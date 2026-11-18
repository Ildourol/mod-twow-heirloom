/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#ifndef _HEIRLOOM_FORMULA_H
#define _HEIRLOOM_FORMULA_H

#include "HeirloomCommon.h"

namespace HeirloomFormula
{
    /**
     * Clamps the player's level to the configured heirloom scaling bounds.
     */
    [[nodiscard]] uint8 GetEffectiveLevel(uint8 playerLevel, uint8 maxLevel);

    /**
     * Determines the reference base level of an item prototype.
     */
    [[nodiscard]] uint8 GetBaseItemLevel(ItemPrototype const* proto);

    /**
     * Computes the scaling ratio between the base item level and the target level.
     */
    [[nodiscard]] double CalculateScalingRatio(uint8 baseLevel, uint8 targetLevel);

    /**
     * Scales an additive stat value (Strength, Agility, Stamina, Intellect, Spirit, Mana, Health).
     */
    [[nodiscard]] int32 ScaleStat(int32 baseStat, double ratio, float multiplier = 1.0f);

    /**
     * Scales armor value.
     */
    [[nodiscard]] uint32 ScaleArmor(uint32 baseArmor, double ratio, float multiplier = 1.0f);

    /**
     * Scales shield block value.
     */
    [[nodiscard]] uint32 ScaleBlock(uint32 baseBlock, double ratio, float multiplier = 1.0f);
}

#endif // _HEIRLOOM_FORMULA_H
