<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section subpage-hero">
      <div class="subpage-copy">
        <span class="badge badge-teal">学习路线</span>
        <h1 class="section-display">
          把海南话学进日常，
          <br />
          更需要一条清楚的路线，而不是零散地刷内容。
        </h1>
        <p class="section-description">
          学习路线页把模块顺序、阶段目标和成果感连接起来，让用户知道为什么先学什么、学完之后能立刻用在哪里。
        </p>
      </div>

      <aside class="subpage-side-panel">
        <span class="panel-kicker">路线原则</span>
        <div class="report-highlight-list">
          <article v-for="item in roadmapPrinciples" :key="item.title" class="highlight-card">
            <span>{{ item.title }}</span>
            <strong>{{ item.description }}</strong>
          </article>
        </div>
      </aside>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label">分阶段学习</span>
        <h2 class="section-title-lg">从敢开口，到能应对场景，再到更复杂的交流，学习应该一段段推进。</h2>
      </div>

      <div class="roadmap-stage-grid">
        <article
          v-for="stage in roadmapStages"
          :key="stage.id"
          class="roadmap-stage-card"
          :class="getToneClass(stage.tone)"
        >
          <span class="badge" :class="badgeTone(stage.tone)">{{ stage.badge }}</span>
          <h3>{{ stage.title }}</h3>
          <p>{{ stage.goal }}</p>
          <div class="module-card-meta">
            <span>{{ stage.duration }}</span>
            <span>{{ stage.modules.length }} 个模块</span>
          </div>

          <div class="roadmap-pill-row">
            <span
              v-for="module in getRoadmapModules(stage)"
              :key="module.slug"
              class="demo-tag"
            >
              {{ module.title }}
            </span>
          </div>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="surface" />

  <section class="section-band is-surface" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label">阶段成果</span>
        <h2 class="section-title-lg">每一个阶段都应该留下明确的“我现在能做什么”。</h2>
      </div>

      <div class="roadmap-flow-grid">
        <article
          v-for="stage in roadmapStages"
          :key="`${stage.id}-outcomes`"
          class="timeline-card"
        >
          <span class="timeline-year">{{ stage.duration }}</span>
          <h3>{{ stage.title }}</h3>
          <ul class="cultural-points">
            <li v-for="outcome in stage.outcomes" :key="outcome">{{ outcome }}</li>
          </ul>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="dark" />

  <section class="section-band is-dark" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label section-label-teal">立即开始</span>
        <h2 class="story-title">
          如果你是第一次进入，
          <br />
          建议从“日常问候”开始。
        </h2>
      </div>

      <div class="dark-cta-panel">
        <div>
          <span class="badge badge-gold">推荐起点</span>
          <h3>先用最短的表达建立成就感，再逐步进入点餐、出行和购物等真实场景。</h3>
        </div>
        <div class="hero-actions">
          <RouterLink class="button button-primary button-md" to="/scenarios/greetings">
            去看场景专题
          </RouterLink>
          <RouterLink class="button button-outline button-md" to="/learning">
            返回学习中心
          </RouterLink>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { RouterLink } from "vue-router";
import WaveDivider from "../components/WaveDivider.vue";
import { getToneClass } from "../lib/brand-content";
import {
  getRoadmapModules,
  roadmapPrinciples,
  roadmapStages,
} from "../lib/extended-pages-content";

function badgeTone(tone) {
  if (tone === "teal") return "badge-teal";
  if (tone === "gold") return "badge-gold";
  return "badge-coral";
}
</script>
