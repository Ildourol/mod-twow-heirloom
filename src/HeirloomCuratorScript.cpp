/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomCuratorScript.h"
#include "HeirloomConfig.h"
#include "HeirloomCuratorMail.h"
#include "HeirloomMgr.h"
#include "HeirloomWorldScript.h"
#include "Database/DatabaseEnv.h"
#include "Database/QueryResult.h"
#include "GossipDef.h"
#include "HonorMgr.h"
#include "ObjectMgr.h"
#include "Objects/Creature.h"
#include "Objects/Item.h"
#include "Objects/Player.h"
#include "Opcodes.h"
#include "ScriptObjects.h"
#include "World.h"
#include "WorldPacket.h"
#include "WorldSession.h"

#include "rapidjson/document.h"
#include "rapidjson/stringbuffer.h"
#include "rapidjson/writer.h"

#include <algorithm>
#include <array>
#include <cstring>
#include <iterator>
#include <mutex>
#include <string>
#include <vector>

namespace
{
    constexpr char MerchantPrefix[] = "TW_Merchant";
    constexpr char MerchantRequest[] = "TW_Merchant\t";
    constexpr size_t ItemsPerBatch = 8;
    constexpr size_t ItemsPerPage = 10;

    constexpr uint32 WeaponFamilies[] = {
        911300, 911600, 911900, 912200, 912400, 912500, 913100, 913400,
        914000, 914300, 914600, 914700, 915300, 915400, 915600, 915900
    };
    enum class ArmorMaterial { Plate, Mail, Leather, Cloth };
    enum class ArmorRole { Bulwark, Arms, Spellcraft = Arms, Renewal };

    constexpr auto ArmorSets = []()
    {
        std::array<std::array<uint32, 3>, 4> families{};
#define HEIRLOOM_ARMOR_SET(material, family, style, ...) \
        families[static_cast<size_t>(ArmorMaterial::material)][static_cast<size_t>(ArmorRole::style)] = family;
#include "HeirloomArmorSets.inc"
#undef HEIRLOOM_ARMOR_SET
        return families;
    }();

    constexpr uint32 AccessoryFamilies[] = {
#define HEIRLOOM_ACCESSORY(family) family,
#include "HeirloomAccessoryCatalog.inc"
#undef HEIRLOOM_ACCESSORY
    };

    template<class Visitor>
    void VisitStock(HeirloomPool pool, Visitor visit)
    {
        if (pool == HeirloomPool::Accessories)
        {
            for (uint32 family : AccessoryFamilies)
                visit(family);
            return;
        }
        if (pool == HeirloomPool::Weapons)
        {
            for (uint32 family : WeaponFamilies)
                visit(family);
            return;
        }

        for (auto const& material : ArmorSets)
            for (uint32 first : material)
                if (first)
                    for (uint32 piece = 0; piece < 8; ++piece)
                        visit(first + piece * 100);
    }

    bool IsWeaponShop(uint32 entry)
    {
        return entry == 2000221 || entry == 2000224;
    }

    bool IsCurator(uint32 entry)
    {
        return IsWeaponShop(entry) || entry == 2000201 || entry == 2000204;
    }

    bool IsFactionCurator(Player const* player, uint32 entry)
    {
        if (!IsCurator(entry))
            return false;
        return player->GetTeam() == (entry == 2000204 || entry == 2000224 ? HORDE : ALLIANCE);
    }

    struct BracketUsage
    {
        uint32 spent = 0;
        std::vector<uint32> characterSlots;
        std::vector<uint32> sharedSlots;
    };

    struct Collection
    {
        bool perCharacter = false;
        std::vector<uint32> families;
        std::array<BracketUsage, HEIRLOOM_UNLOCK_BRACKETS.size()> brackets{};
    };

    std::mutex CollectionMutex;

    bool LoadCollection(Player* player, HeirloomPool pool, Collection& collection)
    {
        collection.perCharacter = sHeirloomConfig.UsesPerCharacterUnlocks();
        uint32 guid = player->GetObjectGuid().GetCounter();

        // The sentinel row distinguishes an empty collection from a failed read.
        QueryResult* result = CharacterDatabase.PQuery(
            "SELECT 0, 0, 0, 0, 0, 0 UNION ALL "
            "SELECT family, milestone, earner_guid, unlock_slot, COALESCE(shared_slot, 0), unlock_cost "
            "FROM mod_heirloom_account_collection WHERE account_id = %u AND pool = %u",
            player->GetSession()->GetAccountId(), static_cast<uint32>(pool));
        if (!result)
            return false;

        do
        {
            Field* fields = result->Fetch();
            uint32 family = fields[0].GetUInt32();
            if (!family)
                continue;

            collection.families.push_back(family);
            uint32 milestone = fields[1].GetUInt32();
            auto bracket = std::find_if(HEIRLOOM_UNLOCK_BRACKETS.begin(), HEIRLOOM_UNLOCK_BRACKETS.end(),
                [milestone](HeirloomUnlockBracket const& candidate) { return candidate.id == milestone; });
            if (bracket == HEIRLOOM_UNLOCK_BRACKETS.end())
                continue;

            BracketUsage& usage = collection.brackets[bracket - HEIRLOOM_UNLOCK_BRACKETS.begin()];
            bool thisCharacter = fields[2].GetUInt32() == guid;
            if (!collection.perCharacter || thisCharacter)
                usage.spent += fields[5].GetUInt32();
            if (thisCharacter)
                usage.characterSlots.push_back(fields[3].GetUInt32());
            if (!collection.perCharacter && fields[4].GetUInt32())
                usage.sharedSlots.push_back(fields[4].GetUInt32());
        } while (result->NextRow());

        delete result;
        return true;
    }

    uint32 FindFreeSlot(std::vector<uint32> const& slots)
    {
        uint32 slot = 1;
        while (std::find(slots.begin(), slots.end(), slot) != slots.end())
            ++slot;
        return slot;
    }

    bool HasUnlocked(Collection const& collection, uint32 family)
    {
        return std::find(collection.families.begin(), collection.families.end(), family) != collection.families.end();
    }

    struct Allowance
    {
        uint32 milestone;
        uint64 remaining;
    };

    Allowance GetAllowance(Player const* player, Collection const& collection, HeirloomPool pool)
    {
        HeirloomUnlockLimits limits = sHeirloomConfig.GetUnlockLimits(pool);
        uint64 earned = 0;
        uint64 spent = 0;
        uint32 firstAvailable = 0;
        for (size_t i = 0; i < limits.size() && HEIRLOOM_UNLOCK_BRACKETS[i].level <= player->GetLevel(); ++i)
        {
            earned += limits[i];
            spent += collection.brackets[i].spent;
            if (!firstAvailable && collection.brackets[i].spent < limits[i])
                firstAvailable = static_cast<uint32>(i + 1);
        }

        return earned > spent ? Allowance{firstAvailable, earned - spent} : Allowance{0, 0};
    }

    uint32 UnlockCost(HeirloomPool pool, ItemPrototype const& offer)
    {
        return pool == HeirloomPool::Weapons && offer.InventoryType == INVTYPE_2HWEAPON ? 2u : 1u;
    }

    ItemPrototype const* GetOffer(Player* player, uint32 family)
    {
        return sObjectMgr.GetItemPrototype(family + HeirloomMgr::GetScaledLevel(player));
    }

    bool UsesVouchers()
    {
        return sHeirloomConfig.IsCollectionMailEnabled();
    }

    bool CanShop(Player* player)
    {
        return player && player->GetSession() && !player->GetSession()->IsHeadless() &&
               player->GetSession()->GetAccountId() && sHeirloomConfig.IsEnabled() &&
               sHeirloomConfig.IsCollectionEnabled() && IsHeirloomCollectionReady() &&
               sWorld.getConfig(CONFIG_BOOL_ADDON_CHANNEL);
    }

    void OpenMerchant(Player* player, Creature* creature)
    {
        // Tortoise's existing client consumes this marker and hides the dialogue.
        player->PlayerTalkClass->ClearMenus();
        player->PlayerTalkClass->SendGossipMenu(HEIRLOOM_MERCHANT_TEXT, creature->GetObjectGuid());
    }

    void SendCurrency(Player* player, char const* command)
    {
        // The native panel reserves two footer fields for PvP currency. Item
        // costs use the native alternate-currency icons on each offer.
        rapidjson::StringBuffer buffer;
        rapidjson::Writer<rapidjson::StringBuffer> writer(buffer);
        writer.StartObject();
        writer.Key("command"); writer.String(command);
        writer.Key("totalHonor"); writer.Uint(player->GetHonorMgr().GetSpendableHonor());
        writer.Key("totalArena"); writer.Uint(player->GetHonorMgr().GetConquestPoints());
        writer.EndObject();
        player->SendAddonMessage(MerchantPrefix, buffer.GetString());
    }

    struct Offer
    {
        uint32 family;
        uint32 entry;
        uint32 price;
        uint32 priceCount;
        bool trained;
        bool canUse;
    };

    void PrimeOfferCache(Player* player, std::vector<Offer> const& offers)
    {
        // The client's first merchant page calls GetItemInfo synchronously.
        // Match the native merchant's cache pacing for the remaining pages.
        size_t firstPage = std::min(ItemsPerPage, offers.size());
        for (size_t i = 0; i < firstPage; ++i)
            sWorld.SendUpdateSingleItem(offers[i].entry, player->GetSession());

        uint32 delay = 100;
        for (size_t begin = firstPage; begin < offers.size(); begin += ItemsPerPage, delay += 50)
        {
            std::vector<uint32> entries;
            size_t end = std::min(begin + ItemsPerPage, offers.size());
            for (size_t i = begin; i < end; ++i)
                entries.push_back(offers[i].entry);
            player->m_Events.AddLambdaEventAtOffset([player, entries]()
            {
                if (!player->IsInWorld() || !player->GetSession())
                    return;
                for (uint32 entry : entries)
                    sWorld.SendUpdateSingleItem(entry, player->GetSession());
            }, delay);
        }
    }

    bool AppendStock(Player* player, HeirloomPool pool, std::vector<Offer>& offers)
    {
        Collection collection{};
        if (!LoadCollection(player, pool, collection))
            return false;

        Allowance allowance = GetAllowance(player, collection, pool);
        uint32 voucher = HeirloomVoucher(pool);
        bool requireVoucher = UsesVouchers();
        uint32 held = requireVoucher ? player->GetItemCount(voucher) : 0;
        if (requireVoucher)
            sWorld.SendUpdateSingleItem(voucher, player->GetSession());

        VisitStock(pool, [&](uint32 family)
        {
            ItemPrototype const* item = GetOffer(player, family);
            if (!item)
                return;
            bool unlocked = HasUnlocked(collection, family);
            bool trained = player->CanUseItem(item) == EQUIP_ERR_OK;
            uint32 units = UnlockCost(pool, *item);
            bool affordable = allowance.remaining >= units && (!requireVoucher || held >= units);
            offers.push_back({family, item->ItemId, !unlocked && requireVoucher ? voucher : 0, units,
                trained, trained && (unlocked || affordable)});
        });
        return true;
    }

    void SendStock(Player* player, bool weapons)
    {
        std::vector<Offer> offers;
        if (!AppendStock(player, weapons ? HeirloomPool::Weapons : HeirloomPool::Armor, offers) ||
            (!weapons && !AppendStock(player, HeirloomPool::Accessories, offers)))
        {
            player->GetSession()->SendNotification("The armory records are unavailable.");
            player->PlayerTalkClass->CloseGossip();
            return;
        }

        // Keep the armorer's catalog grouped even when pieces appear in red.
        if (weapons)
            std::stable_partition(offers.begin(), offers.end(), [](Offer const& offer) { return offer.trained; });
        PrimeOfferCache(player, offers);
        for (size_t begin = 0; begin < offers.size(); begin += ItemsPerBatch)
        {
            rapidjson::StringBuffer buffer;
            rapidjson::Writer<rapidjson::StringBuffer> writer(buffer);
            writer.StartObject();
            writer.Key("command"); writer.String("itemBatch");
            writer.Key("items"); writer.StartArray();
            size_t end = std::min(begin + ItemsPerBatch, offers.size());
            for (size_t i = begin; i < end; ++i)
            {
                Offer const& offer = offers[i];
                writer.StartObject();
                writer.Key("id"); writer.Uint(offer.family);
                writer.Key("item_id"); writer.Uint(offer.entry);
                writer.Key("cost"); writer.Uint(0);
                writer.Key("count"); writer.Uint(1);
                writer.Key("ext_cost"); writer.StartArray();
                if (offer.price)
                {
                    writer.StartObject();
                    writer.Key("type"); writer.Uint(1);
                    writer.Key("value"); writer.Uint(offer.price);
                    writer.Key("amount"); writer.Uint(offer.priceCount);
                    writer.EndObject();
                }
                writer.EndArray();
                writer.Key("ext_cost_count"); writer.Uint(offer.price ? 1 : 0);
                writer.Key("can_use"); writer.Bool(offer.canUse);
                writer.EndObject();
            }
            writer.EndArray();
            writer.EndObject();
            player->SendAddonMessage(MerchantPrefix, buffer.GetString());
        }
        SendCurrency(player, "show");
    }

    void Buy(Player* player, bool weapons, uint32 family)
    {
        HeirloomPool pool = weapons ? HeirloomPool::Weapons : HeirloomPool::Armor;
        if (!weapons &&
            std::find(std::begin(AccessoryFamilies), std::end(AccessoryFamilies), family) != std::end(AccessoryFamilies))
            pool = HeirloomPool::Accessories;

        bool stocked = false;
        VisitStock(pool, [&](uint32 candidate) { stocked = stocked || candidate == family; });
        if (!stocked)
            return;

        WorldSession* session = player->GetSession();
        ItemPrototype const* offer = GetOffer(player, family);
        if (!offer)
            return;
        if (player->CanUseItem(offer) != EQUIP_ERR_OK)
        {
            session->SendNotification("You lack the training to wield or wear that heirloom.");
            return;
        }

        std::lock_guard<std::mutex> lock(CollectionMutex);
        Collection collection{};
        if (!LoadCollection(player, pool, collection))
        {
            session->SendNotification("The armory records are unavailable.");
            return;
        }

        bool unlocked = HasUnlocked(collection, family);
        Allowance allowance = GetAllowance(player, collection, pool);
        uint32 units = UnlockCost(pool, *offer);
        bool charge = !unlocked && UsesVouchers();
        uint32 voucher = HeirloomVoucher(pool);
        if (!unlocked && (!allowance.milestone || allowance.remaining < units))
        {
            session->SendNotification(units == 2
                ? "You have not earned enough for a two-handed weapon."
                : "You have no new choices to spend at this level.");
            return;
        }
        if (charge && !player->HasItemCount(voucher, units))
        {
            if (units == 2)
                session->SendNotification("Bring two Weaponmaster's Seals from your mailbox or bank.");
            else if (pool == HeirloomPool::Accessories)
                session->SendNotification("Bring a Curator's Token from your mailbox or bank.");
            else
                session->SendNotification("Bring the matching voucher from your mailbox or bank.");
            return;
        }

        bool owned = HeirloomMgr::HasOwnedFamily(player, family);
        if (owned && unlocked)
        {
            session->SendNotification("You already have a copy of that heirloom.");
            return;
        }

        ItemPosCountVec destination;
        if (!owned)
        {
            InventoryResult error = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, destination, offer->ItemId, 1);
            if (error != EQUIP_ERR_OK)
            {
                player->SendEquipError(error, nullptr, nullptr, offer->ItemId);
                return;
            }
        }

        if (!unlocked)
        {
            size_t bracket = allowance.milestone - 1;
            BracketUsage const& usage = collection.brackets[bracket];
            uint32 shared = collection.perCharacter ? 0 : FindFreeSlot(usage.sharedSlots);
            if (!CharacterDatabase.DirectPExecute(
                "INSERT INTO mod_heirloom_account_collection "
                "(account_id, family, pool, milestone, earner_guid, unlock_slot, shared_slot, unlock_cost) "
                "VALUES (%u, %u, %u, %u, %u, %u, NULLIF(%u, 0), %u)",
                session->GetAccountId(), family, static_cast<uint32>(pool), HEIRLOOM_UNLOCK_BRACKETS[bracket].id,
                player->GetObjectGuid().GetCounter(), FindFreeSlot(usage.characterSlots), shared, units))
            {
                session->SendNotification("The armory could not record the unlock. Please reopen the shop.");
                return;
            }
        }

        if (!owned)
        {
            sWorld.SendUpdateSingleItem(offer->ItemId, session);
            Item* item = player->StoreNewItem(destination, offer->ItemId, true);
            if (!item)
            {
                session->SendNotification(unlocked ? "The heirloom could not be delivered. Please try again."
                    : "The heirloom is in your collection. Claim a free copy when you have space.");
            }
            else
                player->SendNewItem(item, 1, true, false);
        }
        if (charge)
            player->DestroyItemCount(voucher, units, true);
        player->SaveInventoryAndGoldToDB();

        // The stock panel rebuilds offers on open. Keep the current page open;
        // purchases always use the latest collection and voucher state on the server.
        SendCurrency(player, "update");
    }

    class HeirloomCuratorScript : public CreatureScript
    {
    public:
        HeirloomCuratorScript() : CreatureScript("npc_heirloom_vendor") {}

        bool OnGossipHello(Player* player, Creature* creature) override
        {
            if (!CanShop(player) || !IsFactionCurator(player, creature->GetEntry()))
            {
                if (player && player->GetSession() && !player->GetSession()->IsHeadless())
                    player->GetSession()->SendNotification("The heirloom armory is currently unavailable.");
                return true;
            }
            OpenMerchant(player, creature);
            return true;
        }
    };

    class HeirloomMerchantProtocol : public ServerScript
    {
    public:
        HeirloomMerchantProtocol() : ServerScript("mod-twow-heirloom_merchant", {SERVERHOOK_CAN_PACKET_RECEIVE}) {}

        bool CanPacketReceive(WorldSession* session, WorldPacket const& packet) override
        {
            if (!session || packet.GetOpcode() != CMSG_MESSAGECHAT || packet.size() < 8 || packet.size() > 512 ||
                session->PlayerLoading() || session->PlayerLogout())
                return true;

            Player* player = session->GetPlayer();
            if (!player || !player->IsInWorld())
                return true;

            WorldPacket request(packet);
            uint32 type, language;
            request >> type >> language;
            if (type != CHAT_MSG_GUILD || language != static_cast<uint32>(LANG_ADDON))
                return true;

            std::string payload;
            request >> payload;
            constexpr size_t prefixLength = sizeof(MerchantRequest) - 1;
            if (payload.compare(0, prefixLength, MerchantRequest) != 0)
                return true;

            Creature* creature = player->GetNPCIfCanInteractWith(session->GetCurrentGossipGUID(), UNIT_NPC_FLAG_GOSSIP);
            if (!creature || !IsCurator(creature->GetEntry()))
                return true;
            if (!CanShop(player) || !player->IsAlive() || !IsFactionCurator(player, creature->GetEntry()))
                return false;

            rapidjson::Document message;
            message.Parse(payload.c_str() + prefixLength);
            if (message.HasParseError() || !message.IsObject() || !message.HasMember("command") ||
                !message["command"].IsString())
                return false;

            char const* command = message["command"].GetString();
            bool weapons = IsWeaponShop(creature->GetEntry());
            if (std::strcmp(command, "show") == 0)
            {
                HeirloomCuratorMail::Notify(player);
                SendStock(player, weapons);
            }
            else if (std::strcmp(command, "buy") == 0 && message.HasMember("idx") && message["idx"].IsUint())
                Buy(player, weapons, message["idx"].GetUint());
            else if (std::strcmp(command, "update") == 0)
                SendCurrency(player, "update");

            return false;
        }
    };
}

bool GetHeirloomVoucherAllowance(Player* player, HeirloomVoucherCounts& counts)
{
    std::lock_guard<std::mutex> lock(CollectionMutex);
    for (HeirloomPool pool : HEIRLOOM_POOLS)
    {
        Collection collection{};
        if (!LoadCollection(player, pool, collection))
            return false;
        Allowance allowance = GetAllowance(player, collection, pool);
        uint64 uncollected = 0;
        VisitStock(pool, [&](uint32 family)
        {
            if (!HasUnlocked(collection, family))
                if (ItemPrototype const* item = GetOffer(player, family))
                    uncollected += UnlockCost(pool, *item);
        });
        counts[HeirloomPoolIndex(pool)] = static_cast<uint32>(std::min(allowance.remaining, uncollected));
    }
    return true;
}

void AddHeirloomCuratorScripts()
{
    new HeirloomCuratorScript();
    new HeirloomMerchantProtocol();
}
