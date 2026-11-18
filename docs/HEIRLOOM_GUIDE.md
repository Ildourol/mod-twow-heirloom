# Heirloom Module — Complete Armory & Operator Guide

A comprehensive technical manual and quick-reference armory guide for **mod-twow-heirloom** on Turtle WoW (client 1.12.1 / 1.18.1).

---

## 1. Core Principles & Scaling Architecture

All 162 heirloom pieces share the standard heirloom invariants:
- **Quality = 5 (Legendary Orange font)** in tooltips, inventory bags, and inspection frames.
- **Bonding = 6 (Bind to Account)** — recognized for account-bound equipment auditing.
- **MaxDurability = 0 / Durability Exemption** — immune to durability loss, zero repair costs forever.
- **Dynamic 1–60 Level Scaling**: The module maps 162 archetype families across 60 levels (9,720 templates in `0001_custom_heirloom_items.sql`). Every single level gained dynamically increases item stats, armor, attack power, spell power, and weapon damage.
- **Standard Authentic WoW Armor Invariants**:
  - **Plate is Plate**: Requires Level 40 and Plate Mail armor proficiency (Warriors & Paladins).
  - **Mail is Mail**: Wearable from Level 1 (Warriors, Paladins, Hunters, Shamans).
  - **Leather is Leather**: Wearable from Level 1 (Rogues, Druids, Hunters, Shamans).
  - **Cloth is Cloth**: Wearable from Level 1 (Mages, Priests, Warlocks).
  - *No artificial armor morphing at level 40.* Gear strictly maintains authentic World of Warcraft class proficiencies.
- **No Meta Suffixes**: Items do not use ugly meta suffixes like `(DPS)`, `(Healer)`, or `(Tank)`. Instead, they use authentic classic prefixes:
  - **Guardian**: Tank specialization (Maximized Stamina, Strength/Agility, Defense, and Armor).
  - **Blessed**: Healer specialization (Maximized Intellect, Spirit, and Healing/Spell Power).
  - **Vindicator**: DPS specialization (Maximized Attack Power, Strength/Agility, Critical Strike, or Spell Damage).

---

## 2. In-Game Vendor Locations (Capital City Dual Curators)

All heirlooms are available for purchase for **0 copper (100% free)** from race-appropriate Curators in the Alliance and Horde capital cities:

### A. Stormwind City (Trade District Bank — Alliance)
- **Curator of Antiquities (Armor & Jewelry)**: `Kaelen Dawnbrow` (Entry `2000201` / GUID `3000201`)
  - **Location**: Stormwind Bank interior hall (`Map 0`, `X: -8925.25`, `Y: 632.63`, `Z: 99.52`, `O: 5.30`).
  - **Stock**: 111 Armor pieces (Plate, Mail, Leather, Cloth sets), Cloaks, Rings, and Trinkets.
- **Master of Weapons (Weapons, Ranged & Shields)**: `Branden Stormforged` (Entry `2000221` / GUID `3000221`)
  - **Location**: Stormwind Bank interior hall (`Map 0`, `X: -8924.00`, `Y: 634.20`, `Z: 99.52`, `O: 5.29`).
  - **Stock**: 51 Weapons, Ranged weapons, Shields, and Off-hands.

### B. Orgrimmar (Valley of Strength Bank — Horde)
- **Curator of Antiquities (Armor & Jewelry)**: `Krag'jin` (Entry `2000204` / GUID `3000204`)
  - **Location**: Orgrimmar Bank interior, next to the banker counter (`Map 1`, `X: 1627.50`, `Y: -4370.20`, `Z: 11.81`, `O: 0.45`).
  - **Stock**: 111 Armor pieces (Plate, Mail, Leather, Cloth sets), Cloaks, Rings, and Trinkets.
- **Master of Weapons (Weapons, Ranged & Shields)**: `Gorrok Warsong` (Entry `2000224` / GUID `3000224`)
  - **Location**: Orgrimmar Bank interior, standing beside Krag'jin (`Map 1`, `X: 1629.00`, `Y: -4368.50`, `Z: 11.81`, `O: 0.45`).
  - **Stock**: 51 Weapons, Ranged weapons, Shields, and Off-hands.

> **Dynamic Level-Matched Stock**: When a player interacts with any curator, `OnGossipHello` detects the character's exact level (1–60) and dynamically renders the vendor stock with the exact level-matching items!

---

## 3. How Item IDs Work

Each of the 162 heirloom pieces has a **Family Base ID** divisible by 100. The item template for a character of level `L` (1 to 60) is:
```text
Item Entry = FamilyBase + clamp(characterLevel, 1, 60)
```

For example:
- **Guardian Field Plate Helmet** (Family Base `900000`):
  - At level 1: `900001` (`.additem 900001`)
  - At level 20: `900020` (`.additem 900020`)
  - At level 40: `900040` (`.additem 900040`)
  - At level 60: `900060` (`.additem 900060`)
- **Vindicator Blackened Defias Armor** (Family Base `906600`):
  - At level 1: `906601` (`.additem 906601`)
  - At level 60: `906660` (`.additem 906660`)

As the character levels up, any heirloom equipped or stored in the character's bags automatically increments its ID to match the new level.

---

## 4. Complete Armor & Accessory Catalog (111 Items)

### A. Plate Armor — Field Plate Collection (8 Pieces × 3 Roles)
*Visual Model: Classic Field Plate set*

| Slot | Tank (Guardian) Base | Healer (Blessed) Base | DPS (Vindicator) Base |
| :--- | :--- | :--- | :--- |
| **Head** | `900000` (*Guardian Field Plate Helmet*) | `900800` (*Blessed Field Plate Helmet*) | `901600` (*Vindicator Field Plate Helmet*) |
| **Shoulders** (+10% XP) | `900100` (*Guardian Field Plate Pauldrons*) | `900900` (*Blessed Field Plate Pauldrons*) | `901700` (*Vindicator Field Plate Pauldrons*) |
| **Chest** (+10% XP) | `900200` (*Guardian Field Plate Armor*) | `901000` (*Blessed Field Plate Armor*) | `901800` (*Vindicator Field Plate Armor*) |
| **Wrists** | `900300` (*Guardian Field Plate Vambraces*) | `901100` (*Blessed Field Plate Vambraces*) | `901900` (*Vindicator Field Plate Vambraces*) |
| **Hands** | `900400` (*Guardian Field Plate Gauntlets*) | `901200` (*Blessed Field Plate Gauntlets*) | `902000` (*Vindicator Field Plate Gauntlets*) |
| **Waist** | `900500` (*Guardian Field Plate Girdle*) | `901300` (*Blessed Field Plate Girdle*) | `902100` (*Vindicator Field Plate Girdle*) |
| **Legs** | `900600` (*Guardian Field Plate Leggings*) | `901400` (*Blessed Field Plate Leggings*) | `902200` (*Vindicator Field Plate Leggings*) |
| **Feet** | `900700` (*Guardian Field Plate Boots*) | `901500` (*Blessed Field Plate Boots*) | `902300` (*Vindicator Field Plate Boots*) |

---

### B. Mail Armor — Banded Mail Collection (8 Pieces × 3 Roles)
*Visual Model: Classic Banded Mail set*

| Slot | Tank (Guardian) Base | Healer (Blessed) Base | DPS (Vindicator) Base |
| :--- | :--- | :--- | :--- |
| **Head** | `902400` (*Guardian Banded Helm*) | `903200` (*Blessed Banded Helm*) | `904000` (*Vindicator Banded Helm*) |
| **Shoulders** (+10% XP) | `902500` (*Guardian Banded Pauldrons*) | `903300` (*Blessed Banded Pauldrons*) | `904100` (*Vindicator Banded Pauldrons*) |
| **Chest** (+10% XP) | `902600` (*Guardian Banded Armor*) | `903400` (*Blessed Banded Armor*) | `904200` (*Vindicator Banded Armor*) |
| **Wrists** | `902700` (*Guardian Banded Bracers*) | `903500` (*Blessed Banded Bracers*) | `904300` (*Vindicator Banded Bracers*) |
| **Hands** | `902800` (*Guardian Banded Gauntlets*) | `903600` (*Blessed Banded Gauntlets*) | `904400` (*Vindicator Banded Gauntlets*) |
| **Waist** | `902900` (*Guardian Banded Girdle*) | `903700` (*Blessed Banded Girdle*) | `904500` (*Vindicator Banded Girdle*) |
| **Legs** | `903000` (*Guardian Banded Leggings*) | `903800` (*Blessed Banded Leggings*) | `904600` (*Vindicator Banded Leggings*) |
| **Feet** | `903100` (*Guardian Banded Boots*) | `903900` (*Blessed Banded Boots*) | `904700` (*Vindicator Banded Boots*) |

---

### C. Leather Armor — Blackened Defias Collection (8 Pieces × 3 Roles)
*Visual Model: Classic Blackened Defias set & Bandit pieces*

| Slot | Tank (Guardian) Base | Healer (Blessed) Base | DPS (Vindicator) Base |
| :--- | :--- | :--- | :--- |
| **Head** | `904800` (*Guardian Red Defias Mask*) | `905600` (*Blessed Red Defias Mask*) | `906400` (*Vindicator Red Defias Mask*) |
| **Shoulders** (+10% XP) | `904900` (*Guardian Bandit Shoulders*) | `905700` (*Blessed Bandit Shoulders*) | `906500` (*Vindicator Bandit Shoulders*) |
| **Chest** (+10% XP) | `905000` (*Guardian Blackened Defias Armor*) | `905800` (*Blessed Blackened Defias Armor*) | `906600` (*Vindicator Blackened Defias Armor*) |
| **Wrists** | `905100` (*Guardian Bandit Bracers*) | `905900` (*Blessed Bandit Bracers*) | `906700` (*Vindicator Bandit Bracers*) |
| **Hands** | `905200` (*Guardian Blackened Defias Gloves*) | `906000` (*Blessed Blackened Defias Gloves*) | `906800` (*Vindicator Blackened Defias Gloves*) |
| **Waist** | `905300` (*Guardian Blackened Defias Belt*) | `906100` (*Blessed Blackened Defias Belt*) | `906900` (*Vindicator Blackened Defias Belt*) |
| **Legs** | `905400` (*Guardian Blackened Defias Leggings*) | `906200` (*Blessed Blackened Defias Leggings*) | `907000` (*Vindicator Blackened Defias Leggings*) |
| **Feet** | `905500` (*Guardian Blackened Defias Boots*) | `906300` (*Blessed Blackened Defias Boots*) | `907100` (*Vindicator Blackened Defias Boots*) |

---

### D. Cloth Armor — Mystic's Collection (8 Pieces × 3 Roles)
*Visual Model: Classic Mystic's set & Shadow Hood*

| Slot | Tank (Guardian) Base | Healer (Blessed) Base | DPS (Vindicator) Base |
| :--- | :--- | :--- | :--- |
| **Head** | `907200` (*Guardian Shadow Hood*) | `908000` (*Blessed Shadow Hood*) | `908800` (*Vindicator Shadow Hood*) |
| **Shoulders** (+10% XP) | `907300` (*Guardian Mystic's Shoulder Pads*) | `908100` (*Blessed Mystic's Shoulder Pads*) | `908900` (*Vindicator Mystic's Shoulder Pads*) |
| **Chest** (+10% XP) | `907400` (*Guardian Mystic's Robe*) | `908200` (*Blessed Mystic's Robe*) | `909000` (*Vindicator Mystic's Robe*) |
| **Wrists** | `907500` (*Guardian Mystic's Bracelets*) | `908300` (*Blessed Mystic's Bracelets*) | `909100` (*Vindicator Mystic's Bracelets*) |
| **Hands** | `907600` (*Guardian Mystic's Gloves*) | `908400` (*Blessed Mystic's Gloves*) | `909200` (*Vindicator Mystic's Gloves*) |
| **Waist** | `907700` (*Guardian Mystic's Belt*) | `908500` (*Blessed Mystic's Belt*) | `909300` (*Vindicator Mystic's Belt*) |
| **Legs** | `907800` (*Guardian Mystic's Woolies*) | `908600` (*Blessed Mystic's Woolies*) | `909400` (*Vindicator Mystic's Woolies*) |
| **Feet** | `907900` (*Guardian Mystic's Slippers*) | `908700` (*Blessed Mystic's Slippers*) | `909500` (*Vindicator Mystic's Slippers*) |

---

### E. Jewelry & Accessories (5 Slots × 3 Roles)

| Slot | Tank (Guardian) Base | Healer (Blessed) Base | DPS (Vindicator) Base |
| :--- | :--- | :--- | :--- |
| **Back (Cloak)** | `909600` (*Guardian Drape of Antiquity*) | `909700` (*Blessed Drape of Antiquity*) | `909800` (*Vindicator Drape of Antiquity*) |
| **Finger (Ring 1)** (+5% XP) | `909900` (*Guardian Signet of the Ancestor*) | `910000` (*Blessed Signet of the Ancestor*) | `910100` (*Vindicator Signet of the Ancestor*) |
| **Finger (Ring 2)** (+5% XP) | `910200` (*Guardian Band of the Paragon*) | `910300` (*Blessed Band of the Paragon*) | `910400` (*Vindicator Band of the Paragon*) |
| **Trinket 1** | `910500` (*Guardian Insignia of the Vanguard*) | `910600` (*Blessed Insignia of the Vanguard*) | `910700` (*Vindicator Insignia of the Vanguard*) |
| **Trinket 2** | `910800` (*Guardian Talisman of Resolve*) | `910900` (*Blessed Talisman of Resolve*) | `911000` (*Vindicator Talisman of Resolve*) |

---

## 5. Complete Weapons, Ranged & Shields Catalog (51 Items)

Sold exclusively by the **Master of Weapons** in Stormwind Bank and Orgrimmar Bank:

| Weapon Type | Iconic Visual Reference | Tank (Guardian) Base | Healer (Blessed) Base | DPS (Vindicator) Base |
| :--- | :--- | :--- | :--- | :--- |
| **1H Sword** | Cruel Barb | `911100` | `911200` | `911300` |
| **2H Sword** | Whirlwind Sword | `911400` | `911500` | `911600` |
| **1H Axe** | Butcher's Cleaver | `911700` | `911800` | `911900` |
| **2H Axe** | Ravager | `912000` | `912100` | `912200` |
| **1H Mace** | The Hand of Antu'sul | `912300` | `912400` | `912500` |
| **2H Mace** | Mograine's Might | `912600` | `912700` | `912800` |
| **Dagger** | Black Menace | `912900` | `913000` | `913100` |
| **Fist Weapon** | Thekal's Grasp | `913200` | `913300` | `913400` |
| **Polearm** | Grimlok's Charge | `913500` | `913600` | `913700` |
| **Staff** | Illusionary Rod | `915300` | `915400` | `915500` |
| **Bow** | Gryphonwing Long Bow | `913800` | `913900` | `914000` |
| **Gun** | Precisely Calibrated Boomstick | `914100` | `914200` | `914300` |
| **Crossbow** | Blackcrow | `914400` | `914500` | `914600` |
| **Wand** | Bonecreeper Stylus | `914700` | `914800` | `914900` |
| **Thrown Weapon** | Deadly Throwing Axe | `915000` | `915100` | `915200` |
| **Shield** | Aegis of the Scarlet Commander | `915900` | `916000` | `916100` |
| **Caster Off-Hand** | Orb of Lorica | `915600` | `915700` | `915800` |

---

## 6. Coexistence with Vanilla Items (No Overwrites)

- `0001_custom_heirloom_items.sql` contains exclusively custom items in the ID range `900001` through `916160`.
- **Vanilla items remain 100% untouched**: Vanilla epics and dungeon set pieces (such as *Onyxia Blood Talisman* `18406`, *Beastmaster's Mantle* `22016`, or *Darkmantle Spaulders* `22008`) are NOT included, altered, or overwritten in the heirloom SQL.
- **Client Cache Notice**: If an item name appears white or stats do not refresh immediately in your WoW client, exit the game, delete `WDB/itemcache.wdb`, and log back in.
