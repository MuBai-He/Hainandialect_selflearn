# AI Service(海南话 ASR)

基于 FastAPI 的服务,承载项目微调好的 **SenseVoice-Small** 海南话语音识别模型,
同时保留原有的文本翻译 / 发音评分桩接口。

## 接口一览

| Method | Path | 用途 |
|---|---|---|
| GET | `/health` | 服务健康 + ASR 引擎加载状态 |
| POST | `/v1/asr/offline` | 文件上传(multipart)→ 识别 + 方言注释 |
| POST | `/v1/asr/offline-base64` | JSON + base64 音频 → 等价的离线识别 |
| WebSocket | `/v1/asr/stream` | 流式识别:客户端发 int16 PCM,返回 partial / final |
| GET | `/v1/vocab` | 内置海南话对照词典预览(供前端提示用) |
| POST | `/v1/translate` | 普通话 ↔ 海南话字文本翻译(走词典) |
| POST | `/v1/pronunciation/score` | 按长度启发式打分(老桩,未动) |
| POST | `/v1/recommendations` | 静态推荐接口(老桩,未动) |

### `/v1/asr/offline*` 返回结构

```json
{
  "mandarin": "苹果。",
  "hainan_char": "苹果",
  "hainan_pinyin": "pêng-kó",
  "representation_source": "curated",   // "curated" | "character_compose" | "mandarin_pinyin_fallback"
  "in_dict": true,
  "language_detected": "zh",
  "duration_ms": 1835,
  "inference_ms": 131,
  "raw_token_text": "<|zh|><|NEUTRAL|><|Speech|><|withitn|>苹果。"
}
```

### WebSocket 协议(`/v1/asr/stream`)

客户端 → 服务端:
1. (可选)文本帧:`{"sample_rate": 16000, "language": "auto"}`
2. 二进制帧:int16 单声道 PCM,采样率要和上面保持一致(服务端会把非 16k 自动重采样)
3. (可选)文本帧:`{"event": "eos"}` 触发收尾,服务端返回 `final` 后主动关闭连接

服务端 → 客户端(文本 JSON 帧):
```
{ "type": "partial", "mandarin": "...", "hainan_char": "...", ... }
{ "type": "final",   "mandarin": "...", "hainan_char": "...", ... }
{ "type": "error",   "detail": "..." }
```

## 模型下载

模型文件(893MB 的 `model.pt` + tokenizer/config 等 6 个文件)**不在仓库里**,因为
GitHub 单文件上限 100MB。项目作者把模型打包发到自己的网盘/云空间,用之前需要先下载。

### 模型版本

| 文件 | 大小 | MD5 | 说明 |
|---|---|---|---|
| **`sensevoice_hainan_v4_best_deploy.zip`** | **828 MB** | `392142e369437a8a0ce605589af81667` | **推荐(最新 v4 最终版)** ,加入 267 条长句数据训练,valid CER 0.22,同说话人长句几乎 100% 正确 |
| `sensevoice_hainan_v1_best_deploy.zip` | 828 MB | `6f112feacbe19d50cd26f3a89bb4e8d4` | v1,只用单词训练,valid CER 0.47 |
| `sensevoice_hainan_v2_best_deploy.zip` | 828 MB | `ca6f77bb40c4ca49d1d01d8a05a9acbe` | v2,v1 + 拼接合成,valid CER 0.49 |

> 👉 下载链接请找项目作者索取(网盘/云空间)。默认用 **v4** 即可;v1/v2 只在
> A/B 对比时才需要。启动时 `HAINAN_ASR_MODEL_DIR` 指向解压后的 `best_deploy/` 目录。

### 质量对比(valid 集 56 条未见词 + 50 条已见词采样)

| Pipeline | 未见 CER | 未见 exact | 已见 CER | 已见 exact |
|---|---|---|---|---|
| old_fun_asr (原始老模型) | 1.48 | 18% | 1.32 | 12% |
| baseline_sensevoice (上游) | 1.20 | 14% | 1.10 | 14% |
| v1 | 0.47 | 36% | 0.09 | 86% |
| v2 | 0.49 | 36% | 0.05 | 90% |
| **v4** | **0.22** | **68%** | **0.00** | **100%** |

注意 v4 的短板:**对训练说话人以外的新说话人泛化较差**(男声 / 孩童声 测试 CER 飙到 0.7)。
这是单说话人训练数据的结构性限制,推理时变声的各种 trick 都救不了。想根治必须收多说话人数据。

### 用 `download_model.sh` 半自动下载(推荐)

把你拿到的下载直链填到环境变量 `HAINAN_MODEL_URL`,然后:

```bash
HAINAN_MODEL_URL=<你的直链> \
HAINAN_MODEL_MD5=6f112feacbe19d50cd26f3a89bb4e8d4 \
bash apps/ai-service/download_model.sh
```

脚本会下载、校验 MD5、解压到默认位置 `models/sensevoice_hainan_best_deploy/`,
并打印出接下来启动服务时要用的环境变量。

### 手动下载 + 放置

如果直接手动操作,也可以:

```bash
# 1. 从网盘下载并解压
unzip sensevoice_hainan_v1_best_deploy.zip -d /path/to/somewhere

# 2. 启动服务时通过环境变量指向解压出的 best_deploy/
HAINAN_ASR_MODEL_DIR=/path/to/somewhere/best_deploy npm run dev:ai
```

建议的目录布局(方便服务自动发现):

```
Hainandialect_selflearn/
└─ models/
   └─ sensevoice_hainan_best_deploy/    <── 把解压出的 best_deploy 重命名放这里
      ├─ model.pt
      ├─ config.yaml
      ├─ configuration.json
      ├─ am.mvn
      ├─ tokens.json
      └─ chn_jpn_yue_eng_ko_spectok.bpe.model
```

然后就不用显式设 `HAINAN_ASR_MODEL_DIR` 也能跑(加载器会自动发现 `models/` 下的目录)。

## 启动服务

推荐复用训练时搭好的 `hainan_asr` conda 环境(里面已经有 `funasr`、`torch` 等),
只补装本服务的额外依赖:

```bash
conda activate hainan_asr
pip install -r apps/ai-service/requirements.txt

# 最简单:仓库根目录下已有预置脚本
npm run dev:ai                                # 监听 8001

# 或者用辅助脚本(支持 HAINAN_* 环境变量覆盖)
./apps/ai-service/start.sh

# 或者直接起 uvicorn:
python -m uvicorn app.main:app --app-dir apps/ai-service --port 8001 --reload
```

### 环境变量

| 名称 | 默认 | 作用 |
|---|---|---|
| `HAINAN_ASR_MODEL_DIR` | 自动在仓库根目录查找 | 指向 SenseVoice 兼容的模型目录(必须含 `model.pt` / `config.yaml` / `am.mvn` / tokenizer 等) |
| `HAINAN_ASR_DEVICE` | `cpu` | Torch 设备(`cpu`、`cuda:0` 等) |
| `HAINAN_PROJECT_ROOT` | 从 `apps/` 父级推断 | 用于解析默认模型目录 |
| `LOG_LEVEL` | `INFO` | Python 日志级别 |

### 快速自测

```bash
curl -s http://localhost:8001/health | jq
curl -s -F "audio=@dataset/wav/1_pingguo.wav" http://localhost:8001/v1/asr/offline | jq
```

## 模型选择

加载器按顺序尝试以下路径,第一个存在的就采用:

1. `models/sensevoice_hainan_best_deploy/` — 通过 `download_model.sh` 部署的标准位置
2. `hainan_asr/outputs/sensevoice_hainan_run4_sentence/deploy_ep17_cer0p223/` — **v4 最佳快照**(valid CER 0.22)
3. `hainan_asr/outputs/sensevoice_hainan_run4_sentence/best_deploy/` — v4 训练过程中最新 best
4. `hainan_asr/outputs/sensevoice_hainan_run1_noSynth/best_deploy/` — v1 备用
5. `hainan_asr/outputs/sensevoice_hainan_run2_synth/best_deploy/` — v2 备用
6. `models/iic/SenseVoiceSmall/` — 上游基线兜底

需要换模型时设置 `HAINAN_ASR_MODEL_DIR` 指向任意 SenseVoice 兼容目录即可。
