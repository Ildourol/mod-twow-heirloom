/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomWorldScript.h"
#include "HeirloomConfig.h"
#include "ScriptObjects.h"
#include "Objects/Player.h"
#include "Objects/Creature.h"
#include "ObjectMgr.h"
#include "WorldSession.h"
#include "Log.h"

#include <algorithm>

namespace
{
    class ModTwowHeirloomWorldScript : public WorldScript
    {
    public:
        ModTwowHeirloomWorldScript()
            : WorldScript("mod-twow-heirloom_world")
        {
        }

        void OnStartup() override
        {
            sHeirloomConfig.Load();
            sLog.outString("[mod-twow-heirloom] Module initialized successfully.");
        }

        void OnAfterConfigLoad(bool /*reload*/) override
        {
            sHeirloomConfig.Load();
        }
    };

    class HeirloomVendorScript : public CreatureScript
    {
    public:
        HeirloomVendorScript()
            : CreatureScript("npc_heirloom_vendor")
        {
        }

        bool OnGossipHello(Player* player, Creature* creature) override
        {
            if (!player || !creature)
                return false;

            VendorItemData const* vItems = sObjectMgr.GetNpcVendorItemList(creature->GetEntry());
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

            if (player->GetSession())
            {
                player->GetSession()->SendListInventory(creature->GetObjectGuid());
            }
            return true;
        }
    };
}

void AddHeirloomWorldScripts()
{
    new ModTwowHeirloomWorldScript();
    new HeirloomVendorScript();
}

