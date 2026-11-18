# Heirloom Module — Armory and Operator Guide

A comprehensive manual and quick-reference armory for **mod-twow-heirloom** on Turtle WoW (1.18.1 / 1.12.1).

The full item catalog of **9,720 item templates** across **162 archetypes** is bundled directly in `data/sql/world/0001_custom_heirloom_items.sql`, with capital curators in `data/sql/world/0002_heirloom_vendor_npc.sql`.

---

## 1. How Heirloom Item IDs Work

Every heirloom archetype has a **Family Base ID** divisible by 100 in the range `900000–916100`. The level-specific item template for any character of level `L` (1 to 60) is mathematically calculated as:

$$\text{Item Entry} = \text{Family Base} + \text{clamp}(\text{characterLevel}, 1, 60)$$

### Scaling Examples:
| Archetype Name | Role | Family Base | At Level 1 | At Level 20 | At Level 40 | At Level 60 |
| :--- | :--- | :---: | :---: | :---: | :---: | :---: |
| **Guardian Field Plate Helmet** | Tank | `900000` | `900001` | `900020` | `900040` | `900060` |
| **Blessed Field Plate Armor** | Healer | `901000` | `901001` | `901020` | `901040` | `901060` |
| **Vindicator Field Plate Boots** | DPS | `902300` | `902301` | `902320` | `902340` | `902360` |
| **Guardian Banded Pauldrons** | Tank (+10% XP) | `902500` | `902501` | `902520` | `902540` | `902560` |
| **Vindicator Blackened Defias Armor** | DPS (+10% XP) | `906600` | `906601` | `906620` | `906640` | `906660` |
| **Vindicator Cruel Barb** | DPS (1H Sword) | `911300` | `911301` | `911320` | `911340` | `911360` |
| **Guardian Whirlwind Sword** | Tank (2H Sword) | `911400` | `911401` | `911420` | `911440` | `911460` |
| **Vindicator Ravager** | DPS (2H Axe) | `912200` | `912201` | `912220` | `912240` | `912260` |
| **Guardian Gryphonwing Long Bow** | Tank/DPS (Bow) | `913800` | `913801` | `913820` | `913840` | `913860` |

> [!TIP]
> **Spawning Items with `.additem`**:
> To spawn an heirloom for a specific level, take the Family Base and add the desired level.
> Example: For a Level 35 character to receive the Vindicator Banded Helm, use:
> ```text
> .additem 904035
> ```

---

## 2. Dynamic Vendor & Automatic Adaptation

1. **Dynamic Level Vendor Inventory**:
   - Curators sell level-1 base items in `npc_vendor`.
   - When a player right-clicks an Heirloom Curator, `OnGossipHello` detects the player's level and dynamically updates the vendor list to present exact level-matched templates for their level.
   - All heirloom pieces cost **0 copper (100% free)**.
2. **Automatic Inventory & Bag Adaptation**:
   - When a player levels up or logs in, `HeirloomMgr::AdaptAllPlayerHeirlooms` audits all equipped items, backpack slots, and bag containers, seamlessly upgrading heirlooms from `base + oldLevel` to `base + newLevel`.
3. **Durability Exemption**:
   - All custom heirloom templates are configured with `MaxDurability = 0`, making them naturally immune to durability loss and repair costs forever.

---

## 3. Authentic WoW Armor Invariants (No Morphing)

Gear adheres strictly to standard World of Warcraft armor mechanics:
- **Plate is Plate**: Requires character level 40 and the Plate Mail armor skill. Wearable by Warriors and Paladins. Plate does not morph down to Mail.
- **Mail is Mail**: Wearable from level 1 by Warriors and Paladins, and from level 40 by Hunters and Shamans. Mail does not morph into Plate.
- **Leather is Leather**: Wearable from level 1 by Druids, Rogues, Hunters, Shamans, Paladins, and Warriors.
- **Cloth is Cloth**: Wearable from level 1 by all classes.

---

## 4. Complete Armory Directory

### A. Plate Armor — Field Plate Collection (24 Archetypes)
*Sold by Curator of Antiquities*

| Slot | Tank (Guardian) | Healer (Blessed) | DPS (Vindicator) | XP Bonus |
| :--- | :---: | :---: | :---: | :---: |
| **Head** | `900000` | `900800` | `901600` | — |
| **Shoulders** | `900100` | `900900` | `901700` | **+10% XP** |
| **Chest** | `900200` | `901000` | `901800` | **+10% XP** |
| **Wrists** | `900300` | `901100` | `901900` | — |
| **Hands** | `900400` | `901200` | `902000` | — |
| **Waist** | `900500` | `901300` | `902100` | — |
| **Legs** | `900600` | `901400` | `902200` | — |
| **Feet** | `900700` | `901500` | `902300` | — |

---

### B. Mail Armor — Banded Mail Collection (24 Archetypes)
*Sold by Curator of Antiquities*

| Slot | Tank (Guardian) | Healer (Blessed) | DPS (Vindicator) | XP Bonus |
| :--- | :---: | :---: | :---: | :---: |
| **Head** | `902400` | `903200` | `904000` | — |
| **Shoulders** | `902500` | `903300` | `904100` | **+10% XP** |
| **Chest** | `902600` | `903400` | `904200` | **+10% XP** |
| **Wrists** | `902700` | `903500` | `904300` | — |
| **Hands** | `902800` | `903600` | `904400` | — |
| **Waist** | `902900` | `903700` | `904500` | — |
| **Legs** | `903000` | `903800` | `904600` | — |
| **Feet** | `903100` | `903900` | `904700` | — |

---

### C. Leather Armor — Blackened Defias Collection (24 Archetypes)
*Sold by Curator of Antiquities*

| Slot | Tank (Guardian) | Healer (Blessed) | DPS (Vindicator) | XP Bonus |
| :--- | :---: | :---: | :---: | :---: |
| **Head** (Red Defias Mask) | `904800` | `905600` | `906400` | — |
| **Shoulders** (Bandit Shoulders) | `904900` | `905700` | `906500` | **+10% XP** |
| **Chest** (Blackened Defias Armor) | `905000` | `905800` | `906600` | **+10% XP** |
| **Wrists** (Bandit Bracers) | `905100` | `905900` | `906700` | — |
| **Hands** (Blackened Defias Gloves) | `905200` | `906000` | `906800` | — |
| **Waist** (Blackened Defias Belt) | `905300` | `906100` | `906900` | — |
| **Legs** (Blackened Defias Leggings) | `905400` | `906200` | `907000` | — |
| **Feet** (Blackened Defias Boots) | `905500` | `906300` | `907100` | — |

---

### D. Cloth Armor — Mystic's Collection (24 Archetypes)
*Sold by Curator of Antiquities*

| Slot | Tank (Guardian) | Healer (Blessed) | DPS (Vindicator) | XP Bonus |
| :--- | :---: | :---: | :---: | :---: |
| **Head** (Shadow Hood) | `907200` | `908000` | `908800` | — |
| **Shoulders** (Mystic's Shoulder Pads) | `907300` | `908100` | `908900` | **+10% XP** |
| **Chest** (Mystic's Robe) | `907400` | `908200` | `909000` | **+10% XP** |
| **Wrists** (Mystic's Bracelets) | `907500` | `908300` | `909100` | — |
| **Hands** (Mystic's Gloves) | `907600` | `908400` | `909200` | — |
| **Waist** (Mystic's Belt) | `907700` | `908500` | `909300` | — |
| **Legs** (Mystic's Woolies) | `907800` | `908600` | `909400` | — |
| **Feet** (Mystic's Slippers) | `907900` | `908700` | `909500` | — |

---

### E. Cloaks & Jewelry (15 Archetypes)
*Sold by Curator of Antiquities*

| Slot | Tank (Guardian) | Healer (Blessed) | DPS (Vindicator) | XP Bonus |
| :--- | :---: | :---: | :---: | :---: |
| **Back** (Drape of Antiquity) | `909600` | `909700` | `909800` | — |
| **Finger 1** (Signet of the Ancestor) | `909900` | `910000` | `910100` | **+5% XP** |
| **Finger 2** (Band of the Paragon) | `910200` | `910300` | `910400` | **+5% XP** |
| **Trinket 1** (Insignia of the Vanguard) | `910500` | `910600` | `910700` | — |
| **Trinket 2** (Talisman of Resolve) | `910800` | `910900` | `911000` | — |

---

### F. Weapons, Ranged, Shields & Off-Hands (51 Archetypes)
*Sold by Master of Weapons*

| Weapon Type | Base Weapon Model | Tank (Guardian) | Healer (Blessed) | DPS (Vindicator) |
| :--- | :--- | :---: | :---: | :---: |
| **1H Sword** | Cruel Barb | `911100` | `911200` | `911300` |
| **2H Sword** | Whirlwind Sword | `911400` | `911500` | `911600` |
| **1H Axe** | Butcher's Cleaver | `911700` | `911800` | `911900` |
| **2H Axe** | Ravager | `912000` | `912100` | `912200` |
| **1H Mace** | The Hand of Antu'sul | `912300` | `912400` | `912500` |
| **2H Mace** | Mograine's Might | `912600` | `912700` | `912800` |
| **Dagger** | Black Menace | `912900` | `913000` | `913100` |
| **Fist Weapon** | Thekal's Grasp | `913200` | `913300` | `913400` |
| **Polearm** | Grimlok's Charge | `913500` | `913600` | `913700` |
| **Bow** | Gryphonwing Long Bow | `913800` | `913900` | `914000` |
| **Gun** | Precisely Calibrated Boomstick | `914100` | `914200` | `914300` |
| **Crossbow** | Blackcrow | `914400` | `914500` | `914600` |
| **Wand** | Bonecreeper Stylus | `914700` | `914800` | `914900` |
| **Thrown** | Deadly Throwing Axe | `915000` | `915100` | `915200` |
| **Staff** | Illusionary Rod | `915300` | `915400` | `915500` |
| **Caster Off-Hand** | Orb of Lorica | `915600` | `915700` | `915800` |
| **Shield** | Aegis of the Scarlet Commander | `915900` | `916000` | `916100` |

---

## 5. Capital City Vendor Directory

All heirlooms are sold exclusively by dedicated capital city NPCs in Stormwind and Orgrimmar Banks:

| Location | Vendor Title | NPC Name | Entry | GUID | Faction | Exact Coordinates |
| :--- | :--- | :--- | :---: | :---: | :---: | :--- |
| **Stormwind Bank** (Alliance) | Curator of Antiquities (Armor) | `Kaelen Dawnbrow` | `2000201` | `3000201` | `12` | `X: -8925.25, Y: 632.63, Z: 99.52, O: 5.30` |
| **Stormwind Bank** (Alliance) | Master of Weapons (Weapons) | `Branden Stormforged` | `2000221` | `3000221` | `12` | `X: -8924.00, Y: 634.20, Z: 99.52, O: 5.29` |
| **Orgrimmar Bank** (Horde) | Curator of Antiquities (Armor) | `Krag'jin` | `2000204` | `3000204` | `29` | `X: 1627.50, Y: -4370.20, Z: 11.81, O: 0.45` |
| **Orgrimmar Bank** (Horde) | Master of Weapons (Weapons) | `Gorrok Warsong` | `2000224` | `3000224` | `29` | `X: 1629.00, Y: -4368.50, Z: 11.81, O: 0.45` |

### Interaction Flags & Factions
- **`npc_flags = 5`**: Combines `UNIT_NPC_FLAG_GOSSIP` (`1`) and `UNIT_NPC_FLAG_VENDOR` (`4`), ensuring the client immediately opens the vendor store without throwing `"That vendor doesn't like you"`.
- **Factions**:
  - Stormwind curators use faction `12` (`friendly_mask = 2`, friendly to all Alliance races).
  - Orgrimmar curators use faction `29` (`friendly_mask = 4`, friendly to all Horde races).

---

## 6. Vanilla Items vs Heirloom Items (FAQ)

> [!NOTE]
> **Does `0001_custom_heirloom_items.sql` include vanilla items like *Onyxia Blood Talisman* or *Beastmaster's Mantle*?**
>
> **No.** `0001_custom_heirloom_items.sql` contains **exclusively** custom heirloom templates in the designated ID range `900001` through `916160` (9,720 templates).
>
> Vanilla items such as:
> - **Onyxia Blood Talisman** (`18406`, Epic Trinket, Bind on Pickup)
> - **Beastmaster's Mantle** (`22016`, Epic Dungeon Set 2 Shoulders, Bind on Pickup)
>
> are default vanilla game items residing in the core `tw_world.item_template` table. They are **not** present in `0001_custom_heirloom_items.sql`, nor are they modified by `mod-twow-heirloom`.

---

## 7. Client Cache Clearing

If an heirloom appears in inventory or chat as a plain white item, or displays outdated stats from a previous session:
1. Completely close the World of Warcraft client (`WoW.exe`).
2. Navigate to your WoW game client directory.
3. Delete the `WDB` folder (specifically `WDB/itemcache.wdb`).
4. Re-launch the client and log in. The client will fetch the fresh item template data directly from the server, correctly rendering the **Legendary Orange** font, full scaling stats, and lore flavor text.
