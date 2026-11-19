/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomPlayerScript.h"
#include "HeirloomMgr.h"
#include "HeirloomArmorSets.h"
#include "HeirloomCuratorMail.h"
#include "ScriptObjects.h"
#include "Objects/Item.h"

namespace
{
    class ModTwowHeirloomPlayerScript : public PlayerScript
    {
    public:
        ModTwowHeirloomPlayerScript()
            : PlayerScript("mod-twow-heirloom_player",
                { PLAYERHOOK_ON_LOGIN, PLAYERHOOK_ON_LOGOUT, PLAYERHOOK_ON_LEVEL_CHANGED,
                  PLAYERHOOK_ON_GIVE_EXP, PLAYERHOOK_ON_LOOT_ITEM, PLAYERHOOK_ON_UPDATE })
        {
        }

        void OnLogin(Player* player) override
        {
            sHeirloomMgr.HandlePlayerLogin(player);
            HeirloomArmorSets::Refresh(player);
            HeirloomCuratorMail::Notify(player);
        }

        void OnLogout(Player* player) override
        {
            HeirloomArmorSets::Clear(player);
            sHeirloomMgr.HandlePlayerLogout(player);
        }

        void OnLevelChanged(Player* player, uint8 oldLevel) override
        {
            sHeirloomMgr.AdaptAllPlayerHeirlooms(player);
            HeirloomArmorSets::Refresh(player);
            HeirloomCuratorMail::Notify(player, oldLevel);
        }

        void OnGiveXP(Player* player, uint32& amount, Unit* victim) override
        {
            sHeirloomMgr.HandlePlayerGiveXP(player, amount, victim);
        }

        void OnLootItem(Player* player, Item* item, uint32 /*count*/, ObjectGuid /*lootGuid*/) override
        {
            if (item && HeirloomMgr::GetFamily(item->GetEntry()))
                sHeirloomMgr.AdaptAllPlayerHeirlooms(player);
        }

        void OnUpdate(Player* player, uint32 diff) override
        {
            sHeirloomMgr.HandlePlayerUpdate(player, diff);
            HeirloomArmorSets::Refresh(player);
        }
    };
}

void AddHeirloomPlayerScripts()
{
    new ModTwowHeirloomPlayerScript();
}
