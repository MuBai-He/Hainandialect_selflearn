<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section subpage-hero">
      <div class="subpage-copy">
        <span class="badge badge-teal">项目使命</span>
        <h1 class="section-display">
          让海南话在今天，
          <br />
          继续被听见、被理解、被重新说出口。
        </h1>
        <p class="section-description">
          言通琼岛不是只把方言做成一个展示页面，而是希望用课程、翻译、档案与 AI
          交互，让一门正在变少被主动使用的地方语言，重新回到日常生活里。
        </p>

        <div class="hero-actions">
          <RouterLink class="button button-primary button-lg" to="/archive">
            进入文化档案
          </RouterLink>
          <RouterLink class="button button-outline button-lg" to="/translate">
            进入基础翻译
          </RouterLink>
        </div>
      </div>

      <aside class="subpage-side-panel mission-side-panel">
        <span class="panel-kicker">项目摘要</span>
        <h2>用一套可学习、可展示、可沉淀的数字产品，让海南话重新回到今天的使用情境。</h2>
        <p>
          我们希望评委在很短时间里看到三件事：这是海南的，这是有文化温度的，这是一个做得认真的 AI 产品。
        </p>

        <div class="metric-grid">
          <article v-for="item in aboutProjectStats" :key="item.label" class="metric-card">
            <strong>{{ item.value }}</strong>
            <span>{{ item.label }}</span>
            <small>{{ item.note }}</small>
          </article>
        </div>
      </aside>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label">三大支柱</span>
        <h2 class="section-title-lg">文化、技术与档案沉淀，不是并列关系，而是同一件事的三个侧面。</h2>
      </div>

      <div class="exhibit-grid">
        <article
          v-for="pillar in aboutPillars"
          :key="pillar.key"
          class="feature-card cultural-card"
          :class="getToneClass(pillar.tone)"
        >
          <span class="badge" :class="badgeTone(pillar.tone)">{{ pillar.badge }}</span>
          <h3>{{ pillar.title }}</h3>
          <p>{{ pillar.description }}</p>

          <ul class="cultural-points">
            <li v-for="point in pillar.points" :key="point">{{ point }}</li>
          </ul>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="surface" />

  <section class="section-band is-surface" data-reveal>
    <div class="page-section">
      <div class="section-headline section-headline-row">
        <div>
          <span class="section-label">项目进程</span>
          <h2 class="section-title-lg">从立项到 Web 第一版，我们更关心“能不能真的被看懂和用起来”。</h2>
        </div>
      </div>

      <div class="timeline-grid">
        <article v-for="item in aboutMilestones" :key="item.year" class="timeline-card">
          <span class="timeline-year">{{ item.year }}</span>
          <h3>{{ item.title }}</h3>
          <p>{{ item.description }}</p>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="dark" />

  <section class="section-band is-dark" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label section-label-teal">方法路径</span>
        <h2 class="story-title">
          把地方语言重新点亮，
          <br />
          需要内容、结构和技术一起工作。
        </h2>
      </div>

      <div class="process-grid">
        <article v-for="step in aboutProcessSteps" :key="step.index" class="process-card">
          <span class="process-index">{{ step.index }}</span>
          <h3>{{ step.title }}</h3>
          <p>{{ step.description }}</p>
        </article>
      </div>

      <div class="dark-cta-panel">
        <div>
          <span class="badge badge-gold">继续浏览</span>
          <h3>如果你想更快理解这个项目，最值得接着看的两页是文化档案与基础翻译。</h3>
        </div>
        <div class="hero-actions">
          <RouterLink class="button button-accent button-md" to="/archive">文化档案</RouterLink>
          <RouterLink class="button button-outline button-md" to="/translate">基础翻译</RouterLink>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { RouterLink } from "vue-router";
import WaveDivider from "../components/WaveDivider.vue";
import {
  aboutMilestones,
  aboutPillars,
  aboutProcessSteps,
  aboutProjectStats,
} from "../lib/extended-pages-content";
import { getToneClass } from "../lib/brand-content";

function badgeTone(tone) {
  if (tone === "teal") return "badge-teal";
  if (tone === "gold") return "badge-gold";
  return "badge-coral";
}
</script>
