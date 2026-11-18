/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomConfig.h"
#include "Config/Config.h"
#include "Log.h"

#include <algorithm>
#include <cmath>
#include <sstream>

namespace
{
    // Dedicated custom heirloom items (IDs 990101 - 990115):
    // Plate: Polished Spaulders of Valor (990101), Polished Breastplate of Valor (990102)
    // Mail: Champion Herod's Shoulder (990103), Champion's Deathdealer Breastplate (990104), Mystical Pauldrons of Elements (990109), Mystical Vest of Elements (990110)
    // Leather: Stained Shadowcraft Spaulders (990105), Stained Shadowcraft Tunic (990106), Preened Ironfeather Shoulders (990111), Preened Ironfeather Breastplate (990112)
    // Cloth: Tattered Dreadmist Mantle (990107), Tattered Dreadmist Robe (990108)
    // Jewelry: Discerning Eye of the Beast (990113), Swift Hand of Justice (990114), Dread Pirate Ring (990115)
    const std::unordered_set<uint32> s_defaultHeirloomItemIds = {
        // Armor Pieces & Core Slots (990101 - 990139)
        990101, 990102, 990103, 990104, 990105, 990106, 990107, 990108,
        990109, 990110, 990111, 990112, 990113, 990114, 990115,
        990116, 990117, 990118, 990119, 990120, 990121,
        990122, 990123, 990124, 990125, 990126, 990127,
        990128, 990129, 990130, 990131, 990132, 990133,
        990134, 990135, 990136, 990137, 990138, 990139,
        // Weapons & Off-hands (990140 - 990156)
        990140, 990141, 990142, 990143, 990144, 990145, 990146, 990147, 990148,
        990149, 990150, 990151, 990152, 990153,
        990154, 990155, 990156,
        // Official Heirloom Weapons & Off-hands (User Collection)
        5191, 6977, 1292, 6975, 9639, 7723, 6831, 19896, 9416, 7713,
        13022, 2100, 12651, 13938, 3137, 11262, 7726,
        // Iconic Heirloom Weapon Appearances
        18348, 19854, 17068, 12784, 23056, 19323, 18805, 19365,
        19874, 18713, 19368, 19361, 21603, 18842, 19142, 1168
    };
}

HeirloomConfig& HeirloomConfig::Instance()
{
    static HeirloomConfig instance;
    return instance;
}

void HeirloomConfig::Load()
{
    std::lock_guard<std::mutex> lock(m_mutex);

    ++m_configGeneration;

    m_enabled = sConfig.GetBoolDefault("Heirloom.Enable", true);
    m_scalingEnabled = sConfig.GetBoolDefault("Heirloom.Scaling.Enable", true);

    int32 maxLvl = sConfig.GetIntDefault("Heirloom.Scaling.MaxLevel", HEIRLOOM_MAX_LEVEL_DEFAULT);
    if (maxLvl < HEIRLOOM_MIN_LEVEL)
        maxLvl = HEIRLOOM_MIN_LEVEL;
    if (maxLvl > 60)
        maxLvl = 60;
    m_maxScalingLevel = static_cast<uint8>(maxLvl);

    float statMult = sConfig.GetFloatDefault("Heirloom.Scaling.StatMultiplier", 1.0f);
    if (!std::isfinite(statMult) || statMult <= 0.0f)
        statMult = 1.0f;
    m_statMultiplier = std::clamp(statMult, 0.1f, 10.0f);

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
    m_trinketXPPercent  = clampPercent(sConfig.GetFloatDefault("Heirloom.BonusXP.TrinketPercent", 0.0f), 0.0f);
    m_ringXPPercent     = clampPercent(sConfig.GetFloatDefault("Heirloom.BonusXP.RingPercent", 5.0f), 5.0f);

    m_durabilityExempt = sConfig.GetBoolDefault("Heirloom.Durability.Exempt", true);
    m_autoImport = sConfig.GetBoolDefault("Heirloom.Database.AutoImport", true);
    m_sqlPath = sConfig.GetStringDefault("Heirloom.Database.SqlPath", "");
    m_announceEnabled = sConfig.GetBoolDefault("Heirloom.Announce.Enable", true);
    m_debugEnabled = sConfig.GetBoolDefault("Heirloom.Debug.Enable", true);

    // Explicit administrator allowlist with hardcoded default set support
    m_explicitHeirloomIds.clear();
    std::string idList = sConfig.GetStringDefault("Heirloom.ItemIds", "default");
    
    // Check if default set is requested
    std::string idListLower = idList;
    std::transform(idListLower.begin(), idListLower.end(), idListLower.begin(), ::tolower);
    if (idListLower.empty() || idListLower.find("default") != std::string::npos)
    {
        m_explicitHeirloomIds = s_defaultHeirloomItemIds;
    }

    std::replace(idList.begin(), idList.end(), ',', ' ');
    std::replace(idList.begin(), idList.end(), ';', ' ');
    std::stringstream ss(idList);
    std::string token;
    while (ss >> token)
    {
        try
        {
            uint32 id = std::stoul(token);
            if (id > 0)
                m_explicitHeirloomIds.insert(id);
        }
        catch (...)
        {
            // Ignore non-numeric tokens like "default"
        }
    }

    sLog.outString("[mod-twow-heirloom] Config generation %u loaded: Enabled=%d, Scaling=%d (MaxLvl=%u, StatMult=%.2f), BonusXP=%d (Rate=%.2f), ExplicitIds=%zu",
        m_configGeneration,
        m_enabled ? 1 : 0,
        m_scalingEnabled ? 1 : 0,
        m_maxScalingLevel,
        m_statMultiplier,
        m_bonusXPEnabled ? 1 : 0,
        m_bonusXPRate,
        m_explicitHeirloomIds.size());
}

bool HeirloomConfig::IsHeirloomItemId(uint32 itemId) const
{
    // All custom heirloom items in 900000 - 916300 (Level 1-60 dynamic items) are recognized unconditionally
    if (itemId >= 900000 && itemId <= 916300)
        return true;

    // All custom heirloom items in 990000 - 992999 range are recognized unconditionally
    if (itemId >= 990000 && itemId <= 992999)
        return true;

    // Official Heirloom Weapons & Off-hands (User Collection) recognized unconditionally
    switch (itemId)
    {
        case 5191:  // Cruel Barb
        case 6977:  // Whirlwind Sword
        case 1292:  // Butcher's Cleaver
        case 6975:  // Whirlwind Axe
        case 7717:  // Ravager
        case 9639:  // The Hand of Antu'sul
        case 7723:  // Mograine's Might
        case 6831:  // Black Menace
        case 19896: // Thekal's Grasp
        case 9416:  // Grimlok's Charge
        case 7713:  // Illusionary Rod
        case 13022: // Gryphonwing Long Bow
        case 2100:  // Precisely Calibrated Boomstick
        case 12651: // Blackcrow
        case 13938: // Bonecreeper Stylus
        case 3137:  // Deadly Throwing Axe
        case 11262: // Orb of Lorica
        case 7726:  // Aegis of the Scarlet Commander
        // Iconic Heirloom Weapon Appearances
        case 18348: // Quel'Serrar
        case 19854: // Zin'rokh, Destroyer of Worlds
        case 17068: // Deathbringer
        case 12784: // Arcanite Reaper
        case 23056: // Hammer of the Twisting Nether
        case 19323: // The Unstoppable Force
        case 18805: // Core Hound Tooth
        case 19365: // Claw of the Black Drake
        case 19874: // Halberd of Smiting
        case 18713: // Rhok'delar, Longbow of the Ancient Keepers
        case 19368: // Dragonbreath Hand Cannon
        case 19361: // Ashjre'thul, Crossbow of Smiting
        case 21603: // Wand of Qiraji Nobility
        case 18842: // Staff of Dominance
        case 19142: // Fire Runed Grimoire
        case 1168:  // Skullflame Shield
            return true;
        default:
            break;
    }

    std::lock_guard<std::mutex> lock(m_mutex);
    return m_explicitHeirloomIds.find(itemId) != m_explicitHeirloomIds.end();
}
