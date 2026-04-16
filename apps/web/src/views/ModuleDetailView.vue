<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section detail-hero">
      <div class="detail-hero-main">
        <div class="detail-hero-badges">
          <span class="badge" :class="badgeTone(selectedModule.tone)">
            {{ selectedModule.icon }} {{ selectedModule.title }}
          </span>
          <span class="badge" :class="getDifficultyTone(selectedModule.difficulty)">
            {{ selectedModule.difficulty }}
          </span>
        </div>

        <h1 class="section-display">{{ selectedModule.title }}</h1>
        <p class="section-description">{{ selectedModule.description }}</p>

        <div class="hero-actions">
          <RouterLink class="button button-primary button-lg" :to="firstLessonLink">
            开始学习 →
          </RouterLink>
          <RouterLink class="button button-outline button-lg" to="/learning">
            返回学习中心
          </RouterLink>
        </div>

        <div class="detail-meta-grid">
          <article class="detail-meta-card">
            <span>规划课程</span>
            <strong>{{ selectedModule.lessons }}</strong>
            <small>围绕同一场景渐进展开</small>
          </article>
          <article class="detail-meta-card">
            <span>当前展示</span>
            <strong>{{ selectedLessons.length }}</strong>
            <small>优先展示代表性精选课程</small>
          </article>
          <article class="detail-meta-card">
            <span>学习建议</span>
            <strong>{{ selectedModule.difficulty }}</strong>
            <small>建议先学关键词再进入短句</small>
          </article>
        </div>
      </div>

      <aside class="detail-side-card" :class="getToneClass(selectedModule.tone)">
        <span class="section-label">模块导览</span>
        <h2>从高频场景开口，把语言重新带回生活。</h2>
        <p>
          {{ sideStory }}
        </p>

        <div class="detail-side-list">
          <div v-for="lesson in selectedLessons.slice(0, 3)" :key="lesson.id" class="detail-side-item">
            <strong>{{ lesson.title }}</strong>
            <span>{{ lesson.estimatedMinutes }} 分钟</span>
          </div>
        </div>
      </aside>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section">
      <div class="section-headline section-headline-row">
        <div>
          <span class="section-label">精选课程</span>
          <h2 class="section-title-lg">让每一课都能在真实生活里立刻用上。</h2>
        </div>
        <span v-if="noticeMessage" class="inline-note">{{ noticeMessage }}</span>
      </div>

      <div class="detail-lesson-grid">
        <article v-for="lesson in selectedLessons" :key="lesson.id" class="lesson-brand-card">
          <div class="lesson-brand-head">
            <span class="badge" :class="badgeTone(selectedModule.tone)">{{ lesson.estimatedMinutes }} 分钟</span>
            <span class="badge" :class="statusTone(lesson.status)">
              {{ statusLabel(lesson.status) }}
            </span>
          </div>

          <h3>{{ lesson.title }}</h3>
          <p>{{ lesson.summary }}</p>

          <div class="lesson-brand-preview">
            <div v-if="lesson.terms?.[0]">
              <strong>{{ lesson.terms[0].mandarinText }}</strong>
              <span>{{ lesson.terms[0].hainanText }}</span>
            </div>
            <div v-if="lesson.sentences?.[0]">
              <small>{{ lesson.sentences[0].mandarinText }}</small>
            </div>
          </div>

          <RouterLink class="module-card-link" :to="`/learning/lesson/${lesson.routeId ?? lesson.id}`">
            进入课程 →
          </RouterLink>
        </article>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed, onMounted, ref, watch } from "vue";
import { RouterLink, useRoute } from "vue-router";
import WaveDivider from "../components/WaveDivider.vue";
import { fetchLearningModuleDetail } from "../api/learning";
import {
  getDifficultyTone,
  getModuleBySlug,
  getStatusTone,
  getToneClass,
  scenarioModules,
} from "../lib/brand-content";
import { isAuthenticated } from "../lib/session";

const route = useRoute();
const remoteModule = ref(null);
const noticeMessage = ref("");

const fallbackModule = computed(() => getModuleBySlug(String(route.params.moduleId)));

const selectedModule = computed(() => {
  if (remoteModule.value) {
    const toneFallback =
      scenarioModules[(Number(route.params.moduleId) - 1 + scenarioModules.length) % scenarioModules.length] ||
      scenarioModules[0];

    return {
      slug: toneFallback.slug,
      title: remoteModule.value.title,
      description: remoteModule.value.description,
      lessons: Math.max(remoteModule.value.lessons.length, toneFallback.lessons),
      difficulty: difficultyLabel(remoteModule.value.level),
      tone: toneFallback.tone,
      icon: toneFallback.icon,
      lessonsPreview: remoteModule.value.lessons.map((lesson) => ({
        ...lesson,
        routeId: lesson.id,
        difficulty: difficultyLabel(lesson.difficulty),
      })),
    };
  }

  return fallbackModule.value ?? scenarioModules[0];
});

const selectedLessons = computed(
  () => selectedModule.value.lessonsPreview ?? [],
);

const firstLessonLink = computed(() => {
  const firstLesson = selectedLessons.value[0];
  return firstLesson ? `/learning/lesson/${firstLesson.routeId ?? firstLesson.id}` : "/learning";
});

const sideStory = computed(() => {
  if (selectedModule.value.slug === "festival") {
    return "节庆里藏着地方记忆。先把祝福语和仪式表达学会，更容易理解海南文化的情感纹理。";
  }
  if (selectedModule.value.slug === "medical") {
    return "关键时刻，会说最重要。先记住症状和求助表达，语言就会在真正需要时发挥价值。";
  }
  return "先学高频表达，再进入完整短句，你会更容易把这门语言真正说出口。";
});

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

function statusLabel(status) {
  if (status === "completed") return "已完成";
  if (status === "in_progress") return "学习中";
  return "待开始";
}

function statusTone(status) {
  return getStatusTone(status);
}

async function loadRemoteModule() {
  const routeId = String(route.params.moduleId);
  if (!/^\d+$/.test(routeId)) {
    remoteModule.value = null;
    noticeMessage.value = "当前展示为策展版课程内容。";
    return;
  }

  try {
    remoteModule.value = await fetchLearningModuleDetail(routeId, isAuthenticated());
    noticeMessage.value = "已接入后端课程数据。";
  } catch {
    remoteModule.value = null;
    noticeMessage.value = "已切换为策展版课程内容。";
  }
}

onMounted(loadRemoteModule);
watch(() => route.params.moduleId, loadRemoteModule);
</script>
