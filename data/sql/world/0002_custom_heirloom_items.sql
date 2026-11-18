-- ============================================================================
-- mod-twow-heirloom: Complete 156-Item Heirloom Armory (Tank, Healer, DPS)
-- Quality = 5 (Legendary Orange), Bonding = 6 (Bind to Account), MaxDurability = 0
-- ============================================================================

DELETE FROM `item_template` WHERE `entry` BETWEEN 990001 AND 990015;
DELETE FROM `item_template` WHERE `entry` BETWEEN 990101 AND 990160;
DELETE FROM `item_template` WHERE `entry` BETWEEN 991000 AND 992999;

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991111, 4, 4, 'Polished Helm of Valor (Tank)', 25839, 5, 0, 1, 0, 0,
  1, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 20, 4, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 517, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991112, 4, 4, 'Polished Spaulders of Valor (Tank)', 27361, 5, 0, 1, 0, 0,
  3, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 18, 4, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 459, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991113, 4, 4, 'Polished Breastplate of Valor (Tank)', 27356, 5, 0, 1, 0, 0,
  5, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 26, 4, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 786, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991114, 4, 4, 'Polished Vambraces of Valor (Tank)', 27362, 5, 0, 1, 0, 0,
  9, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 12, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 287, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991115, 4, 4, 'Polished Gauntlets of Valor (Tank)', 27358, 5, 0, 1, 0, 0,
  10, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 402, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991116, 4, 4, 'Polished Girdle of Valor (Tank)', 27359, 5, 0, 1, 0, 0,
  6, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 14, 4, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 345, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991117, 4, 4, 'Polished Leggings of Valor (Tank)', 27360, 5, 0, 1, 0, 0,
  7, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 24, 4, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 632, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991118, 4, 4, 'Polished Boots of Valor (Tank)', 27357, 5, 0, 1, 0, 0,
  8, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 436, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991121, 4, 4, 'Polished Helm of Valor (Healer)', 25839, 5, 0, 1, 0, 0,
  1, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 20, 6, 15, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 450, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991122, 4, 4, 'Polished Spaulders of Valor (Healer)', 27361, 5, 0, 1, 0, 0,
  3, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 18, 6, 13, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 400, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991123, 4, 4, 'Polished Breastplate of Valor (Healer)', 27356, 5, 0, 1, 0, 0,
  5, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 26, 6, 19, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 684, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991124, 4, 4, 'Polished Vambraces of Valor (Healer)', 27362, 5, 0, 1, 0, 0,
  9, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 12, 6, 9, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 250, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991125, 4, 4, 'Polished Gauntlets of Valor (Healer)', 27358, 5, 0, 1, 0, 0,
  10, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 11, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 350, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991126, 4, 4, 'Polished Girdle of Valor (Healer)', 27359, 5, 0, 1, 0, 0,
  6, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 14, 6, 10, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 300, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991127, 4, 4, 'Polished Leggings of Valor (Healer)', 27360, 5, 0, 1, 0, 0,
  7, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 24, 6, 18, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 550, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991128, 4, 4, 'Polished Boots of Valor (Healer)', 27357, 5, 0, 1, 0, 0,
  8, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 11, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 380, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991131, 4, 4, 'Polished Helm of Valor (DPS)', 25839, 5, 0, 1, 0, 0,
  1, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 20, 3, 12, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 450, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991132, 4, 4, 'Polished Spaulders of Valor (DPS)', 27361, 5, 0, 1, 0, 0,
  3, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 18, 3, 10, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 400, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991133, 4, 4, 'Polished Breastplate of Valor (DPS)', 27356, 5, 0, 1, 0, 0,
  5, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 26, 3, 15, 7, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 684, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991134, 4, 4, 'Polished Vambraces of Valor (DPS)', 27362, 5, 0, 1, 0, 0,
  9, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 12, 3, 7, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 250, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991135, 4, 4, 'Polished Gauntlets of Valor (DPS)', 27358, 5, 0, 1, 0, 0,
  10, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 9, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 350, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991136, 4, 4, 'Polished Girdle of Valor (DPS)', 27359, 5, 0, 1, 0, 0,
  6, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 14, 3, 8, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 300, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991137, 4, 4, 'Polished Leggings of Valor (DPS)', 27360, 5, 0, 1, 0, 0,
  7, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 24, 3, 14, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 550, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991138, 4, 4, 'Polished Boots of Valor (DPS)', 27357, 5, 0, 1, 0, 0,
  8, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 9, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 380, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991211, 4, 3, 'Champion\'s Banded Helm of the Vanguard', 27774, 5, 0, 1, 0, 0,
  1, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 20, 4, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 260, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991212, 4, 3, 'Champion Herod\'s Shoulder of the Vanguard', 27776, 5, 0, 1, 0, 0,
  3, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 18, 4, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 230, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991213, 4, 3, 'Champion\'s Deathdealer Breastplate of the Vanguard', 27769, 5, 0, 1, 0, 0,
  5, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 26, 4, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 390, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991214, 4, 3, 'Champion\'s Banded Bracers of the Vanguard', 27783, 5, 0, 1, 0, 0,
  9, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 12, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 140, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991215, 4, 3, 'Champion\'s Banded Gauntlets of the Vanguard', 27778, 5, 0, 1, 0, 0,
  10, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 200, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991216, 4, 3, 'Champion\'s Banded Girdle of the Vanguard', 27777, 5, 0, 1, 0, 0,
  6, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 14, 4, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 170, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991217, 4, 3, 'Champion\'s Banded Leggings of the Vanguard', 27770, 5, 0, 1, 0, 0,
  7, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 24, 4, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 310, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991218, 4, 3, 'Champion\'s Banded Boots of the Vanguard', 27771, 5, 0, 1, 0, 0,
  8, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 220, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991221, 4, 3, 'Champion\'s Banded Helm of Grace', 27774, 5, 0, 1, 0, 0,
  1, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 20, 6, 15, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 260, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991222, 4, 3, 'Champion Herod\'s Shoulder of Grace', 27776, 5, 0, 1, 0, 0,
  3, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 18, 6, 13, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 230, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991223, 4, 3, 'Champion\'s Deathdealer Breastplate of Grace', 27769, 5, 0, 1, 0, 0,
  5, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 26, 6, 19, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 390, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991224, 4, 3, 'Champion\'s Banded Bracers of Grace', 27783, 5, 0, 1, 0, 0,
  9, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 12, 6, 9, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 140, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991225, 4, 3, 'Champion\'s Banded Gauntlets of Grace', 27778, 5, 0, 1, 0, 0,
  10, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 11, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 200, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991226, 4, 3, 'Champion\'s Banded Girdle of Grace', 27777, 5, 0, 1, 0, 0,
  6, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 14, 6, 10, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 170, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991227, 4, 3, 'Champion\'s Banded Leggings of Grace', 27770, 5, 0, 1, 0, 0,
  7, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 24, 6, 18, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 310, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991228, 4, 3, 'Champion\'s Banded Boots of Grace', 27771, 5, 0, 1, 0, 0,
  8, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 11, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 220, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991231, 4, 3, 'Champion\'s Banded Helm of Slaughter', 27774, 5, 0, 1, 0, 0,
  1, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 20, 3, 12, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 260, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991232, 4, 3, 'Champion Herod\'s Shoulder of Slaughter', 27776, 5, 0, 1, 0, 0,
  3, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 18, 3, 10, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 230, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991233, 4, 3, 'Champion\'s Deathdealer Breastplate of Slaughter', 27769, 5, 0, 1, 0, 0,
  5, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 26, 3, 15, 7, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 390, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991234, 4, 3, 'Champion\'s Banded Bracers of Slaughter', 27783, 5, 0, 1, 0, 0,
  9, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 12, 3, 7, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 140, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991235, 4, 3, 'Champion\'s Banded Gauntlets of Slaughter', 27778, 5, 0, 1, 0, 0,
  10, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 9, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 200, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991236, 4, 3, 'Champion\'s Banded Girdle of Slaughter', 27777, 5, 0, 1, 0, 0,
  6, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 14, 3, 8, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 170, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991237, 4, 3, 'Champion\'s Banded Leggings of Slaughter', 27770, 5, 0, 1, 0, 0,
  7, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 24, 3, 14, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 310, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991238, 4, 3, 'Champion\'s Banded Boots of Slaughter', 27771, 5, 0, 1, 0, 0,
  8, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 9, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 220, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991311, 4, 2, 'Blood-Dyed Defias Mask of the Vanguard', 15308, 5, 0, 1, 0, 0,
  1, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 20, 3, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 120, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991312, 4, 2, 'Stained Bandit Shoulders of the Vanguard', 17195, 5, 0, 1, 0, 0,
  3, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 18, 3, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 100, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991313, 4, 2, 'Blackened Defias Armor of the Vanguard', 9123, 5, 0, 1, 0, 0,
  5, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 26, 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 172, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991314, 4, 2, 'Stained Bandit Bracers of the Vanguard', 28427, 5, 0, 1, 0, 0,
  9, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 12, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 70, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991315, 4, 2, 'Blackened Defias Gloves of the Vanguard', 27946, 5, 0, 1, 0, 0,
  10, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 3, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 90, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991316, 4, 2, 'Blackened Defias Belt of the Vanguard', 14389, 5, 0, 1, 0, 0,
  6, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 14, 3, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 80, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991317, 4, 2, 'Blackened Defias Leggings of the Vanguard', 27947, 5, 0, 1, 0, 0,
  7, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 24, 3, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 140, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991318, 4, 2, 'Blackened Defias Boots of the Vanguard', 21903, 5, 0, 1, 0, 0,
  8, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 3, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 100, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991321, 4, 2, 'Blood-Dyed Defias Mask of Grace', 15308, 5, 0, 1, 0, 0,
  1, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 20, 6, 15, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 120, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991322, 4, 2, 'Stained Bandit Shoulders of Grace', 17195, 5, 0, 1, 0, 0,
  3, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 18, 6, 13, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 100, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991323, 4, 2, 'Blackened Defias Armor of Grace', 9123, 5, 0, 1, 0, 0,
  5, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 26, 6, 19, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 172, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991324, 4, 2, 'Stained Bandit Bracers of Grace', 28427, 5, 0, 1, 0, 0,
  9, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 12, 6, 9, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 70, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991325, 4, 2, 'Blackened Defias Gloves of Grace', 27946, 5, 0, 1, 0, 0,
  10, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 11, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 90, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991326, 4, 2, 'Blackened Defias Belt of Grace', 14389, 5, 0, 1, 0, 0,
  6, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 14, 6, 10, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 80, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991327, 4, 2, 'Blackened Defias Leggings of Grace', 27947, 5, 0, 1, 0, 0,
  7, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 24, 6, 18, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 140, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991328, 4, 2, 'Blackened Defias Boots of Grace', 21903, 5, 0, 1, 0, 0,
  8, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 11, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 100, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991331, 4, 2, 'Blood-Dyed Defias Mask of Slaughter', 15308, 5, 0, 1, 0, 0,
  1, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 3, 20, 4, 12, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 120, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991332, 4, 2, 'Stained Bandit Shoulders of Slaughter', 17195, 5, 0, 1, 0, 0,
  3, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 3, 18, 4, 10, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 100, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991333, 4, 2, 'Blackened Defias Armor of Slaughter', 9123, 5, 0, 1, 0, 0,
  5, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 3, 26, 4, 15, 7, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 172, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991334, 4, 2, 'Stained Bandit Bracers of Slaughter', 28427, 5, 0, 1, 0, 0,
  9, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 3, 12, 4, 7, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 70, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991335, 4, 2, 'Blackened Defias Gloves of Slaughter', 27946, 5, 0, 1, 0, 0,
  10, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 3, 15, 4, 9, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 90, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991336, 4, 2, 'Blackened Defias Belt of Slaughter', 14389, 5, 0, 1, 0, 0,
  6, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 3, 14, 4, 8, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 80, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991337, 4, 2, 'Blackened Defias Leggings of Slaughter', 27947, 5, 0, 1, 0, 0,
  7, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 3, 24, 4, 14, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 140, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991338, 4, 2, 'Blackened Defias Boots of Slaughter', 21903, 5, 0, 1, 0, 0,
  8, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 3, 15, 4, 9, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 100, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991411, 4, 1, 'Whisperwind Shadow Hood of the Vanguard', 15319, 5, 0, 1, 0, 0,
  1, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 20, 5, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 60, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991412, 4, 1, 'Mystic\'s Shoulder Pads of the Vanguard', 25887, 5, 0, 1, 0, 0,
  3, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 18, 5, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 50, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991413, 4, 1, 'Mystic\'s Robe of the Vanguard', 25889, 5, 0, 1, 0, 0,
  20, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 26, 5, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 92, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991414, 4, 1, 'Mystic\'s Bracelets of the Vanguard', 16805, 5, 0, 1, 0, 0,
  9, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 12, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 35, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991415, 4, 1, 'Mystic\'s Gloves of the Vanguard', 25885, 5, 0, 1, 0, 0,
  10, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 45, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991416, 4, 1, 'Mystic\'s Belt of the Vanguard', 25881, 5, 0, 1, 0, 0,
  6, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 14, 5, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 40, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991417, 4, 1, 'Mystic\'s Woolies of the Vanguard', 10079, 5, 0, 1, 0, 0,
  7, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 24, 5, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 70, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991418, 4, 1, 'Mystic\'s Slippers of the Vanguard', 16802, 5, 0, 1, 0, 0,
  8, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 50, 0, 6, 'Tempered to withstand crushing blows on the front line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991421, 4, 1, 'Whisperwind Shadow Hood of Grace', 15319, 5, 0, 1, 0, 0,
  1, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 20, 6, 15, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 60, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991422, 4, 1, 'Mystic\'s Shoulder Pads of Grace', 25887, 5, 0, 1, 0, 0,
  3, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 18, 6, 13, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 50, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991423, 4, 1, 'Mystic\'s Robe of Grace', 25889, 5, 0, 1, 0, 0,
  20, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 26, 6, 19, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 92, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991424, 4, 1, 'Mystic\'s Bracelets of Grace', 16805, 5, 0, 1, 0, 0,
  9, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 12, 6, 9, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 35, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991425, 4, 1, 'Mystic\'s Gloves of Grace', 25885, 5, 0, 1, 0, 0,
  10, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 11, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 45, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991426, 4, 1, 'Mystic\'s Belt of Grace', 25881, 5, 0, 1, 0, 0,
  6, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 14, 6, 10, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 40, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991427, 4, 1, 'Mystic\'s Woolies of Grace', 10079, 5, 0, 1, 0, 0,
  7, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 24, 6, 18, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 70, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991428, 4, 1, 'Mystic\'s Slippers of Grace', 16802, 5, 0, 1, 0, 0,
  8, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 11, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 50, 0, 6, 'Resonating softly with the calming radiance of restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991431, 4, 1, 'Whisperwind Shadow Hood of Slaughter', 15319, 5, 0, 1, 0, 0,
  1, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 20, 7, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 60, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991432, 4, 1, 'Mystic\'s Shoulder Pads of Slaughter', 25887, 5, 0, 1, 0, 0,
  3, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 18, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 50, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991433, 4, 1, 'Mystic\'s Robe of Slaughter', 25889, 5, 0, 1, 0, 0,
  20, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 26, 7, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 92, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991434, 4, 1, 'Mystic\'s Bracelets of Slaughter', 16805, 5, 0, 1, 0, 0,
  9, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 12, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 35, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991435, 4, 1, 'Mystic\'s Gloves of Slaughter', 25885, 5, 0, 1, 0, 0,
  10, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 45, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991436, 4, 1, 'Mystic\'s Belt of Slaughter', 25881, 5, 0, 1, 0, 0,
  6, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 14, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 40, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991437, 4, 1, 'Mystic\'s Woolies of Slaughter', 10079, 5, 0, 1, 0, 0,
  7, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 24, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 70, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991438, 4, 1, 'Mystic\'s Slippers of Slaughter', 16802, 5, 0, 1, 0, 0,
  8, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 50, 0, 6, 'Honed to direct devastating strikes into enemy lines.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991501, 4, 1, 'Banded Cloak of Fortification', 27779, 5, 0, 1, 0, 0,
  16, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 14, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 50, 0, 6, 'A thick mantle woven to deflect arrows and glancing blows.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991502, 4, 1, 'Banded Cloak of Restoration', 27779, 5, 0, 1, 0, 0,
  16, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 14, 6, 10, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 40, 0, 6, 'Silken threads infused with ancient protective prayers.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991503, 4, 1, 'Banded Cloak of Carnage', 27779, 5, 0, 1, 0, 0,
  16, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 3, 14, 4, 8, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 40, 0, 6, 'Lightweight cloth that flutters with the motion of lethal strikes.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991601, 4, 0, 'Dread Pirate Band of Fortitude', 31908, 5, 0, 1, 0, 0,
  11, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Plundered from treacherous seas, cold and heavy upon the finger.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991602, 4, 0, 'Dread Pirate Ring of Mending', 31908, 5, 0, 1, 0, 0,
  11, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'An enchanted signet radiating calming oceanic vitality.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991603, 4, 0, 'Dread Pirate Signet of Striking', 31908, 5, 0, 1, 0, 0,
  11, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 3, 12, 4, 12, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Forged from sea-gold to lend weight to every sword stroke.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991611, 4, 0, 'Swift Hand of Fortitude', 24776, 5, 0, 1, 0, 0,
  12, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 20, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'An unyielding medallion steadying the resolve of the frontline guardian.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991612, 4, 0, 'Discerning Eye of the Beast', 30764, 5, 0, 1, 0, 0,
  12, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'A polished stone lens said to pierce the deepest veils of mystery.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991613, 4, 0, 'Swift Hand of Justice', 24776, 5, 0, 1, 0, 0,
  12, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'A talisman weighted perfectly to guide the strike of righteousness.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992011, 2, 7, 'Cruel Barb of the Vanguard', 7311, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  40, 75, 0, 2600, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992012, 2, 7, 'Cruel Barb of Grace', 7311, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  34, 63, 0, 2600, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992013, 2, 7, 'Cruel Barb of Slaughter', 7311, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  40, 75, 0, 2600, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992021, 2, 8, 'Whirlwind Sword of the Vanguard', 22731, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 28, 4, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  105, 158, 0, 3600, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992022, 2, 8, 'Whirlwind Sword of Grace', 22731, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 28, 6, 20, 7, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  89, 134, 0, 3600, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992023, 2, 8, 'Whirlwind Sword of Slaughter', 22731, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 28, 3, 18, 7, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  105, 158, 0, 3600, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992031, 2, 0, 'Butcher\'s Cleaver of the Vanguard', 8466, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  38, 72, 0, 2500, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992032, 2, 0, 'Butcher\'s Cleaver of Grace', 8466, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  32, 61, 0, 2500, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992033, 2, 0, 'Butcher\'s Cleaver of Slaughter', 8466, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  38, 72, 0, 2500, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992041, 2, 1, 'Whirlwind Axe of the Vanguard', 22734, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 28, 4, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  115, 173, 0, 3800, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992042, 2, 1, 'Whirlwind Axe of Grace', 22734, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 28, 6, 20, 7, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  97, 147, 0, 3800, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992043, 2, 1, 'Whirlwind Axe of Slaughter', 22734, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 28, 3, 18, 7, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  115, 173, 0, 3800, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992051, 2, 4, 'The Hand of Antu\'sul of the Vanguard', 18572, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  42, 79, 0, 2700, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992052, 2, 4, 'The Hand of Antu\'sul of Grace', 18572, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  35, 67, 0, 2700, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992053, 2, 4, 'The Hand of Antu\'sul of Slaughter', 18572, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  42, 79, 0, 2700, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992061, 2, 5, 'Mograine\'s Might of the Vanguard', 21252, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 28, 4, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  110, 165, 0, 3700, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992062, 2, 5, 'Mograine\'s Might of Grace', 21252, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 28, 6, 20, 7, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  93, 140, 0, 3700, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992063, 2, 5, 'Mograine\'s Might of Slaughter', 21252, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 28, 3, 18, 7, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  110, 165, 0, 3700, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992071, 2, 15, 'Black Menace of the Vanguard', 20292, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  25, 48, 0, 1700, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992072, 2, 15, 'Black Menace of Grace', 20292, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  21, 40, 0, 1700, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992073, 2, 15, 'Black Menace of Slaughter', 20292, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  25, 48, 0, 1700, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992081, 2, 13, 'Thekal\'s Grasp of the Vanguard', 32776, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  36, 68, 0, 2400, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992082, 2, 13, 'Thekal\'s Grasp of Grace', 32776, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  30, 57, 0, 2400, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992083, 2, 13, 'Thekal\'s Grasp of Slaughter', 32776, 5, 0, 1, 0, 0,
  13, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  36, 68, 0, 2400, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992091, 2, 6, 'Grimlok\'s Charge of the Vanguard', 22233, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 28, 4, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  100, 150, 0, 3500, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992092, 2, 6, 'Grimlok\'s Charge of Grace', 22233, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 28, 6, 20, 7, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  85, 127, 0, 3500, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992093, 2, 6, 'Grimlok\'s Charge of Slaughter', 22233, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 28, 3, 18, 7, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  100, 150, 0, 3500, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992101, 2, 10, 'Illusionary Rod of the Vanguard', 15806, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 28, 4, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  85, 130, 0, 3200, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992102, 2, 10, 'Illusionary Rod of Grace', 15806, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 28, 6, 20, 7, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  72, 110, 0, 3200, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992103, 2, 10, 'Illusionary Rod of Slaughter', 15806, 5, 0, 1, 0, 0,
  17, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 28, 3, 18, 7, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  85, 130, 0, 3200, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992111, 2, 2, 'Gryphonwing Long Bow of the Vanguard', 28766, 5, 0, 1, 0, 0,
  15, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  45, 85, 0, 2800, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992112, 2, 2, 'Gryphonwing Long Bow of Grace', 28766, 5, 0, 1, 0, 0,
  15, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  38, 72, 0, 2800, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992113, 2, 2, 'Gryphonwing Long Bow of Slaughter', 28766, 5, 0, 1, 0, 0,
  15, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  45, 85, 0, 2800, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992121, 2, 3, 'Precisely Calibrated Boomstick of the Vanguard', 8258, 5, 0, 1, 0, 0,
  26, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  48, 89, 0, 2900, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992122, 2, 3, 'Precisely Calibrated Boomstick of Grace', 8258, 5, 0, 1, 0, 0,
  26, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  40, 75, 0, 2900, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992123, 2, 3, 'Precisely Calibrated Boomstick of Slaughter', 8258, 5, 0, 1, 0, 0,
  26, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  48, 89, 0, 2900, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992131, 2, 18, 'Blackcrow of the Vanguard', 22929, 5, 0, 1, 0, 0,
  26, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  52, 97, 0, 3100, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992132, 2, 18, 'Blackcrow of Grace', 22929, 5, 0, 1, 0, 0,
  26, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  44, 82, 0, 3100, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992133, 2, 18, 'Blackcrow of Slaughter', 22929, 5, 0, 1, 0, 0,
  26, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  52, 97, 0, 3100, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992141, 2, 19, 'Bonecreeper Stylus of the Vanguard', 24743, 5, 0, 1, 0, 0,
  26, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  30, 56, 0, 1800, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992142, 2, 19, 'Bonecreeper Stylus of Grace', 24743, 5, 0, 1, 0, 0,
  26, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  25, 47, 0, 1800, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992143, 2, 19, 'Bonecreeper Stylus of Slaughter', 24743, 5, 0, 1, 0, 0,
  26, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  30, 56, 0, 1800, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992151, 2, 16, 'Deadly Throwing Axe of the Vanguard', 20783, 5, 0, 1, 0, 0,
  25, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 15, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  32, 60, 0, 2000, 0, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992152, 2, 16, 'Deadly Throwing Axe of Grace', 20783, 5, 0, 1, 0, 0,
  25, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 15, 6, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  27, 51, 0, 2000, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992153, 2, 16, 'Deadly Throwing Axe of Slaughter', 20783, 5, 0, 1, 0, 0,
  25, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 15, 3, 12, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  32, 60, 0, 2000, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992161, 4, 6, 'Aegis of the Scarlet Vanguard', 18751, 5, 0, 1, 0, 0,
  14, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 18, 4, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 1600, 35, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992162, 4, 6, 'Aegis of the Scarlet Healer', 18751, 5, 0, 1, 0, 0,
  14, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 18, 6, 14, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 1360, 29, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992163, 4, 6, 'Aegis of the Scarlet Crusader', 18751, 5, 0, 1, 0, 0,
  14, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 4, 18, 3, 12, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 1360, 29, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992171, 4, 0, 'Orb of Lorica of the Vanguard', 28337, 5, 0, 1, 0, 0,
  23, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 7, 18, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 250, 0, 6, 'Balanced with impenetrable resolve to protect and hold the line.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992172, 4, 0, 'Orb of Lorica of Grace', 28337, 5, 0, 1, 0, 0,
  23, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 18, 6, 14, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Blessed with restorative essence that flows smoothly to wounded allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992173, 4, 0, 'Orb of Lorica of Slaughter', 28337, 5, 0, 1, 0, 0,
  23, -1, -1, 60, 1, 0, 0,
  0, 1, 0, 5, 18, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Forged for devastating lethality, striking swift and true.', 0
);

