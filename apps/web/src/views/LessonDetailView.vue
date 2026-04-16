<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section detail-hero">
      <div class="detail-hero-main">
        <div class="detail-hero-badges">
          <span class="badge" :class="badgeTone(moduleTone)">
            {{ moduleTitle }}
          </span>
          <span class="badge" :class="getDifficultyTone(selectedLesson.difficulty)">
            {{ selectedLesson.difficulty }}
          </span>
        </div>

        <h1 class="section-display">{{ selectedLesson.title }}</h1>
        <p class="section-description">{{ selectedLesson.summary }}</p>

        <div class="hero-actions">
          <button class="button button-primary button-lg" type="button" @click="handleComplete">
            {{ submitLabel }}
          </button>
          <button class="button button-outline button-lg" type="button" @click="handleFavoriteLesson">
            {{ favoriteLabel }}
          </button>
          <RouterLink class="button button-text button-lg" :to="moduleLink">
            返回模块
          </RouterLink>
        </div>

        <div class="detail-meta-grid">
          <article class="detail-meta-card">
            <span>核心词汇</span>
            <strong>{{ selectedLesson.terms.length }}</strong>
            <small>用关键词先建立表达认知</small>
          </article>
          <article class="detail-meta-card">
            <span>场景短句</span>
            <strong>{{ selectedLesson.sentences.length }}</strong>
            <small>把词汇放回真实生活语境</small>
          </article>
          <article class="detail-meta-card">
            <span>学习时长</span>
            <strong>{{ selectedLesson.estimatedMinutes }}</strong>
            <small>碎片时间也能完整学完一课</small>
          </article>
        </div>
      </div>

      <aside class="detail-side-card" :class="getToneClass(moduleTone)">
        <span class="section-label">课程重点</span>
        <h2>先把词汇记住，再进入完整句子会更容易开口。</h2>
        <p>建议先读普通话理解语义，再记海南话表达，最后跟读一遍短句。</p>

        <div class="detail-side-list">
          <div v-if="selectedLesson.terms[0]" class="detail-side-item">
            <strong>{{ selectedLesson.terms[0].mandarinText }}</strong>
            <span>{{ selectedLesson.terms[0].hainanText }}</span>
          </div>
          <div v-if="selectedLesson.sentences[0]" class="detail-side-item">
            <strong>{{ selectedLesson.sentences[0].mandarinText }}</strong>
            <span>{{ selectedLesson.sentences[0].hainanText }}</span>
          </div>
        </div>
      </aside>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section detail-content-grid">
      <article class="content-panel">
        <div class="section-headline section-headline-row">
          <div>
            <span class="section-label">词汇学习</span>
            <h2 class="section-title-lg">先掌握这组最常用的高频词。</h2>
          </div>
        </div>

        <div class="language-stack">
          <div v-for="term in selectedLesson.terms" :key="term.id" class="language-item">
            <div>
              <strong>{{ term.mandarinText }}</strong>
              <span>{{ term.hainanText }}</span>
            </div>
            <small>{{ term.pinyinNote || term.meaningNote }}</small>
          </div>
        </div>
      </article>

      <article class="content-panel">
        <div class="section-headline section-headline-row">
          <div>
            <span class="section-label">短句练习</span>
            <h2 class="section-title-lg">把词汇放进生活里的真实说法。</h2>
          </div>
        </div>

        <div class="sentence-stack">
          <div v-for="sentence in selectedLesson.sentences" :key="sentence.id" class="sentence-item">
            <strong>{{ sentence.mandarinText }}</strong>
            <span>{{ sentence.hainanText }}</span>
            <small>{{ sentence.meaningNote || "高频生活场景短句" }}</small>
          </div>
        </div>
      </article>
    </div>
  </section>

  <WaveDivider tone="surface" />

  <section class="section-band is-surface" data-reveal>
    <div class="page-section">
      <div class="lesson-step-grid">
        <article class="learning-step-card">
          <div class="learning-step-head">
            <span class="learning-step-index">01</span>
            <span class="learning-step-icon">👀</span>
          </div>
          <h3>先看意思</h3>
          <p>快速确认普通话含义，先把信息理解准确。</p>
        </article>
        <article class="learning-step-card">
          <div class="learning-step-head">
            <span class="learning-step-index">02</span>
            <span class="learning-step-icon">🗣</span>
          </div>
          <h3>再记说法</h3>
          <p>聚焦最短最常说的海南话表达，先把嘴边词练熟。</p>
        </article>
        <article class="learning-step-card">
          <div class="learning-step-head">
            <span class="learning-step-index">03</span>
            <span class="learning-step-icon">⭐</span>
          </div>
          <h3>最后形成记录</h3>
          <p>完成课程、收藏重点内容，后续复习效率会高很多。</p>
        </article>
      </div>

      <div v-if="message" class="message-banner">
        {{ message }}
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed, onMounted, ref, watch } from "vue";
import { RouterLink, useRoute, useRouter } from "vue-router";
import WaveDivider from "../components/WaveDivider.vue";
import { completeLesson, fetchLessonDetail } from "../api/learning";
import { addFavorite } from "../api/user";
import {
  getDifficultyTone,
  getLessonById,
  getToneClass,
} from "../lib/brand-content";
import { isAuthenticated } from "../lib/session";

const route = useRoute();
const router = useRouter();
const remoteLesson = ref(null);
const message = ref("");
const submitting = ref(false);
const favoriting = ref(false);

const fallbackLesson = computed(() => getLessonById(String(route.params.lessonId)));
const selectedLesson = computed(() => {
  if (remoteLesson.value) {
    return {
      ...remoteLesson.value,
      difficulty: difficultyLabel(remoteLesson.value.difficulty),
      terms: remoteLesson.value.terms ?? [],
      sentences: remoteLesson.value.sentences ?? [],
    };
  }

  return fallbackLesson.value ?? {
    id: "demo-lesson",
    title: "课程预览",
    summary: "当前课程内容正在整理中。",
    difficulty: "入门",
    estimatedMinutes: 12,
    terms: [],
    sentences: [],
  };
});

const moduleTitle = computed(() => fallbackLesson.value?.moduleTitle ?? "课程详情");
const moduleTone = computed(() => fallbackLesson.value?.moduleTone ?? "coral");
const moduleLink = computed(
  () => `/learning/module/${remoteLesson.value?.moduleId ?? fallbackLesson.value?.moduleSlug ?? "greetings"}`,
);
const isRemoteLesson = computed(() => Boolean(remoteLesson.value));
const submitLabel = computed(() => (submitting.value ? "正在标记..." : "标记为已完成"));
const favoriteLabel = computed(() => (favoriting.value ? "正在收藏..." : "收藏课程"));

function difficultyLabel(value) {
  if (value === "beginner" || value === "入门") return "入门";
  if (value === "intermediate" || value === "进阶") return "进阶";
  return "实用";
}

function badgeTone(tone) {
  if (tone === "teal") return "badge-teal";
  if (tone === "gold") return "badge-gold";
  return "badge-coral";
}

async function loadRemoteLesson() {
  const routeId = String(route.params.lessonId);
  if (!/^\d+$/.test(routeId)) {
    remoteLesson.value = null;
    return;
  }

  try {
    remoteLesson.value = await fetchLessonDetail(routeId, isAuthenticated());
  } catch {
    remoteLesson.value = null;
  }
}

async function handleComplete() {
  if (!isRemoteLesson.value) {
    message.value = "当前为展示课程，正式进度将在后端课程接入后保存。";
    return;
  }

  if (!isAuthenticated()) {
    router.push({ name: "login", query: { redirect: route.fullPath } });
    return;
  }

  submitting.value = true;
  message.value = "";

  try {
    await completeLesson(route.params.lessonId);
    message.value = "课程已标记为完成。";
    await loadRemoteLesson();
  } catch (err) {
    message.value = err.message || "课程进度更新失败。";
  } finally {
    submitting.value = false;
  }
}

async function handleFavoriteLesson() {
  if (!isRemoteLesson.value) {
    message.value = "演示课程暂不写入收藏，你可以继续浏览完整设计。";
    return;
  }

  if (!isAuthenticated()) {
    router.push({ name: "login", query: { redirect: route.fullPath } });
    return;
  }

  favoriting.value = true;
  message.value = "";

  try {
    await addFavorite({
      favoriteType: "lesson",
      targetId: Number(route.params.lessonId),
    });
    message.value = "课程已加入收藏。";
  } catch (err) {
    message.value = err.message || "收藏课程失败。";
  } finally {
    favoriting.value = false;
  }
}

onMounted(loadRemoteLesson);
watch(() => route.params.lessonId, loadRemoteLesson);
</script>
