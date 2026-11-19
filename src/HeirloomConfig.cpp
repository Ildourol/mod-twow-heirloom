/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomConfig.h"
#include "Config/Config.h"
#include "Log.h"

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
        m_unlocks[HeirloomPoolIndex(HeirloomPool::Armor)][i] = std::max<int32>(0,
            sConfig.GetIntDefault(("Heirloom.Collection.Armor.Level" + level).c_str(), bracket.armorChoices));
        m_unlocks[HeirloomPoolIndex(HeirloomPool::Weapons)][i] = std::max<int32>(0,
            sConfig.GetIntDefault(("Heirloom.Collection.WeaponTokens.Level" + level).c_str(), bracket.weaponTokens));
        m_unlocks[HeirloomPoolIndex(HeirloomPool::Accessories)][i] = std::max<int32>(0,
            sConfig.GetIntDefault(("Heirloom.Collection.AccessoryTokens.Level" + level).c_str(), bracket.accessoryChoices));
    }
    m_scalingEnabled = sConfig.GetBoolDefault("Heirloom.Scaling.Enable", true);

    int32 maxLevel = sConfig.GetIntDefault("Heirloom.Scaling.MaxLevel", HEIRLOOM_MAX_LEVEL_DEFAULT);
    m_maxScalingLevel = static_cast<uint8>(std::clamp<int32>(maxLevel, HEIRLOOM_MIN_LEVEL, HEIRLOOM_MAX_LEVEL_DEFAULT));

    m_bonusXPEnabled = sConfig.GetBoolDefault("Heirloom.BonusXP.Enable", true);

    float xpRate = sConfig.GetFloatDefault("Heirloom.BonusXP.Rate", 1.0f);
    if (!std::isfinite(xpRate) || xpRate < 0.0f)
        xpRate = 1.0f;
    m_bonusXPRate = std::clamp(xpRate, 0.0f, 10.0f);

    auto clampPercent = [](float val, float defVal) -> float
    {
        if (!std::isfinite(val) || val < 0.0f)
            return defVal;
        return std::clamp(val, 0.0f, 100.0f);
    };

    m_shoulderXPPercent = clampPercent(sConfig.GetFloatDefault("Heirloom.BonusXP.ShoulderPercent", 10.0f), 10.0f);
    m_chestXPPercent    = clampPercent(sConfig.GetFloatDefault("Heirloom.BonusXP.ChestPercent", 10.0f), 10.0f);
    m_ringXPPercent     = clampPercent(sConfig.GetFloatDefault("Heirloom.BonusXP.RingPercent", 5.0f), 5.0f);

    m_durabilityExempt = sConfig.GetBoolDefault("Heirloom.Durability.Exempt", true);
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
        }
        catch (...)
        {
            // Ignore non-numeric tokens like "default"
        }
    }

    sLog.outString("[mod-twow-heirloom] Config loaded: Enabled=%d, Collection=%d, Scaling=%d (MaxLevel=%u), BonusXP=%d (Rate=%.2f), ExplicitIds=%zu",
        IsEnabled(), IsCollectionEnabled(), IsScalingEnabled(), static_cast<unsigned>(GetMaxScalingLevel()), IsBonusXPEnabled(),
        GetBonusXPRate(), m_explicitHeirloomIds.size());
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
