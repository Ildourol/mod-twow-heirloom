# Turtle WoW Heirlooms

Earn armor, weapon, and accessory choices through leveling, then redeem them at curators near the Stormwind and Orgrimmar banks. New unlocks join an account-wide collection and can be claimed by eligible alts. Equipment scales within the configured level cap.

## Install

1. Place this repository at `modules/mod-twow-heirloom` in your `tortoise-wow` source tree. Select static linkage with `-DMODULE_MOD_TWOW_HEIRLOOM=static` in your normal server build.
2. Install [the configuration template](conf/mod-twow-heirloom.conf.dist) as `modules/mod-twow-heirloom.conf` beside your active world server configuration. Review its defaults before startup.
3. Back up the affected databases. Apply the relevant [SQL files](data/sql) in filename order to the World and Characters databases if you manage module SQL manually. If you use the core module updater, include this module and verify the migrations in the startup log.
4. Deploy the rebuilt world server and start it after completing the database and configuration setup.

## Use

Look for voucher mail as your character reaches the configured award levels. The merchants use the built-in token merchant UI in Turtle WoW client `1.18.1.7979`. By default, each character earns their own allowance.

World SQL installs the items and merchant data. Characters SQL creates the collection storage. If the module’s enabled fallback importer installs missing World data at startup, restart once to load it.
