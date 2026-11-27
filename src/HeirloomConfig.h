/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#ifndef _HEIRLOOM_CONFIG_H
#define _HEIRLOOM_CONFIG_H

#include "HeirloomCommon.h"
#include <atomic>
#include <mutex>
#include <string>
#include <unordered_set>

class Player;

class HeirloomConfig
{
public:
    static HeirloomConfig& Instance();

    void Load();

    [[nodiscard]] bool IsEnabled() const { return m_enabled; }
    [[nodiscard]] bool IsCollectionEnabled() const { return m_collectionEnabled; }
    [[nodiscard]] bool UsesPerCharacterUnlocks() const { return m_perCharacterUnlocks; }
    [[nodiscard]] bool IsCollectionMailEnabled() const { return m_collectionMailEnabled; }
    [[nodiscard]] HeirloomUnlockLimits GetUnlockLimits(HeirloomPool pool) const;
    [[nodiscard]] bool IsScalingEnabled() const { return m_scalingEnabled; }
    [[nodiscard]] uint8 GetMaxScalingLevel() const { return m_maxScalingLevel; }

    [[nodiscard]] bool IsBonusXPEnabled() const { return m_bonusXPEnabled; }
    [[nodiscard]] float GetBonusXPRate() const { return m_bonusXPRate; }
    [[nodiscard]] float GetShoulderBonusXPPercent() const { return m_shoulderXPPercent; }
    [[nodiscard]] float GetChestBonusXPPercent() const { return m_chestXPPercent; }
    [[nodiscard]] float GetRingBonusXPPercent() const { return m_ringXPPercent; }

    // Bot & player classification helper
    [[nodiscard]] static bool IsBotPlayer(Player const* player);

    // Durability loss & exemption toggles
    [[nodiscard]] bool IsDurabilityLossEnabled(Player const* player) const;
    [[nodiscard]] bool IsDurabilityExempt(Player const* player) const { return !IsDurabilityLossEnabled(player); }
    [[nodiscard]] bool IsDurabilityLossPlayerEnabled() const { return m_durabilityLossPlayer; }
    [[nodiscard]] bool IsDurabilityLossBotEnabled() const { return m_durabilityLossBot; }

    // Token requirement toggles (Players and Bots)
    [[nodiscard]] bool IsTokenRequirementEnabled(Player const* player) const;
    [[nodiscard]] bool IsPlayerTokenRequirementEnabled() const { return m_tokensRequiredPlayer; }
    [[nodiscard]] bool IsBotTokenRequirementEnabled() const { return m_tokensRequiredBot; }

    // Standalone Database Auto-Import
    [[nodiscard]] bool IsAutoImportEnabled() const { return m_autoImport; }
    [[nodiscard]] std::string GetSqlPath() const;

    // Logging, Diagnostics & Reload Generation
    [[nodiscard]] bool IsAnnounceEnabled() const { return m_announceEnabled; }
    [[nodiscard]] bool IsDebugEnabled() const { return m_debugEnabled; }
    [[nodiscard]] uint32 GetGeneration() const { return m_generation.load(std::memory_order_acquire); }

    // Item ID matching
    [[nodiscard]] bool IsHeirloomItemId(uint32 itemId) const;

private:
    HeirloomConfig() = default;

    mutable std::mutex m_mutex;

    std::atomic<bool> m_enabled{true};
    std::atomic<bool> m_collectionEnabled{true};
    std::atomic<bool> m_perCharacterUnlocks{true};
    std::atomic<bool> m_collectionMailEnabled{true};
    std::array<HeirloomUnlockLimits, HEIRLOOM_POOLS.size()> m_unlocks{};
    std::atomic<bool> m_scalingEnabled{true};
    std::atomic<uint8> m_maxScalingLevel{HEIRLOOM_MAX_LEVEL_DEFAULT};

    std::atomic<bool> m_bonusXPEnabled{true};
    std::atomic<float> m_bonusXPRate{1.0f};
    std::atomic<float> m_shoulderXPPercent{10.0f};
    std::atomic<float> m_chestXPPercent{10.0f};
    std::atomic<float> m_ringXPPercent{5.0f};

    std::atomic<bool> m_durabilityLossPlayer{false};
    std::atomic<bool> m_durabilityLossBot{false};
    std::atomic<bool> m_tokensRequiredPlayer{true};
    std::atomic<bool> m_tokensRequiredBot{true};
    std::atomic<bool> m_autoImport{true};
    std::string m_sqlPath;
    std::atomic<bool> m_announceEnabled{true};
    std::atomic<bool> m_debugEnabled{false};
    std::atomic<uint32> m_generation{0};

    std::unordered_set<uint32> m_explicitHeirloomIds;
};

#define sHeirloomConfig HeirloomConfig::Instance()

#endif // _HEIRLOOM_CONFIG_H
