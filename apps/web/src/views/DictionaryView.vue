<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section subpage-hero">
      <div class="subpage-copy">
        <span class="badge badge-teal">训练集词典</span>
        <h1 class="section-display">
          把训练集里的词条、
          <br />
          对应 wav 和普通话标注
          <br />
          做成真正可用的海南话词典。
        </h1>
        <p class="section-description">
          现在词典支持直接搜普通话词语，比如“苹果”“香蕉”，并立刻试听对应的海南话样本音频。后端可用时走真实接口，后端没起时也会自动退化到本地训练集清单，不再整页失效。
        </p>
      </div>

      <aside class="subpage-side-panel dictionary-search-card">
        <span class="panel-kicker">词条检索</span>
        <label class="search-input-wrap">
          <span>按普通话、样本拼写或文件名搜索</span>
          <input
            v-model.trim="query"
            class="field"
            type="text"
            placeholder="例如：苹果 / pingguo / 1_pingguo"
          />
        </label>

        <div class="dictionary-hot-row">
          <button
            v-for="term in hotTerms"
            :key="term"
            class="button button-chip button-sm"
            type="button"
            @click="applyHotTerm(term)"
          >
            {{ term }}
          </button>
        </div>

        <small class="footnote">
          {{ usingFallback ? "当前使用前端本地训练集兜底。" : "当前优先读取后端词典接口。" }}
        </small>
      </aside>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section">
      <div class="section-headline section-headline-row">
        <div>
          <span class="section-label">检索结果</span>
          <h2 class="section-title-lg">
            现在输入一个普通话词语，就能快速定位对应的海南话音频样本。
          </h2>
        </div>
        <span class="inline-note">
          第 {{ page + 1 }} 页 / 共 {{ totalPages }} 页
        </span>
      </div>

      <div class="metric-grid">
        <article class="metric-card">
          <strong>{{ total }}</strong>
          <span>词条总数</span>
          <small>来自 `train.jsonl` 导入的完整训练集词条</small>
        </article>
        <article class="metric-card">
          <strong>{{ entries.length }}</strong>
          <span>当前页结果</span>
          <small>支持普通话、sample key、文件名多字段检索</small>
        </article>
        <article class="metric-card">
          <strong>{{ usingFallback ? "本地" : "接口" }}</strong>
          <span>当前数据源</span>
          <small>{{ usingFallback ? "本地训练集兜底模式" : "后端真实词典接口模式" }}</small>
        </article>
        <article class="metric-card">
          <strong>WAV</strong>
          <span>可直接试听</span>
          <small>输入“苹果”后，不用跳页也可以直接播放对应音频</small>
        </article>
      </div>

      <div v-if="message" class="message-banner">
        {{ message }}
      </div>

      <article v-if="previewEntry" class="surface-card dictionary-preview-card">
        <div class="dictionary-preview-copy">
          <span class="badge badge-coral">当前预览</span>
          <h3 class="dictionary-preview-title">{{ previewEntry.mandarinText }}</h3>
          <p class="dictionary-preview-note">
            样本拼写：{{ previewEntry.pronunciation || previewEntry.sampleKey }} ｜ 文件：{{ previewEntry.fileName }}
          </p>
          <div class="hero-actions">
            <button
              class="button button-primary button-md"
              type="button"
              @click="togglePreview(previewEntry)"
            >
              {{ playingEntryId === previewEntry.id ? "停止播放" : "播放海南话音频" }}
            </button>
          </div>
        </div>

        <div class="dictionary-preview-side">
          <audio
            class="audio-preview-player"
            :src="previewEntry.audioUrl"
            controls
            preload="none"
          />
        </div>
      </article>
    </div>
  </section>

  <WaveDivider tone="surface" />

  <section class="section-band is-surface" data-reveal>
    <div class="page-section">
      <div class="section-headline section-headline-row">
        <div>
          <span class="section-label">词条列表</span>
          <h2 class="section-title-lg">下方每条都可以直接试听，保留高频词条的快速查找与样本对照能力。</h2>
        </div>

        <div class="dictionary-pagination">
          <button
            class="button button-outline button-sm"
            type="button"
            :disabled="page <= 0"
            @click="changePage(page - 1)"
          >
            上一页
          </button>
          <button
            class="button button-outline button-sm"
            type="button"
            :disabled="page >= totalPages - 1"
            @click="changePage(page + 1)"
          >
            下一页
          </button>
        </div>
      </div>

      <div v-if="entries.length" class="dictionary-card-grid">
        <article
          v-for="(entry, index) in entries"
          :key="entry.id"
          class="dictionary-entry-card"
          :class="toneClass(index)"
        >
          <div class="dictionary-entry-head">
            <div>
              <h3>{{ entry.mandarinText }}</h3>
              <span>样本拼写 · {{ entry.pronunciation || entry.sampleKey }}</span>
            </div>
            <span class="badge" :class="badgeTone(index)">
              {{ entry.sampleKey }}
            </span>
          </div>

          <p class="dictionary-entry-meaning">
            对应海南话音频样本：{{ entry.fileName }}。现在可以直接试听，不再依赖单独的词条详情页。
          </p>

          <div class="dictionary-tag-row">
            <span class="demo-tag">普通话词条</span>
            <span class="demo-tag">海南话 wav</span>
            <span class="demo-tag">训练集样本</span>
          </div>

          <div class="dictionary-list-actions">
            <button
              class="button button-outline button-sm"
              type="button"
              @click="togglePreview(entry)"
            >
              {{ playingEntryId === entry.id ? "停止试听" : "试听样本" }}
            </button>
          </div>
        </article>
      </div>

      <div v-else class="empty-story-card dictionary-empty-card">
        <strong>没有找到匹配词条</strong>
        <p>试试直接输入“苹果”“香蕉”这样的普通话词语，或者点击上面的快速检索词。</p>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed, onBeforeUnmount, onMounted, ref, watch } from "vue";
import WaveDivider from "../components/WaveDivider.vue";
import { fetchDictionaryEntries } from "../api/dictionary";
import { audioDataset, searchAudioDataset } from "../lib/audio-dataset";

const pageSize = 24;

const entries = ref([]);
const hotTerms = ref(audioDataset.slice(0, 8).map((item) => item.mandarinText));
const total = ref(audioDataset.length);
const page = ref(0);
const query = ref("");
const message = ref("");
const playingEntryId = ref(null);
const usingFallback = ref(false);

let previewAudio = null;
let searchTimer = null;
let requestToken = 0;

const totalPages = computed(() =>
  Math.max(1, Math.ceil((total.value || 0) / pageSize)),
);

const previewEntry = computed(() => entries.value[0] || null);

function toneClass(index) {
  const tones = ["is-teal", "is-coral", "is-gold"];
  return tones[index % tones.length];
}

function badgeTone(index) {
  const tones = ["badge-teal", "badge-coral", "badge-gold"];
  return tones[index % tones.length];
}

function loadFallbackEntries() {
  const matched = searchAudioDataset(query.value);
  const start = page.value * pageSize;
  const end = start + pageSize;
  entries.value = matched.slice(start, end);
  total.value = matched.length;
  hotTerms.value = audioDataset.slice(0, 8).map((item) => item.mandarinText);
  usingFallback.value = true;
  message.value = "当前后端词典接口不可用，已切换到本地训练集词典模式。";
}

async function loadEntries() {
  const currentToken = ++requestToken;

  if (previewAudio) {
    previewAudio.pause();
    previewAudio.currentTime = 0;
    playingEntryId.value = null;
  }

  try {
    const data = await fetchDictionaryEntries({
      q: query.value,
      page: page.value,
      size: pageSize,
    });

    if (currentToken !== requestToken) return;

    entries.value = data?.items || [];
    hotTerms.value = data?.hotTerms?.length
      ? data.hotTerms
      : audioDataset.slice(0, 8).map((item) => item.mandarinText);
    total.value = data?.total || 0;
    usingFallback.value = false;
    message.value = "";
  } catch {
    if (currentToken !== requestToken) return;
    loadFallbackEntries();
  }
}

function applyHotTerm(term) {
  if (query.value === term) {
    page.value = 0;
    loadEntries();
    return;
  }
  query.value = term;
}

function changePage(nextPage) {
  if (nextPage < 0 || nextPage > totalPages.value - 1) return;
  page.value = nextPage;
  loadEntries();
}

async function togglePreview(entry) {
  if (!previewAudio) return;

  if (playingEntryId.value === entry.id) {
    previewAudio.pause();
    previewAudio.currentTime = 0;
    playingEntryId.value = null;
    return;
  }

  try {
    previewAudio.src = entry.audioUrl;
    previewAudio.currentTime = 0;
    await previewAudio.play();
    playingEntryId.value = entry.id;
    message.value = `正在播放：${entry.mandarinText}（${entry.fileName}）`;
  } catch {
    message.value = "音频播放失败，请确认前端本地音频资源已同步。";
    playingEntryId.value = null;
  }
}

watch(query, () => {
  page.value = 0;

  if (searchTimer) {
    window.clearTimeout(searchTimer);
  }

  searchTimer = window.setTimeout(() => {
    loadEntries();
  }, 220);
});

onMounted(async () => {
  previewAudio = new Audio();
  previewAudio.addEventListener("ended", () => {
    playingEntryId.value = null;
  });
  await loadEntries();
});

onBeforeUnmount(() => {
  if (searchTimer) {
    window.clearTimeout(searchTimer);
  }

  if (previewAudio) {
    previewAudio.pause();
    previewAudio.currentTime = 0;
    previewAudio.src = "";
  }
});
</script>
