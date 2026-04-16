<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section subpage-hero">
      <div class="subpage-copy">
        <div class="detail-hero-badges">
          <span class="badge" :class="badgeTone(moduleData.tone)">{{ moduleData.title }}</span>
          <span class="badge" :class="getDifficultyTone(moduleData.difficulty)">
            {{ moduleData.difficulty }}
          </span>
          <span class="badge badge-gold">{{ moduleData.lessons }} 节课程</span>
        </div>
        <h1 class="section-display">
          {{ moduleData.icon }} {{ moduleData.title }}
          <br />
          <span class="entry-pronunciation">把这个场景学会，就能立刻在生活里用上。</span>
        </h1>
        <p class="section-description">
          {{ moduleData.description }}
        </p>

        <div class="hero-actions">
          <RouterLink class="button button-primary button-lg" :to="`/learning/module/${moduleData.slug}`">
            去模块页学习
          </RouterLink>
          <RouterLink class="button button-outline button-lg" to="/roadmap">
            查看学习路线
          </RouterLink>
        </div>
      </div>

      <aside class="subpage-side-panel">
        <span class="panel-kicker">专题目标</span>
        <div class="report-highlight-list">
          <article class="highlight-card">
            <span>重点词句</span>
            <strong>{{ termCards.length }} 条精选表达</strong>
          </article>
          <article class="highlight-card">
            <span>示例短句</span>
            <strong>{{ sentenceCards.length }} 条高频短句</strong>
          </article>
          <article class="highlight-card">
            <span>适合人群</span>
            <strong>{{ moduleData.difficulty }} 学习者</strong>
          </article>
        </div>
      </aside>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label">推荐课程</span>
        <h2 class="section-title-lg">每一节课都围绕一个可以立刻开口的最小目标设计。</h2>
      </div>

      <div class="detail-lesson-grid">
        <article
          v-for="lesson in moduleData.lessonsPreview"
          :key="lesson.id"
          class="lesson-brand-card"
        >
          <div class="lesson-brand-head">
            <span class="badge" :class="getDifficultyTone(lesson.difficulty)">
              {{ lesson.difficulty }}
            </span>
            <span>{{ lesson.estimatedMinutes }} 分钟</span>
          </div>
          <h3>{{ lesson.title }}</h3>
          <p>{{ lesson.summary }}</p>
          <RouterLink class="module-card-link" :to="`/learning/lesson/${lesson.id}`">
            进入课程 →
          </RouterLink>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="surface" />

  <section class="section-band is-surface" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label">高频词句</span>
        <h2 class="section-title-lg">先记住能用的，再慢慢理解语气和文化细节。</h2>
      </div>

      <div class="phrase-grid">
        <article v-for="item in termCards" :key="item.id" class="phrase-card">
          <span>{{ item.mandarinText }}</span>
          <strong>{{ item.hainanText }}</strong>
          <small>{{ item.pinyinNote }}</small>
        </article>
        <article v-for="item in sentenceCards" :key="item.id" class="phrase-card">
          <span>{{ item.mandarinText }}</span>
          <strong>{{ item.hainanText }}</strong>
          <small>{{ item.meaningNote }}</small>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="dark" />

  <section class="section-band is-dark" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label section-label-teal">下一站推荐</span>
        <h2 class="story-title">
          场景学习最有效的方式，
          <br />
          是顺着相邻生活情境继续推进。
        </h2>
      </div>

      <div class="story-preview-grid">
        <article v-for="item in suggestedModules" :key="item.slug" class="story-preview-card">
          <span class="badge" :class="badgeTone(item.tone)">{{ item.title }}</span>
          <h3>{{ item.description }}</h3>
          <RouterLink class="story-link" :to="`/scenarios/${item.slug}`">
            浏览这个专题 →
          </RouterLink>
        </article>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed } from "vue";
import { RouterLink, useRoute } from "vue-router";
import WaveDivider from "../components/WaveDivider.vue";
import {
  getDifficultyTone,
  getModuleBySlug,
  scenarioModules,
} from "../lib/brand-content";
import { getSuggestedModules } from "../lib/extended-pages-content";

const route = useRoute();

const moduleData = computed(() => getModuleBySlug(route.params.scenarioKey) ?? scenarioModules[0]);

const termCards = computed(() =>
  moduleData.value.lessonsPreview.flatMap((lesson) => lesson.terms).slice(0, 4),
);

const sentenceCards = computed(() =>
  moduleData.value.lessonsPreview.flatMap((lesson) => lesson.sentences).slice(0, 4),
);

const suggestedModules = computed(() => getSuggestedModules(moduleData.value.slug));

function badgeTone(tone) {
  if (tone === "teal") return "badge-teal";
  if (tone === "gold") return "badge-gold";
  return "badge-coral";
}
</script>
