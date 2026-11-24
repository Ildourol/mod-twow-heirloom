#include "HeirloomCuratorMail.h"
#include "HeirloomConfig.h"
#include "HeirloomCuratorScript.h"
#include "HeirloomWorldScript.h"
#include "Database/DatabaseEnv.h"
#include "Database/QueryResult.h"
#include "Mail/Mail.h"
#include "Objects/Item.h"
#include "Objects/Player.h"
#include "WorldSession.h"

#include <algorithm>
#include <memory>
#include <mutex>
#include <sstream>
#include <string>

namespace
{
    constexpr uint32 StormwindCurator = 2000201;
    constexpr uint32 OrgrimmarCurator = 2000204;
    std::mutex VoucherMailMutex;

    bool CountMailedVouchers(uint32 guid, HeirloomVoucherCounts& counts)
    {
        QueryResult* result = CharacterDatabase.PQuery(
            "SELECT COALESCE(SUM(CASE WHEN i.itemEntry = %u THEN i.count ELSE 0 END),0), "
            "COALESCE(SUM(CASE WHEN i.itemEntry = %u THEN i.count ELSE 0 END),0), "
            "COALESCE(SUM(CASE WHEN i.itemEntry = %u THEN i.count ELSE 0 END),0) "
            "FROM mail_items m JOIN mail letter ON letter.id = m.mail_id "
            "JOIN item_instance i ON i.guid = m.item_guid "
            "WHERE m.receiver = %u AND letter.receiver = %u AND letter.expire_time > UNIX_TIMESTAMP() "
            "AND i.itemEntry IN (%u, %u, %u)",
            HEIRLOOM_ARMOR_VOUCHER, HEIRLOOM_WEAPON_VOUCHER, HEIRLOOM_ACCESSORY_VOUCHER, guid, guid,
            HEIRLOOM_ARMOR_VOUCHER, HEIRLOOM_WEAPON_VOUCHER, HEIRLOOM_ACCESSORY_VOUCHER);
        if (!result)
            return false;

        for (size_t i = 0; i < counts.size(); ++i)
            counts[i] = result->Fetch()[i].GetUInt32();
        delete result;
        return true;
    }

    uint32 MissingVouchers(Player* player, uint32 entry, uint32 earned, uint32 mailed)
    {
        // An earlier letter can still be waiting. Count both the mailbox and
        // the character's bags and bank before replacing missing vouchers.
        uint64 held = static_cast<uint64>(player->GetItemCount(entry, true)) + mailed;
        return held < earned ? earned - static_cast<uint32>(held) : 0;
    }

    std::string Letter(Player* player, bool horde, HeirloomPool pool, uint32 count)
    {
        bool weapons = pool == HeirloomPool::Weapons;
        std::ostringstream text;
        text << player->GetName() << ",\n\n";
        if (pool == HeirloomPool::Accessories)
        {
            text << (horde ? "Some of the oldest treasures held by the Horde are small enough to fit in your palm. "
                           : "The Royal Vault keeps signets and keepsakes once carried by the Alliance's finest. ")
                 << "You have earned " << count << (count == 1 ? " Curator's Token." : " Curator's Tokens.")
                 << " Each token is good for a ring or trinket of your choosing."
                 << (horde ? "\n\nYou will find me outside Orgrimmar's bank in the Valley of Strength.\n\nStrength and honor,\nKrag'jin"
                           : "\n\nYou will find me at Stormwind Bank in the Trade District.\n\nLight keep you,\nKaelen Dawnbrow");
            return text.str();
        }
        if (horde)
            text << "The Horde keeps its finest arms and armor for those who stand with us. You have earned a share of those stores.";
        else
            text << "The Royal Vault keeps arms and armor passed down by those who served the Alliance. Your service has earned you a claim on its stores.";

        if (player->GetLevel() == 10)
            text << (weapons ? " Come choose your first weapon." : " Come choose your first piece of armor.");
        text << "\n\n";
        if (weapons)
        {
            text << count << (count == 1 ? " Weaponmaster's Seal is" : " Weaponmaster's Seals are") << " enclosed. "
                 << (horde ? "Bring your seals to me outside the bank in the Valley of Strength."
                           : "Bring your seals to me at Stormwind Bank in the Trade District.")
                 << " A two-handed weapon takes two seals. Other arms and off-hands take one. Keep any extra seals for your next visit.";
        }
        else
        {
            text << count << (count == 1 ? " Armorer's Writ is" : " Armorer's Writs are") << " enclosed. "
                 << (horde ? "Bring them to me outside the bank in the Valley of Strength."
                           : "Bring them to me at Stormwind Bank in the Trade District.")
                 << " Choose from the plate racks once you are trained to wear plate.";
        }
        text << "\n\nOnce a piece is entered in your collection, your other characters may request a copy they can use."
             << (horde ? "\n\nStrength and honor,\n" : "\n\nLight keep you,\n")
             << (weapons ? (horde ? "Gorrok Warsong" : "Branden Stormforged")
                         : (horde ? "Krag'jin" : "Kaelen Dawnbrow"));
        return text.str();
    }

    void SendVoucherLetter(Player* player, HeirloomPool pool, uint32 count)
    {
        if (!count)
            return;

        bool horde = player->GetTeam() == HORDE;
        bool weapons = pool == HeirloomPool::Weapons;
        char const* subject = weapons ? (horde ? "A Claim on the Horde's Arms" : "A Seal from the Master of Weapons")
                                     : (horde ? "A Writ from the Horde Armory" : "A Writ from the Royal Vault");
        if (pool == HeirloomPool::Accessories)
            subject = horde ? "Keepsakes of the Horde" : "Treasures of the Royal Vault";
        uint32 sender = weapons ? (horde ? 2000224 : 2000221) : (horde ? OrgrimmarCurator : StormwindCurator);
        uint32 entry = HeirloomVoucher(pool);
        std::unique_ptr<Item> token(Item::CreateItem(entry, count, player));
        if (!token || !CharacterDatabase.BeginTransaction())
            return;

        MailDraft draft(subject, Letter(player, horde, pool, count));
        if (!draft.GetBodyId())
        {
            CharacterDatabase.RollbackTransaction();
            return;
        }
        token->SetBinding(true);
        token->SaveToDB();
        if (!CharacterDatabase.CommitTransactionDirect())
            return;

        draft.AddItem(token.release());
        draft.SendMailTo(MailReceiver(player), MailSender(MAIL_CREATURE, sender), MAIL_CHECK_MASK_HAS_BODY, 0, 0, true);
    }
}

void HeirloomCuratorMail::Notify(Player* player, uint32 previousLevel)
{
    WorldSession* session = player->GetSession();
    uint32 level = player->GetLevel();
    bool isBot = sScriptMgr.IsBotManaged(player) || session->IsHeadless();
    if (!isBot && !session->GetMasterPlayer())
        return;
    if (!session->GetAccountId() ||
        !sHeirloomConfig.IsEnabled() || !sHeirloomConfig.IsCollectionEnabled() ||
        !sHeirloomConfig.IsCollectionMailEnabled() || !IsHeirloomCollectionReady() ||
        CharacterDatabase.InTransaction())
        return;

    if (player->GetTeam() != ALLIANCE && player->GetTeam() != HORDE)
        return;
    if (std::none_of(HEIRLOOM_UNLOCK_BRACKETS.begin(), HEIRLOOM_UNLOCK_BRACKETS.end(),
        [level, previousLevel](HeirloomUnlockBracket const& bracket)
        {
            return previousLevel < bracket.level && bracket.level <= level;
        }))
        return;

    std::lock_guard<std::mutex> lock(VoucherMailMutex);
    HeirloomVoucherCounts earned{};
    if (!GetHeirloomVoucherAllowance(player, earned) ||
        std::none_of(earned.begin(), earned.end(), [](uint32 count) { return count != 0; }))
        return;

    HeirloomVoucherCounts mailed{};
    if (!CountMailedVouchers(player->GetObjectGuid().GetCounter(), mailed))
        return;
    for (HeirloomPool pool : HEIRLOOM_POOLS)
    {
        size_t index = HeirloomPoolIndex(pool);
        SendVoucherLetter(player, pool, MissingVouchers(player, HeirloomVoucher(pool), earned[index], mailed[index]));
    }
}
