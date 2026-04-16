<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section">
      <div class="translate-hero">
        <div>
          <span class="badge badge-coral">基础翻译</span>
          <h1 class="section-display">
            把高频词和短句，做成
            <br />
            一个真正顺手的双向翻译入口。
          </h1>
        </div>
      </div>

      <div class="translate-grid">
        <article class="translator-panel">
          <div class="direction-switcher">
            <button
              class="button button-chip"
              :class="{ 'is-active': sourceLang === 'mandarin' }"
              type="button"
              @click="setDirection('mandarin', 'hainan')"
            >
              普通话 → 海南话
            </button>

            <button
              class="swap-button"
              type="button"
              :style="{ transform: `rotate(${swapRotation}deg)` }"
              @click="swapDirections"
              aria-label="切换翻译方向"
            >
              ⇌
            </button>

            <button
              class="button button-chip"
              :class="{ 'is-active': sourceLang === 'hainan' }"
              type="button"
              @click="setDirection('hainan', 'mandarin')"
            >
              海南话 → 普通话
            </button>
          </div>

          <div class="textarea-shell">
            <label class="field-label" for="translateText">输入内容</label>
            <textarea
              id="translateText"
              v-model="text"
              class="textarea textarea-warm"
              :placeholder="placeholderText"
            />
            <span class="textarea-counter">{{ charCount }} 字</span>
          </div>

          <div class="translate-quick-bar">
            <span class="section-kicker">常用短句</span>
            <div class="pill-row">
              <button
                v-for="item in fillExamples"
                :key="item"
                class="pill-button"
                type="button"
                @click="applyExample(item)"
              >
                {{ item }}
              </button>
            </div>
          </div>

          <div class="auth-footer">
            <span class="footnote">当前方向：{{ directionLabel }}</span>
            <RouterLink
              v-if="!authenticated"
              class="text-link"
              :to="{ name: 'login', query: { redirect: '/translate' } }"
            >
              登录后同步历史
            </RouterLink>
          </div>

          <div class="button-stack">
            <button class="button button-primary button-lg button-full" type="button" @click="handleTranslate" :disabled="loading">
              {{ loading ? "正在翻译..." : "开始翻译" }}
            </button>
            <button
              class="button button-outline-accent button-lg button-full"
              type="button"
              @click="handleFavoriteResult"
              :disabled="favoriteLoading || !result?.recordId"
            >
              {{ favoriteLoading ? "正在收藏..." : "收藏结果" }}
            </button>
          </div>

          <div v-if="message" class="message-banner">
            {{ message }}
          </div>
        </article>

        <article class="result-panel">
          <div class="result-panel-head">
            <div>
              <span class="section-kicker">翻译结果</span>
              <h2>{{ result ? "结果已生成" : "等待输入内容" }}</h2>
            </div>
            <span class="badge badge-teal">{{ directionLabel }}</span>
          </div>

          <div class="result-output-card">
            <small>{{ result?.sourceText || "原文会显示在这里" }}</small>
            <strong>{{ result?.targetText || "先输入一个高频短句试试" }}</strong>
            <span>{{ resultPinyin }}</span>
          </div>

          <div class="pronunciation-actions">
            <button class="button button-teal button-md button-wave" type="button" @click="playPronunciation">
              🔊 播放海南话发音
            </button>
            <button class="icon-action" type="button" @click="copyResult">📋 复制结果</button>
            <button class="icon-action" type="button" @click="handleFavoriteResult">⭐ 收藏</button>
          </div>

          <div class="translate-example-block">
            <span class="section-kicker">快捷示例</span>
            <div class="pill-row">
              <button
                v-for="item in displayExamples"
                :key="item"
                class="pill-button"
                type="button"
                @click="applyExample(item)"
              >
                {{ item }}
              </button>
            </div>
          </div>

          <div class="advice-card">
            <strong>先用最短表达，结果会更稳定。</strong>
            <p>优先输入“你好”“谢谢”“多少钱”这类高频短句，第一版的匹配效果会更好。</p>
          </div>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section">
      <div class="section-headline section-headline-row">
        <div>
          <span class="section-label">翻译历史</span>
          <h2 class="section-title-lg">把你查过的表达沉淀下来，后面复习会更快。</h2>
        </div>
      </div>

      <div class="history-grid" v-if="authenticated && history.length">
        <article v-for="item in history" :key="item.id" class="history-card">
          <small>{{ historyDirectionLabel(item) }}</small>
          <strong>{{ item.sourceText }}</strong>
          <span>{{ item.targetText }}</span>
          <p>{{ formatTime(item.createdAt) }}</p>
        </article>
      </div>

      <div v-else class="empty-story-card">
        <strong>{{ authenticated ? "翻译历史会出现在这里" : "登录后可以同步翻译历史" }}</strong>
        <p>
          {{ authenticated
            ? "提交几次翻译后，你的高频表达会自动沉淀成可回看的学习记录。"
            : "现在可以先体验翻译，登录后再把历史与收藏统一保存下来。" }}
        </p>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed, onMounted, ref } from "vue";
import { RouterLink, useRouter } from "vue-router";
import WaveDivider from "../components/WaveDivider.vue";
import { fetchTranslationHistory, translateText } from "../api/translate";
import { addFavorite } from "../api/user";
import { quickTranslateExamples } from "../lib/brand-content";
import { sessionState } from "../lib/session";

const router = useRouter();
const sourceLang = ref("mandarin");
const targetLang = ref("hainan");
const text = ref("你好，多少钱？");
const result = ref(null);
const history = ref([]);
const loading = ref(false);
const favoriteLoading = ref(false);
const message = ref("");
const swapRotation = ref(0);

const pinyinMap = {
  "汝好": "Lṳ hó",
  "多谢": "Do xiā",
  "若干钱": "Jiō-gán-chîⁿ",
  "去叨位": "Khì tô-uī",
  "汝好，若干钱？": "Lṳ hó, jiō-gán-chîⁿ?",
  "免客气": "Bián kheh-khì",
};

const authenticated = computed(() => Boolean(sessionState.token));
const charCount = computed(() => text.value.trim().length);
const directionLabel = computed(() =>
  sourceLang.value === "mandarin" ? "普通话 → 海南话" : "海南话 → 普通话",
);
const placeholderText = computed(() =>
  sourceLang.value === "mandarin"
    ? "输入普通话词语或短句…如：你好，多少钱？"
    : "输入海南话词语或短句…如：汝好，若干钱？",
);
const fillExamples = computed(() =>
  sourceLang.value === "mandarin"
    ? quickTranslateExamples.mandarin
    : quickTranslateExamples.hainan,
);
const displayExamples = computed(() =>
  sourceLang.value === "mandarin"
    ? ["你好", "谢谢", "多少钱", "去哪儿"]
    : ["汝好", "多谢", "若干钱", "去叨位"],
);
const resultPinyin = computed(() => {
  if (!result.value?.targetText) {
    return "Lṳ hó, jiō-gán-chîⁿ?";
  }
  return pinyinMap[result.value.targetText] || "拼音示意将随词库持续补充";
});

function setDirection(source, target) {
  sourceLang.value = source;
  targetLang.value = target;
  message.value = "";
}

function swapDirections() {
  const currentSource = sourceLang.value;
  sourceLang.value = targetLang.value;
  targetLang.value = currentSource;
  swapRotation.value += 180;
  result.value = null;
}

function applyExample(example) {
  text.value = example;
}

async function handleTranslate() {
  const value = text.value.trim();
  if (!value) {
    message.value = "请输入需要翻译的词语或短句。";
    return;
  }

  loading.value = true;
  message.value = "";

  try {
    result.value = await translateText(
      {
        sourceLang: sourceLang.value,
        targetLang: targetLang.value,
        text: value,
      },
      authenticated.value,
    );

    if (authenticated.value) {
      await loadHistory();
    }
  } catch (err) {
    message.value = err.message || "翻译失败，请稍后重试。";
  } finally {
    loading.value = false;
  }
}

async function handleFavoriteResult() {
  if (!authenticated.value) {
    router.push({ name: "login", query: { redirect: "/translate" } });
    return;
  }

  if (!result.value?.recordId) {
    message.value = "先完成一次翻译，再收藏结果。";
    return;
  }

  favoriteLoading.value = true;
  message.value = "";

  try {
    await addFavorite({
      favoriteType: "translation_record",
      targetId: result.value.recordId,
    });
    message.value = "翻译结果已收藏。";
  } catch (err) {
    message.value = err.message || "收藏翻译结果失败。";
  } finally {
    favoriteLoading.value = false;
  }
}

function playPronunciation() {
  const textToSpeak = result.value?.targetText || text.value.trim();
  if (!textToSpeak || !window.speechSynthesis) {
    message.value = "当前浏览器不支持语音播放。";
    return;
  }

  const utterance = new SpeechSynthesisUtterance(textToSpeak);
  utterance.lang = "zh-CN";
  window.speechSynthesis.cancel();
  window.speechSynthesis.speak(utterance);
}

async function copyResult() {
  if (!result.value?.targetText) {
    message.value = "先生成翻译结果，再进行复制。";
    return;
  }

  try {
    await navigator.clipboard.writeText(result.value.targetText);
    message.value = "翻译结果已复制。";
  } catch {
    message.value = "复制失败，请手动复制。";
  }
}

async function loadHistory() {
  if (!authenticated.value) {
    history.value = [];
    return;
  }

  try {
    const data = await fetchTranslationHistory(0, 6);
    history.value = data.items || [];
  } catch {
    history.value = [];
  }
}

function historyDirectionLabel(item) {
  return item.sourceLang === "mandarin" ? "普通话 → 海南话" : "海南话 → 普通话";
}

function formatTime(value) {
  if (!value) return "";
  return new Date(value).toLocaleString("zh-CN", { hour12: false });
}

onMounted(loadHistory);
</script>
