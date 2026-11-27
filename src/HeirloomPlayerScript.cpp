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
#include "Timer.h"

#include <array>
#include <atomic>
#include <memory>
#include <mutex>
#include <unordered_map>

namespace
{
    constexpr uint32 MaintenanceCheckMs = 500;
    constexpr uint32 DurabilityCheckMs = 1000;
    constexpr uint32 ActiveReconcileMs = 5000;
    constexpr uint32 IdleReconcileMs = 30000;
    constexpr size_t MaintenanceShardCount = 64;

    struct MaintenanceState
    {
        std::atomic<uint32> lastCheck{0};
        std::atomic<uint32> lastDurability{0};
        std::atomic<uint32> lastReconcile{0};
        std::atomic<uint32> configGeneration{0};
        std::atomic<uint8> tier{0};
        std::atomic<bool> initialized{false};
        std::atomic<bool> enabled{false};
        std::atomic<bool> scaling{false};
        std::atomic<bool> alive{false};
        std::atomic<bool> hasAnyHeirloom{true};
        std::atomic<bool> hasEquippedHeirloom{true};
        std::atomic<bool> dirty{false};
    };

    struct MaintenanceShard
    {
        std::mutex mutex;
        std::unordered_map<uint32, std::shared_ptr<MaintenanceState>> players;
    };

    std::array<MaintenanceShard, MaintenanceShardCount> g_maintenance;

    MaintenanceShard& GetShard(uint32 guid)
    {
        return g_maintenance[guid % g_maintenance.size()];
    }

    std::shared_ptr<MaintenanceState> FindState(uint32 guid)
    {
        MaintenanceShard& shard = GetShard(guid);
        std::lock_guard<std::mutex> lock(shard.mutex);
        auto it = shard.players.find(guid);
        return it != shard.players.end() ? it->second : nullptr;
    }

    std::shared_ptr<MaintenanceState> GetOrCreateState(uint32 guid)
    {
        MaintenanceShard& shard = GetShard(guid);
        std::lock_guard<std::mutex> lock(shard.mutex);
        auto it = shard.players.find(guid);
        if (it != shard.players.end())
            return it->second;
        return shard.players.emplace(guid, std::make_shared<MaintenanceState>()).first->second;
    }

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
            if (!player)
                return;

            HeirloomScanSummary summary = sHeirloomMgr.AdaptAllPlayerHeirlooms(player, true);
            if (summary.hasEquippedHeirloom && sHeirloomConfig.IsEnabled() && sHeirloomConfig.IsDurabilityExempt(player))
                sHeirloomMgr.RestoreEquippedDurability(player);

            auto state = GetOrCreateState(player->GetGUIDLow());
            uint32 now = WorldTimer::getMSTime();
            state->lastCheck.store(now, std::memory_order_relaxed);
            state->lastDurability.store(now, std::memory_order_relaxed);
            state->lastReconcile.store(now, std::memory_order_relaxed);
            state->configGeneration.store(sHeirloomConfig.GetGeneration(), std::memory_order_relaxed);
            state->tier.store(HeirloomMgr::GetScaledLevel(player), std::memory_order_relaxed);
            state->enabled.store(sHeirloomConfig.IsEnabled(), std::memory_order_relaxed);
            state->scaling.store(sHeirloomConfig.IsScalingEnabled(), std::memory_order_relaxed);
            state->alive.store(player->IsAlive(), std::memory_order_relaxed);
            state->hasAnyHeirloom.store(summary.hasAnyHeirloom, std::memory_order_relaxed);
            state->hasEquippedHeirloom.store(summary.hasEquippedHeirloom, std::memory_order_relaxed);
            state->dirty.store(false, std::memory_order_relaxed);
            state->initialized.store(true, std::memory_order_release);

            HeirloomCuratorMail::Notify(player);
        }

        void OnLogout(Player* player) override
        {
            if (!player)
                return;

            uint32 guid = player->GetGUIDLow();
            MaintenanceShard& shard = GetShard(guid);
            std::lock_guard<std::mutex> lock(shard.mutex);
            shard.players.erase(guid);
        }

        void OnLevelChanged(Player* player, uint8 oldLevel) override
        {
            if (!player)
                return;

            HeirloomScanSummary summary = sHeirloomMgr.AdaptAllPlayerHeirlooms(player);
            if (summary.hasEquippedHeirloom && sHeirloomConfig.IsEnabled() && sHeirloomConfig.IsDurabilityExempt(player))
                sHeirloomMgr.RestoreEquippedDurability(player);

            if (auto state = FindState(player->GetGUIDLow()))
            {
                uint32 now = WorldTimer::getMSTime();
                state->lastReconcile.store(now, std::memory_order_relaxed);
                state->tier.store(HeirloomMgr::GetScaledLevel(player), std::memory_order_relaxed);
                state->hasAnyHeirloom.store(summary.hasAnyHeirloom, std::memory_order_relaxed);
                state->hasEquippedHeirloom.store(summary.hasEquippedHeirloom, std::memory_order_relaxed);
            }

            HeirloomCuratorMail::Notify(player, oldLevel);
        }

        void OnPlayerJustDied(Player* player) override
        {
            if (!player || !sHeirloomConfig.IsEnabled() || !sHeirloomConfig.IsDurabilityExempt(player))
                return;

            auto state = FindState(player->GetGUIDLow());
            if (!state || state->hasEquippedHeirloom.load(std::memory_order_relaxed))
                sHeirloomMgr.RestoreEquippedDurability(player);
        }

        void OnGiveXP(Player* player, uint32& amount, Unit* victim) override
        {
            sHeirloomMgr.HandlePlayerGiveXP(player, amount, victim);
        }

        void OnLootItem(Player* player, Item* item, uint32 /*count*/, ObjectGuid /*lootGuid*/) override
        {
            if (!player || !item)
                return;

            if (sHeirloomMgr.IsHeirloomItem(item->GetProto()))
            {
                sHeirloomMgr.AdaptAllPlayerHeirlooms(player);
                NotifyHeirloomInventoryChanged(player->GetGUIDLow());
            }
        }

        void OnUpdate(Player* player, uint32 diff) override
        {
            if (!player || !sHeirloomConfig.IsEnabled())
                return;

            uint32 guid = player->GetGUIDLow();
            uint32 now = WorldTimer::getMSTime();
            // Stagger checks across players so idle/bot ticks stay low-overhead without recurring player events.
            if ((now + guid % MaintenanceCheckMs) % MaintenanceCheckMs >= diff)
                return;

            auto state = GetOrCreateState(guid);
            bool initialized = state->initialized.load(std::memory_order_acquire);
            uint32 prevCheck = state->lastCheck.load(std::memory_order_relaxed);
            if (initialized && WorldTimer::getMSTimeDiff(prevCheck, now) < MaintenanceCheckMs / 2)
                return;
            state->lastCheck.store(now, std::memory_order_relaxed);

            bool dirty = state->dirty.exchange(false, std::memory_order_acq_rel);
            bool scaling = sHeirloomConfig.IsScalingEnabled();
            bool alive = player->IsAlive();
            uint8 tier = HeirloomMgr::GetScaledLevel(player);
            uint32 configGen = sHeirloomConfig.GetGeneration();

            bool resurrected = !initialized || (alive && !state->alive.load(std::memory_order_relaxed));
            bool tierChanged = !initialized || (tier != state->tier.load(std::memory_order_relaxed));
            bool configChanged = !initialized || (configGen != state->configGeneration.load(std::memory_order_relaxed));
            bool scalingChanged = !initialized || !state->enabled.load(std::memory_order_relaxed) ||
                                  (scaling != state->scaling.load(std::memory_order_relaxed));

            uint32 reconcileInterval = state->hasAnyHeirloom.load(std::memory_order_relaxed)
                ? ActiveReconcileMs
                : IdleReconcileMs;
            uint32 prevReconcile = state->lastReconcile.load(std::memory_order_relaxed);
            bool reconcile = !initialized || WorldTimer::getMSTimeDiff(prevReconcile, now) >= reconcileInterval;

            if (dirty || configChanged || resurrected || tierChanged || scalingChanged || reconcile)
            {
                HeirloomScanSummary summary = sHeirloomMgr.AdaptAllPlayerHeirlooms(player);
                state->hasAnyHeirloom.store(summary.hasAnyHeirloom, std::memory_order_relaxed);
                state->hasEquippedHeirloom.store(summary.hasEquippedHeirloom, std::memory_order_relaxed);
                state->lastReconcile.store(now, std::memory_order_relaxed);
            }

            if (state->hasEquippedHeirloom.load(std::memory_order_relaxed) &&
                sHeirloomConfig.IsDurabilityExempt(player))
            {
                uint32 prevDur = state->lastDurability.load(std::memory_order_relaxed);
                if (!initialized || WorldTimer::getMSTimeDiff(prevDur, now) >= DurabilityCheckMs)
                {
                    state->lastDurability.store(now, std::memory_order_relaxed);
                    sHeirloomMgr.RestoreEquippedDurability(player);
                }
            }

            state->tier.store(tier, std::memory_order_relaxed);
            state->configGeneration.store(configGen, std::memory_order_relaxed);
            state->enabled.store(true, std::memory_order_relaxed);
            state->scaling.store(scaling, std::memory_order_relaxed);
            state->alive.store(alive, std::memory_order_relaxed);
            if (!initialized)
                state->initialized.store(true, std::memory_order_release);
        }
    };
}

void NotifyHeirloomInventoryChanged(uint32 guidLow)
{
    if (auto state = FindState(guidLow))
    {
        state->hasAnyHeirloom.store(true, std::memory_order_relaxed);
        state->hasEquippedHeirloom.store(true, std::memory_order_relaxed);
        state->dirty.store(true, std::memory_order_release);
    }
}

void AddHeirloomPlayerScripts()
{
    new ModTwowHeirloomPlayerScript();
}
