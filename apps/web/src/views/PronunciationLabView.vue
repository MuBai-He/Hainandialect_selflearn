<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section subpage-hero">
      <div class="subpage-copy">
        <span class="badge badge-teal">发音实验室</span>
        <h1 class="section-display">
          让海南话音频样本
          <br />
          先稳定地回到普通话文字，
          <br />
          再继续往真正 ASR 推理升级。
        </h1>
        <p class="section-description">
          这一页现在支持两种模式：后端可用时走真实识别演示接口；后端没启动时自动切到本地训练集识别模式，依然可以选样本、播音频、返回普通话文字，不会整页坏掉。
        </p>

        <div class="hero-actions">
          <button
            class="button button-primary button-lg"
            type="button"
            :disabled="!activeSample"
            @click="playCurrentAudio"
          >
            播放当前样本
          </button>
          <button
            class="button button-outline button-lg"
            type="button"
            :disabled="recognizing || !activeSample"
            @click="handleRecognize"
          >
            {{ recognizing ? "识别中..." : "识别为普通话文字" }}
          </button>
        </div>

        <div v-if="message" class="message-banner">
          {{ message }}
        </div>
      </div>

      <aside class="subpage-side-panel lab-score-panel">
        <span class="panel-kicker">当前样本</span>
        <h2>{{ activeSample ? activeSample.sampleKey : "等待加载样本" }}</h2>
        <p>{{ activeSample ? activeSample.fileName : "当前没有可用音频样本" }}</p>
        <div class="score-highlight">
          <strong>{{ confidencePercent }}%</strong>
          <span>识别置信度</span>
        </div>
        <div class="heritage-progress">
          <div class="heritage-progress-fill" :style="{ width: `${confidencePercent}%` }" />
        </div>
        <small>
          {{ usingFallback ? "当前为本地训练集识别模式。" : "当前为后端识别演示模式。" }}
        </small>
      </aside>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section lab-layout">
      <div class="lab-selector-card">
        <div class="section-headline section-headline-row">
          <div>
            <span class="section-label">样本列表</span>
            <h2 class="section-title-lg">你现有的海南话 wav 样本，现在可以直接拿来做演示识别。</h2>
          </div>
        </div>

        <div class="lab-chip-grid">
          <button
            v-for="item in samples"
            :key="item.id"
            class="button button-chip button-md"
            :class="{ 'is-active': item.id === activeSampleId }"
            type="button"
            @click="selectSample(item.id)"
          >
            {{ sampleChipLabel(item) }}
          </button>
        </div>

        <div class="lab-mistake-list">
          <h3>当前说明</h3>
          <ul class="cultural-points">
            <li v-for="item in demoNotes" :key="item">{{ item }}</li>
          </ul>
        </div>
      </div>

      <div class="waveform-card">
        <div class="waveform-head">
          <span class="badge badge-teal">样本识别</span>
          <span>{{ activeSample ? activeSample.fileName : "暂无样本" }}</span>
        </div>

        <audio
          ref="audioPlayer"
          class="audio-preview-player"
          :src="activeSample?.audioUrl || ''"
          controls
          preload="none"
        />

        <div class="waveform-bars" aria-hidden="true">
          <span
            v-for="(bar, index) in activeWaveform"
            :key="`${activeSampleId}-${index}`"
            class="waveform-bar"
            :style="{ height: `${bar}%` }"
          />
        </div>

        <div class="result-output-card recognition-result-card">
          <small>{{ recognitionResult ? "识别结果（普通话）" : "点击按钮开始识别" }}</small>
          <strong>{{ recognitionResult?.translatedText || "等待输出普通话文字" }}</strong>
          <span>
            {{
              recognitionResult?.note ||
              "当前版本会优先走后端识别演示接口；若后端不可用，则直接根据本地训练集映射返回普通话标注。"
            }}
          </span>
        </div>

        <div class="recognition-meta-grid">
          <div class="lab-tips-card">
            <h3>当前音频</h3>
            <ul class="cultural-points">
              <li>样本键：{{ activeSample?.sampleKey || "--" }}</li>
              <li>文件名：{{ activeSample?.fileName || "--" }}</li>
              <li>音频地址：{{ activeSample?.audioUrl || "--" }}</li>
            </ul>
          </div>

          <div class="lab-tips-card">
            <h3>识别结果</h3>
            <ul class="cultural-points">
              <li>记录编号：{{ recognitionResult?.recordId || "本地模式无记录" }}</li>
              <li>识别引擎：{{ recognitionResult?.engine || "--" }}</li>
              <li>识别时间：{{ formatTime(recognitionResult?.createdAt) || "等待识别" }}</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>

  <WaveDivider tone="surface" />

  <section class="section-band is-surface" data-reveal>
    <div class="page-section">
      <div class="section-headline section-headline-row">
        <div>
          <span class="section-label">识别记录</span>
          <h2 class="section-title-lg">登录且后端可用时，识别记录会自动沉淀到数据库。</h2>
        </div>
      </div>

      <div v-if="authenticated && recognitionHistory.length" class="history-grid">
        <article v-for="item in recognitionHistory" :key="item.recordId" class="history-card">
          <small>{{ item.fileName }}</small>
          <strong>{{ item.translatedText }}</strong>
          <span>置信度 {{ toPercent(item.confidence) }}%</span>
          <p>{{ formatTime(item.createdAt) }}</p>
        </article>
      </div>

      <div v-else class="empty-story-card">
        <strong>{{ authenticated ? "识别记录会显示在这里" : "登录后可同步识别历史" }}</strong>
        <p>
          {{
            authenticated
              ? "如果后端当前没有启动，这一页仍然可以本地演示识别，但数据库里不会新增记录。"
              : "现在可以先用样本完成音频识别演示；登录并启用后端后，再把记录沉淀下来。"
          }}
        </p>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed, onMounted, ref, watch } from "vue";
import WaveDivider from "../components/WaveDivider.vue";
import { fetchAudioRecognitionHistory, fetchAudioSamples, recognizeAudioSample } from "../api/audio";
import { audioDataset } from "../lib/audio-dataset";
import { sessionState } from "../lib/session";

const audioPlayer = ref(null);
const samples = ref([]);
const activeSampleId = ref(null);
const recognitionResult = ref(null);
const recognitionHistory = ref([]);
const message = ref("");
const recognizing = ref(false);
const usingFallback = ref(false);

const fallbackSamples = audioDataset.slice(0, 50);

const demoNotes = [
  "后端可用时，会调用真实识别演示接口并写入数据库记录。",
  "后端没启动时，会自动切到本地训练集识别模式，不影响你继续演示。",
  "你现在最重要的是保证“选样本 → 播音频 → 返回普通话文字”这条链随时可用。",
];

const authenticated = computed(() => Boolean(sessionState.token));

const activeSample = computed(() => {
  if (!samples.value.length) return null;
  return samples.value.find((item) => item.id === activeSampleId.value) || samples.value[0];
});

const activeWaveform = computed(() => buildWaveform(activeSample.value?.sampleKey || "demo"));

const confidencePercent = computed(() => {
  if (!recognitionResult.value?.confidence) return 98;
  return Math.round(Number(recognitionResult.value.confidence) * 100);
});

function buildWaveform(seed) {
  const text = seed || "demo";
  return Array.from({ length: 12 }, (_, index) => {
    const charCode = text.charCodeAt(index % text.length) || 60;
    return 26 + ((charCode * (index + 3)) % 58);
  });
}

function sampleChipLabel(item) {
  return item.sampleKey.replace(/_/g, " ").slice(0, 18);
}

function toPercent(value) {
  return Math.round(Number(value || 0) * 100);
}

function formatTime(value) {
  if (!value) return "";
  return new Date(value).toLocaleString("zh-CN", { hour12: false });
}

function selectSample(sampleId) {
  activeSampleId.value = sampleId;
  recognitionResult.value = null;
  message.value = "";
  if (audioPlayer.value) {
    audioPlayer.value.pause();
    audioPlayer.value.currentTime = 0;
  }
}

async function playCurrentAudio() {
  if (!activeSample.value || !audioPlayer.value) {
    message.value = "当前没有可播放的音频样本。";
    return;
  }

  try {
    audioPlayer.value.currentTime = 0;
    await audioPlayer.value.play();
    message.value = "";
  } catch {
    message.value = "音频播放失败，请确认前端本地 wav 资源已同步。";
  }
}

async function handleRecognize() {
  if (!activeSample.value) {
    message.value = "请先选择一个音频样本。";
    return;
  }

  recognizing.value = true;
  message.value = "";

  try {
    if (usingFallback.value) {
      recognitionResult.value = {
        recordId: null,
        sampleId: activeSample.value.id,
        sampleKey: activeSample.value.sampleKey,
        fileName: activeSample.value.fileName,
        audioUrl: activeSample.value.audioUrl,
        recognizedText: activeSample.value.mandarinText,
        translatedText: activeSample.value.mandarinText,
        confidence: 0.98,
        engine: "frontend_dataset_lookup",
        note: "当前为前端本地训练集识别模式，结果直接来自 train.jsonl 对应标注。",
        createdAt: new Date().toISOString(),
      };
      message.value = "本地训练集识别成功，已返回普通话文字。";
      return;
    }

    recognitionResult.value = await recognizeAudioSample(activeSample.value.id, authenticated.value);
    message.value = "样本识别成功，普通话文字结果已经返回。";
    if (authenticated.value) {
      await loadRecognitionHistory();
    }
  } catch {
    usingFallback.value = true;
    recognitionResult.value = {
      recordId: null,
      sampleId: activeSample.value.id,
      sampleKey: activeSample.value.sampleKey,
      fileName: activeSample.value.fileName,
      audioUrl: activeSample.value.audioUrl,
      recognizedText: activeSample.value.mandarinText,
      translatedText: activeSample.value.mandarinText,
      confidence: 0.98,
      engine: "frontend_dataset_lookup",
      note: "后端识别接口暂时不可用，已自动切换到前端本地训练集识别模式。",
      createdAt: new Date().toISOString(),
    };
    message.value = "后端暂时不可用，已自动切换到本地训练集识别模式。";
  } finally {
    recognizing.value = false;
  }
}

async function loadSamples() {
  try {
    const data = await fetchAudioSamples();
    samples.value = data?.length ? data : fallbackSamples;
    usingFallback.value = !data?.length;
    if (samples.value.length && !activeSampleId.value) {
      activeSampleId.value = samples.value[0].id;
    }
  } catch {
    samples.value = fallbackSamples;
    usingFallback.value = true;
    activeSampleId.value = samples.value[0]?.id ?? null;
    message.value = "后端样本接口不可用，已切换到前端本地训练集模式。";
  }
}

async function loadRecognitionHistory() {
  if (!authenticated.value || usingFallback.value) {
    recognitionHistory.value = [];
    return;
  }

  try {
    const data = await fetchAudioRecognitionHistory(0, 6);
    recognitionHistory.value = data.items || [];
  } catch {
    recognitionHistory.value = [];
  }
}

watch(
  () => sessionState.token,
  () => {
    loadRecognitionHistory();
  },
);

onMounted(async () => {
  await loadSamples();
  await loadRecognitionHistory();
});
</script>
