/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomPlayerScript.h"
#include "HeirloomMgr.h"
#include "HeirloomCuratorMail.h"
#include "HeirloomConfig.h"
#include "ScriptObjects.h"
#include "Objects/Item.h"
#include "Objects/Player.h"

#include <array>
#include <chrono>
#include <memory>
#include <mutex>
#include <unordered_map>

namespace
{
    constexpr uint32 MaintenanceCheckMs = 500;
    constexpr uint32 DurabilityCheckMs = 1000;
    constexpr uint32 ReconcileMs = 5000;

    uint64 MaintenanceTimeMs()
    {
        auto elapsed = std::chrono::steady_clock::now().time_since_epoch();
        return static_cast<uint64>(std::chrono::duration_cast<std::chrono::milliseconds>(elapsed).count());
    }

    struct MaintenanceState
    {
        uint64 lastCheck = 0;
        uint64 lastDurability = 0;
        uint64 lastReconcile = 0;
        uint8 tier = 0;
        bool enabled = false;
        bool scaling = false;
        bool alive = false;
    };

    struct MaintenanceShard
    {
        std::mutex mutex;
        std::unordered_map<uint32, std::shared_ptr<MaintenanceState>> players;
    };

    class ModTwowHeirloomPlayerScript : public PlayerScript
    {
    public:
        ModTwowHeirloomPlayerScript()
            : PlayerScript("mod-twow-heirloom_player",
                { PLAYERHOOK_ON_LOGIN, PLAYERHOOK_ON_LOGOUT, PLAYERHOOK_ON_LEVEL_CHANGED,
                  PLAYERHOOK_ON_GIVE_EXP, PLAYERHOOK_ON_LOOT_ITEM,
                  PLAYERHOOK_ON_PLAYER_JUST_DIED, PLAYERHOOK_ON_UPDATE })
        {
        }

        void OnLogin(Player* player) override
        {
            sHeirloomMgr.AdaptAllPlayerHeirlooms(player, true);
            if (sHeirloomConfig.IsDurabilityExempt(player))
                sHeirloomMgr.RestoreEquippedDurability(player);

            auto state = GetState(player->GetGUIDLow());
            uint64 now = MaintenanceTimeMs();
            state->lastCheck = now;
            state->lastDurability = now;
            state->lastReconcile = now;
            state->tier = HeirloomMgr::GetScaledLevel(player);
            state->enabled = sHeirloomConfig.IsEnabled();
            state->scaling = sHeirloomConfig.IsScalingEnabled();
            state->alive = player->IsAlive();

            HeirloomCuratorMail::Notify(player);
        }

        void OnLogout(Player* player) override
        {
            uint32 guid = player->GetGUIDLow();
            MaintenanceShard& shard = GetShard(guid);
            std::lock_guard<std::mutex> lock(shard.mutex);
            shard.players.erase(guid);
        }

        void OnLevelChanged(Player* player, uint8 oldLevel) override
        {
            sHeirloomMgr.AdaptAllPlayerHeirlooms(player);
            if (sHeirloomConfig.IsDurabilityExempt(player))
                sHeirloomMgr.RestoreEquippedDurability(player);
            HeirloomCuratorMail::Notify(player, oldLevel);
        }

        void OnPlayerJustDied(Player* player) override
        {
            if (sHeirloomConfig.IsEnabled() && sHeirloomConfig.IsDurabilityExempt(player))
                sHeirloomMgr.RestoreEquippedDurability(player);
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
            uint32 guid = player->GetGUIDLow();
            uint64 now = MaintenanceTimeMs();
            // Use the update interval to detect when this player's staggered phase was crossed.
            // Most ticks return before accessing the shared registry. Recurring player
            // events would prevent the core from skipping idle player updates.
            if ((now + guid % MaintenanceCheckMs) % MaintenanceCheckMs >= diff)
                return;

            auto state = GetState(guid);
            if (now - state->lastCheck < MaintenanceCheckMs / 2)
                return;
            state->lastCheck = now;

            bool enabled = sHeirloomConfig.IsEnabled();
            bool scaling = sHeirloomConfig.IsScalingEnabled();
            bool alive = player->IsAlive();
            uint8 tier = HeirloomMgr::GetScaledLevel(player);
            bool resurrected = alive && !state->alive;
            bool tierChanged = tier != state->tier;
            bool reconcile = now - state->lastReconcile >= ReconcileMs;
            if (reconcile)
                state->lastReconcile = now;

            if (enabled && scaling && (reconcile || resurrected || tierChanged || !state->enabled || !state->scaling))
                sHeirloomMgr.AdaptAllPlayerHeirlooms(player);

            if (enabled && sHeirloomConfig.IsDurabilityExempt(player) &&
                now - state->lastDurability >= DurabilityCheckMs)
            {
                state->lastDurability = now;
                sHeirloomMgr.RestoreEquippedDurability(player);
            }

            state->tier = tier;
            state->enabled = enabled;
            state->scaling = scaling;
            state->alive = alive;
        }

    private:
        MaintenanceShard& GetShard(uint32 guid) { return m_maintenance[guid % m_maintenance.size()]; }

        std::shared_ptr<MaintenanceState> GetState(uint32 guid)
        {
            MaintenanceShard& shard = GetShard(guid);
            std::lock_guard<std::mutex> lock(shard.mutex);
            auto state = shard.players.find(guid);
            if (state != shard.players.end())
                return state->second;
            return shard.players.emplace(guid, std::make_shared<MaintenanceState>()).first->second;
        }

        std::array<MaintenanceShard, 16> m_maintenance;
    };
}

void AddHeirloomPlayerScripts()
{
    new ModTwowHeirloomPlayerScript();
}
