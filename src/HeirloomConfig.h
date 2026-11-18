/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#ifndef _HEIRLOOM_CONFIG_H
#define _HEIRLOOM_CONFIG_H

#include "HeirloomCommon.h"
#include <mutex>
#include <string>
#include <unordered_set>

class HeirloomConfig
{
public:
    static HeirloomConfig& Instance();

    void Load();

    [[nodiscard]] bool IsEnabled() const { return m_enabled; }
    [[nodiscard]] bool IsScalingEnabled() const { return m_scalingEnabled; }
    [[nodiscard]] uint8 GetMaxScalingLevel() const { return m_maxScalingLevel; }
    [[nodiscard]] float GetStatMultiplier() const { return m_statMultiplier; }

    [[nodiscard]] bool IsBonusXPEnabled() const { return m_bonusXPEnabled; }
    [[nodiscard]] float GetBonusXPRate() const { return m_bonusXPRate; }
    [[nodiscard]] float GetShoulderBonusXPPercent() const { return m_shoulderXPPercent; }
    [[nodiscard]] float GetChestBonusXPPercent() const { return m_chestXPPercent; }
    [[nodiscard]] float GetTrinketBonusXPPercent() const { return m_trinketXPPercent; }
    [[nodiscard]] float GetRingBonusXPPercent() const { return m_ringXPPercent; }

    // Durability exemption toggle
    [[nodiscard]] bool IsDurabilityExemptEnabled() const { return m_durabilityExempt; }

    // Level 40 Armor Auto-Morph
    [[nodiscard]] bool IsAutoMorphEnabled() const { return m_autoMorphEnabled; }
    [[nodiscard]] bool IsAutoLearnArmorSkillEnabled() const { return m_autoLearnArmorSkill; }

    // Logging & Diagnostics
    [[nodiscard]] bool IsAnnounceEnabled() const { return m_announceEnabled; }
    [[nodiscard]] bool IsDebugEnabled() const { return m_debugEnabled; }

    // Item ID matching
    [[nodiscard]] bool IsHeirloomItemId(uint32 itemId) const;

    // Config generation revision counter for reload detection (FINDING-05)
    [[nodiscard]] uint32 GetConfigGeneration() const { return m_configGeneration; }

private:
    HeirloomConfig() = default;

    mutable std::mutex m_mutex;

    bool m_enabled{true};
    bool m_scalingEnabled{true};
    uint8 m_maxScalingLevel{HEIRLOOM_MAX_LEVEL_DEFAULT};
    float m_statMultiplier{1.0f};

    bool m_bonusXPEnabled{true};
    float m_bonusXPRate{1.0f};
    float m_shoulderXPPercent{10.0f};
    float m_chestXPPercent{10.0f};
    float m_trinketXPPercent{5.0f};
    float m_ringXPPercent{5.0f};

    bool m_durabilityExempt{true};
    bool m_autoMorphEnabled{true};
    bool m_autoLearnArmorSkill{true};
    bool m_announceEnabled{false};
    bool m_debugEnabled{true};

    uint32 m_configGeneration{0};

    std::unordered_set<uint32> m_explicitHeirloomIds;
};

#define sHeirloomConfig HeirloomConfig::Instance()

#endif // _HEIRLOOM_CONFIG_H
