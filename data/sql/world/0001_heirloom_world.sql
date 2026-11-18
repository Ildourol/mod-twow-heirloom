-- --------------------------------------------------------------------------------
-- mod-twow-heirloom Database Migration Baseline
-- Turtle WoW Custom vMaNGOS (1.18.1 / 1.12.1)
-- --------------------------------------------------------------------------------

-- In Turtle WoW vMaNGOS, account-bound items utilize Bonding = 6 (BIND_ACCOUNT).
-- Items configured with Bonding = 6 automatically receive the ITEM_DYNFLAG_BOA
-- runtime flag within the core engine and are recognized by mod-twow-heirloom.

-- NOTICE (FINDING-09):
-- To prevent corrupting standard quest items or world drops, this module baseline
-- does NOT mutate existing standard database items by name.
-- Server operators may define custom heirloom item prototypes or configure explicit
-- item IDs via Heirloom.ItemIds in mod-twow-heirloom.conf.

-- Example template for server operators authoring custom heirloom items:
-- INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `display_id`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `max_durability`, `bonding`)
-- VALUES (999901, 4, 1, 'Custom Heirloom Shoulders', 12345, 7, 0, 1, 0, 0, 3, -1, -1, 1, 1, 0, 6);
