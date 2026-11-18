/*
 * Copyright (C) 2026+ Turtle WoW Module Contributors
 * mod-twow-heirloom
 */

#include "HeirloomMailScript.h"
#include "HeirloomConfig.h"
#include "ScriptObjects.h"
#include "Mail/Mail.h"
#include "ObjectMgr.h"
#include "Log.h"

namespace
{
    /**
     * Architectural Limitation Note (FINDING-01 & FINDING-02):
     * Core MailHandler (MailHandler.cpp:348-354, 398-402) performs cross-faction team validation
     * and tradeable/soulbound checks BEFORE invoking MailDraft::SendMailTo.
     * Furthermore, MailDraft::SendMailTo receives deliver_delay as a value parameter (Mail.cpp:287),
     * meaning deliver_delay cannot be modified from the MailScript hook.
     *
     * Therefore, cross-faction BoA mailing and instant delivery cannot be provided purely
     * in module space without core engine modifications. This hook is kept inert and does NOT
     * mutate COD or claim unsupported delivery overrides.
     */
    class ModTwowHeirloomMailScript : public MailScript
    {
    public:
        ModTwowHeirloomMailScript()
            : MailScript("mod-twow-heirloom_mail")
        {
        }

        void OnBeforeMailDraftSendMailTo(MailDraft* mailDraft, MailReceiver const& receiver, MailSender const& sender) override
        {
            if (!sHeirloomConfig.IsEnabled() || !mailDraft)
                return;

            // Only inspect normal player-to-player mail
            if (sender.GetMailMessageType() != MAIL_NORMAL)
                return;

            uint32 senderLowGuid = sender.GetSenderId();
            if (senderLowGuid == 0)
                return;

            ObjectGuid senderGuid(HIGHGUID_PLAYER, senderLowGuid);
            uint32 senderAcc = sObjectMgr.GetPlayerAccountIdByGUID(senderGuid);
            uint32 receiverAcc = sObjectMgr.GetPlayerAccountIdByGUID(receiver.GetPlayerGuid());

            // Observational tracking only: do NOT alter COD or invent unsupported delivery overrides
            if (senderAcc != 0 && senderAcc == receiverAcc && sHeirloomConfig.IsDebugEnabled())
            {
                sLog.outDetail("[mod-twow-heirloom] Account mail transfer between sender low GUID %u and receiver %s on account %u.",
                    senderLowGuid,
                    receiver.GetPlayerGuid().GetString().c_str(),
                    senderAcc);
            }
        }
    };
}

void AddHeirloomMailScripts()
{
    new ModTwowHeirloomMailScript();
}
