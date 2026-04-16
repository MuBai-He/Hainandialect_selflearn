CREATE DATABASE IF NOT EXISTS hainan_dialect_platform
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE hainan_dialect_platform;

SET NAMES utf8mb4;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS knowledge_edges;
DROP TABLE IF EXISTS knowledge_nodes;
DROP TABLE IF EXISTS corpus_recordings;
DROP TABLE IF EXISTS corpus_entries;
DROP TABLE IF EXISTS crowdsourcing_submissions;
DROP TABLE IF EXISTS glossary_entries;
DROP TABLE IF EXISTS pronunciation_assessments;
DROP TABLE IF EXISTS audio_recognition_records;
DROP TABLE IF EXISTS audio_samples;
DROP TABLE IF EXISTS user_vocab_progress;
DROP TABLE IF EXISTS cultural_articles;
DROP TABLE IF EXISTS dialogue_lines;
DROP TABLE IF EXISTS scene_dialogues;
DROP TABLE IF EXISTS example_sentences;
DROP TABLE IF EXISTS vocab_pronunciations;
DROP TABLE IF EXISTS vocab_items;
DROP TABLE IF EXISTS lesson_units;
DROP TABLE IF EXISTS course_modules;
DROP TABLE IF EXISTS learning_paths;
DROP TABLE IF EXISTS dialect_regions;
DROP TABLE IF EXISTS translation_records;
DROP TABLE IF EXISTS translation_dictionary;
DROP TABLE IF EXISTS user_favorites;
DROP TABLE IF EXISTS user_lesson_progress;
DROP TABLE IF EXISTS lesson_sentences;
DROP TABLE IF EXISTS lesson_terms;
DROP TABLE IF EXISTS learning_lessons;
DROP TABLE IF EXISTS learning_modules;
DROP TABLE IF EXISTS user_profiles;
DROP TABLE IF EXISTS users;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS users (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'active',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uk_users_username (username),
  UNIQUE KEY uk_users_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS user_profiles (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  user_id BIGINT UNSIGNED NOT NULL,
  nickname VARCHAR(50) NULL,
  avatar_url VARCHAR(255) NULL,
  bio VARCHAR(255) NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uk_user_profiles_user_id (user_id),
  CONSTRAINT fk_user_profiles_user
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS learning_modules (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  description VARCHAR(255) NULL,
  level VARCHAR(20) NOT NULL DEFAULT 'beginner',
  sort_order INT NOT NULL DEFAULT 0,
  status VARCHAR(20) NOT NULL DEFAULT 'draft',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_learning_modules_level_status_sort (level, status, sort_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS learning_lessons (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  module_id BIGINT UNSIGNED NOT NULL,
  title VARCHAR(100) NOT NULL,
  summary VARCHAR(255) NULL,
  difficulty VARCHAR(20) NOT NULL DEFAULT 'beginner',
  estimated_minutes INT NOT NULL DEFAULT 10,
  sort_order INT NOT NULL DEFAULT 0,
  status VARCHAR(20) NOT NULL DEFAULT 'draft',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_learning_lessons_module
    FOREIGN KEY (module_id) REFERENCES learning_modules (id)
    ON DELETE CASCADE,
  UNIQUE KEY uk_learning_lessons_module_sort (module_id, sort_order),
  INDEX idx_learning_lessons_module_status (module_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS lesson_terms (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  lesson_id BIGINT UNSIGNED NOT NULL,
  mandarin_text VARCHAR(100) NOT NULL,
  hainan_text VARCHAR(100) NOT NULL,
  pinyin_note VARCHAR(100) NULL,
  meaning_note VARCHAR(255) NULL,
  sort_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_lesson_terms_lesson
    FOREIGN KEY (lesson_id) REFERENCES learning_lessons (id)
    ON DELETE CASCADE,
  UNIQUE KEY uk_lesson_terms_lesson_sort (lesson_id, sort_order),
  INDEX idx_lesson_terms_lesson (lesson_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS lesson_sentences (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  lesson_id BIGINT UNSIGNED NOT NULL,
  mandarin_text VARCHAR(255) NOT NULL,
  hainan_text VARCHAR(255) NOT NULL,
  meaning_note VARCHAR(255) NULL,
  sort_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_lesson_sentences_lesson
    FOREIGN KEY (lesson_id) REFERENCES learning_lessons (id)
    ON DELETE CASCADE,
  UNIQUE KEY uk_lesson_sentences_lesson_sort (lesson_id, sort_order),
  INDEX idx_lesson_sentences_lesson (lesson_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS user_lesson_progress (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  user_id BIGINT UNSIGNED NOT NULL,
  lesson_id BIGINT UNSIGNED NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'not_started',
  completed_at TIMESTAMP NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_user_lesson_progress_user
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE,
  CONSTRAINT fk_user_lesson_progress_lesson
    FOREIGN KEY (lesson_id) REFERENCES learning_lessons (id)
    ON DELETE CASCADE,
  UNIQUE KEY uk_user_lesson_progress_user_lesson (user_id, lesson_id),
  INDEX idx_user_lesson_progress_user_status (user_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS user_favorites (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  user_id BIGINT UNSIGNED NOT NULL,
  favorite_type VARCHAR(20) NOT NULL,
  target_id BIGINT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_user_favorites_user
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE,
  UNIQUE KEY uk_user_favorites_user_target (user_id, favorite_type, target_id),
  INDEX idx_user_favorites_user_type_created (user_id, favorite_type, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS translation_dictionary (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  source_lang VARCHAR(20) NOT NULL,
  target_lang VARCHAR(20) NOT NULL,
  source_text VARCHAR(255) NOT NULL,
  target_text VARCHAR(255) NOT NULL,
  note VARCHAR(255) NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uk_translation_dictionary_pair (source_lang, target_lang, source_text, target_text),
  INDEX idx_translation_dictionary_lookup (source_lang, target_lang, source_text)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS translation_records (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  user_id BIGINT UNSIGNED NULL,
  source_lang VARCHAR(20) NOT NULL,
  target_lang VARCHAR(20) NOT NULL,
  source_text TEXT NOT NULL,
  target_text TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_translation_records_user
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE SET NULL,
  INDEX idx_translation_records_user_created (user_id, created_at),
  INDEX idx_translation_records_lang_pair (source_lang, target_lang)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS audio_samples (
  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  sample_key VARCHAR(100) NOT NULL,
  file_name VARCHAR(255) NOT NULL,
  file_path VARCHAR(255) NOT NULL,
  transcript_text VARCHAR(255) NOT NULL,
  translated_text VARCHAR(255) NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uk_audio_samples_sample_key (sample_key),
  UNIQUE KEY uk_audio_samples_file_name (file_name),
  INDEX idx_audio_samples_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
