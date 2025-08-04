ALTER TABLE history_centerline ADD processed bit DEFAULT 0 NOT NULL;
CREATE INDEX history_centerline_processed_IDX ON history_centerline (centerline_id, processed);

-- update version
UPDATE version_centerline SET version = '1.3' WHERE version = '1.2'