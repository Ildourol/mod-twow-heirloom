#ifndef HEIRLOOM_ARMOR_SETS_H
#define HEIRLOOM_ARMOR_SETS_H

#include "Common.h"
#include <array>

class Player;

namespace HeirloomArmorSets
{
    using EquippedEntries = std::array<uint32, 8>;

    bool Initialize();
    EquippedEntries GetEquippedEntries(Player const* player);
    void Refresh(Player* player);
    void Clear(Player* player);
}

#endif
