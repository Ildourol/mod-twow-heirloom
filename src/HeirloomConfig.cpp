/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomConfig.h"
#include "Config/Config.h"
#include "Log.h"
#include "Objects/Player.h"
#include "ScriptMgr.h"
#include "WorldSession.h"

#include <algorithm>
#include <cmath>
#include <limits>
#include <sstream>

HeirloomConfig& HeirloomConfig::Instance()
{
    static HeirloomConfig instance;
    return instance;
}

void HeirloomConfig::Load()
{
    std::lock_guard<std::mutex> lock(m_mutex);

    m_enabled = sConfig.GetBoolDefault("Heirloom.Enable", true);
    m_collectionEnabled = sConfig.GetBoolDefault("Heirloom.Collection.Enable", true);
    m_perCharacterUnlocks = sConfig.GetBoolDefault("Heirloom.Collection.PerCharacterUnlocks", true);
    m_collectionMailEnabled = sConfig.GetBoolDefault("Heirloom.Collection.Mail.Enable", true);

    for (size_t i = 0; i < HEIRLOOM_UNLOCK_BRACKETS.size(); ++i)
    {
        HeirloomUnlockBracket const& bracket = HEIRLOOM_UNLOCK_BRACKETS[i];
        std::string level = std::to_string(bracket.level);

        auto loadAllowance = [&](char const* prefix, uint32 defVal) -> uint32
        {
            std::string key = std::string(prefix) + level;
            int32 raw = sConfig.GetIntDefault(key.c_str(), static_cast<int32>(defVal));
            if (raw < 0)
            {
                sLog.outString("[mod-twow-heirloom] Warning: %s (%d) is negative; clamped to 0.", key.c_str(), raw);
                return 0;
            }
            return static_cast<uint32>(raw);
        };

        m_unlocks[HeirloomPoolIndex(HeirloomPool::Armor)][i] = loadAllowance("Heirloom.Collection.Armor.Level", bracket.armorChoices);
        m_unlocks[HeirloomPoolIndex(HeirloomPool::Weapons)][i] = loadAllowance("Heirloom.Collection.WeaponTokens.Level", bracket.weaponTokens);
        m_unlocks[HeirloomPoolIndex(HeirloomPool::Accessories)][i] = loadAllowance("Heirloom.Collection.AccessoryTokens.Level", bracket.accessoryChoices);
    }

    m_scalingEnabled = sConfig.GetBoolDefault("Heirloom.Scaling.Enable", true);

    int32 maxLevel = sConfig.GetIntDefault("Heirloom.Scaling.MaxLevel", HEIRLOOM_MAX_LEVEL_DEFAULT);
    int32 clampedMaxLevel = std::clamp<int32>(maxLevel, HEIRLOOM_MIN_LEVEL, HEIRLOOM_MAX_LEVEL_DEFAULT);
    if (clampedMaxLevel != maxLevel)
        sLog.outString("[mod-twow-heirloom] Warning: Heirloom.Scaling.MaxLevel (%d) out of range [%u..%u]; clamped to %d.",
            maxLevel, HEIRLOOM_MIN_LEVEL, HEIRLOOM_MAX_LEVEL_DEFAULT, clampedMaxLevel);
    m_maxScalingLevel = static_cast<uint8>(clampedMaxLevel);

    m_bonusXPEnabled = sConfig.GetBoolDefault("Heirloom.BonusXP.Enable", true);

    float xpRate = sConfig.GetFloatDefault("Heirloom.BonusXP.Rate", 1.0f);
    if (!std::isfinite(xpRate) || xpRate < 0.0f)
    {
        sLog.outString("[mod-twow-heirloom] Warning: Heirloom.BonusXP.Rate (%.2f) is invalid; reset to 1.00.", xpRate);
        xpRate = 1.0f;
    }
    else if (xpRate > 10.0f)
    {
        sLog.outString("[mod-twow-heirloom] Warning: Heirloom.BonusXP.Rate (%.2f) exceeds max 10.00; clamped to 10.00.", xpRate);
        xpRate = 10.0f;
    }
    m_bonusXPRate = xpRate;

    auto clampPercent = [](char const* key, float val, float defVal) -> float
    {
        if (!std::isfinite(val) || val < 0.0f)
        {
            sLog.outString("[mod-twow-heirloom] Warning: %s (%.2f) is invalid; reset to %.2f.", key, val, defVal);
            return defVal;
        }
        if (val > 100.0f)
        {
            sLog.outString("[mod-twow-heirloom] Warning: %s (%.2f) exceeds max 100.00; clamped to 100.00.", key, val);
            return 100.0f;
        }
        return val;
    };

    m_shoulderXPPercent = clampPercent("Heirloom.BonusXP.ShoulderPercent",
        sConfig.GetFloatDefault("Heirloom.BonusXP.ShoulderPercent", 10.0f), 10.0f);
    m_chestXPPercent = clampPercent("Heirloom.BonusXP.ChestPercent",
        sConfig.GetFloatDefault("Heirloom.BonusXP.ChestPercent", 10.0f), 10.0f);
    m_ringXPPercent = clampPercent("Heirloom.BonusXP.RingPercent",
        sConfig.GetFloatDefault("Heirloom.BonusXP.RingPercent", 5.0f), 5.0f);

    // Durability loss settings: default is false (loss disabled / heirlooms stay at 100%)
    // Check legacy Heirloom.Durability.Exempt for backward-compatibility (Exempt=1 means Loss=0)
    bool legacyExempt = sConfig.GetBoolDefault("Heirloom.Durability.Exempt", true);
    m_durabilityLossPlayer = sConfig.GetBoolDefault("Heirloom.Durability.Loss.Player", !legacyExempt);
    m_durabilityLossBot = sConfig.GetBoolDefault("Heirloom.Durability.Loss.Bot", false);

    // Token requirement settings: default is true (tokens required for both players and bots)
    m_tokensRequiredPlayer = sConfig.GetBoolDefault("Heirloom.Tokens.Required.Player", true);
    m_tokensRequiredBot = sConfig.GetBoolDefault("Heirloom.Tokens.Required.Bot", true);

    m_autoImport = sConfig.GetBoolDefault("Heirloom.Database.AutoImport", true);
    m_sqlPath = sConfig.GetStringDefault("Heirloom.Database.SqlPath", "");
    m_announceEnabled = sConfig.GetBoolDefault("Heirloom.Announce.Enable", true);
    m_debugEnabled = sConfig.GetBoolDefault("Heirloom.Debug.Enable", false);

    m_explicitHeirloomIds.clear();
    std::string idList = sConfig.GetStringDefault("Heirloom.ItemIds", "");
    std::replace(idList.begin(), idList.end(), ',', ' ');
    std::replace(idList.begin(), idList.end(), ';', ' ');
    std::stringstream ss(idList);
    std::string token;
    while (ss >> token)
    {
        try
        {
            size_t parsed = 0;
            unsigned long id = std::stoul(token, &parsed);
            if (parsed == token.size() && token.front() != '-' && id > 0 && id <= std::numeric_limits<uint32>::max())
                m_explicitHeirloomIds.insert(static_cast<uint32>(id));
            else
                sLog.outString("[mod-twow-heirloom] Warning: Ignoring invalid Heirloom.ItemIds token '%s'.", token.c_str());
        }
        catch (...)
        {
            sLog.outString("[mod-twow-heirloom] Warning: Ignoring non-numeric Heirloom.ItemIds token '%s'.", token.c_str());
        }
    }

    uint32 generation = m_generation.fetch_add(1, std::memory_order_release) + 1;

    sLog.outString(
        "[mod-twow-heirloom] Config loaded (Gen=%u): Enabled=%d, Collection=%d, PerChar=%d, Mail=%d, "
        "Scaling=%d (MaxLevel=%u), BonusXP=%d (Rate=%.2f, S=%.1f%%, C=%.1f%%, R=%.1f%%), "
        "DurabilityLoss(P=%d,B=%d), TokensRequired(P=%d,B=%d), Announce=%d, AutoImport=%d, Debug=%d, ExplicitIds=%zu",
        generation, IsEnabled(), IsCollectionEnabled(), UsesPerCharacterUnlocks(), IsCollectionMailEnabled(),
        IsScalingEnabled(), static_cast<unsigned>(GetMaxScalingLevel()),
        IsBonusXPEnabled(), GetBonusXPRate(), GetShoulderBonusXPPercent(), GetChestBonusXPPercent(), GetRingBonusXPPercent(),
        IsDurabilityLossPlayerEnabled(), IsDurabilityLossBotEnabled(),
        IsPlayerTokenRequirementEnabled(), IsBotTokenRequirementEnabled(),
        IsAnnounceEnabled(), IsAutoImportEnabled(), IsDebugEnabled(), m_explicitHeirloomIds.size());
}

HeirloomUnlockLimits HeirloomConfig::GetUnlockLimits(HeirloomPool pool) const
{
    std::lock_guard<std::mutex> lock(m_mutex);
    return m_unlocks[HeirloomPoolIndex(pool)];
}

std::string HeirloomConfig::GetSqlPath() const
{
    std::lock_guard<std::mutex> lock(m_mutex);
    return m_sqlPath;
}

bool HeirloomConfig::IsHeirloomItemId(uint32 itemId) const
{
    std::lock_guard<std::mutex> lock(m_mutex);
    return m_explicitHeirloomIds.find(itemId) != m_explicitHeirloomIds.end();
}

bool HeirloomConfig::IsBotPlayer(Player const* player)
{
    if (!player)
        return false;
    if (sScriptMgr.IsBotManaged(const_cast<Player*>(player)))
        return true;
    return player->GetSession() && player->GetSession()->IsHeadless();
}

bool HeirloomConfig::IsDurabilityLossEnabled(Player const* player) const
{
    if (!player)
        return false;

    return IsBotPlayer(player) ? m_durabilityLossBot.load() : m_durabilityLossPlayer.load();
}

bool HeirloomConfig::IsTokenRequirementEnabled(Player const* player) const
{
    if (!player)
        return true;

    return IsBotPlayer(player) ? m_tokensRequiredBot.load() : m_tokensRequiredPlayer.load();
}
