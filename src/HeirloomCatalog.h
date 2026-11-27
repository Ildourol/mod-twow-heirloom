/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#ifndef _HEIRLOOM_CATALOG_H
#define _HEIRLOOM_CATALOG_H

#include "HeirloomCommon.h"
#include <array>
#include <cstddef>

namespace HeirloomCatalog
{
    enum class ArmorMaterial : size_t { Plate = 0, Mail = 1, Leather = 2, Cloth = 3 };
    enum class ArmorRole : size_t
    {
        Bulwark = 0,
        Arms = 1,
        Renewal = 2,
        Arcane = Bulwark,
        Destruction = Arms,
        Spellcraft = Arms
    };

    inline constexpr size_t ArmorPiecesPerGroup = 8;

    inline constexpr std::array<std::array<uint32, 3>, 4> ArmorGroups = []()
    {
        std::array<std::array<uint32, 3>, 4> families{};
#define HEIRLOOM_ARMOR_GROUP(material, family, style) \
        families[static_cast<size_t>(ArmorMaterial::material)][static_cast<size_t>(ArmorRole::style)] = family;
#include "HeirloomArmorCatalog.inc"
#undef HEIRLOOM_ARMOR_GROUP
        return families;
    }();

    constexpr size_t CountArmorFamilies()
    {
        size_t count = 0;
        for (auto const& material : ArmorGroups)
            for (uint32 first : material)
                if (first)
                    count += ArmorPiecesPerGroup;
        return count;
    }

    inline constexpr std::array<uint32, CountArmorFamilies()> ArmorFamilies = []()
    {
        std::array<uint32, CountArmorFamilies()> families{};
        size_t idx = 0;
        for (auto const& material : ArmorGroups)
            for (uint32 first : material)
                if (first)
                    for (uint32 piece = 0; piece < ArmorPiecesPerGroup; ++piece)
                        families[idx++] = first + piece * 100;
        return families;
    }();

    inline constexpr auto WeaponFamilies = []()
    {
        constexpr uint32 raw[] = {
#define HEIRLOOM_WEAPON(family) family,
#include "HeirloomWeaponCatalog.inc"
#undef HEIRLOOM_WEAPON
        };
        std::array<uint32, sizeof(raw) / sizeof(raw[0])> arr{};
        for (size_t i = 0; i < arr.size(); ++i)
            arr[i] = raw[i];
        return arr;
    }();

    inline constexpr auto AccessoryFamilies = []()
    {
        constexpr uint32 raw[] = {
#define HEIRLOOM_ACCESSORY(family) family,
#include "HeirloomAccessoryCatalog.inc"
#undef HEIRLOOM_ACCESSORY
        };
        std::array<uint32, sizeof(raw) / sizeof(raw[0])> arr{};
        for (size_t i = 0; i < arr.size(); ++i)
            arr[i] = raw[i];
        return arr;
    }();

    inline constexpr size_t TotalFamilyCount =
        ArmorFamilies.size() + WeaponFamilies.size() + AccessoryFamilies.size();

    inline constexpr std::array<uint32, TotalFamilyCount> AllFamilies = []()
    {
        std::array<uint32, TotalFamilyCount> families{};
        size_t idx = 0;
        for (uint32 fam : ArmorFamilies)
            families[idx++] = fam;
        for (uint32 fam : WeaponFamilies)
            families[idx++] = fam;
        for (uint32 fam : AccessoryFamilies)
            families[idx++] = fam;

        // C++17 constexpr insertion sort for O(log N) binary_search lookup.
        for (size_t i = 1; i < families.size(); ++i)
        {
            uint32 key = families[i];
            size_t j = i;
            while (j > 0 && families[j - 1] > key)
            {
                families[j] = families[j - 1];
                --j;
            }
            families[j] = key;
        }
        return families;
    }();

    static_assert(ArmorFamilies.size() == 96, "Expected 96 heirloom armor families");
    static_assert(WeaponFamilies.size() == 65, "Expected 65 heirloom weapon families");
    static_assert(AccessoryFamilies.size() == 16, "Expected 16 heirloom accessory families");
    static_assert(AllFamilies.size() == 177, "Expected 177 total heirloom families");
    static_assert([]()
    {
        for (size_t i = 1; i < AllFamilies.size(); ++i)
            if (AllFamilies[i - 1] >= AllFamilies[i])
                return false;
        return true;
    }(), "AllFamilies must remain strictly increasing without duplicates");

    constexpr size_t TotalFamilies() { return AllFamilies.size(); }
    constexpr size_t TotalTemplates() { return AllFamilies.size() * HEIRLOOM_MAX_LEVEL_DEFAULT; }
    constexpr uint32 MinCatalogEntry() { return AllFamilies.front() + HEIRLOOM_MIN_LEVEL; }
    constexpr uint32 MaxCatalogEntry() { return AllFamilies.back() + HEIRLOOM_MAX_LEVEL_DEFAULT; }

    constexpr bool IsCatalogFamily(uint32 family)
    {
        size_t lo = 0;
        size_t hi = AllFamilies.size();
        while (lo < hi)
        {
            size_t mid = lo + (hi - lo) / 2;
            if (AllFamilies[mid] < family)
                lo = mid + 1;
            else
                hi = mid;
        }
        return lo < AllFamilies.size() && AllFamilies[lo] == family;
    }

    constexpr bool IsCatalogEntry(uint32 entry)
    {
        uint32 tier = entry % 100;
        return entry > tier && tier >= HEIRLOOM_MIN_LEVEL && tier <= HEIRLOOM_MAX_LEVEL_DEFAULT &&
               IsCatalogFamily(entry - tier);
    }

    template <class Visitor>
    void VisitPoolFamilies(HeirloomPool pool, Visitor&& visit)
    {
        if (pool == HeirloomPool::Accessories)
        {
            for (uint32 family : AccessoryFamilies)
                visit(family);
            return;
        }
        if (pool == HeirloomPool::Weapons)
        {
            for (uint32 family : WeaponFamilies)
                visit(family);
            return;
        }
        for (uint32 family : ArmorFamilies)
            visit(family);
    }
} // namespace HeirloomCatalog

#endif // _HEIRLOOM_CATALOG_H
