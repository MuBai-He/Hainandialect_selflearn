<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section home-hero">
      <div class="hero-grid hero-grid-brand">
        <div class="hero-copy">
          <div class="hero-kicker">
            <span class="hero-kicker-dot" />
            <span>海南自由贸易港数字文化项目</span>
          </div>

          <h1 class="hero-title brand-hero-title">
            把海南话，
            <br />
            带进每一个
            <br />
            <span>人的日常。</span>
          </h1>

          <p class="hero-description hero-description-lg">
            从问路到点餐，从打招呼到讲故事，用 AI 让三千年的琼岛语言，
            在今天重新流动。
          </p>

          <div class="hero-actions">
            <RouterLink class="button button-primary button-lg" to="/learning">
              开始学海南话 →
            </RouterLink>
            <RouterLink class="button button-outline button-lg" to="/translate">
              免费试用翻译
            </RouterLink>
          </div>
        </div>

        <aside class="translation-demo-card">
          <div class="translation-demo-bar" />
          <div class="translation-demo-head">
            <span class="badge badge-teal">{{ heroTranslationDemo.direction }}</span>
            <span class="translation-demo-chip">AI 语义匹配</span>
          </div>

          <div class="translation-demo-body">
            <div class="translation-demo-input">
              {{ heroTranslationDemo.input }}
            </div>
            <div class="translation-demo-arrow">↕</div>
            <div class="translation-demo-result">
              <strong>{{ heroTranslationDemo.output }}</strong>
              <span>{{ heroTranslationDemo.pinyin }}</span>
              <button class="button button-teal button-sm button-dashed" type="button">
                🔊 播放发音
              </button>
            </div>
          </div>

          <div class="translation-demo-tags">
            <span v-for="tag in heroTranslationDemo.quickTags" :key="tag" class="demo-tag">
              {{ tag }}
            </span>
          </div>
        </aside>
      </div>
    </div>
  </section>

  <section ref="statsSection" class="section-band is-warm" data-reveal>
    <div class="page-section">
      <div class="stats-strip">
        <article v-for="(item, index) in homeStatTargets" :key="item.label" class="stats-tile">
          <strong>
            {{ formatStat(countValues[index], item.suffix) }}
          </strong>
          <span>{{ item.label }}</span>
          <small>{{ item.note }}</small>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="surface" />

  <section class="section-band is-surface" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label">产品结构</span>
        <h2 class="section-display">
          围绕“看得懂、学得会、记得住”
          <br />
          组织每一步体验。
        </h2>
      </div>

      <div class="structure-grid">
        <article
          v-for="card in productStructureCards"
          :key="card.key"
          class="feature-card"
          :class="getToneClass(card.tone)"
        >
          <span class="badge" :class="badgeTone(card.tone)">{{ card.badge }}</span>
          <h3>{{ card.title }}</h3>
          <p>{{ card.description }}</p>

          <div class="structure-visual">
            <svg
              v-if="card.key === 'home'"
              viewBox="0 0 220 120"
              class="mini-illustration"
              aria-hidden="true"
            >
              <rect x="16" y="18" width="188" height="84" rx="18" fill="var(--bg-warm)" />
              <circle cx="44" cy="44" r="10" fill="var(--color-primary)" opacity="0.9" />
              <rect x="64" y="36" width="92" height="12" rx="6" fill="var(--text-primary)" opacity="0.12" />
              <rect x="64" y="58" width="126" height="10" rx="5" fill="var(--text-primary)" opacity="0.08" />
              <rect x="64" y="78" width="76" height="10" rx="5" fill="var(--color-secondary)" opacity="0.18" />
            </svg>

            <svg
              v-else-if="card.key === 'learning'"
              viewBox="0 0 220 120"
              class="mini-illustration"
              aria-hidden="true"
            >
              <rect x="20" y="24" width="52" height="68" rx="16" fill="var(--bg-teal)" />
              <rect x="84" y="24" width="52" height="68" rx="16" fill="var(--bg-warm)" />
              <rect x="148" y="24" width="52" height="68" rx="16" fill="var(--color-primary-light)" />
              <path d="M42 58L52 68L72 42" stroke="var(--color-secondary)" stroke-width="7" stroke-linecap="round" stroke-linejoin="round" />
              <path d="M106 58L116 68L136 42" stroke="var(--color-primary)" stroke-width="7" stroke-linecap="round" stroke-linejoin="round" opacity="0.7" />
            </svg>

            <svg
              v-else
              viewBox="0 0 220 120"
              class="mini-illustration"
              aria-hidden="true"
            >
              <rect x="18" y="20" width="184" height="80" rx="20" fill="var(--bg-warm)" />
              <circle cx="58" cy="56" r="18" fill="var(--color-gold-light)" />
              <rect x="92" y="38" width="78" height="12" rx="6" fill="var(--text-primary)" opacity="0.12" />
              <rect x="92" y="58" width="92" height="10" rx="5" fill="var(--text-primary)" opacity="0.08" />
              <rect x="92" y="76" width="56" height="10" rx="5" fill="var(--color-primary)" opacity="0.25" />
            </svg>
          </div>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="warm" />

  <section class="section-band is-warm" data-reveal>
    <div class="page-section">
      <div class="section-headline">
        <span class="section-label">真实场景</span>
        <h2 class="section-title-lg">从真实生活场景出发，每个模块都是一次完整闭环。</h2>
      </div>

      <div class="scene-grid">
        <article
          v-for="module in scenarioModules"
          :key="module.slug"
          class="scene-card"
        >
          <div class="scene-icon" :class="getToneClass(module.tone)">{{ module.icon }}</div>
          <div class="scene-copy">
            <div class="scene-title-row">
              <h3>{{ module.title }}</h3>
              <span>{{ module.lessons }} 节</span>
            </div>
            <p>{{ module.description }}</p>
            <span class="badge" :class="getDifficultyTone(module.difficulty)">
              {{ module.difficulty }}
            </span>
          </div>
        </article>
      </div>
    </div>
  </section>

  <WaveDivider tone="dark" />

  <section id="project-story" class="section-band is-dark" data-reveal>
    <div class="page-section">
      <div class="story-grid">
        <div class="story-copy">
          <span class="section-label section-label-teal">为什么做这件事</span>
          <h2 class="story-title">
            有一种话，只有
            <br />
            海南人才懂。
          </h2>
          <p class="story-body">
            海南话承载着三千年的历史记忆。随着普通话普及，越来越多年轻人
            “听得懂但不会说”。我们想用 AI，让这门语言重新流动，让它重新进入当代人的日常。
          </p>
          <RouterLink class="story-link" to="/learning">了解我们的使命 →</RouterLink>
        </div>

        <div class="story-chart-card">
          <div class="story-chart-head">
            <span class="badge badge-teal">语言数据观察</span>
            <small>海南话活跃使用人口估计趋势</small>
          </div>

          <svg viewBox="0 0 420 220" class="trend-chart" aria-hidden="true">
            <defs>
              <linearGradient id="trendGradient" x1="0" y1="0" x2="1" y2="0">
                <stop offset="0%" stop-color="#E8623A" />
                <stop offset="100%" stop-color="#1A9E8F" />
              </linearGradient>
            </defs>
            <path
              d="M26 182 H394"
              stroke="rgba(255,255,255,0.14)"
              stroke-width="1"
            />
            <path
              d="M26 34 V182"
              stroke="rgba(255,255,255,0.14)"
              stroke-width="1"
            />
            <polyline
              :points="trendPolyline"
              fill="none"
              stroke="url(#trendGradient)"
              stroke-width="5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <g v-for="point in trendDots" :key="point.year">
              <circle :cx="point.x" :cy="point.y" r="5.5" fill="#FFFDF8" />
              <circle :cx="point.x" :cy="point.y" r="3.5" fill="#E8623A" />
              <text :x="point.x - 16" y="204" fill="rgba(255,255,255,0.6)" font-size="12">
                {{ point.year }}
              </text>
            </g>
          </svg>

          <p class="story-footnote">数据示意：综合地方语言研究资料与项目调研样本整理。</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed, onBeforeUnmount, onMounted, ref } from "vue";
import { RouterLink } from "vue-router";
import WaveDivider from "../components/WaveDivider.vue";
import {
  cultureTrend,
  getDifficultyTone,
  getToneClass,
  heroTranslationDemo,
  homeStatTargets,
  productStructureCards,
  scenarioModules,
} from "../lib/brand-content";

const statsSection = ref(null);
const countValues = ref(homeStatTargets.map(() => 0));

let countObserver;
let frameId = 0;
let hasCounted = false;

const trendDots = computed(() => {
  const minX = 52;
  const maxX = 368;
  const minY = 46;
  const maxY = 164;
  const maxValue = Math.max(...cultureTrend.map((item) => item.value));
  const minValue = Math.min(...cultureTrend.map((item) => item.value));

  return cultureTrend.map((item, index) => {
    const progress = index / (cultureTrend.length - 1);
    const x = minX + progress * (maxX - minX);
    const ratio = (item.value - minValue) / (maxValue - minValue || 1);
    const y = maxY - ratio * (maxY - minY);
    return { ...item, x, y };
  });
});

const trendPolyline = computed(() =>
  trendDots.value.map((point) => `${point.x},${point.y}`).join(" "),
);

function badgeTone(tone) {
  if (tone === "teal") return "badge-teal";
  if (tone === "gold") return "badge-gold";
  return "badge-coral";
}

function formatStat(value, suffix) {
  return `${Math.round(value).toLocaleString("zh-CN")}${suffix}`;
}

function startCountAnimation() {
  if (hasCounted) return;
  hasCounted = true;

  const duration = 1500;
  const start = performance.now();

  const tick = (now) => {
    const progress = Math.min((now - start) / duration, 1);
    const eased = 1 - (1 - progress) ** 3;

    countValues.value = homeStatTargets.map((item) => item.value * eased);

    if (progress < 1) {
      frameId = window.requestAnimationFrame(tick);
    } else {
      countValues.value = homeStatTargets.map((item) => item.value);
    }
  };

  frameId = window.requestAnimationFrame(tick);
}

onMounted(() => {
  countObserver = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (!entry.isIntersecting) return;
        startCountAnimation();
        countObserver?.disconnect();
      });
    },
    { threshold: 0.3 },
  );

  if (statsSection.value) {
    countObserver.observe(statsSection.value);
  }
});

onBeforeUnmount(() => {
  countObserver?.disconnect();
  window.cancelAnimationFrame(frameId);
});
</script>
