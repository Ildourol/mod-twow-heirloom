# Heirloom Module — Armory and Operator Guide

This guide tracks the **current repository implementation**, not a guaranteed deployed server state. See the [README](../README.md) for setup, configuration defaults, formula, and supported/unsupported feature boundaries.

> **Catalog prerequisite:** `data/sql/world/0002_custom_heirloom_items.sql` is **empty** at this revision. The vendor SQL does not supply the item templates referenced below. Populate a separately verified, compatible item catalog in a controlled environment before testing the vendors or spawning the items.

## 1. How item IDs work now

The module includes `src/HeirloomItemMapping.inc` with **162** legacy entries mapped to **162 level-based template families**: 111 armor/accessory and 51 weapon/off-hand entries. Older IDs in the `991xxx` / `992xxx` ranges are **source mappings**, not proof of installed items.

For a mapped legacy entry, lookup returns a family base and the level-specific target is:

```text
targetEntry = familyBase + clamp(characterLevel, 1, 60)
```

Examples:

| Legacy entry | Role / slot | Family base | At level 1 | At level 20 | At level 60 |
| --- | --- | ---: | ---: | ---: | ---: |
| `991111` | Plate Vanguard head | `900000` | `900001` | `900020` | `900060` |
| `991112` | Plate Vanguard shoulders | `900100` | `900101` | `900120` | `900160` |
| `991211` | Mail Vanguard head | `902400` | `902401` | `902420` | `902460` |
| `991311` | Leather Vanguard head | `904800` | `904801` | `904820` | `904860` |
| `991411` | Cloth Vanguard head | `907200` | `907201` | `907220` | `907260` |
| `992011` | Vanguard one-handed sword | `911100` | `911101` | `911120` | `911160` |
| `992173` | Slaughter caster off-hand | `916100` | `916101` | `916120` | `916160` |

**Before using `.additem`:** Query `item_template` to confirm the exact entry exists. A command like `.additem 900020` is valid only if an appropriate template for that ID has been installed. The code skips adaptation when the destination `ItemPrototype` is unavailable.

The older armory uses three role variants: **Vanguard** (tank), **Grace** (healer), and **Slaughter** (DPS). The core mapping is authoritative for exact individual legacy-to-family pairs.

### 111 armor and accessory families

| Collection | Legacy ID groups | Families |
| --- | --- | ---: |
| Plate / Field Plate appearance | `991111–991118`, `991121–991128`, `991131–991138` | 24 |
| Mail / Banded appearance | `991211–991218`, `991221–991228`, `991231–991238` | 24 |
| Leather / Blackened Defias appearance | `991311–991318`, `991321–991328`, `991331–991338` | 24 |
| Cloth / Mystic's appearance | `991411–991418`, `991421–991428`, `991431–991438` | 24 |
| Cloak/accessory groups | `991511–991513`, `991611–991613`, `991621–991623`, `991711–991713`, `991721–991723` | 15 |
| **Total** | | **111** |

The old guide used `991501–991503` and `991601–991603` for cloak/ring, but those IDs **do not appear in the current mapping**. Use the current mapping IDs above, and inspect actual template slot assignments before labelling a specific accessory a ring, trinket, or cloak.

### 51 weapon, ranged, shield and off-hand families

Each type has three role versions. For type prefix `9920xx` or `9921xx`, the three valid legacy entries shown are mapped in `HeirloomItemMapping.inc`.

| Type | Legacy entries |
| --- | --- |
| One-handed sword | `992011`, `992012`, `992013` |
| Two-handed sword | `992021`, `992022`, `992023` |
| One-handed axe | `992031`, `992032`, `992033` |
| Two-handed axe | `992041`, `992042`, `992043` |
| One-handed mace | `992051`, `992052`, `992053` |
| Two-handed mace | `992061`, `992062`, `992063` |
| Dagger | `992071`, `992072`, `992073` |
| Fist weapon | `992081`, `992082`, `992083` |
| Polearm | `992091`, `992092`, `992093` |
| Staff | `992101`, `992102`, `992103` |
| Bow | `992111`, `992112`, `992113` |
| Gun | `992121`, `992122`, `992123` |
| Crossbow | `992131`, `992132`, `992133` |
| Wand | `992141`, `992142`, `992143` |
| Thrown weapon | `992151`, `992152`, `992153` |
| Shield | `992161`, `992162`, `992163` |
| Caster off-hand | `992171`, `992172`, `992173` |
| **Total** | **51 legacy entries** |

**Note on visual models:** Older guide labels such as Field Plate, Banded, Blackened Defias, and Mystic's are historical catalog descriptions. The actual look, item quality, name, stats, price, binding, and durability belong to the installed item templates, which are **not included** in `0002`.

## 2. XP bonuses and equipped slots

| Slot | Default bonus | Available pieces |
| --- | ---: | --- |
| Shoulders | +10% | One |
| Chest / robe | +10% | One |
| Ring | +5% | Two |
| Trinket | +0% | Two |
| Head, wrist, gloves, belt, legs, feet, cloak | +0% | As equipped |
| Weapons / ranged / shield / off-hand | +0% | As equipped |

With shoulders + chest + two rings, the default combined bonus is **30%** (`Rate = 1.0`). The two trinkets contribute zero by default. Administrators can adjust slot percentages and the global multiplier; the calculated effective bonus is bounded to **200%**. A broken heirloom does not contribute the slot bonus. The `OnGiveXP` modifier protects the core's 100,000-XP award threshold by limiting bonus XP.

The XP hook does not distinguish quest and creature XP by a dedicated option; verify both award paths against your exact target dispatch.

## 3. Scaling and level changes

For scaling, the per-stat formula is `R = clamp((L + 5) / (L0 + 5), 0.05, 15.0)`, and the module applies `round(baseStat * R * StatMultiplier) - baseStat` as a player-side delta. It also computes armor/block deltas and an approximate average weapon-damage modifier. This differs from swapping into a level-specific prototype: **both** paths exist and have separate preconditions.

When enabled, the module checks player equipment on login, level changes, loot and a roughly one-second periodic audit. Level-specific conversion also checks backpack/bag contents. Conversion requires a corresponding target template. It does not manufacture an item when the required level entry is absent.

Armor types strictly preserve standard WoW invariants: Plate is Plate (wearable at level 40+), Mail is Mail (wearable from level 1), Leather is Leather, and Cloth is Cloth. There is no armor morphing or cross-type conversion; gear behaves identically to standard authentic gear with native level scaling.

## 4. Current vendor SQL

`data/sql/world/0003_heirloom_vendor_npc.sql` establishes capital curators:
- **Stormwind Bank (Alliance)**: `Kaelen Dawnbrow` (`entry 2000201`, `guid 3000201`)
- **Orgrimmar Bank (Horde)**: `Krag'jin` (`entry 2000204`, `guid 3000204`)

Each merchant provides all 162 heirloom pieces (111 armor & jewelry, 51 weapons & shields) directly to players. All other regional spawns are pruned to ensure a clean capital-centric setup.

## 5. Recognition, account binding and mail

Items are recognized via the hardcoded `900000–916300` range, the configuration allowlist/hardcoded IDs, or a prototype with `Bonding == 6`. The configuration also unconditionally recognizes `990000–992999` and selected classic weapon IDs. This means turning on the module can affect items that are not part of the dual-vendor custom catalog; audit the recognized IDs on your server.

Account binding **does not** grant cross-faction mailing or instant mail delivery. The mail hook only observes/logs same-account transfers when debugging is enabled. Core mail restrictions and delivery timing remain in place.

Durability repair auditing is independent of stat scaling when the module remains enabled. For guaranteed no-durability-loss item templates, configure `max_durability = 0` where appropriate; the module cannot establish that property for missing templates.

## 6. Operator validation checklist

- [ ] Record the exact target core commit, module revision, client build and physical DB mapping.
- [ ] Review SQL updater settings and select **one** migration application path.
- [ ] Back up the relevant world database and identify conflicts in `2000200–2000235` and custom item ranges.
- [ ] Supply the missing template catalog separately; confirm `item_template` entries for **every** vendor item and expected level-1–60 destination.
- [ ] Confirm the custom templates' quality, binding, price, required level, visuals, armor type, class/race restrictions and durability.
- [ ] Test 1, 20, 39, 40 and 60 with each armor class; check level-up, relog, bag, bank, equipment, and missing-destination behavior.
- [ ] Test two players of **different levels** opening the same vendor at once; check listing, purchase, item IDs and paging.
- [ ] Compare XP with/without shoulders, chest, one/two rings, trinkets, and weapon; test both creature and quest awards.
- [ ] Test changes of scaling, bonus-XP, durability and auto-morph settings across config reload.
- [ ] Check normal mail, same-account mail, cross-faction restrictions and delivery delay without assuming bypass.
- [ ] Validate with and without TortoiseBots; inspect server log for stat/damage drift or broken-item effects.
- [ ] Keep a reviewed rollback procedure for SQL and module/config changes.

## 7. Recovery and client cache

If NPCs or item entries are missing, **do not repeatedly reimport SQL**. Inspect existing rows and migration tracking first. Revert authorized world database changes using a verified pre-import backup and remove or disable module configuration/code only through the normal operator deployment process.

For a stale item tooltip, fully close the client and clear its item cache (`WDB/itemcache.wdb`) before checking again. Cache clearing cannot fix a missing/incorrect server item template.

**Documentation status (2026-11-18):** Source and checked-in SQL reviewed; build, live vendor inventory, item creation, runtime acceptance, and deployment not performed as part of this documentation update.
