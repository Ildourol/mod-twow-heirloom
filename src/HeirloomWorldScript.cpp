/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomWorldScript.h"
#include "HeirloomConfig.h"
#include "ScriptObjects.h"
#include "Log.h"

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
}

void AddHeirloomWorldScripts()
{
    new ModTwowHeirloomWorldScript();
}
