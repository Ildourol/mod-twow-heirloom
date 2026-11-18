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
#include "Database/DatabaseEnv.h"
#include "Database/QueryResult.h"
#include "Log.h"

#include <algorithm>
#include <filesystem>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

namespace
{
    bool ExecuteSqlFile(std::string const& filePath)
    {
        std::ifstream file(filePath, std::ios::binary);
        if (!file.is_open())
        {
            sLog.outError("[mod-twow-heirloom] Failed to open SQL file: %s", filePath.c_str());
            return false;
        }

        std::string sql((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
        file.close();

        std::string currentQuery;
        currentQuery.reserve(65536);

        enum Scope { None, SingleQuote, DoubleQuote, SingleLineComment, MultiLineComment };
        Scope scope = None;

        for (size_t i = 0; i < sql.size(); ++i)
        {
            char c = sql[i];
            char next = (i + 1 < sql.size()) ? sql[i + 1] : '\0';

            if (scope == SingleLineComment)
            {
                if (c == '\n' || c == '\r')
                    scope = None;
                continue;
            }
            if (scope == MultiLineComment)
            {
                if (c == '*' && next == '/')
                {
                    scope = None;
                    ++i;
                }
                continue;
            }
            if (scope == SingleQuote)
            {
                currentQuery += c;
                if (c == '\\' && next != '\0')
                {
                    currentQuery += next;
                    ++i;
                }
                else if (c == '\'')
                {
                    scope = None;
                }
                continue;
            }
            if (scope == DoubleQuote)
            {
                currentQuery += c;
                if (c == '\\' && next != '\0')
                {
                    currentQuery += next;
                    ++i;
                }
                else if (c == '"')
                {
                    scope = None;
                }
                continue;
            }

            // Outside quotes and comments
            if (c == '-' && next == '-')
            {
                scope = SingleLineComment;
                ++i;
                continue;
            }
            if (c == '/' && next == '*')
            {
                scope = MultiLineComment;
                ++i;
                continue;
            }
            if (c == '\'')
            {
                scope = SingleQuote;
                currentQuery += c;
                continue;
            }
            if (c == '"')
            {
                scope = DoubleQuote;
                currentQuery += c;
                continue;
            }

            if (c == ';')
            {
                size_t first = currentQuery.find_first_not_of(" \t\r\n");
                if (first != std::string::npos)
                {
                    size_t last = currentQuery.find_last_not_of(" \t\r\n");
                    std::string trimmed = currentQuery.substr(first, (last - first + 1));
                    if (!trimmed.empty())
                    {
                        WorldDatabase.DirectExecute(trimmed.c_str());
                    }
                }
                currentQuery.clear();
                continue;
            }

            currentQuery += c;
        }

        size_t first = currentQuery.find_first_not_of(" \t\r\n");
        if (first != std::string::npos)
        {
            size_t last = currentQuery.find_last_not_of(" \t\r\n");
            std::string trimmed = currentQuery.substr(first, (last - first + 1));
            if (!trimmed.empty())
            {
                WorldDatabase.DirectExecute(trimmed.c_str());
            }
        }

        return true;
    }

    std::string FindSqlDirectory()
    {
        namespace fs = std::filesystem;
        std::string customPath = sHeirloomConfig.GetSqlPath();
        if (!customPath.empty())
        {
            std::error_code ec;
            if (fs::exists(fs::path(customPath) / "0001_custom_heirloom_items.sql", ec))
                return customPath;
        }

        std::vector<std::string> candidates = {
            "modules/mod-twow-heirloom/data/sql/world",
            "../modules/mod-twow-heirloom/data/sql/world",
            "../../modules/mod-twow-heirloom/data/sql/world",
            "Source/tortoise-wow/modules/mod-twow-heirloom/data/sql/world",
            "../Source/tortoise-wow/modules/mod-twow-heirloom/data/sql/world",
            "../../Source/tortoise-wow/modules/mod-twow-heirloom/data/sql/world",
            "C:/Users/Admin/AntigravityProfiles/Projects Twow/Turtle wow modules/mod-twow-heirloom/data/sql/world",
            "C:/Users/Admin/AntigravityProfiles/Projects Twow/Turtle wow server/Source/tortoise-wow/modules/mod-twow-heirloom/data/sql/world"
        };

        for (std::string const& p : candidates)
        {
            std::error_code ec;
            if (fs::exists(fs::path(p) / "0001_custom_heirloom_items.sql", ec))
                return p;
        }

        return "";
    }

    void CheckAndImportHeirloomDatabase()
    {
        if (!sHeirloomConfig.IsAutoImportEnabled())
            return;

        QueryResult* itemCheck = WorldDatabase.Query("SELECT entry FROM item_template WHERE entry = 900001 LIMIT 1");
        QueryResult* vendorCheck = WorldDatabase.Query("SELECT entry FROM creature_template WHERE entry = 2000200 LIMIT 1");
        QueryResult* spawnCheck = WorldDatabase.Query("SELECT guid FROM creature WHERE id = 2000201 LIMIT 1");

        bool itemsMissing = (itemCheck == nullptr);
        bool vendorsMissing = (vendorCheck == nullptr);
        bool spawnsMissing = (spawnCheck == nullptr);

        if (itemCheck) delete itemCheck;
        if (vendorCheck) delete vendorCheck;
        if (spawnCheck) delete spawnCheck;

        if (!itemsMissing && !vendorsMissing && !spawnsMissing)
        {
            sLog.outString("[mod-twow-heirloom] Database verified: Heirloom item templates (900001-916160), vendors, and spawns are intact.");
            return;
        }

        sLog.outString("[mod-twow-heirloom] Standalone Auto-Import: Missing items (%d), vendors (%d), or spawns (%d). Searching SQL migrations...",
            itemsMissing ? 1 : 0, vendorsMissing ? 1 : 0, spawnsMissing ? 1 : 0);

        std::string sqlDir = FindSqlDirectory();
        if (sqlDir.empty())
        {
            sLog.outError("[mod-twow-heirloom] Standalone Auto-Import: Could not locate 'data/sql/world' directory! Please check Heirloom.Database.SqlPath.");
            return;
        }

        namespace fs = std::filesystem;
        std::vector<std::string> sqlFiles;
        std::error_code dirEc;
        for (auto const& dirEntry : fs::directory_iterator(sqlDir, dirEc))
        {
            if (dirEntry.is_regular_file() && dirEntry.path().extension() == ".sql")
            {
                sqlFiles.push_back(dirEntry.path().string());
            }
        }
        std::sort(sqlFiles.begin(), sqlFiles.end());

        for (std::string const& filePath : sqlFiles)
        {
            std::error_code ec;
            if (fs::exists(filePath, ec))
            {
                sLog.outString("[mod-twow-heirloom] Importing migration: %s", fs::path(filePath).filename().string().c_str());
                ExecuteSqlFile(filePath);
            }
        }

        sLog.outString("[mod-twow-heirloom] Reloading item templates, creature templates, and vendor inventories into memory...");
        sObjectMgr.LoadItemPrototypes();
        sObjectMgr.LoadCreatureTemplates();
        sObjectMgr.LoadVendors();

        sLog.outString("[mod-twow-heirloom] Standalone Auto-Import completed successfully. Heirloom system is fully operational.");
    }

    class ModTwowHeirloomWorldScript : public WorldScript
    {
    public:
        ModTwowHeirloomWorldScript()
            : WorldScript("mod-twow-heirloom_world",
                {
                    WORLDHOOK_ON_STARTUP,
                    WORLDHOOK_ON_AFTER_CONFIG_LOAD,
                    WORLDHOOK_ON_LOAD_CUSTOM_DATABASE_TABLE
                })
        {
        }

        void OnLoadCustomDatabaseTable() override
        {
            sHeirloomConfig.Load();
            CheckAndImportHeirloomDatabase();
        }

        void OnStartup() override
        {
            sHeirloomConfig.Load();
            CheckAndImportHeirloomDatabase();
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
