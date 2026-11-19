/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#ifndef _HEIRLOOM_COMMON_H
#define _HEIRLOOM_COMMON_H

#include "Common.h"
#include "ItemPrototype.h"
#include "ObjectGuid.h"
#include <array>

constexpr uint8 HEIRLOOM_MIN_LEVEL = 1;
constexpr uint8 HEIRLOOM_MAX_LEVEL_DEFAULT = 60;
constexpr uint32 HEIRLOOM_BONDING_ACCOUNT = 6;
constexpr uint32 CORE_MAX_GIVEXP_LIMIT = 100000;
constexpr uint32 HEIRLOOM_ARMOR_VOUCHER = 916301;
constexpr uint32 HEIRLOOM_WEAPON_VOUCHER = 916302;
constexpr uint32 HEIRLOOM_ACCESSORY_VOUCHER = 916303;

enum class HeirloomPool : uint8 { Armor, Weapons, Accessories };
constexpr std::array<HeirloomPool, 3> HEIRLOOM_POOLS = {
    HeirloomPool::Armor, HeirloomPool::Weapons, HeirloomPool::Accessories
};
using HeirloomVoucherCounts = std::array<uint32, HEIRLOOM_POOLS.size()>;

constexpr size_t HeirloomPoolIndex(HeirloomPool pool) { return static_cast<size_t>(pool); }

constexpr uint32 HeirloomVoucher(HeirloomPool pool)
{
    constexpr HeirloomVoucherCounts entries = {
        HEIRLOOM_ARMOR_VOUCHER, HEIRLOOM_WEAPON_VOUCHER, HEIRLOOM_ACCESSORY_VOUCHER
    };
    return entries[HeirloomPoolIndex(pool)];
}

constexpr uint32 HEIRLOOM_MERCHANT_TEXT = 910210;
struct HeirloomUnlockBracket
{
    uint32 level;
    uint32 id;
    uint32 armorChoices;
    uint32 weaponTokens;
    uint32 accessoryChoices;
};

// The bracket ID identifies its allowance row in the collection table.
constexpr std::array<HeirloomUnlockBracket, 6> HEIRLOOM_UNLOCK_BRACKETS = {{
    {10, 4, 1, 2, 1},
    {20, 1, 2, 1, 1},
    {30, 5, 1, 1, 1},
    {40, 2, 2, 1, 1},
    {50, 6, 1, 1, 0},
    {55, 3, 1, 0, 0}
}};
using HeirloomUnlockLimits = std::array<uint32, HEIRLOOM_UNLOCK_BRACKETS.size()>;

#endif // _HEIRLOOM_COMMON_H
