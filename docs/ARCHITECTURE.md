# Heirloom module architecture

## Curators and account state

The curator script sends the Tortoise client's built-in merchant trigger. Build 1.18.1.7979 hides the dialogue and opens its token shop directly. The module serves `TW_Merchant` requests for its own nearby, faction-appropriate curators and calculates each buyer's capped offers and prices independently. The native `npc_vendor` stock stays empty. Purchase requests revalidate the family, proficiency, current allowance, and voucher in the bags before delivery. The module records a new family before consuming its voucher, so a delivery retry can use a free claim.

The character database starts with an empty mod_heirloom_account_collection table. Each family is unique per account. Spending is tracked by earner, equipment pool, and bracket in per-character mode, and by account in shared mode. The unique shared slot prevents concurrent grants from using the same slot. The curator picks the earliest earned bracket with room and validates the cumulative allowance. Bag space and existing equipment, inventory, and bank copies are checked before an unlock or claim. The collection row is written before delivery so an interrupted delivery can be retried as a free claim.

## Curator letters

The level-change, login, and shop-open hooks compare earned, unspent choices with bound vouchers in the player's bags, bank, and unexpired mail. Each voucher shortage generates its own letter and attachment, sent by the corresponding faction curator. The account collection determines how many unspent choices remain when vouchers are replaced or the earning mode changes.

## Weapon tokens

Level 10 grants two Weaponmaster's Seals by default. Two-handed weapon templates consume two seals and two units of the weapon allowance. Other weapon-shop offers consume one. The collection stores the allowance spent by each purchase. Offer previews, purchases, and replacement mail use the same cumulative weapon balance. The other equipment pools retain their own allowances.

## Accessory collection

The armorer combines the armor and accessory pools in the same merchant window. Each new accessory unlock consumes one Curator's Token and one accessory allowance. Mail reconciliation checks this currency independently against unexpired attachments and held tokens. Rings and trinkets use individual stats, equip effects, and flavor text.

## Scaling and balance

The effective template entry is `family + clamp(characterLevel, 1, MaxLevel)`. The same level function drives curator previews, grants, and subsequent scaling. Login, level changes, loot, and periodic inventory checks update existing instances through core item and equipment APIs. Equipped items remove the previous template's modifiers and equip the new one through the core. The item template supplies its stats, armor, damage range, block, and equip aura, and the module sends that template to the client for its tooltip. Bonus XP and durability use their existing independent configuration.

The bundled World SQL contains all 60 tiers for 162 families. Combat values use rare item and quest reward benchmarks by slot, material, or weapon type. Shields use separate armor and block curves. Roles allocate stat points and fixed equip effects within those budgets. The balance audit records the sample and example values. The catalog also includes alternative appearances with equivalent stats for several Arcane families.

## Armor set bonuses

Each armor set uses one module-owned passive aura with up to three native effects. The player hook counts the eight matching equipment slots and recomputes the cumulative amounts when a 2-, 4-, or 8-piece threshold is reached. Flat effects scale by template tier. Percentage effects use whole percentage points and activate at the tier declared in the set data. It refreshes the aura through the core and removes it as soon as the worn pieces cease to qualify on the next player update. Set membership uses the item family, so changing level templates preserves it. Passive auras are recomputed on login and are not saved to characters.

`src/HeirloomArmorSets.inc` supplies the curator catalog, aura IDs, and effect progression. The World SQL includes the passive spells for low tiers and the stock armor models and set IDs for higher tiers. The core applies stock set effects and the client reads the matching ItemSet.dbc records. The module yields to the core for an equipped family with a native set ID.

## Installation

The core updater can import the prebuilt World and Characters SQL before loading items and scripts. The module checks the actual World data and Characters table on startup. If enabled, its fallback imports missing data and logs when a restart is needed to load the world templates. The SQL archive mirrors the two standalone install files.

## Live verification

Test with two characters of different levels opening the same curator concurrently. Check full bags, duplicate claims across bank storage, persistence across a restart, and an eligible alt claim from the other faction's capital. Change `MaxLevel` below a character's level and compare equipped damage and armor, fixed equip effects, and the item tooltip before and after the same cap is used for a new claim. Verify the wand performs Arcane damage and compare both a shield and a two-handed weapon to the generated template values.
