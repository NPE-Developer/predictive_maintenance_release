ALTER TABLE history_following_error ALTER COLUMN following_error decimal(20,2) NOT NULL;
ALTER TABLE history_following_error ALTER COLUMN following_error_warn decimal(20,2) NULL;
ALTER TABLE history_following_error ALTER COLUMN following_error_alarm decimal(20,2) NULL;

ALTER TABLE machine_config_following_error ALTER COLUMN following_error_warn decimal(20,2) NULL;
ALTER TABLE machine_config_following_error ALTER COLUMN following_error_alarm decimal(20,2) NULL;

-- update version
UPDATE version_following_error SET version = '1.0.2' WHERE version = '1.0.1'