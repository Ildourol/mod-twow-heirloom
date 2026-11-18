/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomMgr.h"
#include "HeirloomConfig.h"
#include "HeirloomFormula.h"
#include "Objects/Player.h"
#include "Objects/Item.h"
#include "Objects/ItemPrototype.h"
#include "Objects/Bag.h"
#include "ObjectMgr.h"
#include "Chat/Chat.h"
#include "Log.h"

#include <algorithm>
#include <cmath>

HeirloomMgr& HeirloomMgr::Instance()
{
    static HeirloomMgr instance;
    return instance;
}

bool HeirloomMgr::IsHeirloomItem(ItemPrototype const* proto) const
{
    if (!proto)
        return false;

    // 1. Explicit administrator allowlist from configuration
    if (sHeirloomConfig.IsHeirloomItemId(proto->ItemId))
        return true;

    // 2. Native account-bound bonding flag (Bonding == 6 / BIND_ACCOUNT)
    if (proto->Bonding == HEIRLOOM_BONDING_ACCOUNT)
        return true;

    return false;
}

void HeirloomMgr::HandlePlayerLogin(Player* player)
{
    if (!player)
        return;

    CheckAndApplyArmorMorph(player, 0, player->GetLevel());
    RecalculatePlayerHeirlooms(player, true);
}

void HeirloomMgr::HandlePlayerLogout(Player* player)
{
    if (!player)
        return;

    std::lock_guard<std::mutex> lock(m_mutex);
    auto it = m_playerCaches.find(player->GetObjectGuid());
    if (it != m_playerCaches.end())
    {
        RemoveAllDeltas(player, it->second);
        m_playerCaches.erase(it);
    }
}

void HeirloomMgr::HandlePlayerLevelChanged(Player* player, uint8 oldLevel)
{
    if (!player)
        return;

    if (sHeirloomConfig.IsDebugEnabled())
    {
        sLog.outDetail("[mod-twow-heirloom] Player %s level changed from %u to %u; recalculating heirlooms",
            player->GetName(), oldLevel, player->GetLevel());
    }

    CheckAndApplyArmorMorph(player, oldLevel, player->GetLevel());
    RecalculatePlayerHeirlooms(player, true);
}

void HeirloomMgr::HandlePlayerUpdate(Player* player, uint32 diff)
{
    if (!player)
        return;

    std::lock_guard<std::mutex> lock(m_mutex);
    auto& cache = m_playerCaches[player->GetObjectGuid()];

    // FINDING-01 & FINDING-05: Feature-decoupled execution matrix
    bool isModuleEnabled = sHeirloomConfig.IsEnabled();
    bool isScalingEnabled = sHeirloomConfig.IsScalingEnabled();
    bool isDurabilityEnabled = sHeirloomConfig.IsDurabilityExemptEnabled();
    uint32 currentConfigGen = sHeirloomConfig.GetConfigGeneration();

    // Master disable cleanly purges all deltas and halts
    if (!isModuleEnabled)
    {
        if (cache.moduleActiveWhenApplied || cache.scalingActiveWhenApplied)
        {
            RemoveAllDeltas(player, cache);
        }
        return;
    }

    // If scaling specifically was disabled (e.g. Scaling.Enable = 0),
    // cleanly purge any active stat deltas, but continue so durability exemption can run.
    if (!isScalingEnabled && cache.scalingActiveWhenApplied)
    {
        RemoveAllDeltas(player, cache);
        cache.scalingActiveWhenApplied = false;
    }

    cache.updateTimer += diff;
    if (cache.updateTimer < 1000 && cache.appliedConfigGen == currentConfigGen)
        return;

    cache.updateTimer = 0;

    if (isScalingEnabled)
    {
        bool guidsChanged = false;
        bool breakStateChanged = false;
        for (uint8 slot = 0; slot < HEIRLOOM_EQUIPMENT_SLOTS_COUNT; ++slot)
        {
            Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);
            uint64 currentGuid = item ? item->GetObjectGuid().GetRawValue() : 0;
            if (currentGuid != cache.equippedGuids[slot])
            {
                guidsChanged = true;
                break;
            }

            bool itemBroken = item ? item->IsBroken() : false;
            if (itemBroken != cache.slots[slot].isBroken)
            {
                breakStateChanged = true;
                break;
            }
        }

        uint8 effectiveLvl = HeirloomFormula::GetEffectiveLevel(player->GetLevel(), sHeirloomConfig.GetMaxScalingLevel());
        bool configGenChanged = (cache.appliedConfigGen != currentConfigGen);

        if (guidsChanged || breakStateChanged || effectiveLvl != cache.lastKnownLevel || configGenChanged)
        {
            for (uint8 slot = 0; slot < HEIRLOOM_EQUIPMENT_SLOTS_COUNT; ++slot)
            {
                Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);
                ItemPrototype const* proto = item ? item->GetProto() : nullptr;
                uint64 currentGuid = item ? item->GetObjectGuid().GetRawValue() : 0;
                bool isHeirloom = IsHeirloomItem(proto);

                // REVIEW POINT 3: Repair broken heirloom BEFORE querying broken status
                // to eliminate 1-second lag and allow immediate delta application.
                if (item && isHeirloom && isDurabilityEnabled)
                {
                    EnsureHeirloomDurability(player, item, slot);
                }

                bool isBroken = item ? item->IsBroken() : false;

                // Unapply existing delta if item changed, broken, or config/level changed
                if (cache.slots[slot].active)
                {
                    if (!isHeirloom || isBroken || currentGuid != cache.slots[slot].itemGuid ||
                        effectiveLvl != cache.lastKnownLevel || configGenChanged)
                    {
                        ApplySlotDelta(player, cache.slots[slot], slot, false);
                        cache.slots[slot].Reset();
                    }
                }

                // Apply new delta if heirloom is equipped and not broken
                if (isHeirloom && !isBroken && proto)
                {
                    if (!cache.slots[slot].active)
                    {
                        HeirloomSlotDelta delta;
                        uint8 baseLvl = HeirloomFormula::GetBaseItemLevel(proto);
                        double ratio = HeirloomFormula::CalculateScalingRatio(baseLvl, effectiveLvl);
                        float mult = sHeirloomConfig.GetStatMultiplier();

                        for (uint8 i = 0; i < MAX_ITEM_PROTO_STATS; ++i)
                        {
                            int32 baseStatVal = proto->ItemStat[i].ItemStatValue;
                            uint32 statType = proto->ItemStat[i].ItemStatType;
                            if (baseStatVal != 0 && statType < MAX_ITEM_MOD)
                            {
                                // Protective module delta refusal: reject scaling deltas for pathological base values outside sanity bounds.
                                // Note: Native base stat remains completely unmodified as authored in the database.
                                if (baseStatVal < HEIRLOOM_MIN_VALID_NATIVE_STAT || baseStatVal > HEIRLOOM_MAX_VALID_NATIVE_STAT)
                                {
                                    if (sHeirloomConfig.IsDebugEnabled())
                                    {
                                        sLog.outDetail("[mod-twow-heirloom] Item %u has native stat %u (val %d) outside protective bounds [%d, %d]; refusing scaling delta (native stat remains unmodified)",
                                            proto->ItemId, statType, baseStatVal, HEIRLOOM_MIN_VALID_NATIVE_STAT, HEIRLOOM_MAX_VALID_NATIVE_STAT);
                                    }
                                    continue;
                                }

                                int32 scaledVal = HeirloomFormula::ScaleStat(baseStatVal, ratio, mult);
                                int64 diff = static_cast<int64>(scaledVal) - static_cast<int64>(baseStatVal);
                                delta.statDeltas[i] = static_cast<int32>(diff);
                                delta.statTypes[i] = statType;
                            }
                        }

                        if (proto->Armor > 0)
                        {
                            if (proto->Armor <= HEIRLOOM_MAX_VALID_NATIVE_ARMOR)
                            {
                                uint32 scaledArmor = HeirloomFormula::ScaleArmor(proto->Armor, ratio, mult);
                                int64 armorDiff = static_cast<int64>(scaledArmor) - static_cast<int64>(proto->Armor);
                                delta.armorDelta = static_cast<int32>(armorDiff);
                            }
                            else if (sHeirloomConfig.IsDebugEnabled())
                            {
                                sLog.outDetail("[mod-twow-heirloom] Item %u has native armor %u outside protective bounds [0, %u]; refusing armor scaling delta (native armor remains unmodified)",
                                    proto->ItemId, proto->Armor, HEIRLOOM_MAX_VALID_NATIVE_ARMOR);
                            }
                        }

                        if (proto->Block > 0)
                        {
                            if (proto->Block <= HEIRLOOM_MAX_VALID_NATIVE_BLOCK)
                            {
                                uint32 scaledBlock = HeirloomFormula::ScaleBlock(proto->Block, ratio, mult);
                                int64 blockDiff = static_cast<int64>(scaledBlock) - static_cast<int64>(proto->Block);
                                delta.blockDelta = static_cast<int32>(blockDiff);
                            }
                            else if (sHeirloomConfig.IsDebugEnabled())
                            {
                                sLog.outDetail("[mod-twow-heirloom] Item %u has native block %u outside protective bounds [0, %u]; refusing block scaling delta (native block remains unmodified)",
                                    proto->ItemId, proto->Block, HEIRLOOM_MAX_VALID_NATIVE_BLOCK);
                            }
                        }

                        delta.itemEntry = proto->ItemId;
                        delta.itemGuid = currentGuid;
                        delta.active = true;
                        delta.isBroken = isBroken;

                        ApplySlotDelta(player, delta, slot, true);
                        cache.slots[slot] = delta;
                    }
                }

                cache.slots[slot].isBroken = isBroken;
                cache.equippedGuids[slot] = currentGuid;
            }

            cache.lastKnownLevel = effectiveLvl;
            cache.appliedConfigGen = currentConfigGen;
            cache.moduleActiveWhenApplied = true;
            cache.scalingActiveWhenApplied = true;
        }
        else if (isDurabilityEnabled)
        {
            for (uint8 slot = 0; slot < HEIRLOOM_EQUIPMENT_SLOTS_COUNT; ++slot)
            {
                Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);
                if (item && IsHeirloomItem(item->GetProto()))
                {
                    EnsureHeirloomDurability(player, item, slot);
                }
            }
        }
    }
    else
    {
        // Scaling is disabled, but module is enabled. Maintain durability exemption if configured.
        cache.appliedConfigGen = currentConfigGen;
        cache.moduleActiveWhenApplied = true;
        cache.scalingActiveWhenApplied = false;

        if (isDurabilityEnabled)
        {
            for (uint8 slot = 0; slot < HEIRLOOM_EQUIPMENT_SLOTS_COUNT; ++slot)
            {
                Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);
                if (item && IsHeirloomItem(item->GetProto()))
                {
                    EnsureHeirloomDurability(player, item, slot);
                }
            }
        }
    }
}

void HeirloomMgr::RecalculatePlayerHeirlooms(Player* player, bool force)
{
    if (!player)
        return;

    std::lock_guard<std::mutex> lock(m_mutex);
    auto& cache = m_playerCaches[player->GetObjectGuid()];

    bool isModuleEnabled = sHeirloomConfig.IsEnabled();
    bool isScalingEnabled = sHeirloomConfig.IsScalingEnabled();
    bool isDurabilityEnabled = sHeirloomConfig.IsDurabilityExemptEnabled();
    uint32 currentConfigGen = sHeirloomConfig.GetConfigGeneration();

    // Master disable purges everything and halts
    if (!isModuleEnabled)
    {
        RemoveAllDeltas(player, cache);
        return;
    }

    // If scaling specifically is disabled, remove existing deltas
    if (!isScalingEnabled)
    {
        if (cache.scalingActiveWhenApplied)
        {
            RemoveAllDeltas(player, cache);
            cache.scalingActiveWhenApplied = false;
        }

        // Still run durability audit if enabled
        if (isDurabilityEnabled)
        {
            for (uint8 slot = 0; slot < HEIRLOOM_EQUIPMENT_SLOTS_COUNT; ++slot)
            {
                Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);
                if (item && IsHeirloomItem(item->GetProto()))
                {
                    EnsureHeirloomDurability(player, item, slot);
                }
            }
        }
        return;
    }

    uint8 effectiveLvl = HeirloomFormula::GetEffectiveLevel(player->GetLevel(), sHeirloomConfig.GetMaxScalingLevel());

    for (uint8 slot = 0; slot < HEIRLOOM_EQUIPMENT_SLOTS_COUNT; ++slot)
    {
        Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);
        ItemPrototype const* proto = item ? item->GetProto() : nullptr;
        uint64 currentGuid = item ? item->GetObjectGuid().GetRawValue() : 0;
        bool isHeirloom = IsHeirloomItem(proto);

        // REVIEW POINT 3: Maintain durability first to restore native item mods and avoid delay
        if (item && isHeirloom && isDurabilityEnabled)
        {
            EnsureHeirloomDurability(player, item, slot);
        }

        bool isBroken = item ? item->IsBroken() : false;

        if (cache.slots[slot].active)
        {
            if (force || !isHeirloom || isBroken || currentGuid != cache.slots[slot].itemGuid ||
                effectiveLvl != cache.lastKnownLevel || cache.appliedConfigGen != currentConfigGen)
            {
                ApplySlotDelta(player, cache.slots[slot], slot, false);
                cache.slots[slot].Reset();
            }
        }

        if (isHeirloom && !isBroken && proto)
        {
            if (!cache.slots[slot].active)
            {
                HeirloomSlotDelta delta;
                uint8 baseLvl = HeirloomFormula::GetBaseItemLevel(proto);
                double ratio = HeirloomFormula::CalculateScalingRatio(baseLvl, effectiveLvl);
                float mult = sHeirloomConfig.GetStatMultiplier();

                for (uint8 i = 0; i < MAX_ITEM_PROTO_STATS; ++i)
                {
                    int32 baseStatVal = proto->ItemStat[i].ItemStatValue;
                    uint32 statType = proto->ItemStat[i].ItemStatType;
                    if (baseStatVal != 0 && statType < MAX_ITEM_MOD)
                    {
                        // Protective module delta refusal: reject scaling deltas for pathological base values outside sanity bounds.
                        // Note: Native base stat remains completely unmodified as authored in the database.
                        if (baseStatVal < HEIRLOOM_MIN_VALID_NATIVE_STAT || baseStatVal > HEIRLOOM_MAX_VALID_NATIVE_STAT)
                        {
                            if (sHeirloomConfig.IsDebugEnabled())
                            {
                                sLog.outDetail("[mod-twow-heirloom] Item %u has native stat %u (val %d) outside protective bounds [%d, %d]; refusing scaling delta (native stat remains unmodified)",
                                    proto->ItemId, statType, baseStatVal, HEIRLOOM_MIN_VALID_NATIVE_STAT, HEIRLOOM_MAX_VALID_NATIVE_STAT);
                            }
                            continue;
                        }

                        int32 scaledVal = HeirloomFormula::ScaleStat(baseStatVal, ratio, mult);
                        int64 diff = static_cast<int64>(scaledVal) - static_cast<int64>(baseStatVal);
                        delta.statDeltas[i] = static_cast<int32>(diff);
                        delta.statTypes[i] = statType;
                    }
                }

                if (proto->Armor > 0)
                {
                    if (proto->Armor <= HEIRLOOM_MAX_VALID_NATIVE_ARMOR)
                    {
                        uint32 scaledArmor = HeirloomFormula::ScaleArmor(proto->Armor, ratio, mult);
                        int64 armorDiff = static_cast<int64>(scaledArmor) - static_cast<int64>(proto->Armor);
                        delta.armorDelta = static_cast<int32>(armorDiff);
                    }
                    else if (sHeirloomConfig.IsDebugEnabled())
                    {
                        sLog.outDetail("[mod-twow-heirloom] Item %u has native armor %u outside protective bounds [0, %u]; refusing armor scaling delta (native armor remains unmodified)",
                            proto->ItemId, proto->Armor, HEIRLOOM_MAX_VALID_NATIVE_ARMOR);
                    }
                }

                if (proto->Block > 0)
                {
                    if (proto->Block <= HEIRLOOM_MAX_VALID_NATIVE_BLOCK)
                    {
                        uint32 scaledBlock = HeirloomFormula::ScaleBlock(proto->Block, ratio, mult);
                        int64 blockDiff = static_cast<int64>(scaledBlock) - static_cast<int64>(proto->Block);
                        delta.blockDelta = static_cast<int32>(blockDiff);
                    }
                    else if (sHeirloomConfig.IsDebugEnabled())
                    {
                        sLog.outDetail("[mod-twow-heirloom] Item %u has native block %u outside protective bounds [0, %u]; refusing block scaling delta (native block remains unmodified)",
                            proto->ItemId, proto->Block, HEIRLOOM_MAX_VALID_NATIVE_BLOCK);
                    }
                }

                delta.itemEntry = proto->ItemId;
                delta.itemGuid = currentGuid;
                delta.active = true;
                delta.isBroken = isBroken;

                ApplySlotDelta(player, delta, slot, true);
                cache.slots[slot] = delta;
            }
        }

        cache.slots[slot].isBroken = isBroken;
        cache.equippedGuids[slot] = currentGuid;
    }

    cache.lastKnownLevel = effectiveLvl;
    cache.appliedConfigGen = currentConfigGen;
    cache.moduleActiveWhenApplied = true;
    cache.scalingActiveWhenApplied = true;
}

void HeirloomMgr::EnsureHeirloomDurability(Player* player, Item* item, uint8 slot)
{
    if (!player || !item)
        return;

    uint32 maxDur = item->GetUInt32Value(ITEM_FIELD_MAXDURABILITY);
    uint32 curDur = item->GetUInt32Value(ITEM_FIELD_DURABILITY);

    if (maxDur > 0 && curDur < maxDur)
    {
        if (sHeirloomConfig.IsDebugEnabled())
        {
            sLog.outDetail("[mod-twow-heirloom] Restored durability for heirloom (entry %u, slot %u, was %u/%u) on player %s",
                item->GetEntry(), slot, curDur, maxDur, player->GetName());
        }

        // FINDING-04: If item was broken (0 durability), calling DurabilityRepair restores
        // core base item stats (_ApplyItemMods) which were stripped by DurabilityPointsLoss.
        // Core Player::DurabilityRepair (Player.cpp:6276) expects a packed pos: (bag << 8) | slot.
        // For equipped items, bag is INVENTORY_SLOT_BAG_0 (255).
        if (curDur == 0)
        {
            uint16 pos = (static_cast<uint16>(INVENTORY_SLOT_BAG_0) << 8) | static_cast<uint16>(slot);
            player->DurabilityRepair(pos, false, 0.0f);
        }
        else
        {
            player->UpdateItemDurability(item, maxDur);
            item->SetState(ITEM_CHANGED, player);
        }
    }
}

float HeirloomMgr::CalculatePlayerBonusXPPercent(Player* player) const
{
    if (!player || !sHeirloomConfig.IsBonusXPEnabled())
        return 0.0f;

    float totalPercent = 0.0f;

    auto checkSlot = [this, player](EquipmentSlots slot, float bonus) -> float
    {
        Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);
        if (item && !item->IsBroken() && IsHeirloomItem(item->GetProto()))
            return bonus;
        return 0.0f;
    };

    totalPercent += checkSlot(EQUIPMENT_SLOT_SHOULDERS, sHeirloomConfig.GetShoulderBonusXPPercent());
    totalPercent += checkSlot(EQUIPMENT_SLOT_CHEST, sHeirloomConfig.GetChestBonusXPPercent());
    totalPercent += checkSlot(EQUIPMENT_SLOT_TRINKET1, sHeirloomConfig.GetTrinketBonusXPPercent());
    totalPercent += checkSlot(EQUIPMENT_SLOT_TRINKET2, sHeirloomConfig.GetTrinketBonusXPPercent());
    totalPercent += checkSlot(EQUIPMENT_SLOT_FINGER1, sHeirloomConfig.GetRingBonusXPPercent());
    totalPercent += checkSlot(EQUIPMENT_SLOT_FINGER2, sHeirloomConfig.GetRingBonusXPPercent());

    totalPercent *= sHeirloomConfig.GetBonusXPRate();
    if (!std::isfinite(totalPercent) || totalPercent < 0.0f)
        return 0.0f;

    return std::clamp(totalPercent, 0.0f, 200.0f);
}

void HeirloomMgr::HandlePlayerGiveXP(Player* player, uint32& amount, Unit* /*victim*/)
{
    // FINDING-06: Strict numeric safety and preservation of base award against core 100k cap
    if (!player || amount == 0 || amount >= CORE_MAX_GIVEXP_LIMIT ||
        !sHeirloomConfig.IsEnabled() || !sHeirloomConfig.IsBonusXPEnabled())
        return;

    float bonusPercent = CalculatePlayerBonusXPPercent(player);
    if (bonusPercent <= 0.0f || !std::isfinite(bonusPercent))
        return;

    uint64 safeAmount = static_cast<uint64>(amount);
    double mult = static_cast<double>(bonusPercent) / 100.0;
    uint64 calculatedBonus = static_cast<uint64>(std::round(static_cast<double>(safeAmount) * mult));

    // Player::GiveXP (Player.cpp:3648) drops all XP if award > 100000.
    // Clamp bonus so total amount strictly never reaches or exceeds 100000,
    // preserving the player's legitimate base experience award.
    uint32 maxAllowedBonus = (CORE_MAX_GIVEXP_LIMIT > amount) ? (CORE_MAX_GIVEXP_LIMIT - amount - 1) : 0;
    uint32 safeBonusXP = static_cast<uint32>(std::min<uint64>(calculatedBonus, static_cast<uint64>(maxAllowedBonus)));

    if (safeBonusXP > 0)
    {
        amount += safeBonusXP;

        if (sHeirloomConfig.IsAnnounceEnabled())
        {
            ChatHandler(player->GetSession()).PSendSysMessage("Heirloom gear granted +%u bonus experience (%.1f%%)!", safeBonusXP, bonusPercent);
        }
    }
}

void HeirloomMgr::ApplySlotDelta(Player* player, HeirloomSlotDelta const& delta, uint8 slot, bool apply)
{
    if (!player || !delta.active)
        return;

    if (sHeirloomConfig.IsDebugEnabled())
    {
        sLog.outDetail("[mod-twow-heirloom] %s stat deltas for item %u in slot %u on player %s",
            apply ? "Applied" : "Removed", delta.itemEntry, slot, player->GetName());
    }

    // FINDING-07: Pass exact delta value and pass 'apply' boolean directly.
    // Core ApplyStatBuffMod (Player.h:1887) expects original val with apply=false to decrement the correct bucket.
    for (uint8 i = 0; i < MAX_ITEM_PROTO_STATS; ++i)
    {
        int32 val = delta.statDeltas[i];
        if (val == 0)
            continue;

        float fval = static_cast<float>(val);

        switch (delta.statTypes[i])
        {
            case ITEM_MOD_MANA:
                player->HandleStatModifier(UNIT_MOD_MANA, BASE_VALUE, fval, apply);
                break;
            case ITEM_MOD_HEALTH:
                player->HandleStatModifier(UNIT_MOD_HEALTH, BASE_VALUE, fval, apply);
                break;
            case ITEM_MOD_AGILITY:
                player->HandleStatModifier(UNIT_MOD_STAT_AGILITY, BASE_VALUE, fval, apply);
                player->ApplyStatBuffMod(STAT_AGILITY, fval, apply);
                player->UpdateStats(STAT_AGILITY);
                break;
            case ITEM_MOD_STRENGTH:
                player->HandleStatModifier(UNIT_MOD_STAT_STRENGTH, BASE_VALUE, fval, apply);
                player->ApplyStatBuffMod(STAT_STRENGTH, fval, apply);
                player->UpdateStats(STAT_STRENGTH);
                break;
            case ITEM_MOD_INTELLECT:
                player->HandleStatModifier(UNIT_MOD_STAT_INTELLECT, BASE_VALUE, fval, apply);
                player->ApplyStatBuffMod(STAT_INTELLECT, fval, apply);
                player->UpdateStats(STAT_INTELLECT);
                break;
            case ITEM_MOD_SPIRIT:
                player->HandleStatModifier(UNIT_MOD_STAT_SPIRIT, BASE_VALUE, fval, apply);
                player->ApplyStatBuffMod(STAT_SPIRIT, fval, apply);
                player->UpdateStats(STAT_SPIRIT);
                break;
            case ITEM_MOD_STAMINA:
                player->HandleStatModifier(UNIT_MOD_STAT_STAMINA, BASE_VALUE, fval, apply);
                player->ApplyStatBuffMod(STAT_STAMINA, fval, apply);
                player->UpdateStats(STAT_STAMINA);
                break;
            default:
                break;
        }
    }

    // Armor
    if (delta.armorDelta != 0)
    {
        player->HandleStatModifier(UNIT_MOD_ARMOR, BASE_VALUE, static_cast<float>(delta.armorDelta), apply);
        player->UpdateArmor();
    }

    // Block
    if (delta.blockDelta != 0)
    {
        player->HandleBaseModValue(SHIELD_BLOCK_VALUE, FLAT_MOD, static_cast<float>(delta.blockDelta), apply);
    }
}

void HeirloomMgr::RemoveAllDeltas(Player* player, HeirloomPlayerCache& cache)
{
    if (!player)
        return;

    for (uint8 slot = 0; slot < HEIRLOOM_EQUIPMENT_SLOTS_COUNT; ++slot)
    {
        if (cache.slots[slot].active)
        {
            ApplySlotDelta(player, cache.slots[slot], slot, false);
            cache.slots[slot].Reset();
        }
    }
    cache.Reset();
}

uint32 HeirloomMgr::GetMorphedItemId(uint32 entry, uint8 playerClass, bool toHighTier)
{
    // Plate classes: Warrior and Paladin
    // Plate classes: Warrior and Paladin
    if (playerClass == CLASS_WARRIOR || playerClass == CLASS_PALADIN)
    {
        if (toHighTier) // Mail -> Plate (Level >= 40)
        {
            // Mathematical 1-to-1 mapping for 991200 series (Mail) -> 991100 series (Plate)
            if (entry >= 991200 && entry <= 991299)
                return entry - 100;

            switch (entry)
            {
                // Legacy entries
                case 22016: return 22001; // Legacy Beastmaster's Mantle (Mail) -> Spaulders of Heroism (Plate)
                case 22060: return 21997; // Legacy Beastmaster's Tunic (Mail) -> Breastplate of Heroism (Plate)
                case 22101: return 22093; // Legacy Pauldrons of The Five Thunders (Mail) -> Soulforge Spaulders (Plate)
                case 22102: return 22089; // Legacy Vest of The Five Thunders (Mail) -> Soulforge Breastplate (Plate)
                default: break;
            }
        }
        else // Plate -> Mail (Level < 40)
        {
            // Mathematical 1-to-1 mapping for 991100 series (Plate) -> 991200 series (Mail)
            if (entry >= 991100 && entry <= 991199)
                return entry + 100;

            switch (entry)
            {
                // Legacy entries
                case 22001: return 22016; // Legacy Spaulders of Heroism (Plate) -> Beastmaster's Mantle (Mail)
                case 21997: return 22060; // Legacy Breastplate of Heroism (Plate) -> Beastmaster's Tunic (Mail)
                case 22093: return 22101; // Legacy Soulforge Spaulders (Plate) -> Pauldrons of The Five Thunders (Mail)
                case 22089: return 22102; // Legacy Soulforge Breastplate (Plate) -> Vest of The Five Thunders (Mail)
                default: break;
            }
        }
    }
    // Mail classes: Hunter and Shaman
    else if (playerClass == CLASS_HUNTER || playerClass == CLASS_SHAMAN)
    {
        if (toHighTier) // Leather -> Mail (Level >= 40)
        {
            // Mathematical 1-to-1 mapping for 991300 series (Leather) -> 991200 series (Mail)
            if (entry >= 991300 && entry <= 991399)
                return entry - 100;

            switch (entry)
            {
                // Legacy entries
                case 22008: return 22016; // Legacy Darkmantle Spaulders (Leather) -> Beastmaster's Mantle (Mail)
                case 22009: return 22060; // Legacy Darkmantle Tunic (Leather) -> Beastmaster's Tunic (Mail)
                case 22112: return 22101; // Legacy Moonheart Spaulders (Leather) -> Pauldrons of The Five Thunders (Mail)
                case 22113: return 22102; // Legacy Moonheart Vest (Leather) -> Vest of The Five Thunders (Mail)
                default: break;
            }
        }
        else // Mail -> Leather (Level < 40)
        {
            // Mathematical 1-to-1 mapping for 991200 series (Mail) -> 991300 series (Leather)
            if (entry >= 991200 && entry <= 991299)
                return entry + 100;

            switch (entry)
            {
                // Legacy entries
                case 22016: return 22008; // Legacy Beastmaster's Mantle (Mail) -> Darkmantle Spaulders (Leather)
                case 22060: return 22009; // Legacy Beastmaster's Tunic (Mail) -> Darkmantle Tunic (Leather)
                case 22101: return 22112; // Legacy Pauldrons of The Five Thunders (Mail) -> Moonheart Spaulders (Leather)
                case 22102: return 22113; // Legacy Vest of The Five Thunders (Mail) -> Moonheart Vest (Leather)
                default: break;
            }
        }
    }

    return 0;
}

void HeirloomMgr::CheckAndApplyArmorMorph(Player* player, uint8 oldLevel, uint8 newLevel)
{
    if (!player || !sHeirloomConfig.IsEnabled() || !sHeirloomConfig.IsAutoMorphEnabled())
        return;

    uint8 pClass = player->GetClass();
    bool isPlateClass = (pClass == CLASS_WARRIOR || pClass == CLASS_PALADIN);
    bool isMailClass = (pClass == CLASS_HUNTER || pClass == CLASS_SHAMAN);

    if (!isPlateClass && !isMailClass)
        return;

    bool toHighTier = (newLevel >= 40);

    // If crossing the boundary or checking on login:
    if (oldLevel != 0)
    {
        bool wasHighTier = (oldLevel >= 40);
        if (wasHighTier == toHighTier)
            return; // No tier change
    }

    // Auto-learn armor skill if configured
    if (toHighTier && sHeirloomConfig.IsAutoLearnArmorSkillEnabled())
    {
        if (isPlateClass && !player->HasSpell(750))
        {
            player->LearnSpell(750, false);
            if (sHeirloomConfig.IsAnnounceEnabled())
                ChatHandler(player->GetSession()).SendSysMessage("You have learned the Plate Mail skill!");
        }
        else if (isMailClass && !player->HasSpell(8737))
        {
            player->LearnSpell(8737, false);
            if (sHeirloomConfig.IsAnnounceEnabled())
                ChatHandler(player->GetSession()).SendSysMessage("You have learned the Mail skill!");
        }
    }

    // 1. Check all 8 equipped armor slots (Head, Shoulders, Chest, Wrists, Hands, Waist, Legs, Feet)
    for (uint8 slot : {
        static_cast<uint8>(EQUIPMENT_SLOT_HEAD),
        static_cast<uint8>(EQUIPMENT_SLOT_SHOULDERS),
        static_cast<uint8>(EQUIPMENT_SLOT_CHEST),
        static_cast<uint8>(EQUIPMENT_SLOT_WRISTS),
        static_cast<uint8>(EQUIPMENT_SLOT_HANDS),
        static_cast<uint8>(EQUIPMENT_SLOT_WAIST),
        static_cast<uint8>(EQUIPMENT_SLOT_LEGS),
        static_cast<uint8>(EQUIPMENT_SLOT_FEET)
    })
    {
        Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);
        if (!item)
            continue;

        uint32 oldEntry = item->GetEntry();
        uint32 newEntry = GetMorphedItemId(oldEntry, pClass, toHighTier);
        if (newEntry == 0 || newEntry == oldEntry)
            continue;

        if (sHeirloomConfig.IsDebugEnabled())
        {
            sLog.outDetail("[mod-twow-heirloom] Auto-morphing equipped item %u to %u for player %s (slot %u, level %u)",
                oldEntry, newEntry, player->GetName(), slot, newLevel);
        }

        // Unapply existing deltas if applied
        {
            std::lock_guard<std::mutex> lock(m_mutex);
            auto it = m_playerCaches.find(player->GetObjectGuid());
            if (it != m_playerCaches.end() && it->second.slots[slot].active)
            {
                ApplySlotDelta(player, it->second.slots[slot], slot, false);
                it->second.slots[slot] = HeirloomSlotDelta();
            }
        }

        player->DestroyItem(INVENTORY_SLOT_BAG_0, slot, true);
        uint16 pos = (INVENTORY_SLOT_BAG_0 << 8) | slot;
        Item* newItem = player->EquipNewItem(pos, newEntry, true);

        if (newItem && sHeirloomConfig.IsAnnounceEnabled())
        {
            ItemPrototype const* newProto = newItem->GetProto();
            if (newProto)
                ChatHandler(player->GetSession()).PSendSysMessage("Your heirloom has adapted to your level: [%s]!", newProto->Name1);
        }
    }

    // 2. Check items in backpack and bags
    auto morphBagItem = [&](uint8 bag, uint8 slot, Item* item)
    {
        if (!item)
            return;

        uint32 oldEntry = item->GetEntry();
        uint32 newEntry = GetMorphedItemId(oldEntry, pClass, toHighTier);
        if (newEntry == 0 || newEntry == oldEntry)
            return;

        if (sHeirloomConfig.IsDebugEnabled())
        {
            sLog.outDetail("[mod-twow-heirloom] Auto-morphing bagged item %u to %u for player %s (bag %u, slot %u, level %u)",
                oldEntry, newEntry, player->GetName(), bag, slot, newLevel);
        }

        player->DestroyItem(bag, slot, true);
        player->StoreNewItemInBestSlots(newEntry, 1);

        if (sHeirloomConfig.IsAnnounceEnabled())
        {
            ItemPrototype const* newProto = sObjectMgr.GetItemPrototype(newEntry);
            if (newProto)
                ChatHandler(player->GetSession()).PSendSysMessage("Your bagged heirloom has adapted: [%s]!", newProto->Name1);
        }
    };

    // Backpack
    for (int i = INVENTORY_SLOT_ITEM_START; i < INVENTORY_SLOT_ITEM_END; ++i)
        morphBagItem(INVENTORY_SLOT_BAG_0, i, player->GetItemByPos(INVENTORY_SLOT_BAG_0, i));

    // Bag containers
    for (int i = INVENTORY_SLOT_BAG_START; i < INVENTORY_SLOT_BAG_END; ++i)
    {
        if (Bag* pBag = (Bag*)player->GetItemByPos(INVENTORY_SLOT_BAG_0, i))
        {
            for (uint32 j = 0; j < pBag->GetBagSize(); ++j)
                morphBagItem(i, j, player->GetItemByPos(i, j));
        }
    }
}
