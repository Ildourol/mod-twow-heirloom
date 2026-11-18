# Technical Architecture: mod-twow-heirloom

## 1. Overview
`mod-twow-heirloom` provides Account-Bound Heirloom gear mechanics for the Turtle WoW custom vMaNGOS engine (`tortoise-wow` client 1.18.1.7272 / 1.12.1).

> **Module Status**: `ACTIVE & VERIFIED` (Compiled Release x64, 9,720 item templates across 162 archetypes, dual capital city vendors, live runtime verified).  
> **Immutability Invariant**: Strictly compliant with **The Unediting Doctrine** (0 modifications to core or TortoiseBots).

---

## 2. Core Architectural Patterns & Hook Integration

### A. Level-Aware Prototype Scaling & Adaptation
- **Mathematical Family Formula**: Every archetype is anchored to a base entry divisible by 100 in the range `900000–916100`. The level-specific item template is:
  $$\text{Item Entry} = \text{Family Base} + \text{clamp}(\text{characterLevel}, 1, 60)$$
- **Dynamic Vendor Inventory**: In `HeirloomWorldScript.cpp`, `HeirloomVendorScript::OnGossipHello` dynamically intercepts the gossip greeting, checks the player's level (clamped 1–60), and updates the vendor's template items so that players only see and buy gear matching their exact level.
- **Inventory Adaptation**: In `HeirloomMgr::AdaptAllPlayerHeirlooms`, player login, level changes, and loot events trigger a non-destructive item swap in equipped slots, backpack, and bag containers, adapting items from `base + oldLevel` to `base + newLevel`.

### B. Standard WoW Armor Invariants (Simplified Armor Policy)
- **Zero Armor Morphing**: Armor types strictly preserve standard World of Warcraft proficiencies:
  - Plate is Plate (requires character level 40 and Plate Mail armor proficiency).
  - Mail is Mail (wearable from level 1 by Warriors/Paladins, level 40 by Hunters/Shamans).
  - Leather is Leather; Cloth is Cloth.
- No artificial down-morphing or cross-type mutation occurs; gear behaves identically to standard authentic WoW gear.

### C. Stat Scaling & Deltas Layer
- **Hook Integration**: Uses native `PlayerScript::OnLevelChanged`, `PlayerScript::OnLogin`, `PlayerScript::OnLogout`, and `PlayerScript::OnUpdate` (1000ms periodic audit).
- **Primary Attributes**: Applied via `Player::HandleStatModifier(..., apply)` and `Player::ApplyStatBuffMod(..., apply)`.
- **Resource Stats**: Mana and Health are modified via `UNIT_MOD_MANA` and `UNIT_MOD_HEALTH`.
- **Armor & Block**: Modified via `UNIT_MOD_ARMOR` (`Player::UpdateArmor()`) and `SHIELD_BLOCK_VALUE` via `HandleBaseModValue`.
- **Symmetric Reversal**: Delta removals pass the original positive delta with `apply = false` to guarantee symmetrical decrementing without bucket corruption.

### D. Feature Decoupling Matrix
- **Master Switch (`Heirloom.Enable`)**: When disabled, all active deltas are purged immediately from players and all processing halts.
- **Scaling Toggle (`Heirloom.Scaling.Enable`)**: When disabled, scaling deltas are stripped, while `Heirloom.Durability.Exempt` continues to audit and maintain equipped heirlooms.
- **Bonus XP Toggle (`Heirloom.BonusXP.Enable`)**: Evaluated independently inside `PlayerScript::OnGiveXP`. Shoulder (+10%), Chest (+10%), and Rings (+5% each) contribute up to a default +30% bonus XP (bounded to 200%).
- **Durability Exemption (`Heirloom.Durability.Exempt`)**: Maintained with `MaxDurability = 0` on custom templates, ensuring zero durability decay and no repair costs.

---

## 3. Vendor System & Faction Alignment

- **Dual Capital Curators**:
  - **Stormwind Bank (Alliance)**:
    - Curator of Antiquities (Armor & Jewelry, 111 archetypes): `Kaelen Dawnbrow` (Entry `2000201`, GUID `3000201`, Faction `12`).
    - Master of Weapons (Weapons & Shields, 51 archetypes): `Branden Stormforged` (Entry `2000221`, GUID `3000221`, Faction `12`).
  - **Orgrimmar Bank (Horde)**:
    - Curator of Antiquities (Armor & Jewelry, 111 archetypes): `Krag'jin` (Entry `2000204`, GUID `3000204`, Faction `29`).
    - Master of Weapons (Weapons & Shields, 51 archetypes): `Gorrok Warsong` (Entry `2000224`, GUID `3000224`, Faction `29`).
- **Interaction Flags**:
  - Curators are assigned `npc_flags = 5` (`UNIT_NPC_FLAG_GOSSIP (1) | UNIT_NPC_FLAG_VENDOR (4)`), ensuring `WorldSession::SendListInventory` verifies the vendor flag while allowing `OnGossipHello` to adapt stock dynamically.
- **Faction Alignment**:
  - Faction `12` (Stormwind) is friendly to all Alliance races.
  - Faction `29` (Orgrimmar) is friendly to all Horde races.

---

## 4. Standalone Database Auto-Importer

With `Heirloom.Database.AutoImport = 1` (default ON):
1. On server boot (`Addmod_twow_heirloomScripts`), the module checks `tw_world` for existing heirloom templates and vendor entries.
2. If missing, it locates `data/sql/world/` migrations:
   - `0001_custom_heirloom_items.sql` (9,720 templates)
   - `0002_heirloom_vendor_npc.sql` (Curator templates, vendor lists, and bank spawns)
3. Executes them sequentially and reloads memory prototype tables automatically without server downtime.
