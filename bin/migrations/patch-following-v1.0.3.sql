ALTER TABLE history_following_error ADD processed bit DEFAULT 0 NOT NULL;
CREATE INDEX history_following_error_processed_IDX ON history_following_error (machine_id, processed);

-- update version
UPDATE version_following_error SET version = '1.0.3' WHERE version = '1.0.2'