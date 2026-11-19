#ifndef HEIRLOOM_CURATOR_SCRIPT_H
#define HEIRLOOM_CURATOR_SCRIPT_H

#include "HeirloomCommon.h"

class Player;

void AddHeirloomCuratorScripts();
bool GetHeirloomVoucherAllowance(Player* player, HeirloomVoucherCounts& counts);

#endif
