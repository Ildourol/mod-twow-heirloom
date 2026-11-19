# Heirloom balance audit

The World install SQL contains all 162 heirloom families at tiers 1 through 60. A read-only export of the local Tortoise database supplied item templates, quest reward levels, and fixed passive effects. After filtering, **2,929 rare items** and **3,422 uncommon items** contributed to the general comparison.

| Heirloom | Tier | Shipped values |
| --- | ---: | --- |
| Guardian Field Plate Armor | 60 | 687 armor, 39 primary stat points, +4 Defense |
| Blessed Field Plate Armor | 60 | 687 armor, 39 primary stat points, +18 healing |
| Vindicator Field Plate Armor | 60 | 687 armor, 39 primary stat points, +15 Attack Power |
| Guardian Banded Armor | 60 | 377 armor, 44 primary stat points, +7 Defense |
| Arcane Mystic's Robe | 60 | 90 armor, 37 primary stat points, +22 spell damage and healing |
| Cruel Barb | 19 | 15.5 DPS |
| Aegis of the Scarlet Commander | 39 | 1,548 armor, 23 block |
| Bonecreeper Stylus | 60 | 64.7 DPS |

Breastplate of Valor, a level-58 rare, has 657 armor and 49 primary stat points on this server. Heirloom plate chests use comparable rare plate chests as a benchmark and allocate some of the stat budget to their equip effects. The table lists individual item values.

## Level curves

- The audit compared gear at its required level or quest reward level by slot, armor material, weapon type, and quality. It excluded honor gear, randomly rolled items, item levels over 66, and items more than 12 item levels above the comparison level.
- Nearby matching rares supplied the median. Sparse groups used comparable uncommon items with a rarity adjustment, related rare groups, or an estimate from the nearest items.
- Armor, shield block, and weapon DPS follow separate curves. The stat budget counts primary stats and recognizable fixed passive effects. Trinket budgets use passive effects.

## Rare ring audit

A separate export yielded **183 rare rings** and **176 uncommon rings** with measurable stat budgets. The ring curve uses the exact-level rare median where at least two references exist. At sparse levels, it scales nearby rare rings by the ratio of target item level to source item level, as in the item-level-scaling module. A sample-weighted fit keeps budgets from dropping between tiers.

| Character tier | Rare references | Target item level | Stat budget |
| --- | --- | ---: | ---: |
| 10 | Estimated from nearby rares, including level-13 Band of Hailar | 15 | 4.375 |
| 21 | Silverlaine's Family Seal and Deep Fathom Ring | 26 | 11 |
| 60 | 33 rare drops and quest rewards, including Field Medic's Band and Band of the Cultist | 65 | 24 |

Guardian and Vindicator rings round to 4, 11, and 24 primary stat points at the displayed tiers. Blessed rings spend part of the same budget on healing. Trinkets have individual stat and equip effects.
