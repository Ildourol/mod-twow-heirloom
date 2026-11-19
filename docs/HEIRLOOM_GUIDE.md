# Heirloom collection

| City | Armor vendor | Weapons vendor |
| --- | --- | --- |
| Stormwind Bank | Kaelen Dawnbrow | Branden Stormforged |
| Orgrimmar Bank | Krag'jin | Gorrok Warsong |

The first choices are earned at level **10**. By level **55**, the shipped progression gives each character enough choices for one eight-piece armor set and six weapon seals.

| Character level | New armor choices | New weapon seals | Total armor choices | Total weapon seals |
| --- | ---: | ---: | ---: | ---: |
| 10 | 1 | 2 | 1 | 2 |
| 20 | 2 | 1 | 3 | 3 |
| 30 | 1 | 1 | 4 | 4 |
| 40 | 2 | 1 | 6 | 5 |
| 50 | 1 | 1 | 7 | 6 |
| 55 | 1 | 0 | 8 | 6 |

Check an in-game mailbox after reaching a bracket. The armor curator sends **Armorer's Writs**, and the weaponmaster sends **Weaponmaster's Seals** in a separate letter. Collect each attachment before visiting its shop.

1. Right-click the Heirloom Armorer to shop for armor. The weapons vendor offers arms, shields, and caster off-hands. Bring the matching voucher in your bags.
2. Hover over a piece to see its stats and requirements. At the set's native tier, the stock tooltip shows the original set's bonus text. Right-click an item in the shop to unlock the family. A two-handed weapon costs two seals, and a one-handed weapon, ranged weapon, shield, or caster off-hand costs one. A family already unlocked is free to claim. Purchases keep the shop open and the stock client refreshes the displayed prices the next time the shop opens.
3. Return when you reach the next bracket, or save choices for later. Unused choices carry forward and the curator uses the earliest earned bracket with room. Each character earns their own choices by default. Every new family they unlock becomes available across the account. A low-level alt can claim any shared family they can equip and keep their own choices for adding new pieces.

The curators use your current weapon and armor proficiencies. Plate is visible at all levels and requires plate proficiency to buy or equip. If a character has an unlocked item in the bank, move it from the bank to use it again. If you've destroyed an unlocked item, you can claim a replacement.

Pick a slot where you expect long gaps between upgrades. Guardian heavy armor, shields, and one-handed tank weapons favor Stamina and Defense. Guardian leather and cloaks use Agility and armor. Vindicator armor and melee weapons favor physical attributes and Attack Power. Bows, guns, crossbows, and thrown weapons favor Agility and ranged Attack Power. Arcane gear favors Intellect and spell damage. Blessed gear favors healing, with mana regeneration on selected bracers. Each piece follows a rare-item benchmark for its slot, armor material, or weapon type. Chest pieces carry more stats than smaller slots. A caster staff can carry a larger spell bonus than a wand or off-hand.

## Rings and trinkets

Find the trinkets and rings at the end of the Heirloom Armorer's stock. Right-click to unlock a piece for **one Curator's Token**. The armorer mails one token at each of these default milestones.

| Level | Tokens in the letter | Total accessory choices earned |
| --- | ---: | ---: |
| 10 | 1 | 1 |
| 20 | 1 | 2 |
| 30 | 1 | 3 |
| 40 | 1 | 4 |

Each role has two named rings and two distinct trinkets. You can mix them across roles and wear them with any armor. The equipped pieces contribute their individual stats and effects. Guardian trinkets grant armor or Defense, Blessed trinkets grant healing or mana regeneration, and Vindicator trinkets grant Attack Power or physical critical strike chance. Fixed equip effects use stock tooltip lines, and each ring and trinket has its own flavor text. Ring stats scale using the rare-ring benchmark for the heirloom's tier.

## Armor sets

The armorer lists plate, mail, leather, and cloth in that order. Within each material, Guardian comes first, then Vindicator or Arcane, then Blessed, where available.

A full set consists of the helm, shoulders, chest, bracers, gloves, belt, leggings, and boots. Wearing **2, 4, or 8** matching pieces unlocks cumulative, scaled bonuses until the core awards a stock bonus for that family. Alternate Vindicator cloth appearances count toward Arcane Mystic's Vestments.

| Material | Bulwark | Renewal | Arms or Spellcraft |
| --- | --- | --- | --- |
| Plate | Guardian adds Armor, Defense, and block | Blessed adds Healing, Intellect, and spell crit | Vindicator adds Strength, melee Attack Power, and physical crit |
| Mail | Guardian adds Armor, Stamina, and dodge | Blessed adds Healing, Intellect, and spell crit | Vindicator adds melee and ranged Attack Power and physical crit |
| Leather | Guardian adds Stamina, Agility, and dodge | Blessed adds Healing, Spirit, and spell crit | Vindicator adds Agility, Stamina, and physical crit |
| Cloth | | Blessed adds Healing, Spirit, and spell crit | Arcane adds Spell Damage, Intellect, and spell crit |

The flat bonuses scale with the heirloom tier. Their eight-piece **+1%** crit, dodge, or block effect starts at tier 40. At the listed native tier, eligible pieces can count together with ordinary drops from the same stock set. With automatic scaling disabled, the core counts only pieces carrying the stock set ID. Once the core awards a stock bonus, that set uses stock bonuses. The stock client lists original item entries and can show gray set lines for scaled heirloom variants even when the server has awarded an effect.

| Heirloom set | Stock set | Native tier |
| --- | --- | ---: |
| Guardian Field Plate | Imperial Plate | 47 |
| Blessed Field Plate | Lawbringer Armor | 55 |
| Vindicator Field Plate | Battlegear of Valor | 52 |
| Guardian Banded Mail | Beastmaster Armor | 52 |
| Blessed Banded Mail | The Elements | 52 |
| Vindicator Banded Mail | Beaststalker Armor | 52 |
| Guardian Defias Leathers | Wildheart Raiment | 52 |
| Blessed Defias Leathers | Moonheart Raiment | 52 |
| Vindicator Defias Leathers | Shadowcraft Armor | 52 |
| Arcane Mystic's Vestments | Magister's Regalia | 52 |
| Blessed Mystic's Vestments | Vestments of the Devout | 52 |

Each piece uses one armor unlock. With the default allowance, you can earn the two-piece bonus at level 20, the four-piece bonus at 30, and the eight-piece bonus at 55 if you choose matching pieces. If you want plate, save your armor choices until your character can wear it.

## Set custom allowances

Use `Heirloom.Collection.Armor.Level<level>` for armor and `Heirloom.Collection.WeaponTokens.Level<level>` for weapon seals for levels 10, 20, 30, 40, 50, and 55. Use `Heirloom.Collection.AccessoryTokens.Level<level>` for accessory awards. Collection mail sends one token per choice. Each configured value adds that many choices or weapon seals. For example, set `Heirloom.Collection.Armor.Level10 = 2` to grant two armor choices at the first bracket. `Heirloom.Collection.Mail.Enable = 0` disables voucher letters and lets you spend your earned choices directly at the shop. Previously unlocked items remain available if allowances change. Set `Heirloom.Collection.PerCharacterUnlocks = 0` to make the allowances account-wide again.

## Experience and scaling

Qualifying shoulders and chests each grant 10% bonus XP by default. Each qualifying ring grants another 5% by default, so wearing two adds 10%. The `Heirloom.BonusXP.RingPercent` setting controls the bonus per ring. Item tooltips show the default bonuses. Server configuration determines the actual rate. Curators award gear at the lower of the player's level and the server's scaling cap. With automatic scaling disabled, items retain their current tier after the claim.
