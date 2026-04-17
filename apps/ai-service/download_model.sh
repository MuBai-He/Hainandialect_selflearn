#!/usr/bin/env bash
# Download + verify + unzip the fine-tuned SenseVoice Hainanese model bundle.
#
# Inputs (environment variables):
#   HAINAN_MODEL_URL  required – direct download URL for the zip file
#   HAINAN_MODEL_MD5  optional – expected MD5 to verify against (strongly recommended)
#   HAINAN_MODEL_DIR  optional – where to extract (default: <repo>/models/sensevoice_hainan_best_deploy)
#   HAINAN_MODEL_ZIP  optional – path to a pre-downloaded zip (skips the download step)
#
# Exit codes:
#   0 success; 2 bad arg; 3 download fail; 4 md5 mismatch; 5 unzip fail.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
DEFAULT_DEST="$REPO_ROOT/models/sensevoice_hainan_best_deploy"

DEST="${HAINAN_MODEL_DIR:-$DEFAULT_DEST}"
URL="${HAINAN_MODEL_URL:-}"
EXPECTED_MD5="${HAINAN_MODEL_MD5:-}"
ZIP_PATH="${HAINAN_MODEL_ZIP:-}"

say() { printf '[download_model] %s\n' "$*"; }
die() { printf '[download_model][ERROR] %s\n' "$*" >&2; exit "${2:-1}"; }

if [[ -z "$URL" && -z "$ZIP_PATH" ]]; then
  cat <<'EOF' >&2
HAINAN_MODEL_URL is required.

Example:
  HAINAN_MODEL_URL="https://your-cloud-drive/some/path/sensevoice_hainan_v1_best_deploy.zip" \
  HAINAN_MODEL_MD5=6f112feacbe19d50cd26f3a89bb4e8d4 \
  bash apps/ai-service/download_model.sh

Or, if you already have the zip locally:
  HAINAN_MODEL_ZIP=/tmp/sensevoice_hainan_v1_best_deploy.zip \
  bash apps/ai-service/download_model.sh
EOF
  exit 2
fi

mkdir -p "$(dirname "$DEST")"
TMPDIR="$(mktemp -d -t hainan_model_XXXX)"
trap 'rm -rf "$TMPDIR"' EXIT

if [[ -z "$ZIP_PATH" ]]; then
  ZIP_PATH="$TMPDIR/model.zip"
  say "Downloading from $URL"
  if command -v curl >/dev/null 2>&1; then
    curl -L --fail --progress-bar -o "$ZIP_PATH" "$URL" || die "curl download failed" 3
  elif command -v wget >/dev/null 2>&1; then
    wget --show-progress -O "$ZIP_PATH" "$URL" || die "wget download failed" 3
  else
    die "Neither curl nor wget is installed" 3
  fi
else
  [[ -f "$ZIP_PATH" ]] || die "Local zip not found: $ZIP_PATH" 2
  say "Using local zip: $ZIP_PATH"
fi

if [[ -n "$EXPECTED_MD5" ]]; then
  if command -v md5sum >/dev/null 2>&1; then
    ACTUAL_MD5="$(md5sum "$ZIP_PATH" | awk '{print $1}')"
  elif command -v md5 >/dev/null 2>&1; then
    ACTUAL_MD5="$(md5 -q "$ZIP_PATH")"
  else
    say "No md5 tool found, skipping integrity check."
    ACTUAL_MD5=""
  fi
  if [[ -n "$ACTUAL_MD5" && "$ACTUAL_MD5" != "$EXPECTED_MD5" ]]; then
    die "MD5 mismatch: expected $EXPECTED_MD5 but got $ACTUAL_MD5" 4
  fi
  say "MD5 OK: $ACTUAL_MD5"
fi

say "Extracting to $DEST"
rm -rf "$DEST"
mkdir -p "$DEST"
if ! command -v unzip >/dev/null 2>&1; then
  die "unzip is not installed" 5
fi
# The archive has a top-level best_deploy/ folder; strip it so DEST itself becomes the model root.
unzip -q "$ZIP_PATH" -d "$TMPDIR/extracted" || die "unzip failed" 5
SRC_ROOT="$(find "$TMPDIR/extracted" -maxdepth 2 -type d -name 'best_deploy' | head -1)"
if [[ -z "$SRC_ROOT" ]]; then
  SRC_ROOT="$(find "$TMPDIR/extracted" -maxdepth 1 -mindepth 1 -type d | head -1)"
  [[ -n "$SRC_ROOT" ]] || die "Unexpected zip layout" 5
fi
cp -r "$SRC_ROOT/." "$DEST/"

if [[ ! -f "$DEST/model.pt" ]]; then
  die "Extraction complete but model.pt is missing from $DEST" 5
fi

say "Done. Model is at: $DEST"
say "Next, start the service with:"
printf '    HAINAN_ASR_MODEL_DIR=%q npm run dev:ai\n' "$DEST"
