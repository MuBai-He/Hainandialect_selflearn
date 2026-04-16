<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section learning-header">
      <div class="learning-header-copy">
        <span class="badge badge-teal">学习中心</span>
        <h1 class="section-display">
          从高频生活场景开始，
          <br />
          把海南话一步步学进日常里。
        </h1>
        <p class="section-description">
          当前版本优先提供最适合入门的学习模块，让第一次接触海南话的人也能快速找到开口路径。
        </p>
      </div>

      <div class="learning-stat-grid">
        <article class="learning-stat-card">
          <span>模块总数</span>
          <strong>8</strong>
          <small>覆盖日常闭环、交流、点餐、出行等高频场景</small>
        </article>
        <article class="learning-stat-card">
          <span>课程总数</span>
          <strong>156</strong>
          <small>每个模块聚焦最容易直接上手的使用主题</small>
        </article>
        <article class="learning-stat-card">
          <span>已完成</span>
          <strong>{{ completedDisplay }}</strong>
          <small>{{ authenticated ? "已接入你的学习记录" : "登录后可保存学习进度" }}</small>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="surface" />

  <section class="section-band is-surface" data-reveal>
    <div class="page-section">
      <div class="learning-step-row">
        <article v-for="step in steps" :key="step.index" class="learning-step-card">
          <div class="learning-step-head">
            <span class="learning-step-index">{{ step.index }}</span>
            <span class="learning-step-icon">{{ step.icon }}</span>
          </div>
          <h3>{{ step.title }}</h3>
          <p>{{ step.description }}</p>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section">
      <div class="section-headline section-headline-row">
        <div>
          <span class="section-label">全部模块</span>
          <h2 class="section-title-lg">围绕真实生活，把高频场景拆成更容易坚持的学习路径。</h2>
        </div>
        <span v-if="errorMessage" class="inline-note">{{ errorMessage }}</span>
      </div>

      <div class="module-grid">
        <article
          v-for="module in displayModules"
          :key="module.slug"
          class="module-brand-card"
        >
          <div class="module-top-strip" :class="getToneClass(module.tone)" />
          <div class="module-card-icon" :class="getToneClass(module.tone)">{{ module.icon }}</div>
          <h3>{{ module.title }}</h3>
          <p>{{ module.description }}</p>

          <div class="module-card-meta">
            <span>{{ module.lessons }} 节</span>
            <span class="badge" :class="getDifficultyTone(module.difficulty)">
              {{ module.difficulty }}
            </span>
          </div>

          <RouterLink
            class="module-card-link"
            :to="`/learning/module/${module.routeId}`"
          >
            开始学习 →
          </RouterLink>
        </article>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed, onMounted, ref } from "vue";
import { RouterLink } from "vue-router";
import WaveDivider from "../components/WaveDivider.vue";
import { fetchLearningModules } from "../api/learning";
import {
  getDifficultyTone,
  getToneClass,
  scenarioModules,
} from "../lib/brand-content";
import { isAuthenticated } from "../lib/session";

const authenticated = isAuthenticated();
const remoteModules = ref([]);
const errorMessage = ref("");

const steps = [
  {
    index: "01",
    icon: "🧭",
    title: "先选模块",
    description: "从最贴近日常的场景切入，降低第一次学习的心理门槛。",
  },
  {
    index: "02",
    icon: "📝",
    title: "再学词句",
    description: "先记关键词，再看完整短句，把表达一步步学进嘴边。",
  },
  {
    index: "03",
    icon: "📚",
    title: "最后形成记录",
    description: "把进度、收藏和翻译历史留下来，形成真正可复用的学习资产。",
  },
];

const displayModules = computed(() =>
  scenarioModules.map((module, index) => {
    const remote = remoteModules.value[index];
    return {
      ...module,
      routeId: remote?.id ?? module.slug,
      completedLessonCount: remote?.completedLessonCount ?? null,
    };
  }),
);

const completedDisplay = computed(() => {
  if (!authenticated) return "——";

  const totalCompleted = remoteModules.value.reduce(
    (sum, item) => sum + (item.completedLessonCount ?? 0),
    0,
  );

  return totalCompleted > 0 ? String(totalCompleted) : "——";
});

async function loadRemoteModules() {
  try {
    remoteModules.value = await fetchLearningModules(authenticated);
    errorMessage.value = "";
  } catch {
    remoteModules.value = [];
    errorMessage.value = authenticated
      ? "已切换为演示课程视图。"
      : "";
  }
}

onMounted(loadRemoteModules);
</script>
