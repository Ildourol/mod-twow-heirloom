/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomWorldScript.h"
#include "HeirloomCatalog.h"
#include "HeirloomConfig.h"
#include "ScriptObjects.h"
#include "Database/DatabaseEnv.h"
#include "Database/QueryResult.h"
#include "ObjectMgr.h"
#include "Log.h"

#include <algorithm>
#include <atomic>
#include <filesystem>
#include <fstream>
#include <iterator>
#include <sstream>
#include <string>

namespace
{
    constexpr char WorldInstallSql[] = "heirloom_world.sql";
    constexpr char CharacterInstallSql[] = "heirloom_characters.sql";
    std::atomic<bool> CollectionReady{false};
    std::atomic<bool> WorldTemplatesLoaded{false};
    std::atomic<bool> CharacterSchemaReady{false};

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

        // Strip UTF-8 BOM if present.
        if (sql.size() >= 3 &&
            static_cast<unsigned char>(sql[0]) == 0xEF &&
            static_cast<unsigned char>(sql[1]) == 0xBB &&
            static_cast<unsigned char>(sql[2]) == 0xBF)
        {
            sql.erase(0, 3);
        }

        std::string currentQuery;
        currentQuery.reserve(65536);

        enum Scope { None, SingleQuote, DoubleQuote, SingleLineComment, MultiLineComment };
        Scope scope = None;
        size_t statementIndex = 0;

        auto executeStatement = [&](std::string const& raw) -> bool
        {
            size_t first = raw.find_first_not_of(" \t\r\n");
            if (first == std::string::npos)
                return true;
            size_t last = raw.find_last_not_of(" \t\r\n");
            std::string trimmed = raw.substr(first, last - first + 1);
            if (trimmed.empty())
                return true;

            ++statementIndex;
            if (!database.DirectExecute(trimmed.c_str()))
            {
                std::string snippet = trimmed.substr(0, std::min<size_t>(160, trimmed.size()));
                sLog.outError("[mod-twow-heirloom] SQL execution failed at %s statement #%zu: %s...",
                    filePath.filename().string().c_str(), statementIndex, snippet.c_str());
                return false;
            }
            return true;
        };

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
                    if (next == '\'')
                    {
                        currentQuery += next;
                        ++i;
                    }
                    else
                    {
                        scope = None;
                    }
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
                    if (next == '"')
                    {
                        currentQuery += next;
                        ++i;
                    }
                    else
                    {
                        scope = None;
                    }
                }
                continue;
            }

            // Outside quotes and comments
            if (c == '#')
            {
                scope = SingleLineComment;
                continue;
            }
            if (c == '-' && next == '-')
            {
                char afterDash = (i + 2 < sql.size()) ? sql[i + 2] : '\0';
                if (afterDash == ' ' || afterDash == '\t' || afterDash == '\r' || afterDash == '\n' || afterDash == '\0')
                {
                    scope = SingleLineComment;
                    ++i;
                    continue;
                }
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
                if (!executeStatement(currentQuery))
                    return false;
                currentQuery.clear();
                continue;
            }

            currentQuery += c;
        }

        return executeStatement(currentQuery);
    }

    bool HasWorldData()
    {
        std::ostringstream query;
        query << "SELECT 1 FROM DUAL WHERE "
              << "(SELECT COUNT(*) FROM item_template WHERE entry BETWEEN "
              << HeirloomCatalog::MinCatalogEntry() << " AND " << HeirloomCatalog::MaxCatalogEntry()
              << " AND MOD(entry, 100) BETWEEN " << static_cast<uint32>(HEIRLOOM_MIN_LEVEL)
              << " AND " << static_cast<uint32>(HEIRLOOM_MAX_LEVEL_DEFAULT)
              << " AND (entry - MOD(entry, 100)) IN (";
        for (size_t i = 0; i < HeirloomCatalog::AllFamilies.size(); ++i)
        {
            if (i > 0)
                query << ',';
            query << HeirloomCatalog::AllFamilies[i];
        }
        query << ") AND bonding = " << HEIRLOOM_BONDING_ACCOUNT << ") = " << HeirloomCatalog::TotalTemplates()
              << " AND (SELECT COUNT(*) FROM item_template WHERE entry IN ("
              << HEIRLOOM_ARMOR_VOUCHER << ", " << HEIRLOOM_WEAPON_VOUCHER << ", " << HEIRLOOM_ACCESSORY_VOUCHER
              << ") AND bonding = 1) = 3"
              << " AND (SELECT COUNT(*) FROM creature_template WHERE entry IN (2000201, 2000204, 2000221, 2000224) "
              << "AND script_name = 'npc_heirloom_vendor') = 4"
              << " AND (SELECT COUNT(DISTINCT id) FROM creature WHERE id IN (2000201, 2000204, 2000221, 2000224)) = 4"
              << " AND EXISTS (SELECT 1 FROM npc_text n JOIN broadcast_text b ON b.entry = n.BroadcastTextID0 "
              << "WHERE n.ID = " << HEIRLOOM_MERCHANT_TEXT
              << " AND b.male_text = 'CUSTOM_MERCHANT_TRIGGER' AND b.female_text = 'CUSTOM_MERCHANT_TRIGGER')";

        QueryResult* result = WorldDatabase.Query(query.str().c_str());
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

    bool AreWorldPrototypesLoaded()
    {
        if (!sObjectMgr.GetNpcText(HEIRLOOM_MERCHANT_TEXT) ||
            !sObjectMgr.GetItemPrototype(HEIRLOOM_ARMOR_VOUCHER) ||
            !sObjectMgr.GetItemPrototype(HEIRLOOM_WEAPON_VOUCHER) ||
            !sObjectMgr.GetItemPrototype(HEIRLOOM_ACCESSORY_VOUCHER))
            return false;

        for (uint32 family : HeirloomCatalog::AllFamilies)
        {
            if (!sObjectMgr.GetItemPrototype(family + HEIRLOOM_MIN_LEVEL) ||
                !sObjectMgr.GetItemPrototype(family + HEIRLOOM_MAX_LEVEL_DEFAULT))
                return false;
        }
        return true;
    }

    std::filesystem::path FindWorldSql()
    {
        namespace fs = std::filesystem;
        std::error_code error;
        std::string configuredPath = sHeirloomConfig.GetSqlPath();
        if (!configuredPath.empty())
        {
            fs::path path(configuredPath);
            if (fs::is_regular_file(path, error))
            {
                fs::path parent = path.parent_path();
                return parent.empty() ? fs::path(".") : parent;
            }
            if (fs::is_regular_file(path / WorldInstallSql, error))
                return path;
            sLog.outError("[mod-twow-heirloom] Configured Heirloom.Database.SqlPath '%s' does not contain %s.",
                configuredPath.c_str(), WorldInstallSql);
            return fs::path();
        }

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

        void OnAfterConfigLoad(bool reload) override
        {
            sHeirloomConfig.Load();
            if (reload)
                CollectionReady.store(WorldTemplatesLoaded.load(std::memory_order_acquire) &&
                                      CharacterSchemaReady.load(std::memory_order_acquire), std::memory_order_release);
        }

        void OnLoadCustomDatabaseTable() override
        {
            sHeirloomConfig.Load();
            bool worldInstalled = HasWorldData();
            bool characterReady = HasCharacterSchema();
            bool worldLoaded = worldInstalled && AreWorldPrototypesLoaded();

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
                        std::error_code error;
                        std::filesystem::path characterSql = worldSql.parent_path() / "character" / CharacterInstallSql;
                        if (!std::filesystem::is_regular_file(characterSql, error))
                            sLog.outError("[mod-twow-heirloom] Missing character install SQL: %s.", characterSql.string().c_str());
                        else
                        {
                            characterReady = ExecuteSqlFile(CharacterDatabase, characterSql) && HasCharacterSchema();
                            if (!characterReady)
                                sLog.outError("[mod-twow-heirloom] Could not create the collection from %s.", CharacterInstallSql);
                        }
                    }
                }
            }

            WorldTemplatesLoaded.store(worldLoaded, std::memory_order_release);
            CharacterSchemaReady.store(characterReady, std::memory_order_release);
            bool ready = worldLoaded && characterReady;
            CollectionReady.store(ready, std::memory_order_release);
            if (!ready && sHeirloomConfig.IsEnabled())
                sLog.outString("[mod-twow-heirloom] Curators require the installed world data and character collection schema.");
        }
    };
}

bool IsHeirloomCollectionReady()
{
    return CollectionReady.load(std::memory_order_acquire);
}

void AddHeirloomWorldScripts()
{
    new ModTwowHeirloomWorldScript();
}
