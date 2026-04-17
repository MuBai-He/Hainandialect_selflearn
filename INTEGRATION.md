# 海南话自学平台 — 语音识别集成说明

本文档记录在原有 Spring Boot + Vue 单仓库里,接入我们新微调的 Hainanese SenseVoice-Small
模型所做的全部改动。基于此前只放了占位桩的版本。

## 一句话总结

- `apps/ai-service/app/main.py` 不再是 demo 桩。现在真正加载微调后的 SenseVoice 模型,
  对外暴露**离线识别 + 实时流式识别 + 人工维护的普通话↔海南话字对照词典**三组接口。
- `apps/web` 新增页面 `/recognize`(`DialectRecognizerView.vue`),同时支持实时麦克风流
  和离线录音/上传,结果区**同屏显示简体普通话、海南话字形、Peng'im 拼音**。
- Java 后端(`apps/api`)**没有改动**。语音数据直接从浏览器发给 Python ai-service,
  Java 层继续负责鉴权 / 文本翻译 / 用户数据。

## 新增 / 修改的文件

```
Hainandialect_selflearn/
├─ apps/
│  ├─ ai-service/
│  │  ├─ app/
│  │  │  ├─ main.py            # 改写:真实 ASR + WebSocket 流 + 兼容老桩接口
│  │  │  ├─ asr_engine.py      # 新增:加载 SenseVoice + 滑动窗口流式解码器
│  │  │  └─ hainan_dict.py     # 新增:普通话→海南话字/拼音对照词典
│  │  ├─ requirements.txt      # 追加 torch / funasr / soundfile / pypinyin / tiktoken
│  │  ├─ start.sh              # 新增:用 HAINAN_* 环境变量的一键启动脚本
│  │  └─ README.md             # 新增:服务接口完整说明
│  └─ web/
│     ├─ src/
│     │  ├─ api/asr.js                       # 新增:离线 + WebSocket 流式客户端
│     │  ├─ lib/wav-recorder.js              # 新增:AudioWorklet 麦克风 → PCM16/WAV
│     │  ├─ views/DialectRecognizerView.vue  # 新增:语音识别页面
│     │  ├─ router/index.js                  # + 路由 /recognize
│     │  └─ App.vue                          # + 导航 "语音识别"
│     └─ .env.example                        # 新增:记录 VITE_AI_SERVICE_URL
└─ INTEGRATION.md                            # 本文档
```

## 全栈启动步骤

```bash
# 0) MySQL(只有用到 Java 的认证/历史功能才需要)
docker compose up -d mysql

# 1) Python ai-service — 只有这里需要训练好的模型
conda activate hainan_asr                 # 里面已经有 torch + funasr
pip install -r apps/ai-service/requirements.txt
npm run dev:ai                            # 监听 0.0.0.0:8001

# 2) Java 后端(老接口:学习中心、用户中心、文本翻译)
npm run dev:api                           # 监听 0.0.0.0:8080

# 3) Vue 前端
cd apps/web && cp .env.example .env.local
npm run dev                               # 监听 0.0.0.0:5173
```

浏览器打开 `http://localhost:5173/recognize` 即可使用新页面。

## 环境变量一览

| 变量 | 使用方 | 默认 | 作用 |
|---|---|---|---|
| `VITE_API_BASE_URL` | Vue | `http://localhost:8080` | Spring Boot 网关地址 |
| `VITE_AI_SERVICE_URL` | Vue | `http://localhost:8001` | FastAPI ai-service 地址(自动按当前页面 host 推断) |
| `HAINAN_ASR_MODEL_DIR` | ai-service | 自动从同级 `FunASRfinetune-c/hainan_asr/outputs/...` 发现 | 覆盖 ASR 模型路径 |
| `HAINAN_ASR_DEVICE` | ai-service | `cpu` | `cpu` / `cuda:0` 等 |
| `HAINAN_PROJECT_ROOT` | ai-service | 自动推断 | 用于解析默认模型路径 |

## 识别结果返回格式

```json
{
  "mandarin": "葡萄。",
  "hainan_char": "葡萄",
  "hainan_pinyin": "phû-tô",
  "representation_source": "curated",
  "in_dict": true,
  "language_detected": "zh",
  "duration_ms": 1771,
  "inference_ms": 129,
  "raw_token_text": "<|zh|><|NEUTRAL|><|Speech|><|withitn|>葡萄。"
}
```

`representation_source` 告诉前端海南话表示的可信度:
- `curated` — 整句命中了人工维护的对照词典
- `character_compose` — 至少有一个字在词典里,其余原样透出
- `mandarin_pinyin_fallback` — 词典里都没有,拿普通话拼音兜底占位

WebSocket 流式接口返回相同的结构,外层包一个 `{"type": "partial"|"final", ...}`。

## 可以期待的效果

来自微调报告(`hainan_asr/outputs/final_report.md`):

| 场景 | CER | 精确匹配 |
|---|---|---|
| 训练词汇(模型见过) | **0.05–0.09** | **86–90%** |
| 未见的海南话词 | 0.47 | 36% |
| 长句连续说话 | 差 | — |

短词识别效果很好;长句连续说话在我们有更多数据前还不稳。前端会把 `duration_ms` 和
`inference_ms` 一起展示出来,超长/低质量输入很容易被看出来。

## 远程 / 局域网访问

想让同一网段内的其他人(或远程客户端)使用这个页面:

1. **监听所有网卡**(默认已经这么做了):
   - `vite.config.js` 写了 `server.host: "0.0.0.0"` → 前端可以被局域网访问
   - `apps/ai-service/start.sh` 默认 `HAINAN_AI_HOST=0.0.0.0` → ai-service 可被访问
   - Spring Boot 的 `application.yml` 没设置 `server.address`,默认也是 `0.0.0.0`

2. **前端自动发现 ai-service 的 host**:`apps/web/src/api/asr.js` 在 `VITE_AI_SERVICE_URL`
   没设的情况下,会退化到 `http://${window.location.hostname}:8001`。所以远程浏览器
   打开 `http://SERVER_IP:5173/recognize` 会自动把请求发给 `http://SERVER_IP:8001`,
   无需额外配环境变量。

3. **防火墙**:放开 `5173`(Vite)、`8001`(ai-service),以及可选的 `8080`(Spring Boot)。
   ufw 示例:
   ```bash
   sudo ufw allow 5173/tcp
   sudo ufw allow 8001/tcp
   sudo ufw allow 8080/tcp
   ```

4. **查本机 IP**:`hostname -I | awk '{print $1}'`。

5. **HTTPS + WebSocket**:页面如果是 HTTPS,浏览器要求 WebSocket 也必须是 WSS。
   在两个服务前放一层反向代理(nginx/Caddy),统一发到一个 HTTPS 域名,然后在
   `.env.production.local` 设 `VITE_AI_SERVICE_URL=https://your.domain/ai`,前端会
   自动把 `/v1/asr/stream` 重写成 `wss:` 连接。

### 非 localhost 访问的麦克风限制

浏览器的 `getUserMedia`(麦克风 API)只在**安全上下文**(HTTPS 或 localhost)下可用。
直接通过原生 IP 访问(`http://192.168.x.y:5173`)时,Chrome 会拒绝麦克风授权。三种解法:

- 上 HTTPS 反向代理(正式部署推荐)。
- Chrome flags:`chrome://flags/#unsafely-treat-insecure-origin-as-secure`,
  加入目标 IP:端口,重启浏览器(只适合自己临时测)。
- SSH 隧道:`ssh -L 5173:localhost:5173 -L 8001:localhost:8001 user@host`,
  然后本地浏览器开 `http://localhost:5173`,此时 host 是 localhost,安全上下文成立。

## 扩充海南话词典

编辑 `apps/ai-service/app/hainan_dict.py` 里的 `_SEED` 字典。键是简体普通话短语,
值是 `(hainan_char, hainan_pinyin)` 元组。ai-service 重启后新条目即生效。
