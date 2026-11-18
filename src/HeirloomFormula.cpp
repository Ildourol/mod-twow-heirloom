/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomFormula.h"
#include <algorithm>
#include <cmath>

namespace HeirloomFormula
{
    uint8 GetEffectiveLevel(uint8 playerLevel, uint8 maxLevel)
    {
        uint8 effective = std::max<uint8>(HEIRLOOM_MIN_LEVEL, playerLevel);
        if (maxLevel > 0)
            effective = std::min<uint8>(effective, maxLevel);
        return effective;
    }

    uint8 GetBaseItemLevel(ItemPrototype const* proto)
    {
        if (!proto)
            return HEIRLOOM_MIN_LEVEL;

        // Level 1-60 dynamic morphing heirlooms (900000 - 916300) already have exact stats in template
        if (proto->ItemId >= 900000 && proto->ItemId <= 916300)
            return static_cast<uint8>(std::min<uint32>(proto->ItemLevel > 0 ? proto->ItemLevel : 1, 60));

        // Custom heirloom items (990000 - 992999) have explicit Level 1 base
        if (proto->ItemId >= 990000 && proto->ItemId <= 992999)
            return HEIRLOOM_MIN_LEVEL;

        if (proto->ItemLevel > 0)
            return static_cast<uint8>(std::min<uint32>(proto->ItemLevel, 60));

        if (proto->RequiredLevel > 0)
            return static_cast<uint8>(std::min<uint32>(proto->RequiredLevel, 60));

        return HEIRLOOM_MIN_LEVEL;
    }

    double CalculateScalingRatio(uint8 baseLevel, uint8 targetLevel)
    {
        uint32 b = std::max<uint32>(1, baseLevel);
        uint32 t = std::max<uint32>(1, targetLevel);

        if (b == t)
            return 1.0;

        // Linear item scaling budget formula from mod-twow-item-level-scaling:
        // Budget ratio R(L) = (L + 5.0) / (L0 + 5.0)
        double r = (static_cast<double>(t) + 5.0) / (static_cast<double>(b) + 5.0);
        if (!std::isfinite(r) || r <= 0.0)
            return 1.0;

        // Clamp to prevent overflow or extreme numbers while allowing lower-level scaling
        return std::clamp(r, 0.05, 15.0);
    }

    int32 ScaleStat(int32 baseStat, double ratio, float multiplier)
    {
        if (baseStat == 0)
            return 0;

        if (!std::isfinite(ratio) || ratio <= 0.0)
            ratio = 1.0;
        if (!std::isfinite(multiplier) || multiplier <= 0.0f)
            multiplier = 1.0f;

        double baseDouble = static_cast<double>(baseStat);
        if (!std::isfinite(baseDouble))
            return 0;

        double scaled = baseDouble * ratio * static_cast<double>(multiplier);
        if (!std::isfinite(scaled))
            return baseStat;

        // Bounded to prevent int32 overflow and game-breaking stats
        scaled = std::clamp(scaled, -10000.0, 10000.0);
        int64 result = static_cast<int64>(std::round(scaled));

        // Preserve non-zero sign if base was non-zero
        if (result == 0)
            return (baseStat > 0) ? 1 : -1;

        return static_cast<int32>(std::clamp<int64>(result, -10000LL, 10000LL));
    }

    uint32 ScaleArmor(uint32 baseArmor, double ratio, float multiplier)
    {
        if (baseArmor == 0)
            return 0;

        if (!std::isfinite(ratio) || ratio <= 0.0)
            ratio = 1.0;
        if (!std::isfinite(multiplier) || multiplier <= 0.0f)
            multiplier = 1.0f;

        double baseDouble = static_cast<double>(baseArmor);
        if (!std::isfinite(baseDouble))
            return 0;

        double scaled = baseDouble * ratio * static_cast<double>(multiplier);
        if (!std::isfinite(scaled))
            return baseArmor;

        scaled = std::clamp(scaled, 1.0, 100000.0);
        int64 result = static_cast<int64>(std::round(scaled));

        if (result <= 0)
            return 1;

        return static_cast<uint32>(std::clamp<int64>(result, 1LL, 100000LL));
    }

    uint32 ScaleBlock(uint32 baseBlock, double ratio, float multiplier)
    {
        if (baseBlock == 0)
            return 0;

        if (!std::isfinite(ratio) || ratio <= 0.0)
            ratio = 1.0;
        if (!std::isfinite(multiplier) || multiplier <= 0.0f)
            multiplier = 1.0f;

        double baseDouble = static_cast<double>(baseBlock);
        if (!std::isfinite(baseDouble))
            return 0;

        double scaled = baseDouble * ratio * static_cast<double>(multiplier);
        if (!std::isfinite(scaled))
            return baseBlock;

        scaled = std::clamp(scaled, 1.0, 50000.0);
        int64 result = static_cast<int64>(std::round(scaled));

        if (result <= 0)
            return 1;

        return static_cast<uint32>(std::clamp<int64>(result, 1LL, 50000LL));
    }
}
