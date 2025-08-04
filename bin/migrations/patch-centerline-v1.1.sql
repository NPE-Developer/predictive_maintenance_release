-- update centerline 

ALTER TABLE centerline ADD centerline_bottom_warn int NULL;
ALTER TABLE centerline ADD centerline_bottom_alarm int NULL;
ALTER TABLE centerline ADD centerline_unit varchar(200) DEFAULT 'mbar' NOT NULL;
ALTER TABLE centerline ADD centerline_display_type varchar(200) DEFAULT 'gauge' NOT NULL;

-- update history centerline

ALTER TABLE history_centerline ADD warning_limit_bottom decimal(20,2) NULL;
ALTER TABLE history_centerline ADD alarm_limit_bottom decimal(20,2) NULL;
ALTER TABLE history_centerline ALTER COLUMN alarm_limit decimal(20,2) NULL;
ALTER TABLE history_centerline ALTER COLUMN warning_limit decimal(20,2) NULL;

-- update version
UPDATE version_centerline SET version = '1.1' WHERE version = '1.0'