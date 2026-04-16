USE hainan_dialect_platform;

CREATE TABLE IF NOT EXISTS user_recent_dictionary_entries (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  user_id BIGINT UNSIGNED NOT NULL,
  entry_id BIGINT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_viewed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_user_recent_dictionary_entries_user
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE,
  CONSTRAINT fk_user_recent_dictionary_entries_entry
    FOREIGN KEY (entry_id) REFERENCES audio_samples (id)
    ON DELETE CASCADE,
  UNIQUE KEY uk_user_recent_dictionary_entries_user_entry (user_id, entry_id),
  INDEX idx_user_recent_dictionary_entries_user_last_viewed (user_id, last_viewed_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
