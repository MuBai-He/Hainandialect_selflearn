from __future__ import annotations

import argparse
import json
from pathlib import Path


DEFAULT_INPUT = Path(
    r"D:\code\school_race\FunASRfinetune\FunASRfinetune\dataset_cleaned\train.jsonl"
)
DEFAULT_OUTPUT = Path(
    r"D:\code\school_race\Hainandialect_selflearn\database\audio_samples_seed.sql"
)


def read_text_with_fallback(path: Path) -> str:
    for encoding in ("utf-8", "utf-8-sig", "gb18030", "gbk"):
        try:
            return path.read_text(encoding=encoding)
        except UnicodeDecodeError:
            continue
    raise UnicodeDecodeError("unknown", b"", 0, 1, f"Unable to decode {path}")


def sql_escape(value: str) -> str:
    return value.replace("\\", "\\\\").replace("'", "''")


def build_insert_sql(train_jsonl_path: Path) -> str:
    raw_text = read_text_with_fallback(train_jsonl_path)
    lines: list[str] = [
        "USE hainan_dialect_platform;",
        "",
        "CREATE TABLE IF NOT EXISTS audio_samples (",
        "  id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,",
        "  sample_key VARCHAR(100) NOT NULL,",
        "  file_name VARCHAR(255) NOT NULL,",
        "  file_path VARCHAR(255) NOT NULL,",
        "  transcript_text VARCHAR(255) NOT NULL,",
        "  translated_text VARCHAR(255) NULL,",
        "  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,",
        "  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,",
        "  UNIQUE KEY uk_audio_samples_sample_key (sample_key),",
        "  UNIQUE KEY uk_audio_samples_file_name (file_name),",
        "  INDEX idx_audio_samples_created_at (created_at)",
        ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;",
        "",
    ]

    for raw_line in raw_text.splitlines():
        line = raw_line.strip()
        if not line:
            continue

        item = json.loads(line)
        source = str(item.get("source", "")).strip().replace("\\", "/")
        target = str(item.get("target", "")).strip()
        file_name = Path(source).name
        sample_key = Path(file_name).stem

        if not source or not target or not file_name or not sample_key:
            continue

        lines.extend(
            [
                "INSERT INTO audio_samples (sample_key, file_name, file_path, transcript_text, translated_text)",
                "SELECT "
                f"'{sql_escape(sample_key)}', "
                f"'{sql_escape(file_name)}', "
                f"'{sql_escape(source)}', "
                f"'{sql_escape(target)}', "
                f"'{sql_escape(target)}'",
                "FROM DUAL",
                "WHERE NOT EXISTS (",
                "  SELECT 1 FROM audio_samples",
                f"  WHERE sample_key = '{sql_escape(sample_key)}'",
                ");",
                "",
            ]
        )

    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate SQL inserts for audio_samples from a FunASR jsonl dataset."
    )
    parser.add_argument("--input", type=Path, default=DEFAULT_INPUT, help="Path to train.jsonl")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT, help="Path to output SQL file")
    args = parser.parse_args()

    sql_text = build_insert_sql(args.input)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(sql_text, encoding="utf-8")
    print(f"Generated {args.output}")


if __name__ == "__main__":
    main()
