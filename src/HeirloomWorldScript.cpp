/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomWorldScript.h"
#include "HeirloomConfig.h"
#include "ScriptObjects.h"
#include "Database/DatabaseEnv.h"
#include "Database/QueryResult.h"
#include "ObjectMgr.h"
#include "Log.h"

#include <filesystem>
#include <fstream>
#include <iterator>
#include <string>

namespace
{
    constexpr char WorldInstallSql[] = "heirloom_world.sql";
    constexpr char CharacterInstallSql[] = "heirloom_characters.sql";
    bool CollectionReady = false;

    bool ExecuteSqlFile(DatabaseType& database, std::filesystem::path const& filePath)
    {
        std::ifstream file(filePath, std::ios::binary);
        if (!file.is_open())
        {
            sLog.outError("[mod-twow-heirloom] Failed to open SQL file: %s", filePath.string().c_str());
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
                {
                    scope = None;
                    currentQuery += ' ';
                }
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
                        if (!database.DirectExecute(trimmed.c_str()))
                            return false;
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
                return database.DirectExecute(trimmed.c_str());
            }
        }

        return true;
    }

    bool HasWorldData()
    {
        QueryResult* result = WorldDatabase.Query(
            "SELECT 1 FROM DUAL WHERE "
            "(SELECT COUNT(*) FROM item_template WHERE entry BETWEEN 900001 AND 916160 "
            "AND MOD(entry, 100) BETWEEN 1 AND 60 AND bonding = 6) = 9720 "
            "AND (SELECT COUNT(*) FROM item_template WHERE entry IN (916301, 916302, 916303) AND bonding = 1) = 3 "
            "AND (SELECT COUNT(*) FROM creature_template WHERE entry IN (2000201, 2000204, 2000221, 2000224) "
            "AND script_name = 'npc_heirloom_vendor') = 4 "
            "AND (SELECT COUNT(DISTINCT id) FROM creature WHERE id IN (2000201, 2000204, 2000221, 2000224)) = 4 "
            "AND EXISTS (SELECT 1 FROM npc_text n JOIN broadcast_text b ON b.entry = n.BroadcastTextID0 "
            "WHERE n.ID = 910210 AND b.male_text = 'CUSTOM_MERCHANT_TRIGGER' "
            "AND b.female_text = 'CUSTOM_MERCHANT_TRIGGER')");
        bool ready = result != nullptr;
        delete result;
        return ready;
    }

    bool HasCharacterSchema()
    {
        QueryResult* result = CharacterDatabase.Query(
            "SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() "
            "AND TABLE_NAME = 'mod_heirloom_account_collection' "
            "AND COLUMN_NAME IN ('account_id', 'family', 'pool', 'milestone', 'earner_guid', "
            "'unlock_slot', 'shared_slot', 'unlock_cost')");
        bool ready = result && result->Fetch()[0].GetUInt32() == 8;
        delete result;
        return ready;
    }

    std::filesystem::path FindWorldSql()
    {
        namespace fs = std::filesystem;
        std::error_code error;
        std::string configuredPath = sHeirloomConfig.GetSqlPath();
        if (!configuredPath.empty())
            return fs::path(configuredPath);

        for (fs::path const& root : {fs::path("."), fs::path(".."), fs::path("../..")})
        {
            for (fs::path const& prefix : {fs::path(""), fs::path("Source/tortoise-wow")})
            {
                fs::path candidate = root / prefix / "modules/mod-twow-heirloom/data/sql/world";
                if (fs::is_regular_file(candidate / WorldInstallSql, error))
                    return candidate;
            }
        }
        fs::path adjacent = "data/sql/world";
        return fs::is_regular_file(adjacent / WorldInstallSql, error) ? adjacent : fs::path();
    }

    class ModTwowHeirloomWorldScript : public WorldScript
    {
    public:
        ModTwowHeirloomWorldScript()
            : WorldScript("mod-twow-heirloom_world",
                { WORLDHOOK_ON_AFTER_CONFIG_LOAD, WORLDHOOK_ON_LOAD_CUSTOM_DATABASE_TABLE })
        {
        }

        void OnAfterConfigLoad(bool /*reload*/) override
        {
            sHeirloomConfig.Load();
        }

        void OnLoadCustomDatabaseTable() override
        {
            sHeirloomConfig.Load();
            bool worldInstalled = HasWorldData();
            bool characterReady = HasCharacterSchema();
            bool worldLoaded = worldInstalled && sObjectMgr.GetNpcText(HEIRLOOM_MERCHANT_TEXT) &&
                sObjectMgr.GetItemPrototype(900001) && sObjectMgr.GetItemPrototype(916160) &&
                sObjectMgr.GetItemPrototype(HEIRLOOM_ARMOR_VOUCHER) &&
                sObjectMgr.GetItemPrototype(HEIRLOOM_WEAPON_VOUCHER) &&
                sObjectMgr.GetItemPrototype(HEIRLOOM_ACCESSORY_VOUCHER);

            if ((!worldInstalled || !characterReady) &&
                sHeirloomConfig.IsEnabled() && sHeirloomConfig.IsAutoImportEnabled())
            {
                std::filesystem::path worldSql = FindWorldSql();
                if (worldSql.empty())
                    sLog.outError("[mod-twow-heirloom] Install SQL not found. Set Heirloom.Database.SqlPath to the world SQL directory.");
                else
                {
                    if (!worldInstalled)
                    {
                        // The fallback runs after the core has loaded templates and script bindings.
                        if (ExecuteSqlFile(WorldDatabase, worldSql / WorldInstallSql) && HasWorldData())
                            sLog.outString("[mod-twow-heirloom] World data installed. Restart to load the items and curators.");
                        else
                            sLog.outError("[mod-twow-heirloom] Could not install the world data from %s.", WorldInstallSql);
                    }
                    if (!characterReady)
                    {
                        std::filesystem::path characterSql = worldSql.parent_path() / "character" / CharacterInstallSql;
                        characterReady = ExecuteSqlFile(CharacterDatabase, characterSql) && HasCharacterSchema();
                        if (!characterReady)
                            sLog.outError("[mod-twow-heirloom] Could not create the collection from %s.", CharacterInstallSql);
                    }
                }
            }

            CollectionReady = worldLoaded && characterReady;
            if (!CollectionReady && sHeirloomConfig.IsEnabled())
                sLog.outString("[mod-twow-heirloom] Curators require the installed world data and character collection schema.");
        }
    };
}

bool IsHeirloomCollectionReady()
{
    return CollectionReady;
}

void AddHeirloomWorldScripts()
{
    new ModTwowHeirloomWorldScript();
}
