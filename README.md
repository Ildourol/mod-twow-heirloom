# mod-twow-heirloom

![Turtle WoW Heirloom System](docs/images/preview.jpg)

A standalone heirloom equipment module for the community `tortoise-wow` custom vMaNGOS-derived server and its Turtle WoW-compatible client. This is a community project, not an official Turtle WoW module.

> **Bundled & Standalone:** The full item catalog of 9,720 level 1–60 templates across 162 archetypes is bundled directly in `data/sql/world/0002_custom_heirloom_items.sql`. Dual-vendor curators (Curator of Antiquities & Master of Weapons) and 25 capital bank spawns are bundled in `data/sql/world/0003_heirloom_vendor_npc.sql`. With `Heirloom.Database.AutoImport = 1` (default), the module automatically verifies the world database and imports missing migrations on world startup seamlessly without requiring manual SQL imports or server restarts.

## Features

- **Level-aware stat scaling:** Applied to equipped recognized heirlooms (primary attributes, health/mana, armor, shield block, and a weapon-damage modifier). The module applies and removes per-slot deltas using player modifier APIs; it does not rewrite shared item templates.
- **Level-specific item entry adaptation:** Maps supported legacy entries to level-1–60 template families and updates recognized equipped/backpack/bagged items on supported lifecycle events, if target templates exist.
- **Armor proficiency adaptation at level 40:** Warriors/Paladins can transition recognized Mail entries to Plate; Hunters/Shamans can transition recognized Leather entries to Mail. These transitions are upward-only in the present implementation; Plate is not automatically downgraded to Mail.
- **Configurable bonus XP:** Shoulder **10%**, chest **10%**, ring **5% each**, trinket **0% each** by default. The bonus is evaluated by equipment slot on the `OnGiveXP` hook, and the final effective percentage is capped at 200%. Weapon heirlooms do not contribute bonus XP.
- **Durability maintenance:** When enabled, audits equipped heirlooms with positive maximum durability and restores lost durability. True loss-free items require a zero-`max_durability` template.
- **Configuration reload and diagnostics:** Separate switches for master enablement, scaling, XP, durability maintenance, armor adaptation, and debug messages.
- **Bot-compatible hook design:** Uses player/session hooks rather than a hard dependency on TortoiseBots internals; gameplay with installed bots still requires runtime testing.

### Boundaries

- **Account-bound recognition is not cross-faction mail support.** Templates with `bonding = 6` are recognized by the module, but the mail script is observational only; it cannot bypass core mail restrictions or remove mail delivery delay.
- The current weapon modifier is derived from **average base weapon damage** and applied through a damage modifier. This is not proof of exact per-hit, DPS, or tooltip scaling parity.
- The module does **not** create item templates dynamically. Missing destination entries cause level adaptation to skip that item.
- The `900000–916300` and `990000–992999` item ranges receive special recognition; the default allowlist also includes selected pre-existing weapon IDs. Review this scope before enabling on a live database.
- The documented client build and runtime behavior must be checked against your actual target fork; source review is not a successful build or runtime acceptance test.

## Item catalog and vendors

The current `src/HeirloomItemMapping.inc` contains **162** legacy-to-level-family mappings: **111 armor/accessory entries** and **51 weapon/off-hand entries**. Each family uses a base divisible by 100; a level-specific entry is `base + playerLevel` (1–60). For example, legacy Plate head `991111` maps to base `900000`, so its level-20 destination is `900020`. All 9,720 destination templates are bundled in `0002_custom_heirloom_items.sql`.

`0003_heirloom_vendor_npc.sql` provides a **dual-vendor** layout: Curators of Antiquities (`2000200–2000212`) and Masters of Weapons (`2000220–2000232`), spawned across 25 major capital bank locations. The first group lists 111 armor/accessory families; the second lists 51 weapons/off-hands. Its records refer to **level-1 destination entries**, which the vendor scripts adapt for player level dynamically upon opening the vendor window.

For mapped legacy IDs, detailed category and example commands, see [Heirloom Guide](docs/HEIRLOOM_GUIDE.md).

## Scaling model

For an item with base level `L0` and effective character level `L`, the implementation computes:

```text
L = clamp(playerLevel, 1, Heirloom.Scaling.MaxLevel)
R = clamp((L + 5) / (L0 + 5), 0.05, 15.0)
scaledStat = round(baseStat * R * StatMultiplier)
delta = scaledStat - baseStat
```

Armor and block use the same ratio with their own value bounds. Custom `990000–992999` entries use base level 1; supported `900000–916300` entries use the template `ItemLevel` (clamped to 1–60). For other templates, base level comes from `ItemLevel` or `RequiredLevel`. Scaling uses a 1-second equipment audit, as well as login, level changes, and configuration-generation changes.

## Configuration

Copy `conf/mod-twow-heirloom.conf.dist` into the module configuration location used by your target server (e.g. `Server/etc/modules/mod-twow-heirloom.conf`). The file has a required `[ModuleConf]` section. Current defaults:

| Key | Default | Meaning |
| --- | --- | --- |
| `Heirloom.Enable` | `1` | Master feature switch |
| `Heirloom.Scaling.Enable` | `1` | Equipment stat/damage scaling |
| `Heirloom.Scaling.MaxLevel` | `60` | Effective level cap (1–60) |
| `Heirloom.Scaling.StatMultiplier` | `1.0` | Scaling multiplier (0.1–10.0) |
| `Heirloom.BonusXP.Enable` | `1` | XP modifier |
| `Heirloom.BonusXP.Rate` | `1.0` | Global XP multiplier (0–10) |
| `Heirloom.BonusXP.ShoulderPercent` | `10.0` | One shoulder slot |
| `Heirloom.BonusXP.ChestPercent` | `10.0` | One chest slot |
| `Heirloom.BonusXP.RingPercent` | `5.0` | Each of two ring slots |
| `Heirloom.BonusXP.TrinketPercent` | `0.0` | Each of two trinket slots |
| `Heirloom.Durability.Exempt` | `1` | Repair audit |
| `Heirloom.ItemIds` | `"default"` | Built-in allowlist plus optional IDs |
| `Heirloom.Announce.Enable` | `1` | Bonus-XP system messages |
| `Heirloom.Debug.Enable` | `1` | Diagnostic logs |
| `Heirloom.Database.AutoImport` | `1` | Standalone auto-import of missing items, vendors, and spawns on world startup |
| `Heirloom.Database.SqlPath` | `""` | Optional custom path to `data/sql/world/` migration files |

Configured XP slot percentages are bounded to 0–100 individually; invalid/negative inputs fall back to defaults. `Heirloom.ItemIds` accepts comma- or semicolon-separated numeric entries and the `default` keyword. **An empty value also selects the built-in default allowlist**, not an empty allowlist; supplying numeric IDs without `default` does not suppress the hardcoded range/switch recognition. Inspect `src/HeirloomConfig.cpp` for the current built-in IDs. Runtime configuration is loaded at startup and after config reload; audit effects are reconciled by player update.

## Installation & Setup

1. Copy the `mod-twow-heirloom` directory to `Source/tortoise-wow/modules/`.
2. Re-run CMake generation so the module is recognized.
3. Build the core server (e.g. MSBuild `TurtleWoW.sln` Release x64).
4. **Database Migrations (Bundled & Standalone)**:
   - All 9,720 level 1-60 heirloom item templates, dual-vendor curators, and 25 capital bank spawns are bundled directly in `data/sql/world/`:
     - `0001_heirloom_world.sql`
     - `0002_custom_heirloom_items.sql` (9,720 scaling item templates across 162 archetypes)
     - `0003_heirloom_vendor_npc.sql` (Dual-vendor curators, inventories, and 25 bank spawns)
   - **Automatic Standalone Import**: With `Heirloom.Database.AutoImport = 1` (default ON), the module automatically verifies the world database on server boot. If items or vendors are not yet present, it executes the migrations and reloads memory prototypes automatically without requiring manual SQL imports or server restarts.
   - **Manual Import (Optional)**: If preferred, server operators can manually import the three files above into `tw_world` using any MariaDB/MySQL client.
5. Copy `conf/mod-twow-heirloom.conf.dist` to `Server/etc/modules/mod-twow-heirloom.conf` and adjust settings as desired.
6. Start the server.

## Troubleshooting

- **Item does not change with level:** Check `Heirloom.Enable`, `Heirloom.Scaling.Enable`, legacy mapping, and existence of destination template `base + level`. Level-specific adaptation and delta scaling are distinct mechanisms.
- **Unexpected bonus XP:** Default bonuses total **30%** if one shoulder, one chest, and two rings are equipped; trinkets default to **0%**, and weapons have no slot bonus. Check `Rate`, per-slot settings, and the final 200% cap.
- **Incorrect name/quality in client:** After confirming the source item template, close the game client and clear the appropriate item cache (`WDB/itemcache.wdb`) before retesting. Appearance and quality are defined by templates, not by the module itself.
- **Cross-faction or instant mail fails:** Those behaviors are not implemented in the standalone mail hook.

## Documentation and verification

- [Full armory and operator guide](docs/HEIRLOOM_GUIDE.md)
- [Architecture notes](docs/ARCHITECTURE.md) — historical design notes may describe earlier boundaries; use current source as the authority.
- Implementation sources: `src/HeirloomConfig.cpp`, `src/HeirloomMgr.cpp`, `src/HeirloomPlayerScript.cpp`, `src/HeirloomWorldScript.cpp`, `src/HeirloomItemMapping.inc`.
