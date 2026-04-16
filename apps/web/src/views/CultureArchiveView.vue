<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section subpage-hero">
      <div class="subpage-copy">
        <span class="badge badge-gold">文化档案</span>
        <h1 class="section-display">
          把地方语言当作
          <br />
          一份可以被继续阅读的文化档案。
        </h1>
        <p class="section-description">
          这不是百科式堆砌，而是尝试把海南话背后的地域感、生活感、节庆感与口述记忆，整理成一组可浏览、可学习、可继续生长的内容界面。
        </p>

        <div class="hero-actions">
          <RouterLink class="button button-primary button-lg" to="/dictionary">
            浏览词典
          </RouterLink>
          <RouterLink class="button button-outline button-lg" to="/learning">
            进入学习中心
          </RouterLink>
        </div>
      </div>

      <aside class="subpage-side-panel">
        <span class="panel-kicker">档案概览</span>
        <div class="metric-grid">
          <article v-for="item in archiveOverviewStats" :key="item.label" class="metric-card">
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
        <span class="section-label">历史脉络</span>
        <h2 class="section-title-lg">从海岛形成到数字化时代，语言本身也在记录一座岛屿如何变化。</h2>
      </div>

      <div class="timeline-grid">
        <article v-for="item in archiveTimeline" :key="item.period" class="timeline-card">
          <span class="timeline-year">{{ item.period }}</span>
          <h3>{{ item.title }}</h3>
          <p>{{ item.description }}</p>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="surface" />

  <section class="section-band is-surface" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label">地域切片</span>
        <h2 class="section-title-lg">不同地方的生活节奏，也会留下不同的表达纹理。</h2>
      </div>

      <div class="archive-region-grid">
        <article
          v-for="region in archiveRegions"
          :key="region.key"
          class="archive-region-card"
          :class="getToneClass(region.tone)"
        >
          <span class="badge" :class="badgeTone(region.tone)">{{ region.region }}</span>
          <h3>{{ region.title }}</h3>
          <p>{{ region.description }}</p>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section">
      <div class="section-headline section-headline-row">
        <div>
          <span class="section-label">代表表达</span>
          <h2 class="section-title-lg">先记住几句最有温度的词，文化距离就会一下子缩短。</h2>
        </div>
        <RouterLink class="button button-outline button-md" to="/dictionary">查看完整词典</RouterLink>
      </div>

      <div class="archive-term-grid">
        <article
          v-for="item in archiveTermCards"
          :key="item.id"
          class="archive-term-card"
          :class="getToneClass(item.tone)"
        >
          <div class="archive-term-head">
            <strong>{{ item.term }}</strong>
            <span>{{ item.pinyin }}</span>
          </div>
          <p>{{ item.note }}</p>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="dark" />

  <section class="section-band is-dark" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label section-label-teal">口述故事</span>
        <h2 class="story-title">
          语言真正打动人的地方，
          <br />
          往往藏在故事里。
        </h2>
      </div>

      <div class="story-preview-grid">
        <article v-for="story in storyArchive" :key="story.id" class="story-preview-card">
          <span class="badge" :class="badgeTone(story.tone)">{{ story.category }}</span>
          <h3>{{ story.title }}</h3>
          <p>{{ story.excerpt }}</p>
          <span class="story-link is-disabled">文化故事页面已下线</span>
        </article>
      </div>
    </div>
  </section>
</template>

<script setup>
import { RouterLink } from "vue-router";
import WaveDivider from "../components/WaveDivider.vue";
import { getToneClass } from "../lib/brand-content";
import {
  archiveOverviewStats,
  archiveRegions,
  archiveTermCards,
  archiveTimeline,
  storyArchive,
} from "../lib/extended-pages-content";

function badgeTone(tone) {
  if (tone === "teal") return "badge-teal";
  if (tone === "gold") return "badge-gold";
  return "badge-coral";
}
</script>
