/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#ifndef _HEIRLOOM_MGR_H
#define _HEIRLOOM_MGR_H

#include "HeirloomCommon.h"

class Player;
class Item;
class Unit;

struct HeirloomScanSummary
{
    bool hasAnyHeirloom = false;
    bool hasEquippedHeirloom = false;
};

class HeirloomMgr
{
public:
    static HeirloomMgr& Instance();

    [[nodiscard]] bool IsHeirloomItem(ItemPrototype const* proto) const;
    static uint8 GetScaledLevel(Player const* player);
    static uint32 GetFamily(uint32 entry);
    static uint32 GetCanonicalFamily(uint32 family);
    static bool HasOwnedFamily(Player* player, uint32 family);

    void RestoreEquippedDurability(Player* player);
    void HandlePlayerGiveXP(Player* player, uint32& amount, Unit* victim);
    HeirloomScanSummary AdaptAllPlayerHeirlooms(Player* player, bool refreshTooltips = false);

private:
    HeirloomMgr() = default;

    static void EnsureHeirloomDurability(Player* player, Item* item, uint8 slot);
    [[nodiscard]] float CalculatePlayerBonusXPPercent(Player* player) const;
};

#define sHeirloomMgr HeirloomMgr::Instance()

#endif // _HEIRLOOM_MGR_H
