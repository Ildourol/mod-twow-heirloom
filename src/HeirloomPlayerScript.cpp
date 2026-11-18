/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomPlayerScript.h"
#include "HeirloomMgr.h"
#include "ScriptObjects.h"
#include "Objects/Player.h"
#include "Objects/Creature.h"
#include "Objects/Item.h"
#include "ObjectMgr.h"
#include "Maps/Map.h"

#include <algorithm>

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

            // Pre-adapt vendor items whenever targeting an heirloom curator
            if (player && player->GetTargetGuid())
            {
                if (Creature* creature = player->GetMap()->GetCreature(player->GetTargetGuid()))
                {
                    uint32 entry = creature->GetEntry();
                    if ((entry >= 2000200 && entry <= 2000212) || (entry >= 2000220 && entry <= 2000232))
                    {
                        VendorItemData const* vItems = sObjectMgr.GetNpcVendorItemList(entry);
                        if (vItems)
                        {
                            uint8 pLevel = std::clamp<uint8>(player->GetLevel(), 1, 60);
                            for (size_t i = 0; i < vItems->m_items.size(); ++i)
                            {
                                VendorItem* vItem = vItems->GetItem(static_cast<uint32>(i));
                                if (vItem)
                                {
                                    uint32 baseId = (vItem->item / 100) * 100;
                                    if (baseId >= 900000 && baseId <= 916260)
                                    {
                                        vItem->item = baseId + pLevel;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    };
}

void AddHeirloomPlayerScripts()
{
    new ModTwowHeirloomPlayerScript();
}
