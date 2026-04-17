#!/usr/bin/env bash
# Start the Hainan dialect ai-service.
#
# Usage:
#   ./apps/ai-service/start.sh           # CPU, auto-discover model, port 8081
#   HAINAN_ASR_DEVICE=cuda:0 ./apps/ai-service/start.sh
#   HAINAN_ASR_MODEL_DIR=/path/to/custom ./apps/ai-service/start.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MONOREPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Default to the model trained in the sibling FunASRfinetune-c project.
FINETUNE_ROOT="${HAINAN_PROJECT_ROOT:-${MONOREPO_ROOT%/*}}"
: "${HAINAN_ASR_MODEL_DIR:=${FINETUNE_ROOT}/hainan_asr/outputs/sensevoice_hainan_run1_noSynth/best_deploy}"
: "${HAINAN_PROJECT_ROOT:=${FINETUNE_ROOT}}"
: "${HAINAN_ASR_DEVICE:=cpu}"
: "${HAINAN_AI_PORT:=8001}"
: "${HAINAN_AI_HOST:=0.0.0.0}"

export HAINAN_ASR_MODEL_DIR HAINAN_PROJECT_ROOT HAINAN_ASR_DEVICE

echo "[ai-service] model_dir = $HAINAN_ASR_MODEL_DIR"
echo "[ai-service] device    = $HAINAN_ASR_DEVICE"
echo "[ai-service] binding   = $HAINAN_AI_HOST:$HAINAN_AI_PORT"

exec python -m uvicorn app.main:app \
    --host "$HAINAN_AI_HOST" --port "$HAINAN_AI_PORT" \
    --app-dir "$SCRIPT_DIR"
