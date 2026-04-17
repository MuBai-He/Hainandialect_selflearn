<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section">
      <div class="translate-hero">
        <div>
          <span class="badge badge-teal">海南话识别</span>
          <h1 class="section-display">
            说海南话，
            <br />
            同时看到普通话和海南话字的对照。
          </h1>
          <p class="section-description">
            这里用的是项目最新微调的 SenseVoice-Small 海南话模型。支持实时麦克风识别和上传音频离线识别，
            结果会同步给出普通话汉字、海南话字形、以及参考的 Peng'im 拼音。
          </p>
          <p class="footnote" v-if="engineStatus">
            引擎状态：<strong>{{ engineStatus.status }}</strong>
            <span v-if="engineStatus.model_dir"> · 模型：<code>{{ shortPath(engineStatus.model_dir) }}</code></span>
            <span v-if="engineStatus.device"> · 设备：{{ engineStatus.device }}</span>
          </p>
          <p class="footnote" v-else-if="engineError">
            引擎状态：<strong style="color:#c0392b;">无法连接到 AI 服务</strong>
            <br />
            <small>请检查 <code>ai-service</code> 是否已启动，默认地址 <code>{{ aiBaseLabel }}</code>，可通过
              <code>VITE_AI_SERVICE_URL</code> 环境变量覆盖。</small>
          </p>
        </div>
      </div>

      <div class="translate-grid">
        <!-- LEFT: recording & upload controls -->
        <article class="translator-panel">
          <div class="direction-switcher">
            <button
              class="button button-chip"
              :class="{ 'is-active': mode === 'stream' }"
              type="button"
              @click="setMode('stream')"
            >
              实时麦克风识别
            </button>

            <button
              class="button button-chip"
              :class="{ 'is-active': mode === 'offline' }"
              type="button"
              @click="setMode('offline')"
            >
              离线录音 / 上传识别
            </button>
          </div>

          <!-- STREAM MODE -->
          <div v-if="mode === 'stream'" class="stream-controls">
            <p class="field-label">实时识别</p>
            <p class="footnote">
              点击下方按钮开始录音。说话期间每 0.8 秒会回传一次中间结果，结果区会持续刷新。停止后会给出最终识别。
            </p>
            <div class="button-stack">
              <button
                class="button button-primary button-lg button-full"
                type="button"
                :disabled="engineError || streaming || connecting"
                @click="startStreaming"
                v-if="!streaming"
              >
                {{ connecting ? "连接中..." : "🎙 开始实时识别" }}
              </button>
              <button
                v-else
                class="button button-outline-accent button-lg button-full"
                type="button"
                @click="stopStreaming"
              >
                ⏹ 停止并收尾
              </button>
            </div>
            <div class="textarea-shell" v-if="streaming">
              <label class="field-label">录音强度</label>
              <div class="meter-bar">
                <div class="meter-bar-fill" :style="{ width: meterPercent + '%' }" />
              </div>
              <span class="textarea-counter">{{ meterPercent }}%</span>
            </div>
          </div>

          <!-- OFFLINE MODE -->
          <div v-if="mode === 'offline'" class="offline-controls">
            <p class="field-label">方式一：麦克风录一段</p>
            <div class="button-stack">
              <button
                class="button button-primary button-lg button-full"
                type="button"
                :disabled="engineError || recording"
                @click="startRecording"
                v-if="!recording"
              >
                🎙 开始录音
              </button>
              <button
                v-else
                class="button button-outline-accent button-lg button-full"
                type="button"
                @click="stopRecording"
              >
                ⏹ 停止（录了 {{ recordingDuration.toFixed(1) }} 秒）
              </button>
            </div>

            <div class="textarea-shell" style="margin-top:1.4rem;">
              <label class="field-label" for="audioUpload">方式二：上传音频文件</label>
              <input
                id="audioUpload"
                ref="fileInputRef"
                type="file"
                accept="audio/*"
                @change="handleFilePicked"
                :disabled="engineError"
              />
              <span class="textarea-counter" v-if="pickedFileName">{{ pickedFileName }}</span>
            </div>

            <div v-if="pendingBlobUrl" style="margin-top:1rem;">
              <audio :src="pendingBlobUrl" controls style="width:100%;" />
            </div>

            <div class="button-stack" v-if="pendingBlob">
              <button
                class="button button-primary button-lg button-full"
                type="button"
                :disabled="recognizing"
                @click="submitOffline"
              >
                {{ recognizing ? "识别中..." : "🚀 提交给模型识别" }}
              </button>
            </div>
          </div>

          <div v-if="message" class="message-banner">{{ message }}</div>
        </article>

        <!-- RIGHT: recognition result card -->
        <article class="result-panel">
          <div class="result-panel-head">
            <div>
              <span class="section-kicker">识别结果</span>
              <h2>{{ hasResult ? "识别完成" : "等待语音输入" }}</h2>
            </div>
            <span class="badge badge-teal">{{ modeLabel }}</span>
          </div>

          <div class="result-output-card">
            <small>海南话 → 普通话</small>
            <strong>{{ display.mandarin || "请在左侧说话或上传音频" }}</strong>
            <span v-if="display.in_dict" class="footnote">
              （词典匹配 · 置信度高）
            </span>
          </div>

          <div class="result-output-card" style="margin-top:1rem;">
            <small>海南话字形（对照，来自词典）</small>
            <strong>{{ display.hainan_char || "—" }}</strong>
            <span class="footnote">
              {{ display.hainan_pinyin || "等识别结束后自动补上 Peng'im 拼音" }}
            </span>
          </div>

          <div class="pronunciation-actions">
            <button class="button button-teal button-md button-wave" type="button"
                    :disabled="!display.mandarin" @click="playTts">
              🔊 试听普通话
            </button>
            <button class="icon-action" type="button" @click="copyResult" :disabled="!display.mandarin">
              📋 复制结果
            </button>
            <button class="icon-action" type="button" @click="clearResult" :disabled="!display.mandarin">
              🧽 清空
            </button>
          </div>

          <div class="translate-example-block" v-if="recentHistory.length">
            <span class="section-kicker">会话历史</span>
            <ul class="history-inline">
              <li v-for="item in recentHistory" :key="item.id">
                <strong>{{ item.mandarin }}</strong>
                <span>{{ item.hainan_char }}</span>
                <small>{{ item.meta }}</small>
              </li>
            </ul>
          </div>

          <div class="advice-card">
            <strong>数据小提示</strong>
            <p>
              当前微调模型基于 695 条孤立短词录音，所以<strong>已见词准确率 ~90%</strong>，未见词 ~36%，长句连续说话仍不稳定。
              录音请尽量一句一个词 / 短语，录完再停。
            </p>
          </div>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal v-if="vocab.length">
    <div class="page-section">
      <div class="section-headline section-headline-row">
        <div>
          <span class="section-label">词典预览</span>
          <h2 class="section-title-lg">模型熟悉的词：{{ vocab.length }} 条 · 以下是前几十条示例</h2>
        </div>
      </div>

      <div class="history-grid">
        <article v-for="(item, idx) in vocabPreview" :key="idx" class="history-card">
          <small>普通话</small>
          <strong>{{ item.mandarin }}</strong>
          <span>{{ item.hainan_char }}</span>
          <p>{{ item.hainan_pinyin }}</p>
        </article>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed, onMounted, onBeforeUnmount, reactive, ref } from "vue";
import WaveDivider from "../components/WaveDivider.vue";
import {
  AI_SERVICE_URL,
  checkAiServiceHealth,
  fetchVocab,
  openStreamSocket,
  recognizeOffline,
} from "../api/asr";
import { createMicRecorder } from "../lib/wav-recorder";

const mode = ref("stream");
const message = ref("");
const engineStatus = ref(null);
const engineError = ref(false);
const vocab = ref([]);
const recentHistory = ref([]);
let historySeq = 0;

// STREAM state ---------------
const streaming = ref(false);
const connecting = ref(false);
const meterPercent = ref(0);
let streamRecorder = null;
let streamSocket = null;

// OFFLINE state --------------
const recording = ref(false);
const recordingDuration = ref(0);
const pendingBlob = ref(null);
const pendingBlobUrl = ref("");
const pickedFileName = ref("");
const recognizing = ref(false);
const fileInputRef = ref(null);
let offlineRecorder = null;
let recordStartTs = 0;
let recordTicker = null;

// Latest displayed recognition
const display = reactive({
  mandarin: "",
  hainan_char: "",
  hainan_pinyin: "",
  in_dict: false,
});

const hasResult = computed(() => Boolean(display.mandarin));
const modeLabel = computed(() =>
  mode.value === "stream" ? "实时识别" : "离线识别",
);
const aiBaseLabel = computed(() => AI_SERVICE_URL || "http://localhost:8081");
const vocabPreview = computed(() => vocab.value.slice(0, 24));

function setMode(next) {
  if (mode.value === next) return;
  // Gracefully tear down anything the previous mode was doing.
  if (streaming.value) stopStreaming();
  if (recording.value) stopRecording();
  mode.value = next;
  message.value = "";
}

function shortPath(p) {
  if (!p) return "";
  const parts = String(p).split("/");
  if (parts.length <= 4) return p;
  return ".../" + parts.slice(-3).join("/");
}

function applyResult(payload, {meta = ""} = {}) {
  if (!payload) return;
  display.mandarin = payload.mandarin || "";
  display.hainan_char = payload.hainan_char || "";
  display.hainan_pinyin = payload.hainan_pinyin || "";
  display.in_dict = Boolean(payload.in_dict);
  if (payload.mandarin) {
    recentHistory.value.unshift({
      id: ++historySeq,
      mandarin: payload.mandarin,
      hainan_char: payload.hainan_char || payload.mandarin,
      meta,
    });
    if (recentHistory.value.length > 8) recentHistory.value.length = 8;
  }
}

// ================= STREAM =================

async function startStreaming() {
  message.value = "";
  connecting.value = true;
  try {
    streamSocket = openStreamSocket({ sampleRate: 16000, language: "auto" });
    streamSocket.events.addEventListener("partial", (ev) => {
      applyResult(ev.detail, { meta: "partial" });
    });
    streamSocket.events.addEventListener("final", (ev) => {
      applyResult(ev.detail, { meta: "final" });
    });
    streamSocket.events.addEventListener("error", () => {
      message.value = "WebSocket 传输错误，请重试。";
    });
    streamSocket.events.addEventListener("close", () => {
      if (streaming.value) {
        // Unexpected remote close
        streaming.value = false;
        connecting.value = false;
      }
    });
    await streamSocket._waitOpen();

    streamRecorder = await createMicRecorder({
      onPCM: (int16) => {
        if (streamSocket && streamSocket.isOpen()) streamSocket.sendPCM(int16);
        updateMeter(int16);
      },
    });
    streaming.value = true;
  } catch (err) {
    message.value = err?.message || "启动实时识别失败。";
    stopStreaming();
  } finally {
    connecting.value = false;
  }
}

async function stopStreaming() {
  streaming.value = false;
  meterPercent.value = 0;
  try {
    if (streamSocket) streamSocket.sendEOS();
  } catch {}
  try {
    if (streamRecorder) await streamRecorder.stop();
  } catch {}
  streamRecorder = null;
  // Leave the WS open briefly so the server's 'final' message can arrive.
  setTimeout(() => {
    try { streamSocket?.close(); } catch {}
    streamSocket = null;
  }, 1500);
}

function updateMeter(int16) {
  // Fast RMS for a quick level indicator — good enough for user feedback.
  let sum = 0;
  for (let i = 0; i < int16.length; i++) sum += int16[i] * int16[i];
  const rms = Math.sqrt(sum / int16.length) / 32768;
  // -60..-10 dBFS maps to 0..100%
  const db = 20 * Math.log10(rms + 1e-6);
  const pct = Math.max(0, Math.min(100, Math.round(((db + 60) / 50) * 100)));
  meterPercent.value = pct;
}

// ================= OFFLINE =================

async function startRecording() {
  message.value = "";
  try {
    offlineRecorder = await createMicRecorder();
    recording.value = true;
    recordStartTs = Date.now();
    recordingDuration.value = 0;
    recordTicker = setInterval(() => {
      recordingDuration.value = (Date.now() - recordStartTs) / 1000;
    }, 100);
  } catch (err) {
    message.value = err?.message || "打开麦克风失败。";
  }
}

async function stopRecording() {
  if (!offlineRecorder) return;
  recording.value = false;
  if (recordTicker) { clearInterval(recordTicker); recordTicker = null; }
  let blob;
  try {
    blob = await offlineRecorder.stop();
  } catch (err) {
    message.value = err?.message || "保存录音失败。";
    return;
  } finally {
    offlineRecorder = null;
  }
  pickedFileName.value = `mic_${new Date().toISOString().slice(0, 19)}.wav`;
  assignPendingBlob(blob);
}

function handleFilePicked(ev) {
  const file = ev.target.files?.[0];
  if (!file) return;
  pickedFileName.value = file.name;
  assignPendingBlob(file);
}

function assignPendingBlob(blob) {
  if (pendingBlobUrl.value) URL.revokeObjectURL(pendingBlobUrl.value);
  pendingBlob.value = blob;
  pendingBlobUrl.value = URL.createObjectURL(blob);
}

async function submitOffline() {
  if (!pendingBlob.value) return;
  recognizing.value = true;
  message.value = "";
  try {
    const payload = await recognizeOffline(pendingBlob.value);
    applyResult(payload, { meta: `${payload.duration_ms}ms/${payload.inference_ms}ms` });
    message.value = `识别完成（${payload.duration_ms}ms 音频 · 推理 ${payload.inference_ms}ms）`;
  } catch (err) {
    message.value = err?.message || "离线识别失败。";
  } finally {
    recognizing.value = false;
  }
}

function playTts() {
  const text = display.mandarin;
  if (!text || !window.speechSynthesis) {
    message.value = "当前浏览器不支持语音播放。";
    return;
  }
  const utter = new SpeechSynthesisUtterance(text);
  utter.lang = "zh-CN";
  window.speechSynthesis.cancel();
  window.speechSynthesis.speak(utter);
}

async function copyResult() {
  if (!display.mandarin) return;
  try {
    await navigator.clipboard.writeText(
      `${display.mandarin}\n${display.hainan_char}\n${display.hainan_pinyin}`,
    );
    message.value = "已复制普通话 / 海南话字 / 拼音。";
  } catch {
    message.value = "复制失败，请手动复制。";
  }
}

function clearResult() {
  display.mandarin = "";
  display.hainan_char = "";
  display.hainan_pinyin = "";
  display.in_dict = false;
  if (pendingBlobUrl.value) URL.revokeObjectURL(pendingBlobUrl.value);
  pendingBlob.value = null;
  pendingBlobUrl.value = "";
  pickedFileName.value = "";
  if (fileInputRef.value) fileInputRef.value.value = "";
}

// ================= LIFECYCLE =================

onMounted(async () => {
  try {
    engineStatus.value = await checkAiServiceHealth();
    if (engineStatus.value.status !== "ok") {
      message.value = "AI 服务已连接，但 ASR 模型未就绪，请检查后端日志。";
    }
  } catch (err) {
    engineError.value = true;
    engineStatus.value = null;
  }
  try {
    const v = await fetchVocab();
    vocab.value = v?.entries || [];
  } catch { /* non-fatal */ }
});

onBeforeUnmount(() => {
  if (streaming.value) stopStreaming();
  if (recording.value) stopRecording();
  if (pendingBlobUrl.value) URL.revokeObjectURL(pendingBlobUrl.value);
});
</script>

<style scoped>
.meter-bar {
  position: relative;
  height: 0.6rem;
  background: rgba(0, 0, 0, 0.08);
  border-radius: 999px;
  overflow: hidden;
  margin-top: 0.4rem;
}
.meter-bar-fill {
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  background: linear-gradient(90deg, #34d399, #f59e0b, #ef4444);
  transition: width 80ms linear;
}
.history-inline {
  list-style: none;
  padding: 0;
  margin: 0;
  display: grid;
  gap: 0.4rem;
}
.history-inline li {
  display: flex;
  gap: 0.6rem;
  align-items: baseline;
  padding: 0.4rem 0.6rem;
  border-radius: 0.5rem;
  background: rgba(255, 255, 255, 0.65);
}
.history-inline strong { font-size: 1.05rem; }
.history-inline span { color: #1f6a6b; }
.history-inline small { margin-left: auto; color: #6b7280; font-size: 0.8rem; }
</style>
