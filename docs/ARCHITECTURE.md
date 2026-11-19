# Heirloom module architecture

## Curators and account state

The curator script sends the Tortoise client's built-in merchant trigger. Build 1.18.1.7979 hides the dialogue and opens its token shop directly. The module serves `TW_Merchant` requests for its own nearby, faction-appropriate curators and calculates each buyer's capped offers and prices independently. The native `npc_vendor` stock stays empty. Purchase requests revalidate the family, proficiency, current allowance, and voucher in the bags before delivery. The module records a new family before consuming its voucher, so a delivery retry can use a free claim. Successful purchases keep the merchant panel open. The stock client refreshes offer prices when the panel opens, and the server validates prices and eligibility on each click.

The character database starts with an empty mod_heirloom_account_collection table. Each family is unique per account. Spending is tracked by earner, equipment pool, and bracket in per-character mode, and by account in shared mode. The unique shared slot prevents concurrent grants from using the same slot. The curator picks the earliest earned bracket with room and validates the cumulative allowance. Bag space and existing equipment, inventory, and bank copies are checked before an unlock or claim. The collection row is written before delivery so an interrupted delivery can be retried as a free claim.

## Curator letters

The level-change, login, and shop-open hooks compare earned, unspent choices with bound vouchers in the player's bags, bank, and unexpired mail. Each voucher shortage generates its own letter and attachment, sent by the corresponding faction curator. The account collection determines how many unspent choices remain when vouchers are replaced or the earning mode changes.

## Weapon tokens

Level 10 grants two Weaponmaster's Seals by default. Two-handed weapon templates consume two seals and two units of the weapon allowance. Other weapon-shop offers consume one. The collection stores the allowance spent by each purchase. Offer previews, purchases, and replacement mail use the same cumulative weapon balance. The other equipment pools retain their own allowances.

## Accessory collection

The armorer combines the armor and accessory pools in the same merchant window. Each new accessory unlock consumes one Curator's Token and one accessory allowance. Mail reconciliation checks this currency independently against unexpired attachments and held tokens. Rings and trinkets use individual stats, equip effects, and flavor text.

## Scaling and balance

The effective template entry is `family + clamp(characterLevel, 1, MaxLevel)`. The same level function drives curator previews, grants, and subsequent scaling. Login, level changes, loot, and periodic inventory checks update existing instances through core item and equipment APIs. Equipped items remove the previous template's modifiers and equip the new one through the core. The item template supplies its stats, armor, damage range, block, and equip aura, and the module sends that template to the client for its tooltip. Scaled items are queued for the core inventory save after their template, flags, and durability are updated. Bonus XP and durability use independent configuration.

Login, level changes, and heirloom loot trigger immediate scaling. A staggered maintenance check detects tier and life state changes. A five-second inventory reconciliation covers mail, trade, and GM grants. Optional durability restoration has its own one-second check and skips intact items. Diagnostic logging is off by default.

The bundled World SQL contains all 60 tiers for 162 families. Combat values use rare item and quest reward benchmarks by slot, material, or weapon type. Shields use separate armor and block curves. Roles allocate stat points and fixed equip effects within those budgets. The balance audit records the sample and example values. The catalog also includes alternative appearances with equivalent stats for several Arcane families.

## Armor catalog and equipment effects

`HeirloomArmorCatalog.inc` groups matching armor appearances for vendor ordering. All equip effects come from the individual item templates. The core applies the stock passive spell ranks and removes them when the item is unequipped or breaks. The clean-install rows use an empty native set ID at every tier.

Repairable item templates have maximum durability based on ordinary gear of the same type. The core handles damage, death penalties and repair. Tier changes preserve remaining durability in proportion to the old maximum. The optional module maintenance pass periodically restores equipped heirlooms when `Heirloom.Durability.Exempt` is enabled.

## Installation

The core updater can import the prebuilt World and Characters SQL before loading items and scripts. The module checks the actual World data and Characters table on startup. If enabled, its fallback imports missing data and logs when a restart is needed to load the world templates.

## Live verification

Test with two characters of different levels opening the same curator concurrently. Check full bags, duplicate claims across bank storage, persistence across a restart, and an eligible alt claim from the other faction's capital. Change `MaxLevel` below a character's level and compare equipped damage and armor, fixed equip effects, and the item tooltip before and after the same cap is used for a new claim. Verify the wand performs Arcane damage and compare both a shield and a two-handed weapon to the generated template values.
