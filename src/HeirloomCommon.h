/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#ifndef _HEIRLOOM_COMMON_H
#define _HEIRLOOM_COMMON_H

#if defined(STANDALONE_TEST_BUILD)
#include <cstdint>
using uint8 = std::uint8_t;
using int16 = std::int16_t;
using uint16 = std::uint16_t;
using int32 = std::int32_t;
using uint32 = std::uint32_t;
using int64 = std::int64_t;
using uint64 = std::uint64_t;

struct ItemPrototype
{
    uint32 ItemId{0};
    uint32 ItemLevel{0};
    uint32 RequiredLevel{0};
};
#else
#include "Common.h"
#include "ItemPrototype.h"
#include "ObjectGuid.h"
#endif

#include <array>
#include <cstdint>
#include <string>

// Maximum stats per item prototype in vMaNGOS
#ifndef MAX_ITEM_PROTO_STATS
#define MAX_ITEM_PROTO_STATS 10
#endif

// Maximum equipment slots tracked on a player (0 to 18)
constexpr uint8 HEIRLOOM_EQUIPMENT_SLOTS_COUNT = 19;

// Default level constraints
constexpr uint8 HEIRLOOM_MIN_LEVEL = 1;
constexpr uint8 HEIRLOOM_MAX_LEVEL_DEFAULT = 60;

// Bonding type for account-bound items in Turtle WoW
constexpr uint32 HEIRLOOM_BONDING_ACCOUNT = 6; // BIND_ACCOUNT

// Core maximum XP limit enforced by Player::GiveXP (Player.cpp:3648)
constexpr uint32 CORE_MAX_GIVEXP_LIMIT = 100000;

// Template sanity boundaries: legitimate level 1-60 item templates have stats < 500,
// armor < 10000, and block < 2000. Pathological or corrupt values outside these bounds
// are rejected to guarantee exact destination composition and float precision.
constexpr int32 HEIRLOOM_MAX_VALID_NATIVE_STAT = 500;
constexpr int32 HEIRLOOM_MIN_VALID_NATIVE_STAT = -500;
constexpr uint32 HEIRLOOM_MAX_VALID_NATIVE_ARMOR = 10000;
constexpr uint32 HEIRLOOM_MAX_VALID_NATIVE_BLOCK = 2000;

/**
 * Structure storing the calculated stat and attribute deltas
 * between base template values and scaled character-level values.
 */
struct HeirloomSlotDelta
{
    uint32 itemEntry{0};
    uint64 itemGuid{0};
    bool active{false};
    bool isBroken{false};

    // Primary & secondary stat modifiers (scaled - base)
    int32 statDeltas[MAX_ITEM_PROTO_STATS]{0};
    uint32 statTypes[MAX_ITEM_PROTO_STATS]{0};

    // Armor and defensive values (scaled - base)
    int32 armorDelta{0};
    int32 blockDelta{0};

    void Reset()
    {
        itemEntry = 0;
        itemGuid = 0;
        active = false;
        isBroken = false;
        for (uint8 i = 0; i < MAX_ITEM_PROTO_STATS; ++i)
        {
            statDeltas[i] = 0;
            statTypes[i] = 0;
        }
        armorDelta = 0;
        blockDelta = 0;
    }
};

/**
 * Player cache tracking applied heirloom deltas across equipment slots.
 */
struct HeirloomPlayerCache
{
    uint8 lastKnownLevel{0};
    uint32 updateTimer{0};
    uint32 appliedConfigGen{0};
    bool moduleActiveWhenApplied{false};
    bool scalingActiveWhenApplied{false};
    std::array<HeirloomSlotDelta, HEIRLOOM_EQUIPMENT_SLOTS_COUNT> slots{};
    std::array<uint64, HEIRLOOM_EQUIPMENT_SLOTS_COUNT> equippedGuids{};

    void Reset()
    {
        lastKnownLevel = 0;
        updateTimer = 0;
        appliedConfigGen = 0;
        moduleActiveWhenApplied = false;
        scalingActiveWhenApplied = false;
        for (auto& slot : slots)
            slot.Reset();
        equippedGuids.fill(0);
    }
};

#endif // _HEIRLOOM_COMMON_H
