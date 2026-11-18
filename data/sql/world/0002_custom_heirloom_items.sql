-- ============================================================================
-- mod-twow-heirloom: Complete 156-Item Heirloom Armory (Tank, Healer, DPS)
-- Quality = 5 (Legendary Orange), Bonding = 6 (Bind to Account), MaxDurability = 0
-- Baseline Level 1 stats (ItemLevel = 1, RequiredLevel = 1)
-- Scales smoothly to Level 60 via mod-twow-item-level-scaling formula: R(L) = (L + 5) / 6
-- All 156 items feature unique, lore-rich inscriptions and strict role naming.
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
  991111, 4, 4, 'Field Plate Helmet (Tank)', 25839, 5, 0, 1, 0, 0,
  1, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 26, 0, 6, 'Heavy steel visor forged to absorb crushing impacts on the frontline.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991121, 4, 4, 'Field Plate Helmet (Healer)', 25839, 5, 0, 1, 0, 0,
  1, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 1, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 26, 0, 6, 'Blessed steel headpiece inscribed with verses of the Silver Hand.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991131, 4, 4, 'Field Plate Helmet (DPS)', 25839, 5, 0, 1, 0, 0,
  1, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 26, 0, 6, 'Intimidating war-helm honed with razor crests for relentless offense.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991112, 4, 4, 'Field Plate Pauldrons (Tank)', 27361, 5, 0, 1, 0, 0,
  3, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 24, 0, 6, 'Layered steel pauldrons engineered to deflect sweeping halberds.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991122, 4, 4, 'Field Plate Pauldrons (Healer)', 27361, 5, 0, 1, 0, 0,
  3, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 1, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 24, 0, 6, 'Gleaming pauldrons channeled with pure restorative solar energy.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991132, 4, 4, 'Field Plate Pauldrons (DPS)', 27361, 5, 0, 1, 0, 0,
  3, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 24, 0, 6, 'Spiked shoulder guards balanced for vicious two-handed swings.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991113, 4, 4, 'Field Plate Armor (Tank)', 27356, 5, 0, 1, 0, 0,
  5, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 40, 0, 6, 'Reinforced breastplate hardened against siege weaponry and mortal blows.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991123, 4, 4, 'Field Plate Armor (Healer)', 27356, 5, 0, 1, 0, 0,
  5, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 1, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 40, 0, 6, 'Sacred chestplate holding a radiant focal crystal near the heart.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991133, 4, 4, 'Field Plate Armor (DPS)', 27356, 5, 0, 1, 0, 0,
  5, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 40, 0, 6, 'Heavy assault cuirass granting freedom of arm motion for crushing strikes.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991114, 4, 4, 'Field Plate Vambraces (Tank)', 27362, 5, 0, 1, 0, 0,
  9, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 12, 0, 6, 'Thick steel bracers preventing severance from stray blade thrusts.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991124, 4, 4, 'Field Plate Vambraces (Healer)', 27362, 5, 0, 1, 0, 0,
  9, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 1, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 12, 0, 6, 'Etched wristguards that cool the blood of fallen allies with healing warmth.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991134, 4, 4, 'Field Plate Vambraces (DPS)', 27362, 5, 0, 1, 0, 0,
  9, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 12, 0, 6, 'Steel vambraces weighted to lend momentum to cleaving maneuvers.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991115, 4, 4, 'Field Plate Gauntlets (Tank)', 27358, 5, 0, 1, 0, 0,
  10, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 18, 0, 6, 'Articulated gauntlets providing an unbreakable grip on towering shields.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991125, 4, 4, 'Field Plate Gauntlets (Healer)', 27358, 5, 0, 1, 0, 0,
  10, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 1, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 18, 0, 6, 'Gentle yet unyielding plate gauntlets consecrated for laying on hands.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991135, 4, 4, 'Field Plate Gauntlets (DPS)', 27358, 5, 0, 1, 0, 0,
  10, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 18, 0, 6, 'Reinforced gauntlets bearing brass knuckles for devastating counter-punches.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991116, 4, 4, 'Field Plate Girdle (Tank)', 27359, 5, 0, 1, 0, 0,
  6, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 16, 0, 6, 'Broad steel belt reinforcing the spine against monstrous trampling.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991126, 4, 4, 'Field Plate Girdle (Healer)', 27359, 5, 0, 1, 0, 0,
  6, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 1, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 16, 0, 6, 'Adorned girdle bearing sacred libram chains and blessed vials.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991136, 4, 4, 'Field Plate Girdle (DPS)', 27359, 5, 0, 1, 0, 0,
  6, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 16, 0, 6, 'Flexible war-belt distributing weight for explosive sudden lunges.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991117, 4, 4, 'Field Plate Leggings (Tank)', 27360, 5, 0, 1, 0, 0,
  7, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 31, 0, 6, 'Double-plated greaves providing steadfast footing against dragon talons.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991127, 4, 4, 'Field Plate Leggings (Healer)', 27360, 5, 0, 1, 0, 0,
  7, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 1, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 31, 0, 6, 'Luminous greaves steadying the champion through the darkest blasphemies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991137, 4, 4, 'Field Plate Leggings (DPS)', 27360, 5, 0, 1, 0, 0,
  7, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 31, 0, 6, 'Jointed plate greaves engineered for unstoppable forward momentum.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991118, 4, 4, 'Field Plate Boots (Tank)', 27357, 5, 0, 1, 0, 0,
  8, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 19, 0, 6, 'Steel sabatons anchored with heavy treads to hold the ground.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991128, 4, 4, 'Field Plate Boots (Healer)', 27357, 5, 0, 1, 0, 0,
  8, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 1, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 19, 0, 6, 'Sanctified sabatons walking calmly across blighted or scorched terrain.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991138, 4, 4, 'Field Plate Boots (DPS)', 27357, 5, 0, 1, 0, 0,
  8, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 19, 0, 6, 'Stout boots forged to trample the vanguard of enemy armies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991211, 4, 3, 'Banded Helm (Tank)', 27774, 5, 0, 1, 0, 0,
  1, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 16, 0, 6, 'Interlocking iron rings guarding against feral bites and glancing arrows.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991221, 4, 3, 'Banded Helm (Healer)', 27774, 5, 0, 1, 0, 0,
  1, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 16, 0, 6, 'Ritualistic mail coif resonating with the whispered winds of the ancestors.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991231, 4, 3, 'Banded Helm (DPS)', 27774, 5, 0, 1, 0, 0,
  1, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 16, 0, 6, 'Camouflaged mail helm designed for patient stalking through dense brambles.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991212, 4, 3, 'Banded Pauldrons (Tank)', 27776, 5, 0, 1, 0, 0,
  3, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 14, 0, 6, 'Riveted mail mantle absorbing the weight of falling claws.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991222, 4, 3, 'Banded Pauldrons (Healer)', 27776, 5, 0, 1, 0, 0,
  3, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 14, 0, 6, 'Spiritual mail shoulders carrying the elemental essence of rolling thunder.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991232, 4, 3, 'Banded Pauldrons (DPS)', 27776, 5, 0, 1, 0, 0,
  3, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 14, 0, 6, 'Streamlined chain pauldrons shaped to eliminate quiver friction.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991213, 4, 3, 'Banded Armor (Tank)', 27769, 5, 0, 1, 0, 0,
  5, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 20, 0, 6, 'Durable chain hauberk tested against the savagery of wild beasts.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991223, 4, 3, 'Banded Armor (Healer)', 27769, 5, 0, 1, 0, 0,
  5, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 20, 0, 6, 'Totemic chain mail woven with enchanted earthward protection.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991233, 4, 3, 'Banded Armor (DPS)', 27769, 5, 0, 1, 0, 0,
  5, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 20, 0, 6, 'Flexible ringed chestguard suited for swift archery draws in the brush.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991214, 4, 3, 'Banded Bracers (Tank)', 27783, 5, 0, 1, 0, 0,
  9, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 8, 0, 6, 'Close-fitting mail bands shielding the forearms from vicious lacerations.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991224, 4, 3, 'Banded Bracers (Healer)', 27783, 5, 0, 1, 0, 0,
  9, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 8, 0, 6, 'Conducted brass bracers channeling lightning harmlessly into the earth.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991234, 4, 3, 'Banded Bracers (DPS)', 27783, 5, 0, 1, 0, 0,
  9, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 8, 0, 6, 'Light chain bracers guarding wrists against bowstring whip.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991215, 4, 3, 'Banded Gauntlets (Tank)', 27778, 5, 0, 1, 0, 0,
  10, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 12, 0, 6, 'Stout mail gloves preventing predatory disarms during close skirmishes.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991225, 4, 3, 'Banded Gauntlets (Healer)', 27778, 5, 0, 1, 0, 0,
  10, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 12, 0, 6, 'Blessed ringed gloves carrying the soothing chill of freshwater springs.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991235, 4, 3, 'Banded Gauntlets (DPS)', 27778, 5, 0, 1, 0, 0,
  10, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 12, 0, 6, 'Supple chain gloves offering precise finger sensitivity for the trigger.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991216, 4, 3, 'Banded Girdle (Tank)', 27777, 5, 0, 1, 0, 0,
  6, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 11, 0, 6, 'Sturdy link girdle keeping vital midriff organs safe from ambush.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991226, 4, 3, 'Banded Girdle (Healer)', 27777, 5, 0, 1, 0, 0,
  6, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 11, 0, 6, 'Ceremonial mail belt adorned with relics of ancient tribal protectors.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991236, 4, 3, 'Banded Girdle (DPS)', 27777, 5, 0, 1, 0, 0,
  6, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 11, 0, 6, 'Sturdy hunting cinch bearing pouches for ammunition and survival cords.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991217, 4, 3, 'Banded Leggings (Tank)', 27770, 5, 0, 1, 0, 0,
  7, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 17, 0, 6, 'Heavy ringed chausses enduring jagged rocks and beast fangs.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991227, 4, 3, 'Banded Leggings (Healer)', 27770, 5, 0, 1, 0, 0,
  7, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 17, 0, 6, 'Spirit-warded mail kilt guarding the Shaman across ancestral grounds.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991237, 4, 3, 'Banded Leggings (DPS)', 27770, 5, 0, 1, 0, 0,
  7, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 17, 0, 6, 'Reinforced chain leggings made for relentless cross-country pursuit.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991218, 4, 3, 'Banded Boots (Tank)', 27771, 5, 0, 1, 0, 0,
  8, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 13, 0, 6, 'Iron-soled chain boots bracing against the impact of rampaging boars.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991228, 4, 3, 'Banded Boots (Healer)', 27771, 5, 0, 1, 0, 0,
  8, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 13, 0, 6, 'Elemental treaded mail boots moving steadily over seismic fissures.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991238, 4, 3, 'Banded Boots (DPS)', 27771, 5, 0, 1, 0, 0,
  8, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 13, 0, 6, 'Silent iron-mesh boots muffling footsteps over dry forest leaves.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991311, 4, 2, 'Red Defias Mask (Tank)', 15308, 5, 0, 1, 0, 0,
  1, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 9, 0, 6, 'Tough crimson cowl obscuring identity while bracing for sudden blows.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991321, 4, 2, 'Red Defias Mask (Healer)', 15308, 5, 0, 1, 0, 0,
  1, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 9, 0, 6, 'Whispering silk-lined mask keeping the druidic mind clear of chaos.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991331, 4, 2, 'Red Defias Mask (DPS)', 15308, 5, 0, 1, 0, 0,
  1, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 9, 0, 6, 'The iconic rogue veil, striking fear before the blade even emerges.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991312, 4, 2, 'Bandit Shoulders (Tank)', 17195, 5, 0, 1, 0, 0,
  3, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 8, 0, 6, 'Cured leather shoulder pads reinforced with hidden copper studs.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991322, 4, 2, 'Bandit Shoulders (Healer)', 17195, 5, 0, 1, 0, 0,
  3, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 8, 0, 6, 'Bark-tanned leather pads carrying the scent of primordial cedar groves.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991332, 4, 2, 'Bandit Shoulders (DPS)', 17195, 5, 0, 1, 0, 0,
  3, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 8, 0, 6, 'Darkened shoulder guards designed to vanish in dimly lit alleyways.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991313, 4, 2, 'Blackened Defias Armor (Tank)', 9123, 5, 0, 1, 0, 0,
  5, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 12, 0, 6, 'Hardened outlaw tunic soaked in boiled oil to turn away fatal knives.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991323, 4, 2, 'Blackened Defias Armor (Healer)', 9123, 5, 0, 1, 0, 0,
  5, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 12, 0, 6, 'Supple dream-leather vest humming with the breath of the Emerald Dream.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991333, 4, 2, 'Blackened Defias Armor (DPS)', 9123, 5, 0, 1, 0, 0,
  5, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 12, 0, 6, 'Shadow-stitched assassin jerkin allowing total silence and lethal precision.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991314, 4, 2, 'Bandit Bracers (Tank)', 28427, 5, 0, 1, 0, 0,
  9, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 4, 0, 6, 'Cured hide wristguards stiffened to parry dagger strikes.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991324, 4, 2, 'Bandit Bracers (Healer)', 28427, 5, 0, 1, 0, 0,
  9, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 4, 0, 6, 'Living-wood banded cuffs maintaining harmonious flow of mana.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991334, 4, 2, 'Bandit Bracers (DPS)', 28427, 5, 0, 1, 0, 0,
  9, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 4, 0, 6, 'Form-fitting leather wraps giving steady poise for deadly pickpocketing.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991315, 4, 2, 'Blackened Defias Gloves (Tank)', 27946, 5, 0, 1, 0, 0,
  10, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 6, 0, 6, 'Grip-coated leather gloves preventing weapons from slipping in blood.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991325, 4, 2, 'Blackened Defias Gloves (Healer)', 27946, 5, 0, 1, 0, 0,
  10, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 6, 0, 6, 'Embroidered leather gloves nurturing the seed of renewed vitality.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991335, 4, 2, 'Blackened Defias Gloves (DPS)', 27946, 5, 0, 1, 0, 0,
  10, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 6, 0, 6, 'Supple gloves with exposed tips for handling precision lockpicks.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991316, 4, 2, 'Blackened Defias Belt (Tank)', 14389, 5, 0, 1, 0, 0,
  6, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 6, 0, 6, 'Thick hide utility belt fastened with a heavy, blunt iron buckle.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991326, 4, 2, 'Blackened Defias Belt (Healer)', 14389, 5, 0, 1, 0, 0,
  6, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 6, 0, 6, 'Vessel-bearing sash holding sacred salves distilled from moonglade dew.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991336, 4, 2, 'Blackened Defias Belt (DPS)', 14389, 5, 0, 1, 0, 0,
  6, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 6, 0, 6, 'Concealed sheath girdle carrying throwing stars and blinding dust.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991317, 4, 2, 'Blackened Defias Leggings (Tank)', 27947, 5, 0, 1, 0, 0,
  7, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 10, 0, 6, 'Reinforced leather breeches built to endure tumbling and harsh parries.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991327, 4, 2, 'Blackened Defias Leggings (Healer)', 27947, 5, 0, 1, 0, 0,
  7, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 10, 0, 6, 'Nature-spun breeches offering effortless agility across wild undergrowth.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991337, 4, 2, 'Blackened Defias Leggings (DPS)', 27947, 5, 0, 1, 0, 0,
  7, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 10, 0, 6, 'Muffled leather pants preventing any rustle when stalking in stealth.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991318, 4, 2, 'Blackened Defias Boots (Tank)', 21903, 5, 0, 1, 0, 0,
  8, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 7, 0, 6, 'Stiffened leather footwear weighted to anchor evasive maneuvers.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991328, 4, 2, 'Blackened Defias Boots (Healer)', 21903, 5, 0, 1, 0, 0,
  8, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 7, 0, 6, 'Soft-moccasin soles moving gently without disturbing forest wildlife.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991338, 4, 2, 'Blackened Defias Boots (DPS)', 21903, 5, 0, 1, 0, 0,
  8, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 7, 0, 6, 'Light leather boots leaving neither print nor trace behind.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991411, 4, 1, 'Shadow Hood (Tank)', 15319, 5, 0, 1, 0, 0,
  1, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 4, 0, 6, 'Heavy woven hood charmed with kinetic deflection runes.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991421, 4, 1, 'Shadow Hood (Healer)', 15319, 5, 0, 1, 0, 0,
  1, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 6, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 4, 0, 6, 'Serene cowl focusing the inner spirit for miraculous recuperation.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991431, 4, 1, 'Shadow Hood (DPS)', 15319, 5, 0, 1, 0, 0,
  1, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 4, 0, 6, 'Abyssal hood whispering secrets of forbidden arcane conflagrations.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991412, 4, 1, 'Mystic\'s Shoulder Pads (Tank)', 25887, 5, 0, 1, 0, 0,
  3, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 3, 0, 6, 'Rune-woven epaulets absorbing stray shockwaves from explosive rituals.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991422, 4, 1, 'Mystic\'s Shoulder Pads (Healer)', 25887, 5, 0, 1, 0, 0,
  3, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 6, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 3, 0, 6, 'Pious silken shoulder pads gleaming with peaceful dawn light.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991432, 4, 1, 'Mystic\'s Shoulder Pads (DPS)', 25887, 5, 0, 1, 0, 0,
  3, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 3, 0, 6, 'Crackling velvet pads pulsing with volatile spellpower resonance.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991413, 4, 1, 'Mystic\'s Robe (Tank)', 25889, 5, 0, 1, 0, 0,
  5, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 5, 0, 6, 'Durable ritual vestment blessed to withstand mystical backlashes.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991423, 4, 1, 'Mystic\'s Robe (Healer)', 25889, 5, 0, 1, 0, 0,
  5, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 6, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 5, 0, 6, 'Graceful white-gold robe radiating perpetual warmth to nearby allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991433, 4, 1, 'Mystic\'s Robe (DPS)', 25889, 5, 0, 1, 0, 0,
  5, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 5, 0, 6, 'Flowing robes shimmering with latent devastation ready to unleash.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991414, 4, 1, 'Mystic\'s Bracelets (Tank)', 16805, 5, 0, 1, 0, 0,
  9, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 2, 0, 6, 'Grounded linen bands insulating the pulse against mental shocks.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991424, 4, 1, 'Mystic\'s Bracelets (Healer)', 16805, 5, 0, 1, 0, 0,
  9, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 6, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 2, 0, 6, 'Pure silk wristlets steadying the hands during critical triage spells.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991434, 4, 1, 'Mystic\'s Bracelets (DPS)', 16805, 5, 0, 1, 0, 0,
  9, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 2, 0, 6, 'Runed cuffs accelerating the gathering of raw destructive ether.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991415, 4, 1, 'Mystic\'s Gloves (Tank)', 25885, 5, 0, 1, 0, 0,
  10, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 3, 0, 6, 'Warded silk handwraps allowing deflection of hostile hexes.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991425, 4, 1, 'Mystic\'s Gloves (Healer)', 25885, 5, 0, 1, 0, 0,
  10, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 6, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 3, 0, 6, 'Sacred gloves blessed by priests to soothe mortal agony instantly.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991435, 4, 1, 'Mystic\'s Gloves (DPS)', 25885, 5, 0, 1, 0, 0,
  10, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 3, 0, 6, 'Tapered finger-wraps sparking with volatile frost and flame embers.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991416, 4, 1, 'Mystic\'s Belt (Tank)', 25881, 5, 0, 1, 0, 0,
  6, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 2, 0, 6, 'Firm woven sash binding the body against kinetic concussions.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991426, 4, 1, 'Mystic\'s Belt (Healer)', 25881, 5, 0, 1, 0, 0,
  6, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 6, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 2, 0, 6, 'Holy cord woven from altar cloth, anchoring divine devotion.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991436, 4, 1, 'Mystic\'s Belt (DPS)', 25881, 5, 0, 1, 0, 0,
  6, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 2, 0, 6, 'Enchanted cord holding endless reservoirs of fiery vengeance.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991417, 4, 1, 'Mystic\'s Woolies (Tank)', 10079, 5, 0, 1, 0, 0,
  7, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 4, 0, 6, 'Stout wool trousers resisting the bite of magical frost and fire.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991427, 4, 1, 'Mystic\'s Woolies (Healer)', 10079, 5, 0, 1, 0, 0,
  7, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 6, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 4, 0, 6, 'Comfortable prayer woolies sustaining concentration through long trials.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991437, 4, 1, 'Mystic\'s Woolies (DPS)', 10079, 5, 0, 1, 0, 0,
  7, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 4, 0, 6, 'Patterned woolies crackling with unstable lightning enchantments.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991418, 4, 1, 'Mystic\'s Slippers (Tank)', 16802, 5, 0, 1, 0, 0,
  8, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 3, 0, 6, 'Padded silken shoes absorbing the tremor of ground-shattering impacts.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991428, 4, 1, 'Mystic\'s Slippers (Healer)', 16802, 5, 0, 1, 0, 0,
  8, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 6, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 3, 0, 6, 'Light tread slippers walking swiftly to heal the wounded upon the field.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991438, 4, 1, 'Mystic\'s Slippers (DPS)', 16802, 5, 0, 1, 0, 0,
  8, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 3, 0, 6, 'Arcane-infused slippers gliding effortlessly as catastrophic spells cast.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991511, 4, 1, 'Drape of Antiquity (Tank)', 28337, 5, 0, 1, 0, 0,
  16, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 8, 0, 6, 'Heavy embroidered cloak shielding the rear guard from fatal backstabs.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991512, 4, 1, 'Drape of Antiquity (Healer)', 28337, 5, 0, 1, 0, 0,
  16, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 4, 0, 6, 'Silk-lined cloak billowing with tranquil breezes of eternal restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991513, 4, 1, 'Drape of Antiquity (DPS)', 28337, 5, 0, 1, 0, 0,
  16, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 5, 0, 6, 'Shadowed mantle trailing like smoke behind relentless skirmishers.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991611, 4, 0, 'Signet of the Ancestor (Tank)', 1156, 5, 0, 1, 0, 0,
  11, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Heavy platinum band radiating the enduring resilience of the ancients.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991612, 4, 0, 'Signet of the Ancestor (Healer)', 1156, 5, 0, 1, 0, 0,
  11, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Polished sapphire signet glowing with eternal tidal wisdom.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991613, 4, 0, 'Signet of the Ancestor (DPS)', 1156, 5, 0, 1, 0, 0,
  11, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Serrated bloodstone ring thirsting for martial glory in battle.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991621, 4, 0, 'Band of the Paragon (Tank)', 1156, 5, 0, 1, 0, 0,
  11, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Adamantite ring reinforcing the willpower of unyielding guardians.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991622, 4, 0, 'Band of the Paragon (Healer)', 1156, 5, 0, 1, 0, 0,
  11, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 6, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Gleaming pearl band soothing chaotic surges within the spiritual body.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991623, 4, 0, 'Band of the Paragon (DPS)', 1156, 5, 0, 1, 0, 0,
  11, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Fine mithril wire loop providing uncanny reflex precision to the bearer.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991711, 4, 0, 'Insignia of the Vanguard (Tank)', 15308, 5, 0, 1, 0, 0,
  12, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Military medal bestowed for heroic defense against impossible odds.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991712, 4, 0, 'Insignia of the Vanguard (Healer)', 15308, 5, 0, 1, 0, 0,
  12, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Sacred clover talisman inspiring hope in dying champions.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991713, 4, 0, 'Insignia of the Vanguard (DPS)', 15308, 5, 0, 1, 0, 0,
  12, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Engraved crest commemorating swift and devastating tactical conquests.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991721, 4, 0, 'Talisman of Resolve (Tank)', 15308, 5, 0, 1, 0, 0,
  12, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Chiseled granite charm grounding the soul against fear and despair.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991722, 4, 0, 'Talisman of Resolve (Healer)', 15308, 5, 0, 1, 0, 0,
  12, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 6, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Luminous prism focusing celestial energies directly into weary hearts.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  991723, 4, 0, 'Talisman of Resolve (DPS)', 15308, 5, 0, 1, 0, 0,
  12, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Sharpened dragonfang amulet quickening the heartbeat of ferocious fighters.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992011, 2, 7, 'Cruel Barb (Tank)', 7311, 5, 0, 1, 0, 0,
  13, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 2800, 0, 0, 6, 'A notched steel falchion designed to intercept and hook enemy blades.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992012, 2, 7, 'Cruel Barb (Healer)', 7311, 5, 0, 1, 0, 0,
  13, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 2800, 0, 0, 6, 'Sanctified saber glowing with soft luminous aura to protect the fallen.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992013, 2, 7, 'Cruel Barb (DPS)', 7311, 5, 0, 1, 0, 0,
  13, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 2800, 0, 0, 6, 'The infamous Defias cutlass, brutally keen and thirsty for coastal plunder.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992021, 2, 8, 'Whirlwind Sword (Tank)', 22731, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  4, 8, 0, 2900, 0, 0, 6, 'Massive two-handed greatsword serving as an impenetrable bulwark.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992022, 2, 8, 'Whirlwind Sword (Healer)', 22731, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  4, 8, 0, 2900, 0, 0, 6, 'Ritualistic greatsword channeling purifying light across the battlefield.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992023, 2, 8, 'Whirlwind Sword (DPS)', 22731, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  4, 8, 0, 2900, 0, 0, 6, 'Aerodynamic titan blade cleaving swathes through opposing ranks like wind.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992031, 2, 0, 'Butcher\'s Cleaver (Tank)', 8466, 5, 0, 1, 0, 0,
  13, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 3, 0, 1700, 0, 0, 6, 'Heavy meat-cleaver weighted to chop through bone and disarm assailants.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992032, 2, 0, 'Butcher\'s Cleaver (Healer)', 8466, 5, 0, 1, 0, 0,
  13, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 3, 0, 1700, 0, 0, 6, 'Consecrated hatchet carving protective wards into the stubborn earth.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992033, 2, 0, 'Butcher\'s Cleaver (DPS)', 8466, 5, 0, 1, 0, 0,
  13, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 3, 0, 1700, 0, 0, 6, 'Cruel bone-chopper leaving ragged wounds that refuse to close in combat.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992041, 2, 1, 'Whirlwind Axe (Tank)', 22734, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  5, 9, 0, 3600, 0, 0, 6, 'Imposing broadaxe planted firmly to anchor the front ranks against cavalry.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992042, 2, 1, 'Whirlwind Axe (Healer)', 22734, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  5, 9, 0, 3600, 0, 0, 6, 'Solemn ceremonial battleaxe invoking sky spirits to safeguard the warband.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992043, 2, 1, 'Whirlwind Axe (DPS)', 22734, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  5, 9, 0, 3600, 0, 0, 6, 'Legendary greataxe forged with bound cyclones, striking like thunderbolts.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992051, 2, 4, 'The Hand of Antu\'sul (Tank)', 18572, 5, 0, 1, 0, 0,
  21, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 2700, 0, 0, 6, 'Spiked sandfury mace crushing weapons before they can strike the wielder.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992052, 2, 4, 'The Hand of Antu\'sul (Healer)', 18572, 5, 0, 1, 0, 0,
  21, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 2700, 0, 0, 6, 'Ancient ceremonial club thrumming with primordial mojo and healing surge.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992053, 2, 4, 'The Hand of Antu\'sul (DPS)', 18572, 5, 0, 1, 0, 0,
  21, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 2700, 0, 0, 6, 'Savage troll mace that pulverizes enemy armor with concussive savagery.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992061, 2, 5, 'Mograine\'s Might (Tank)', 21252, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  4, 8, 0, 2800, 0, 0, 6, 'Monumental maul inspiring steadfast courage against the undead scourge.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992062, 2, 5, 'Mograine\'s Might (Healer)', 21252, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  4, 8, 0, 2800, 0, 0, 6, 'Holy crusader warhammer blessed by the High Inquisitor to comfort the pure.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992063, 2, 5, 'Mograine\'s Might (DPS)', 21252, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  4, 8, 0, 2800, 0, 0, 6, 'Crushing battle-hammer designed to shatter skeletal armies in wide sweeps.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992071, 2, 15, 'Black Menace (Tank)', 20292, 5, 0, 1, 0, 0,
  13, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  1, 3, 0, 1500, 0, 0, 6, 'Parrying stiletto designed to deflect fatal strikes from the shadows.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992072, 2, 15, 'Black Menace (Healer)', 20292, 5, 0, 1, 0, 0,
  13, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  1, 3, 0, 1500, 0, 0, 6, 'Sacrificial needle used in ancient soothing rituals to draw away venom.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992073, 2, 15, 'Black Menace (DPS)', 20292, 5, 0, 1, 0, 0,
  13, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  1, 3, 0, 1500, 0, 0, 6, 'Obsidian-edged stiletto leaving silent lethality in the dark alleyways.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992081, 2, 13, 'Thekal\'s Grasp (Tank)', 32776, 5, 0, 1, 0, 0,
  21, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 2200, 0, 0, 6, 'Tiger-headed claw gauntlet deflecting vicious blows with brass fangs.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992082, 2, 13, 'Thekal\'s Grasp (Healer)', 32776, 5, 0, 1, 0, 0,
  21, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 2200, 0, 0, 6, 'Primal totem claw channeling high priest blessing to mend torn flesh.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992083, 2, 13, 'Thekal\'s Grasp (DPS)', 32776, 5, 0, 1, 0, 0,
  21, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 2200, 0, 0, 6, 'Savage fist weapon ripping into prey with the ferocious fury of the tiger.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992091, 4, 6, 'Grimlok\'s Charge (Tank)', 22233, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  4, 8, 0, 2700, 0, 0, 6, 'Stout trogg spear keeping monstrous beasts safely at arm\'s reach.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992092, 4, 6, 'Grimlok\'s Charge (Healer)', 22233, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  4, 8, 0, 2700, 0, 0, 6, 'Tribal sun-polearm warding off malevolent curses from vulnerable allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992093, 4, 6, 'Grimlok\'s Charge (DPS)', 22233, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  4, 8, 0, 2700, 0, 0, 6, 'Barbed thrusting spear built for ferocious cavalry impalement.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992101, 2, 2, 'Gryphonwing Long Bow (Tank)', 28766, 5, 0, 1, 0, 0,
  15, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 2700, 0, 0, 6, 'Reinforced yew bow keeping predators at bay with pinning suppressive shots.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992102, 2, 2, 'Gryphonwing Long Bow (Healer)', 28766, 5, 0, 1, 0, 0,
  15, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 2700, 0, 0, 6, 'Enchanted avian bow firing arrows wrapped in soothing mists of serenity.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992103, 2, 2, 'Gryphonwing Long Bow (DPS)', 28766, 5, 0, 1, 0, 0,
  15, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 2700, 0, 0, 6, 'Aerodynamic elven longbow sending whistling arrows with lethal range.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992111, 2, 3, 'Precisely Calibrated Boomstick (Tank)', 8258, 5, 0, 1, 0, 0,
  26, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 1500, 0, 0, 6, 'Gnomish scattergun loaded to stagger charging brutes with concussive smoke.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992112, 2, 3, 'Precisely Calibrated Boomstick (Healer)', 8258, 5, 0, 1, 0, 0,
  26, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 1500, 0, 0, 6, 'Brass-plated apothecary blunderbuss dispensing restorative vapors on impact.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992113, 2, 3, 'Precisely Calibrated Boomstick (DPS)', 8258, 5, 0, 1, 0, 0,
  26, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 4, 0, 1500, 0, 0, 6, 'Fine-tuned engineering rifle ensuring pinpoint precision between enemy eyes.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992121, 2, 18, 'Blackcrow (Tank)', 22929, 5, 0, 1, 0, 0,
  26, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  3, 5, 0, 3200, 0, 0, 6, 'Heavy steel crossbow pinning charging berserkers before they reach allies.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992122, 2, 18, 'Blackcrow (Healer)', 22929, 5, 0, 1, 0, 0,
  26, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  3, 5, 0, 3200, 0, 0, 6, 'Night-carved crossbow carrying protective spirit charms in its stock.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992123, 2, 18, 'Blackcrow (DPS)', 22929, 5, 0, 1, 0, 0,
  26, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  3, 5, 0, 3200, 0, 0, 6, 'Raven-crested crossbow firing bolts with surgical and silent finality.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992131, 2, 19, 'Bonecreeper Stylus (Tank)', 24743, 5, 0, 1, 0, 0,
  26, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  1, 3, 0, 1900, 0, 0, 6, 'Carved ivory rod radiating a protective barrier against necrotic curses.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992132, 2, 19, 'Bonecreeper Stylus (Healer)', 24743, 5, 0, 1, 0, 0,
  26, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  1, 3, 0, 1900, 0, 0, 6, 'Sacred bone stylus etching soothing runes upon the skin of the fallen.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992133, 2, 19, 'Bonecreeper Stylus (DPS)', 24743, 5, 0, 1, 0, 0,
  26, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  1, 3, 0, 1900, 0, 0, 6, 'Necrotic bone wand firing searing beams of spectral torment.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992141, 2, 16, 'Deadly Throwing Axe (Tank)', 20783, 5, 0, 1, 0, 0,
  25, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 3, 0, 2100, 0, 0, 6, 'Weighted hatchet hurled to cripple approaching charging predators.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992142, 2, 16, 'Deadly Throwing Axe (Healer)', 20783, 5, 0, 1, 0, 0,
  25, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 3, 0, 2100, 0, 0, 6, 'Totemic throwing axe carrying a blessing to calm bloodthirsty aggression.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992143, 2, 16, 'Deadly Throwing Axe (DPS)', 20783, 5, 0, 1, 0, 0,
  25, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 3, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  2, 3, 0, 2100, 0, 0, 6, 'Razor-sharp throwing axe balanced for quick, fatal decapitating tosses.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992151, 2, 10, 'Illusionary Rod (Tank)', 15806, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  3, 6, 0, 3400, 0, 0, 6, 'Solid hardwood stave woven with defensive light to turn aside blades.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992152, 2, 10, 'Illusionary Rod (Healer)', 15806, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  3, 6, 0, 3400, 0, 0, 6, 'Transcendent rod radiating endless waves of tranquil restoration.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992153, 2, 10, 'Illusionary Rod (DPS)', 15806, 5, 0, 1, 0, 0,
  17, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  3, 6, 0, 3400, 0, 0, 6, 'Kaleidoscopic staff warping arcane geometry to unleash devastating firestorms.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992161, 4, 0, 'Orb of Lorica (Tank)', 28337, 5, 0, 1, 0, 0,
  23, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Impenetrable astral orb creating personal kinetic wards around the caster.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992162, 4, 0, 'Orb of Lorica (Healer)', 28337, 5, 0, 1, 0, 0,
  23, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Restorative crystalline orb pulsating with pure fountain waters.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992163, 4, 0, 'Orb of Lorica (DPS)', 28337, 5, 0, 1, 0, 0,
  23, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 6, 'Prismatic arcane orb focusing spell power into blistering devastation.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992171, 4, 6, 'Aegis of the Scarlet Commander (Tank)', 18751, 5, 0, 1, 0, 0,
  14, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 7, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 45, 5, 6, 'Towering scarlet heater shield bearing the scars of a thousand sieges.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992172, 4, 6, 'Aegis of the Scarlet Commander (Healer)', 18751, 5, 0, 1, 0, 0,
  14, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 5, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 45, 5, 6, 'Radiant crest shield channeling holy power to bolster all nearby faithful.', 0
);

INSERT INTO `item_template` (
  `entry`, `class`, `subclass`, `name`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`,
  `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`,
  `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`,
  `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `armor`, `block`, `bonding`, `description`, `max_durability`
) VALUES (
  992173, 4, 6, 'Aegis of the Scarlet Commander (DPS)', 18751, 5, 0, 1, 0, 0,
  14, -1, -1, 1, 1, 0, 0,
  0, 1, 0, 4, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 45, 5, 6, 'Spiked heraldic aegis designed for crushing bash attacks in the vanguard.', 0
);
