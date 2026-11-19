-- Fresh mod-twow-heirloom installation into the Tortoise Characters database.
CREATE TABLE IF NOT EXISTS mod_heirloom_account_collection (
    account_id INT UNSIGNED NOT NULL,
    family MEDIUMINT UNSIGNED NOT NULL,
    pool TINYINT UNSIGNED NOT NULL,
    milestone TINYINT UNSIGNED NOT NULL,
    earner_guid INT UNSIGNED NOT NULL,
    unlock_slot INT UNSIGNED NOT NULL,
    shared_slot INT UNSIGNED DEFAULT NULL,
    unlock_cost TINYINT UNSIGNED NOT NULL DEFAULT 1,
    PRIMARY KEY (account_id, family),
    UNIQUE KEY earner_bracket_slot (account_id, pool, milestone, earner_guid, unlock_slot),
    UNIQUE KEY shared_bracket_slot (account_id, pool, milestone, shared_slot)
) ENGINE=InnoDB;
