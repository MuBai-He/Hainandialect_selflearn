<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section subpage-hero">
      <div class="subpage-copy">
        <span class="badge badge-coral">学习报告</span>
        <h1 class="section-display">
          {{ learnerName }} 的学习轨迹，
          <br />
          正在把语言重新变成日常能力。
        </h1>
        <p class="section-description">
          这份报告把学习进度、翻译记录、收藏内容和近期习惯放在同一张页面里，让“学过什么”和“下一步学什么”都变得清晰。
        </p>
      </div>

      <aside class="subpage-side-panel">
        <span class="panel-kicker">本期概览</span>
        <div class="metric-grid">
          <article class="metric-card">
            <strong>{{ reportSummary.completedLessons }}</strong>
            <span>已完成课程</span>
            <small>完成度已经形成稳定学习节奏</small>
          </article>
          <article class="metric-card">
            <strong>{{ reportSummary.inProgressLessons }}</strong>
            <span>进行中课程</span>
            <small>说明学习已经开始向多个场景扩展</small>
          </article>
          <article class="metric-card">
            <strong>{{ reportSummary.favoriteCount }}</strong>
            <span>已收藏内容</span>
            <small>收藏越多，复习路径越清楚</small>
          </article>
          <article class="metric-card">
            <strong>{{ reportSummary.translationCount }}</strong>
            <span>翻译记录</span>
            <small>高频输入内容可直接反映真实需求</small>
          </article>
        </div>
      </aside>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section report-grid">
      <div class="report-panel">
        <div class="section-headline section-headline-row">
          <div>
            <span class="section-label">学习热力</span>
            <h2 class="section-title-lg">最近四周的节奏，已经从“偶尔看看”变成“持续接触”。</h2>
          </div>
        </div>

        <div class="activity-grid" aria-hidden="true">
          <span
            v-for="(value, index) in reportWeeklyActivity"
            :key="index"
            class="activity-cell"
            :class="activityLevel(value)"
          />
        </div>
      </div>

      <div class="report-panel">
        <div class="section-headline section-headline-row">
          <div>
            <span class="section-label">学习亮点</span>
            <h2 class="section-title-lg">把最近已经形成的优势，继续放大。</h2>
          </div>
        </div>

        <div class="report-highlight-list">
          <article v-for="item in reportHighlights" :key="item.title" class="highlight-card">
            <span>{{ item.title }}</span>
            <strong>{{ item.value }}</strong>
            <small>{{ item.note }}</small>
          </article>
        </div>
      </div>
    </div>
  </section>

  <WaveDivider tone="surface" />

  <section class="section-band is-surface" data-reveal>
    <div class="page-section">
      <div class="section-headline section-headline-row">
        <div>
          <span class="section-label">近期沉淀</span>
          <h2 class="section-title-lg">学习报告不只是数字，也包括你已经留下的语言痕迹。</h2>
        </div>
      </div>

      <div class="report-grid">
        <div class="report-panel">
          <h3>最近课程</h3>
          <div class="report-highlight-list">
            <article
              v-for="item in fallbackProfileState.progress.recentLessons"
              :key="item.lessonId"
              class="highlight-card"
            >
              <span>{{ item.lessonTitle }}</span>
              <strong>{{ item.status === "completed" ? "已完成" : "进行中" }}</strong>
              <small>{{ item.updatedAt.slice(0, 10) }}</small>
            </article>
          </div>
        </div>

        <div class="report-panel">
          <h3>已获成就</h3>
          <div class="badge-collection">
            <article
              v-for="item in reportBadges"
              :key="item.title"
              class="badge-collection-card"
              :class="getToneClass(item.tone)"
            >
              <span class="badge" :class="badgeTone(item.tone)">{{ item.title }}</span>
              <p>{{ item.description }}</p>
            </article>
          </div>
        </div>
      </div>
    </div>
  </section>

  <WaveDivider tone="dark" />

  <section class="section-band is-dark" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label section-label-teal">下一步建议</span>
        <h2 class="story-title">
          你已经有了基础节奏，
          <br />
          下一步要把表达推进到更完整的场景里。
        </h2>
      </div>

      <div class="story-preview-grid">
        <article v-for="module in nextModules" :key="module.slug" class="story-preview-card">
          <span class="badge" :class="badgeTone(module.tone)">{{ module.title }}</span>
          <h3>{{ module.description }}</h3>
          <RouterLink class="story-link" :to="`/learning/module/${module.slug}`">
            去学这个模块 →
          </RouterLink>
        </article>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed } from "vue";
import { RouterLink } from "vue-router";
import WaveDivider from "../components/WaveDivider.vue";
import { getToneClass, scenarioModules, fallbackProfileState } from "../lib/brand-content";
import { sessionState } from "../lib/session";
import {
  reportBadges,
  reportHighlights,
  reportSummary,
  reportWeeklyActivity,
} from "../lib/extended-pages-content";

const learnerName = computed(
  () =>
    sessionState.user?.nickname ||
    sessionState.user?.username ||
    reportSummary.learnerName,
);

const nextModules = computed(() => scenarioModules.slice(1, 4));

function activityLevel(value) {
  if (value >= 7) return "is-strong";
  if (value >= 5) return "is-medium";
  if (value >= 3) return "is-light";
  return "is-soft";
}

function badgeTone(tone) {
  if (tone === "teal") return "badge-teal";
  if (tone === "gold") return "badge-gold";
  return "badge-coral";
}
</script>
