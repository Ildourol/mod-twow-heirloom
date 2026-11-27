# Heirloom balance audit

## Vanilla primary-stat and weapon-speed pass

The source for this pass was the local [Tortoise DB viewer](https://xian55.github.io/tortoise-db-viewer/) SQLite snapshot at `tortoise-db-viewer/public/data/tortoise.sqlite`. The comparison used its non-custom item templates and the quest level for rewards with no item required level. It excluded honor gear, random rolls, items above item level 66, and items more than 12 item levels above their comparison level.

Armor and shields use separate curves by material and slot. At each five-level anchor, take up to seven closest rare peers within eight levels. Normalize their primary totals by `(tier + 5) / (peer level + 5)` and use 75% of the median as a floor to leave room for the heirloom equip effects. With fewer than three rare peers, use 90% of the median of up to seven uncommon peers within five levels, with the same minimum sample size. Anchor floors never decrease and intermediate tiers interpolate. The floor is distributed using the family's role weights, with each stat retaining any higher value supplied by its role curve.

The second armor review found that endgame rare mail chests often put more of their budget into base stats, while comparable plate chests often have equip effects. Heirloom mail and plate already share those effects by role and slot. For mail, use the higher of the original mail budget and the corresponding revised plate budget, then distribute it by role. Guardian weights Stamina, Agility, and Strength at 63/22/15. Blessed weights Intellect, Spirit, and Stamina at 48/32/20. Vindicator weights Agility, Stamina, and Strength at 45/32/23, with the original Agility as an individual floor through tier 39. Its chest also keeps a separate mid-level floor for Stamina and Strength based on the rare mail examples below. At tier 60 the Vindicator mail chest has 18 Agility, 12 Stamina, and 9 Strength.

The review also capped the late-tier increase for leather headgear after a small cluster of stat-heavy rares pushed the floor up. Guardian and Blessed shields now progress from 14 primary points at tier 39 to 17 at tier 60. Rings, trinkets, and held-in-off-hand caster items retain their individual budgets. The two eligible mid-level rare off-hands had 5 and 22 primary points. The three tier-39 heirloom off-hands had 8–9 points plus equip effects.

| Tier-39 mail chest | Before | After |
| --- | --- | --- |
| Guardian Banded Armor | 15 Sta, 5 Agi | 13 Sta, 4 Agi, 3 Str |
| Vindicator Banded Armor | 13 Agi, 5 Sta, 3 Str | 13 Agi, 10 Sta, 7 Str |
| Blessed Banded Armor | 8 Int, 6 Spi, 3 Sta | 8 Int, 6 Spi, 3 Sta |

[Scarlet Chestpiece](https://xian55.github.io/tortoise-db-viewer/?item=10328) has 19 Stamina and 8 Strength at level 34. [Polished Jazeraint Armor](https://xian55.github.io/tortoise-db-viewer/?item=1715) has 10 Stamina, 9 Strength, and 17 Spirit at level 39. [Scarlet Leggings](https://xian55.github.io/tortoise-db-viewer/?item=10330) have 10 Stamina and 20 Strength at level 38. These items support stronger secondary primary stats on physical mail, with different mixes for tanking and damage.

### Weapon families

Compared physical damage or wand damage per second with nearby rares of the same weapon subclass and compatible hand slot. Comparable tier-39 families were within 7% of the sampled medians. At tier 60 the spread was about 8%, with the fist-weapon sample limited to four peers. The lowest tier-19 comparison was the gun group, at 11.0 DPS versus 13.3 from three peers. The existing DPS curves were retained because the comparison pools ranged across several levels and some subclass samples were sparse.

Each speed is fixed across all 60 tiers of its family. Damage endpoints scale by the ratio of new delay to old delay, preserving base DPS to within rounding. Faster tank weapons change swing cadence, and slower damage weapons deal more damage per swing at the same base DPS.

| Heirloom | Before | After | Vanilla speed reference |
| --- | ---: | ---: | --- |
| Guardian Broadsword | 2.80 s | 1.90 s | [Sword of Omen](https://xian55.github.io/tortoise-db-viewer/?item=6802) |
| Vindicator Broadsword | 2.80 s | 2.70 s | [Thrash Blade](https://xian55.github.io/tortoise-db-viewer/?item=17705) |
| Vindicator Greatsword | 2.90 s | 3.90 s | [Stoneslayer](https://xian55.github.io/tortoise-db-viewer/?item=9418) |
| Guardian War Axe | 1.70 s | 1.60 s | [Soul Breaker](https://xian55.github.io/tortoise-db-viewer/?item=13408) |
| Vindicator War Axe | 1.70 s | 2.70 s | [Ripsaw](https://xian55.github.io/tortoise-db-viewer/?item=9478) |
| Blessed Ravager | 3.60 s | 3.50 s | [Ravager](https://xian55.github.io/tortoise-db-viewer/?item=7717) |
| Vindicator Greataxe | 3.60 s | 3.80 s | [Executioner's Cleaver](https://xian55.github.io/tortoise-db-viewer/?item=13018) |
| Guardian Warhammer | 2.70 s | 2.00 s | [Rubidium Hammer](https://xian55.github.io/tortoise-db-viewer/?item=11805) |
| Guardian and Blessed Greatmaul | 2.80 s | 3.40 s | [Princess Theradras' Scepter](https://xian55.github.io/tortoise-db-viewer/?item=17766) |
| Vindicator Greatmaul | 2.80 s | 3.70 s | [The Rockpounder](https://xian55.github.io/tortoise-db-viewer/?item=9413) |
| Vindicator Stiletto | 1.50 s | 1.90 s | [Toxic Revenger](https://xian55.github.io/tortoise-db-viewer/?item=9453) |
| Vindicator Knuckles | 2.20 s | 1.80 s | [Claw of Celebras](https://xian55.github.io/tortoise-db-viewer/?item=17738) |
| Vindicator Pike | 2.70 s | 3.50 s | [Blackhand Doomsaw](https://xian55.github.io/tortoise-db-viewer/?item=12583) |
| Vindicator Rifle | 1.50 s | 2.60 s | [Galgann's Fireblaster](https://xian55.github.io/tortoise-db-viewer/?item=9412) |
| Arcane Staff | 3.40 s | 2.70 s | [Zum'rah's Vexing Cane](https://xian55.github.io/tortoise-db-viewer/?item=18082) |
| Arcane Ritual Dagger | 1.50 s | 1.40 s | [Hypnotic Blade](https://xian55.github.io/tortoise-db-viewer/?item=7714) |

The three polearms had 46–54 base primary points at tier 60 in addition to their passives. The revised tier-60 caps are 44 for Guardian, 37 for Blessed, and 42 for Vindicator. Caps scale by `(tier + 5) / 65` and are applied only where the shipped budget exceeds them. [Grimlok's Charge](https://xian55.github.io/tortoise-db-viewer/?item=9416) has 40 base primary points at level 42 and serves as a high-stat polearm reference.

The balance changes ship in the fresh world install SQL. The install uses `INSERT IGNORE`, so a re-import leaves existing templates in place.

## Previous baseline audit

A read-only export of the local Tortoise database supplied item templates, quest reward levels, and fixed passive effects for the previous balance pass. After filtering, **2,929 rare items** and **3,422 uncommon items** contributed to that comparison.

| Heirloom | Tier | Previous values |
| --- | ---: | --- |
| Guardian Field Plate Armor | 60 | 687 armor, 34 primary stat points, +7 Defense |
| Blessed Field Plate Armor | 60 | 687 armor, 29 primary stat points, +42 healing |
| Vindicator Field Plate Armor | 60 | 687 armor, 34 primary stat points, +26 Attack Power |
| Guardian Banded Armor | 60 | 377 armor, 44 primary stat points, +7 Defense |
| Guardian Blackened Defias Armor | 60 | 176 base armor, 40 primary stat points, +30 armor on equip |
| Arcane Mystic's Robe | 60 | 90 armor, 34 primary stat points, +26 spell damage and healing |
| Arcane Illusionary Rod | 60 | 29 primary stat points, +31 spell damage and healing |
| Vindicator Gryphonwing Long Bow | 60 | 10 primary stat points, +7 ranged Attack Power |
| Cruel Barb | 19 | 15.5 DPS |
| Aegis of the Scarlet Commander | 39 | 1,548 armor, 23 block |
| Bonecreeper Stylus | 60 | 64.7 DPS |

Breastplate of Valor, a level-58 rare, has 657 armor and 49 primary stat points on this server. Heirloom plate chests use comparable rare plate chests as a benchmark and allocate some of the stat budget to their equip effects. The table lists individual item values. Primary stat totals include the native secondary equip stat when present.

## Level curves

- The audit compared gear at its required level or quest reward level by slot, armor material, weapon type, and quality. It excluded honor gear, randomly rolled items, item levels over 66, and items more than 12 item levels above the comparison level.
- Nearby matching rares supplied the median. Sparse groups used comparable uncommon items with a rarity adjustment, related rare groups, or an estimate from the nearest items.
- Armor, shield block, and weapon DPS follow separate curves. The stat budget counts primary stats and recognizable fixed passive effects. Trinket budgets use passive effects.

## Role-specific equip effects

Guardian heavy armor, shields, and one-handed tank weapons spend part of their budget on Defense. Guardian leather uses Stamina, Agility, and armor. Vindicator armor and melee weapons use Attack Power. Physical ranged weapons use Agility and ranged Attack Power. Arcane cloth and caster arms use spell damage and healing, while Blessed gear uses healing or mana regeneration on selected bracers.

The new secondary equip line reallocates part of each eligible item's primary-stat budget into a stock passive rank. Each tier preserves its total primary-stat points. The 148 armor and weapon families with a secondary equip line use fixed ranks confirmed against the bundled server spell data and the stock 1.18.1.7979 client Spell.dbc. The added ranks progress monotonically by family. Rings and trinkets use their own existing budgets and effects. Base armor, block, damage, XP and appearances retain their audited values.

## Durability benchmarks

For repairable gear, the audit took the median durability of the seven closest ordinary rare items by class, subclass, slot and target item level. Sparse groups include uncommon gear and use the same weapon subclass across hand slots if needed. Helm durability is 80 for plate, 70 for mail, 60 for leather, and 50 for cloth at tier 60. The tier-60 Blessed Field Plate chest has 135 durability, Cruel Barb has 90, and Bonecreeper Stylus has 65.

## Rare ring audit

A separate export yielded **183 rare rings** and **176 uncommon rings** with measurable stat budgets. The ring curve uses the exact-level rare median where at least two references exist. At sparse levels, it scales nearby rare rings by the ratio of target item level to source item level, as in the item-level-scaling module. A sample-weighted fit keeps budgets from dropping between tiers.

| Character tier | Rare references | Target item level | Stat budget |
| --- | --- | ---: | ---: |
| 10 | Estimated from nearby rares, including level-13 Band of Hailar | 15 | 4.375 |
| 21 | Silverlaine's Family Seal and Deep Fathom Ring | 26 | 11 |
| 60 | 33 rare drops and quest rewards, including Field Medic's Band and Band of the Cultist | 65 | 24 |

Guardian and Vindicator rings round to 4, 11, and 24 primary stat points at the displayed tiers. Blessed rings spend part of the same budget on healing. Trinkets have individual stat and equip effects.
