-- Restore the native range modifier and projectile type for existing heirloom bows, guns, and crossbows.
UPDATE `item_template`
SET `range_mod` = 100,
    `ammo_type` = CASE WHEN `subclass` = 3 THEN 3 ELSE 2 END
WHERE `entry` BETWEEN 913801 AND 914660
  AND MOD(`entry`, 100) BETWEEN 1 AND 60
  AND `class` = 2
  AND `subclass` IN (2, 3, 18)
  AND `bonding` = 6
  AND (`range_mod` <> 100 OR `ammo_type` <> CASE WHEN `subclass` = 3 THEN 3 ELSE 2 END);
