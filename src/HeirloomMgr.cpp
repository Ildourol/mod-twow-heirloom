/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomMgr.h"
#include "HeirloomConfig.h"
#include "Objects/Player.h"
#include "Objects/Item.h"
#include "Objects/Bag.h"
#include "ObjectMgr.h"
#include "World.h"
#include "WorldSession.h"
#include "Chat/Chat.h"
#include "Log.h"

#include <algorithm>
#include <cmath>

namespace
{
    bool IsCatalogEntry(uint32 entry)
    {
        return entry >= 900001 && entry <= 916260 && entry % 100 >= 1 && entry % 100 <= 60;
    }

    template<class Visitor>
    bool VisitOwnedItems(Player* player, Visitor visit)
    {
        auto visitSlot = [&](uint8 bag, uint8 slot)
        {
            Item* item = player->GetItemByPos(bag, slot);
            return item && visit(bag, slot, item);
        };
        for (uint8 slot = EQUIPMENT_SLOT_START; slot < INVENTORY_SLOT_ITEM_END; ++slot)
            if (visitSlot(INVENTORY_SLOT_BAG_0, slot))
                return true;
        for (uint8 slot = BANK_SLOT_ITEM_START; slot < BANK_SLOT_ITEM_END; ++slot)
            if (visitSlot(INVENTORY_SLOT_BAG_0, slot))
                return true;

        auto visitBags = [&](uint8 first, uint8 end)
        {
            for (uint8 bagSlot = first; bagSlot < end; ++bagSlot)
            {
                Item* container = player->GetItemByPos(INVENTORY_SLOT_BAG_0, bagSlot);
                Bag* bag = container ? container->ToBag() : nullptr;
                if (!bag)
                    continue;
                for (uint8 slot = 0; slot < bag->GetBagSize(); ++slot)
                    if (visitSlot(bagSlot, slot))
                        return true;
            }
            return false;
        };
        return visitBags(INVENTORY_SLOT_BAG_START, INVENTORY_SLOT_BAG_END) ||
               visitBags(BANK_SLOT_BAG_START, BANK_SLOT_BAG_END);
    }
}

HeirloomMgr& HeirloomMgr::Instance()
{
    static HeirloomMgr instance;
    return instance;
}

bool HeirloomMgr::IsHeirloomItem(ItemPrototype const* proto) const
{
    return proto && (GetFamily(proto->ItemId) || proto->Bonding == HEIRLOOM_BONDING_ACCOUNT ||
                     sHeirloomConfig.IsHeirloomItemId(proto->ItemId));
}

uint8 HeirloomMgr::GetScaledLevel(Player const* player)
{
    return static_cast<uint8>(std::clamp<uint32>(player->GetLevel(), HEIRLOOM_MIN_LEVEL, sHeirloomConfig.GetMaxScalingLevel()));
}

uint32 HeirloomMgr::GetFamily(uint32 entry)
{
    return IsCatalogEntry(entry) ? entry - entry % 100 : 0;
}

uint32 HeirloomMgr::GetCanonicalFamily(uint32 family)
{
    if (family >= 908800 && family <= 909500)
        return family - 1600;
    if (family == 914900 || family == 915500 || family == 915800)
        return family - 200;
    return family;
}

bool HeirloomMgr::HasOwnedFamily(Player* player, uint32 family)
{
    return VisitOwnedItems(player, [family](uint8, uint8, Item* item)
    {
        return GetCanonicalFamily(GetFamily(item->GetEntry())) == family;
    });
}

void HeirloomMgr::RestoreEquippedDurability(Player* player)
{
    for (uint8 slot = EQUIPMENT_SLOT_START; slot < EQUIPMENT_SLOT_END; ++slot)
        if (Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
            if (item->GetUInt32Value(ITEM_FIELD_DURABILITY) < item->GetUInt32Value(ITEM_FIELD_MAXDURABILITY) &&
                IsHeirloomItem(item->GetProto()))
                EnsureHeirloomDurability(player, item, slot);
}

void HeirloomMgr::AdaptAllPlayerHeirlooms(Player* player, bool refreshTooltips)
{
    if (!sHeirloomConfig.IsEnabled())
        return;

    bool scaling = sHeirloomConfig.IsScalingEnabled();
    if (!scaling && !refreshTooltips)
        return;

    uint8 level = GetScaledLevel(player);
    WorldSession* session = player->GetSession();
    bool sendTooltips = session && !session->IsHeadless();
    TradeData* trade = player->GetTradeData();
    Item* enchantTarget = trade ? trade->GetItem(TRADE_SLOT_NONTRADED) : nullptr;
    VisitOwnedItems(player, [&](uint8 bag, uint8 slot, Item* item)
    {
        uint32 entry = item->GetEntry();
        uint32 family = GetFamily(entry);
        if (!family)
            return false;

        // Scale within the appearance family used by the item instance.
        uint32 target = family + level;
        bool equipped = bag == INVENTORY_SLOT_BAG_0 && slot < EQUIPMENT_SLOT_END;
        ItemPrototype const* next = scaling && entry != target ? sObjectMgr.GetItemPrototype(target) : nullptr;
        if (!next || item->IsInTrade() || item == enchantTarget || (equipped && !player->IsAlive()))
        {
            if (refreshTooltips && sendTooltips)
                sWorld.SendUpdateSingleItem(entry, session);
            return false;
        }

        uint16 position = (static_cast<uint16>(bag) << 8) | slot;
        if (equipped)
            player->RemoveItem(bag, slot, false);

        if (!item->ChangeEntry(next))
        {
            if (equipped)
                player->EquipItem(position, item, true);
            return false;
        }
        if (sendTooltips)
            sWorld.SendUpdateSingleItem(target, session);
        item->ApplyModFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_BOA, true);
        uint32 previousMax = item->GetUInt32Value(ITEM_FIELD_MAXDURABILITY);
        uint32 previousDurability = std::min(item->GetUInt32Value(ITEM_FIELD_DURABILITY), previousMax);
        // Keep the remaining durability fraction across tiers, or keep 100% if durability loss is exempt/off.
        uint32 durability = next->MaxDurability;
        if (sHeirloomConfig.IsDurabilityExempt(player))
        {
            durability = next->MaxDurability;
        }
        else if (previousMax && next->MaxDurability)
        {
            durability = previousDurability ? std::max(1u, previousDurability * next->MaxDurability / previousMax) : 0u;
        }
        item->SetUInt32Value(ITEM_FIELD_MAXDURABILITY, next->MaxDurability);
        item->SetUInt32Value(ITEM_FIELD_DURABILITY, durability);
        if (equipped)
            player->EquipItem(position, item, true);
        else if (sendTooltips)
            item->SendCreateUpdateToPlayer(player);

        // Queue the final state after changing the entry, flags and durability.
        item->SetState(ITEM_CHANGED, player);
        return false;
    });
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
            sLog.outString("[mod-twow-heirloom] Restored durability for heirloom (entry %u, slot %u, was %u/%u) on player %s",
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

        if (sHeirloomConfig.IsAnnounceEnabled() && player->GetSession() && !player->GetSession()->IsHeadless())
        {
            ChatHandler(player->GetSession()).PSendSysMessage("Heirloom gear granted +%u bonus experience (%.1f%%)!", safeBonusXP, bonusPercent);
        }
    }
}
