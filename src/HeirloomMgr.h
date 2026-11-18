/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#ifndef _HEIRLOOM_MGR_H
#define _HEIRLOOM_MGR_H

#include "HeirloomCommon.h"
#include <mutex>
#include <unordered_map>

class Player;
class Item;
class Unit;
struct ItemPrototype;

class HeirloomMgr
{
public:
    static HeirloomMgr& Instance();

    [[nodiscard]] bool IsHeirloomItem(ItemPrototype const* proto) const;

    void HandlePlayerLogin(Player* player);
    void HandlePlayerLogout(Player* player);
    void HandlePlayerLevelChanged(Player* player, uint8 oldLevel);
    void HandlePlayerUpdate(Player* player, uint32 diff);
    void HandlePlayerGiveXP(Player* player, uint32& amount, Unit* victim);

    void RecalculatePlayerHeirlooms(Player* player, bool force = false);
    void EnsureHeirloomDurability(Player* player, Item* item, uint8 slot);
    void CheckAndApplyArmorMorph(Player* player, uint8 oldLevel, uint8 newLevel);
    static uint32 GetMorphedItemId(uint32 entry, uint8 playerClass, bool toHighTier);

    [[nodiscard]] float CalculatePlayerBonusXPPercent(Player* player) const;

private:
    HeirloomMgr() = default;

    void ApplySlotDelta(Player* player, HeirloomSlotDelta const& delta, uint8 slot, bool apply);
    void RemoveAllDeltas(Player* player, HeirloomPlayerCache& cache);

    mutable std::mutex m_mutex;
    std::unordered_map<ObjectGuid, HeirloomPlayerCache> m_playerCaches;
};

#define sHeirloomMgr HeirloomMgr::Instance()

#endif // _HEIRLOOM_MGR_H
