#include "HeirloomArmorSets.h"
#include "HeirloomConfig.h"
#include "HeirloomMgr.h"
#include "Objects/Item.h"
#include "Objects/Player.h"
#include "Spells/SpellAuras.h"
#include "Spells/SpellMgr.h"

#include <algorithm>
#include <array>
#include <iterator>

namespace
{
    constexpr std::array<uint8, 3> Thresholds = {2, 4, 8};
    constexpr std::array<uint8, HeirloomArmorSets::EquippedEntries{}.size()> Slots = {
        EQUIPMENT_SLOT_HEAD, EQUIPMENT_SLOT_SHOULDERS, EQUIPMENT_SLOT_CHEST, EQUIPMENT_SLOT_WRISTS,
        EQUIPMENT_SLOT_HANDS, EQUIPMENT_SLOT_WAIST, EQUIPMENT_SLOT_LEGS, EQUIPMENT_SLOT_FEET
    };

    struct SetEffect
    {
        uint32 aura;
        int32 mask;
        std::array<int32, Thresholds.size()> amounts;
        uint8 minimumLevel;
    };

    struct ArmorSet
    {
        uint32 firstFamily;
        uint32 spell;
        char const* name;
        std::array<SetEffect, MAX_EFFECT_INDEX> effects;
    };

    constexpr ArmorSet Sets[] = {
#define HEIRLOOM_ARMOR_SET(material, family, style, spell, name, a0, m0, n0, t0, f0, e0, l0, a1, m1, n1, t1, f1, e1, l1, a2, m2, n2, t2, f2, e2, l2) \
        {family, spell, name, {{{a0, m0, {t0, f0, e0}, l0}, {a1, m1, {t1, f1, e1}, l1}, {a2, m2, {t2, f2, e2}, l2}}}},
#include "HeirloomArmorSets.inc"
#undef HEIRLOOM_ARMOR_SET
    };

    using EffectAmounts = std::array<int32, MAX_EFFECT_INDEX>;

    bool Available = false;

    struct EquippedSet
    {
        uint32 pieces = 0;
        bool usesNativeSet = false;
        uint8 level = HEIRLOOM_MIN_LEVEL;
    };

    std::array<EquippedSet, std::size(Sets)> CountEquipped(Player const* player)
    {
        std::array<EquippedSet, std::size(Sets)> equipped{};
        uint8 level = HeirloomMgr::GetScaledLevel(player);
        bool scaling = sHeirloomConfig.IsScalingEnabled();
        for (EquippedSet& set : equipped)
            set.level = level;

        for (size_t i = 0; i < Slots.size(); ++i)
        {
            Item const* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, Slots[i]);
            if (!item)
                continue;

            uint32 entry = item->GetEntry();
            uint32 family = HeirloomMgr::GetFamily(entry);
            uint32 canonical = HeirloomMgr::GetCanonicalFamily(family);
            uint32 offset = static_cast<uint32>(i * 100);
            if (canonical < offset)
                continue;

            // A worn piece counts for its own set even if it is broken, as in vanilla.
            uint32 first = canonical - offset;
            auto set = std::lower_bound(std::begin(Sets), std::end(Sets), first,
                [](ArmorSet const& candidate, uint32 id) { return candidate.firstFamily < id; });
            if (set == std::end(Sets) || set->firstFamily != first)
                continue;

            EquippedSet& worn = equipped[set - std::begin(Sets)];
            ++worn.pieces;
            worn.usesNativeSet |= item->GetProto()->ItemSet != 0;
            if (!scaling && entry > family && entry <= family + HEIRLOOM_MAX_LEVEL_DEFAULT)
                worn.level = std::min(worn.level, static_cast<uint8>(entry - family));
        }
        return equipped;
    }

    int32 ScaleSetAmount(int32 amount, uint8 level)
    {
        return std::max<int32>(1, (amount * level + 30) / 60);
    }

    EffectAmounts GetBonuses(ArmorSet const& set, EquippedSet const& equipped)
    {
        EffectAmounts amounts{};
        // The core applies the stock bonuses for any equipped native variant.
        // With fixed-tier items, mixed versions must not also earn a custom aura.
        if (equipped.usesNativeSet)
            return amounts;

        for (size_t i = 0; i < set.effects.size(); ++i)
        {
            SetEffect const& effect = set.effects[i];
            if (equipped.level < effect.minimumLevel)
                continue;
            for (size_t tier = 0; tier < Thresholds.size(); ++tier)
            {
                int32 amount = effect.amounts[tier];
                if (!amount || equipped.pieces < Thresholds[tier])
                    continue;
                amounts[i] += effect.minimumLevel == 1
                    ? ScaleSetAmount(amount, equipped.level) : amount;
            }
        }
        return amounts;
    }

    bool HasValidSetSpell(ArmorSet const& set)
    {
        SpellEntry const* spell = sSpellMgr.GetSpellEntry(set.spell);
        if (!spell || spell->SpellName[0] != set.name || !spell->IsPassiveSpell() ||
            !spell->HasAttribute(SPELL_ATTR_HIDDEN_CLIENTSIDE))
            return false;
        for (size_t i = 0; i < set.effects.size(); ++i)
            if (spell->EffectApplyAuraName[i] != set.effects[i].aura || spell->EffectMiscValue[i] != set.effects[i].mask)
                return false;
        return true;
    }

    void UpdateSetAura(Player* player, uint32 spell, EffectAmounts& amounts)
    {
        bool hasBonus = std::any_of(amounts.begin(), amounts.end(), [](int32 amount) { return amount != 0; });
        if (SpellAuraHolder* holder = player->GetSpellAuraHolder(spell, player->GetObjectGuid()))
        {
            bool matches = hasBonus;
            for (size_t effect = 0; matches && effect < amounts.size(); ++effect)
            {
                Aura const* aura = holder->GetAuraByEffectIndex(static_cast<SpellEffectIndex>(effect));
                matches = aura && aura->GetModifier()->m_amount == amounts[effect];
            }
            if (matches)
                return;
            player->RemoveSpellAuraHolder(holder);
        }
        if (hasBonus)
            player->AddAura(spell, ADD_AURA_PASSIVE | ADD_AURA_PERMANENT | ADD_AURA_POSITIVE,
                player, &amounts[0], &amounts[1], &amounts[2]);
    }

}

bool HeirloomArmorSets::Initialize()
{
    // Never apply or remove an aura if a reserved ID belongs to another spell.
    Available = std::all_of(std::begin(Sets), std::end(Sets), HasValidSetSpell);
    return Available;
}

HeirloomArmorSets::EquippedEntries HeirloomArmorSets::GetEquippedEntries(Player const* player)
{
    EquippedEntries entries{};
    if (Available)
        for (size_t i = 0; i < Slots.size(); ++i)
            if (Item const* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, Slots[i]))
                if (HeirloomMgr::GetFamily(item->GetEntry()))
                    entries[i] = item->GetEntry();
    return entries;
}

void HeirloomArmorSets::Clear(Player* player)
{
    if (Available)
        for (ArmorSet const& set : Sets)
            if (SpellAuraHolder* holder = player->GetSpellAuraHolder(set.spell, player->GetObjectGuid()))
                player->RemoveSpellAuraHolder(holder);
}

void HeirloomArmorSets::Refresh(Player* player)
{
    if (!sHeirloomConfig.IsEnabled() || !player->IsAlive())
    {
        Clear(player);
        return;
    }

    if (!Available)
        return;

    auto equipped = CountEquipped(player);
    for (size_t i = 0; i < equipped.size(); ++i)
    {
        ArmorSet const& set = Sets[i];
        EffectAmounts amounts = GetBonuses(set, equipped[i]);
        UpdateSetAura(player, set.spell, amounts);
    }
}
