/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomPlayerScript.h"
#include "HeirloomMgr.h"
#include "ScriptObjects.h"
#include "Objects/Player.h"
#include "Objects/Item.h"

namespace
{
    class ModTwowHeirloomPlayerScript : public PlayerScript
    {
    public:
        ModTwowHeirloomPlayerScript()
            : PlayerScript("mod-twow-heirloom_player")
        {
        }

        void OnLogin(Player* player) override
        {
            sHeirloomMgr.HandlePlayerLogin(player);
        }

        void OnLogout(Player* player) override
        {
            sHeirloomMgr.HandlePlayerLogout(player);
        }

        void OnLevelChanged(Player* player, uint8 oldLevel) override
        {
            sHeirloomMgr.HandlePlayerLevelChanged(player, oldLevel);
        }

        void OnGiveXP(Player* player, uint32& amount, Unit* victim) override
        {
            sHeirloomMgr.HandlePlayerGiveXP(player, amount, victim);
        }

        void OnLootItem(Player* player, Item* item, uint32 /*count*/, ObjectGuid /*lootGuid*/) override
        {
            if (player && item && sHeirloomMgr.IsHeirloomItem(item->GetProto()))
            {
                sHeirloomMgr.AdaptAllPlayerHeirlooms(player);
            }
        }

        void OnUpdate(Player* player, uint32 diff) override
        {
            sHeirloomMgr.HandlePlayerUpdate(player, diff);
        }
    };
}

void AddHeirloomPlayerScripts()
{
    new ModTwowHeirloomPlayerScript();
}
