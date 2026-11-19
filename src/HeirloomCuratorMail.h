#ifndef HEIRLOOM_CURATOR_MAIL_H
#define HEIRLOOM_CURATOR_MAIL_H

#include "HeirloomCommon.h"

class Player;

namespace HeirloomCuratorMail
{
    void Notify(Player* player, uint32 previousLevel = 0);
}

#endif
