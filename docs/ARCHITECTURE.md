# Technical Architecture: mod-twow-heirloom

## 1. Overview
`mod-twow-heirloom` provides Account-Bound Heirloom gear mechanics for the Turtle WoW custom vMaNGOS engine (`tortoise-wow` client 1.18.1.7272 / 1.12.1).

> **Module Status**: `RUNTIME_ACCEPTANCE_PENDING` (Offline verified & MSBuild Release x64 compiled; awaiting operator item catalog decision and staging runtime acceptance).  
> **Immutability Invariant**: Strictly compliant with **The Unediting Doctrine** (0 modifications to core or TortoiseBots).

---

## 2. Core Architectural Patterns & Hook Integration

### A. Non-Intrusive Stat Scaling Layer
- **Hook Integration**: Uses native `PlayerScript::OnLevelChanged`, `PlayerScript::OnLogin`, `PlayerScript::OnLogout`, and `PlayerScript::OnUpdate` (1000ms periodic audit).
- **Stat Application**: Primary attributes (Strength, Agility, Stamina, Intellect, Spirit) are applied via `Player::HandleStatModifier(..., apply)` and `Player::ApplyStatBuffMod(..., apply)`.
- **Resource Stats**: Mana and Health are modified via `UNIT_MOD_MANA` and `UNIT_MOD_HEALTH`. `ITEM_MOD_MANA` (enum 0) is fully recognized.
- **Armor & Block**: Modified via `UNIT_MOD_ARMOR` (`Player::UpdateArmor()`) and `SHIELD_BLOCK_VALUE` via `HandleBaseModValue`.
- **Symmetric Reversal**: Delta removals pass the original positive delta with `apply = false` to guarantee symmetrical decrementing of `PLAYER_FIELD_POSSTAT0` without bucket corruption.

### B. Feature Decoupling Matrix
- **Master Switch (`Heirloom.Enable`)**: When disabled, all active deltas are purged immediately from players and all processing halts.
- **Scaling Toggle (`Heirloom.Scaling.Enable`)**: When disabled, scaling deltas are stripped, while `Heirloom.Durability.Exempt` continues to audit and repair equipped heirlooms.
- **Bonus XP Toggle (`Heirloom.BonusXP.Enable`)**: Evaluated independently inside `PlayerScript::OnGiveXP`.

### C. Lifecycle Boundaries & Bounded Polling
- **Audit Interval**: In the absence of core hooks inside `EquipItem`, `UnequipItem`, or `DurabilityPointsLoss`, the module uses an asynchronous 1000ms polling timer.
- **Break State Handling**: Broken items (`curDur == 0`) have core item bonuses stripped by core. When repaired, `HeirloomMgr::EnsureHeirloomDurability` invokes packed `player->DurabilityRepair((255 << 8) | slot)` to restore native item bonuses, and caching ensures scaling deltas are withheld while an item remains broken.

### D. Numerical Safety & Destination Clamping
- **Formula Widening**: Scaling calculations widen to `int64` before subtraction and rounding.
- **Finite Float Checks**: Inputs (ratios, multipliers, percentages) are validated with `std::isfinite`.
- **Destination Clamping**: Scaled stats are clamped to `[-10000, 10000]`, armor to `[1, 100000]`, and block to `[1, 50000]`.
- **Experience Award Cap Protection**: Bonus XP is strictly clamped to `CORE_MAX_GIVEXP_LIMIT - amount - 1` so total XP never reaches the core 100,000 XP drop threshold (`Player.cpp:3648`), preserving legitimate base experience.

---

## 3. Formally Excluded / Unsupported Features (v1 Boundaries)

Under **The Unediting Doctrine** (zero core modifications), the following features are formally classified as **UNSUPPORTED / DISABLED** for standalone module space:

1. **Cross-Faction BoA Mail & Instant Delivery**:
   - `WorldSession::HandleSendMailCallback` (`MailHandler.cpp:348-354, 398-402`) enforces team validation and soulbound rejection *before* any module hook runs.
   - `deliver_delay` is passed by value to `MailDraft::SendMailTo` (`Mail.cpp:287`) and is immutable from `MailScript`.
   - Classification: **UNSUPPORTED IN STANDALONE MODULE V1**.
2. **Dynamic Live Weapon Damage Scaling**:
   - Core `m_weaponDamage` is an absolute array directly overwritten on weapon swap without an additive modifier group. Mutating `ItemPrototype` in memory corrupts server-wide baseline data, while modifying player weapon damage directly causes baseline drift on unequip.
   - Classification: **UNSUPPORTED IN STANDALONE MODULE V1**.
3. **Explicit Allowlist Empty by Default**:
   - No vanilla items are arbitrarily converted to heirlooms.
   - Default `Heirloom.ItemIds` explicit allowlist is empty (`""`); native account-bound selection remains active for any template with `Bonding == 6`.

---

## 4. Remaining Decision Blockers for Operator Review

1. **Gate A: Scope Acceptance for Reduced Features**:
   - Live weapon damage scaling and account-bound cross-faction mail are unsupported in standalone module space due to core engine seams. The operator must explicitly accept this scope reduction.
2. **Gate B: Canonical Heirloom Item IDs**:
   - Explicit allowlist is empty by default. Server operators must decide which item IDs to configure in `Heirloom.ItemIds` or introduce new items with `Bonding = 6` (BIND_ACCOUNT) via world database migrations.
3. **Gate C: Isolated Runtime Staging Permission**:
   - Release x64 MSBuild compilation (Exit code 0, SHA256: `EC16CC38AB7797CDCB2F4C34E23B7B2858E499AC163E09181C9BFA41A3A656EC`) and static/model tests are verified clean.
   - Production Manager lifecycle behavior is UNVERIFIED in offline harnesses. Live verification requires operator authorization on a designated disposable staging environment (separate root, isolated DB/ports, dedicated test account). Production deployment remains a strictly separate approval.
