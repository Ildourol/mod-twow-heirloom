#ifndef HEIRLOOM_ARMOR_SETS_H
#define HEIRLOOM_ARMOR_SETS_H

class Player;

namespace HeirloomArmorSets
{
    bool Initialize();
    void Refresh(Player* player);
    void Clear(Player* player);
}

#endif
