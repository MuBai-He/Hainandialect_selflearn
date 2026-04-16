USE hainan_dialect_platform;

CREATE TABLE IF NOT EXISTS audio_recognition_records (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  user_id BIGINT UNSIGNED NULL,
  sample_id BIGINT UNSIGNED NULL,
  sample_key VARCHAR(100) NOT NULL,
  file_name VARCHAR(255) NOT NULL,
  recognized_text VARCHAR(255) NOT NULL,
  translated_text VARCHAR(255) NULL,
  engine VARCHAR(50) NOT NULL DEFAULT 'demo_dataset_lookup',
  confidence DECIMAL(5,4) NOT NULL DEFAULT 0.9800,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_audio_recognition_records_user
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE SET NULL,
  CONSTRAINT fk_audio_recognition_records_sample
    FOREIGN KEY (sample_id) REFERENCES audio_samples (id)
    ON DELETE SET NULL,
  INDEX idx_audio_recognition_records_user_created (user_id, created_at),
  INDEX idx_audio_recognition_records_sample_created (sample_id, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
