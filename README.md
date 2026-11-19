# mod-twow-heirloom

A standalone heirloom collection for the Tortoise WoW `1181dev` core and Turtle WoW client 1.18.1.7979.

## How to earn heirlooms

Visit the Curator of Antiquities or Master of Weapons near **Stormwind Bank** or **Orgrimmar Bank**. Right-click the curator to open Tortoise's token merchant window. A new armor family costs one **Armorer's Writ**. Two-handed weapons cost two **Weaponmaster's Seals**. Other weapon-shop offers cost one seal. Families already in your collection appear with no voucher cost. The armor curator offers eight-piece sets in plate, mail, leather, and cloth. The weapons curator offers melee and ranged weapons, caster gear, and a shield.

**Each character earns their own choices by default.** With the shipped progression, each character earns eight armor choices and six weapon seals by level 55. Armor and weapon allowances are independent. Every family unlocked joins the account collection.

| Character level | New armor choices | New weapon seals | Total armor choices | Total weapon seals |
| --- | ---: | ---: | ---: | ---: |
| 10 | 1 | 2 | 1 | 2 |
| 20 | 2 | 1 | 3 | 3 |
| 30 | 1 | 1 | 4 | 4 |
| 40 | 2 | 1 | 6 | 5 |
| 50 | 1 | 1 | 7 | 6 |
| 55 | 1 | 0 | 8 | 6 |

Characters receive bound vouchers as in-game mail attachments when they reach a bracket that grants new choices. The armor curator sends Armorer's Writs, and the weaponmaster sends Weaponmaster's Seals in a separate letter. Returning characters receive vouchers for any earned choices they have yet to spend. The module checks the mailbox, bags, and bank before issuing replacements.

Unused choices carry forward. If two characters each unlock eight different armor families, a third character can browse all sixteen and claim any they can equip. Claims spend none of the third character's own choices. Each character can hold one copy of each family across equipment, bags, and bank storage. Claims and owned gear scale up to `Heirloom.Scaling.MaxLevel` (default 60).

## Rings and trinkets

The Heirloom Armorer also stocks six rings and six trinkets. Guardian, Blessed, and Vindicator each have two of each type. Every piece has its own flavor text and individual stats or equip effect. Ring stats follow the server's rare-ring budget at the heirloom's tier. Accessories work with any armor type.

Characters receive **one Curator's Token** at each of levels **10, 20, 30, and 40** by default. Each new accessory costs one token, so four choices are available by level 40, enough for two rings and two trinkets. The armorer sends accessory tokens in their own letter. Accessories join the same account collection with their own allowance, and unlocked pieces are free for eligible alts to claim.

## Armor and weapon equip effects

The armor curator offers eleven matching eight-piece collections across plate, mail, leather, and cloth. Each piece works on its own. Armor and weapons gain a secondary equip stat as their item tier and slot budget grow. Guardian gear favors Stamina, Blessed gear favors Spirit, Arcane gear favors Intellect, and physical gear favors Strength or Agility. Existing role effects such as Defense, healing, spell power, and Attack Power still scale with the item.

Repairable armor, shields, and weapons display durability and take ordinary durability loss, including on applicable deaths. The optional automatic repair setting is off by default.

Spending all eight default armor choices on the same set completes it by level 55. Plate appears in the shop at all levels. Redeeming and equipping it require plate proficiency.

## Fresh installation

Place the module under the Tortoise core's modules directory and install its configuration template. On startup, the core SQL updater can import the module data before loading the world. If the updater skips this module, the default module configuration imports the files automatically.

| Database | Install file |
| --- | --- |
| World | [heirloom_world.sql](data/sql/world/heirloom_world.sql) |
| Characters | [heirloom_characters.sql](data/sql/character/heirloom_characters.sql) |

The World SQL contains all 9,720 heirloom templates, with 60 levels for each of 162 families. The Characters SQL creates an empty collection table on a fresh install. Re-importing preserves existing collection data.

With `Heirloom.Database.AutoImport = 1`, the module installs missing data from the bundled SQL. When the fallback installs World data, it logs that one restart is needed to load the items and curators. `Heirloom.Database.SqlPath` points to the World SQL directory. The Characters SQL belongs in the sibling character directory.

The shops use the built-in `TW_Merchant` interface in client 1.18.1.7979 and the server's addon-message channel.

## Configuration

`Heirloom.Collection.PerCharacterUnlocks` defaults to 1 and gives each character their own allowance. Set it to 0 for one allowance across the account. Unlocked families join the account collection in either mode.

`Heirloom.Collection.Enable` defaults to 1. Set it to 0 to close the collection shops and suspend new unlocks and alt claims. `Heirloom.Collection.Mail.Enable = 0` lets characters spend earned choices at the shops without voucher letters.

Use `Heirloom.Collection.Armor.Level<level>` for armor, `Heirloom.Collection.WeaponTokens.Level<level>` for weapon seals, and `Heirloom.Collection.AccessoryTokens.Level<level>` for rings and trinkets. The brackets are 10, 20, 30, 40, 50, and 55. Each setting adds the specified choices or seals. Use 0 to skip an award.

Heirloom combat stats are benchmarked against rare leveling gear at every tier. The [balance audit](docs/BALANCE_AUDIT.md) explains the comparisons, how sparse levels are handled, and the resulting stat changes.

Review [the configuration template](conf/mod-twow-heirloom.conf.dist) for scaling, bonus XP, durability, and import settings.

[Player guide](docs/HEIRLOOM_GUIDE.md) · [Technical notes](docs/ARCHITECTURE.md)
