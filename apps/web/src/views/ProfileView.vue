<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section profile-hero-panel">
      <div class="profile-hero-main">
        <div class="profile-header">
          <div class="profile-avatar">{{ avatarInitial }}</div>
          <div>
            <span class="badge badge-teal">个人中心</span>
            <h1 class="section-display">{{ displayProfile.nickname || displayProfile.username }}</h1>
            <p class="section-description">{{ displayProfile.email }}</p>
            <span class="profile-bio">
              {{ displayProfile.bio || "守护语言 · 传承文化 · 言通琼岛" }}
            </span>
          </div>
        </div>

        <div class="hero-actions">
          <RouterLink class="button button-primary button-lg" to="/learning">
            继续学习 →
          </RouterLink>
          <RouterLink class="button button-outline button-lg" to="/dictionary">
            去词典页
          </RouterLink>
        </div>

        <div class="profile-progress-card">
          <div class="progress-headline">
            <span>当前完成率</span>
            <strong>{{ completionRate }}%</strong>
          </div>
          <div class="progress-track">
            <span class="progress-fill progress-fill-teal" :style="{ width: `${completionRate}%` }" />
          </div>
          <small>{{ infoMessage }}</small>
        </div>
      </div>

      <aside class="profile-story-card">
        <span class="section-label">学习档案</span>
        <h2>你收藏的已经不只是一条词语，而是一套可以持续回看的海南话个人资产。</h2>
        <p>
          现在个人中心会同时沉淀课程、翻译记录和重点收藏内容，后面继续往复习系统上接就会顺很多。
        </p>
      </aside>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section">
      <div class="profile-stat-grid">
        <article class="learning-stat-card">
          <span>已完成课程</span>
          <strong>{{ progressDisplay(displayProgress.completedLessons) }}</strong>
          <small>你已经完成的核心学习节数</small>
        </article>
        <article class="learning-stat-card">
          <span>学习中课程</span>
          <strong>{{ progressDisplay(displayProgress.inProgressLessons) }}</strong>
          <small>保持熟悉感最好的方式，是继续把课程往下学完</small>
        </article>
        <article class="learning-stat-card">
          <span>我的收藏</span>
          <strong>{{ progressDisplay(displayFavorites.length) }}</strong>
          <small>现在已经包含课程、翻译和训练集词条收藏</small>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="surface" />

  <section class="section-band is-surface" data-reveal>
    <div class="page-section profile-content-grid">
      <article class="content-panel">
        <div class="section-headline section-headline-row">
          <div>
            <span class="section-label">最近学习</span>
            <h2 class="section-title-lg">继续上次停下来的地方。</h2>
          </div>
        </div>

        <div class="history-list">
          <div v-for="item in displayProgress.recentLessons" :key="item.lessonId" class="history-row">
            <div>
              <strong>{{ item.lessonTitle }}</strong>
              <p>{{ statusText(item.status) }}</p>
            </div>
            <div class="history-side">
              <span class="badge" :class="statusTone(item.status)">{{ statusText(item.status) }}</span>
              <small>{{ formatTime(item.updatedAt) }}</small>
            </div>
          </div>
        </div>
      </article>

      <article class="content-panel">
        <div class="section-headline section-headline-row">
          <div>
            <span class="section-label">我的收藏</span>
            <h2 class="section-title-lg">把重要表达留给下一次复习。</h2>
          </div>
        </div>

        <div class="history-list">
          <div v-for="item in displayFavorites" :key="item.id" class="history-row">
            <div>
              <strong>{{ item.title }}</strong>
              <p>{{ item.subtitle || favoriteTypeText(item.favoriteType) }}</p>
            </div>
            <div class="history-side">
              <span class="badge badge-coral">{{ favoriteTypeText(item.favoriteType) }}</span>
              <small>{{ formatTime(item.createdAt) }}</small>
            </div>
          </div>
        </div>
      </article>

    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section">
      <article class="content-panel">
        <div class="section-headline section-headline-row">
          <div>
            <span class="section-label">翻译历史</span>
            <h2 class="section-title-lg">你最近查过的表达，会变成下一次开口的底气。</h2>
          </div>
        </div>

        <div class="history-grid">
          <article v-for="item in displayHistory" :key="item.id" class="history-card">
            <small>{{ historyDirectionLabel(item) }}</small>
            <strong>{{ item.sourceText }}</strong>
            <span>{{ item.targetText }}</span>
            <p>{{ formatTime(item.createdAt) }}</p>
          </article>
        </div>
      </article>
    </div>
  </section>
</template>

<script setup>
import { computed, onMounted, ref } from "vue";
import { RouterLink } from "vue-router";
import WaveDivider from "../components/WaveDivider.vue";
import { fetchTranslationHistory } from "../api/translate";
import {
  fetchCurrentUser,
  fetchFavorites,
  fetchLearningProgress,
} from "../api/user";
import { fallbackProfileState, getStatusTone } from "../lib/brand-content";
import { sessionState } from "../lib/session";

const profile = ref(null);
const progress = ref(null);
const favorites = ref([]);
const history = ref([]);
const infoMessage = ref("演示数据与真实数据会在这里自动融合。");

const displayProfile = computed(() => ({
  ...fallbackProfileState.profile,
  ...(sessionState.user ?? {}),
  ...(profile.value ?? {}),
}));

const displayProgress = computed(() => {
  const source = progress.value;
  if (
    source &&
    ((source.completedLessons ?? 0) > 0 ||
      (source.inProgressLessons ?? 0) > 0 ||
      source.recentLessons?.length)
  ) {
    return source;
  }
  return fallbackProfileState.progress;
});

const displayFavorites = computed(() =>
  favorites.value.length ? favorites.value : fallbackProfileState.favorites,
);

const displayHistory = computed(() =>
  history.value.length ? history.value : fallbackProfileState.history,
);

const completionRate = computed(() => {
  const completed = displayProgress.value.completedLessons ?? 0;
  const inProgress = displayProgress.value.inProgressLessons ?? 0;
  const total = completed + inProgress;
  if (!total) return 68;
  return Math.round((completed / total) * 100);
});

const avatarInitial = computed(() =>
  (displayProfile.value.nickname || displayProfile.value.username || "琼")
    .slice(0, 1)
    .toUpperCase(),
);

function progressDisplay(value) {
  return value > 0 ? String(value) : "——";
}

function statusText(status) {
  if (status === "completed") return "已完成";
  if (status === "in_progress") return "学习中";
  return "待开始";
}

function statusTone(status) {
  return getStatusTone(status);
}

function favoriteTypeText(type) {
  if (type === "lesson") return "课程";
  if (type === "sentence") return "短句";
  if (type === "translation_record") return "翻译";
  if (type === "dictionary_entry") return "词条";
  return "收藏";
}

function historyDirectionLabel(item) {
  return item.sourceLang === "mandarin" ? "普通话 → 海南话" : "海南话 → 普通话";
}

function formatTime(value) {
  if (!value) return "";
  return new Date(value).toLocaleString("zh-CN", { hour12: false });
}

async function loadProfileData() {
  try {
    const [profileData, progressData, favoriteData, historyData] = await Promise.all([
      fetchCurrentUser(),
      fetchLearningProgress(),
      fetchFavorites(),
      fetchTranslationHistory(0, 6),
    ]);

    profile.value = profileData;
    progress.value = progressData;
    favorites.value = favoriteData || [];
    history.value = historyData.items || [];
    infoMessage.value = "已接入你的个人学习数据。";
  } catch {
    infoMessage.value = "当前展示项目演示数据，登录并产生操作后会自动切换为真实记录。";
  }
}

onMounted(loadProfileData);
</script>
