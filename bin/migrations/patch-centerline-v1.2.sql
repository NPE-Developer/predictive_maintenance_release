-- update centerline 

ALTER TABLE centerline ALTER COLUMN centerline_warn decimal(20,2) NULL;
ALTER TABLE centerline ALTER COLUMN centerline_alarm decimal(20,2) NULL;
ALTER TABLE centerline ALTER COLUMN centerline_bottom_warn decimal(20,2) NULL;
ALTER TABLE centerline ALTER COLUMN centerline_bottom_alarm decimal(20,2) NULL;

-- update version
UPDATE version_centerline SET version = '1.2' WHERE version = '1.1'