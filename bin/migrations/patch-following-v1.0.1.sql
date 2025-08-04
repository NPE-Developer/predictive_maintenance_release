ALTER TABLE history_following_error ADD  DEFAULT getutcdate()  FOR created_at;

-- update version
UPDATE version_following_error SET version = '1.0.1' WHERE version = '1.0'