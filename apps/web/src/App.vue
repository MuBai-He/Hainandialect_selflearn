<template>
  <div class="app-shell" :data-theme="theme">
    <header class="nav-shell">
      <div class="nav-inner">
        <RouterLink class="brand" to="/">
          <span class="brand-mark">琼</span>
          <span class="brand-copy">
            <strong>言通琼岛</strong>
            <small>Hainan Dialect</small>
          </span>
        </RouterLink>

        <div class="nav-center">
          <nav class="nav-links" aria-label="主导航">
            <RouterLink v-for="item in primaryNavLinks" :key="item.to" :to="item.to">
              {{ item.label }}
            </RouterLink>
          </nav>

          <nav class="nav-secondary" aria-label="扩展页面导航">
            <RouterLink v-for="item in extendedNavLinks" :key="item.to" :to="item.to">
              {{ item.label }}
            </RouterLink>
          </nav>
        </div>

        <div class="nav-actions">
          <button
            class="theme-switch"
            type="button"
            role="switch"
            :aria-checked="isDark"
            :aria-label="isDark ? '切换到浅色模式' : '切换到深色模式'"
            @click="toggleTheme"
          >
            <span class="theme-track" :class="{ 'is-on': isDark }">
              <span class="theme-thumb" />
            </span>
            <span class="theme-label">{{ isDark ? "深色" : "浅色" }}</span>
          </button>

          <template v-if="sessionState.user">
            <RouterLink class="button button-text button-sm" to="/profile">
              {{ sessionState.user.nickname || sessionState.user.username }}
            </RouterLink>
            <button class="button button-primary button-sm" type="button" @click="handleLogout">
              退出
            </button>
          </template>

          <template v-else>
            <RouterLink class="button button-text button-sm" to="/login">登录</RouterLink>
            <RouterLink class="button button-accent button-sm" to="/register">注册</RouterLink>
          </template>
        </div>
      </div>
    </header>

    <main class="page-shell">
      <RouterView />
    </main>

    <WaveDivider tone="dark" />

    <footer class="site-footer">
      <div class="footer-inner">
        <div class="footer-brand">
          <div class="footer-brand-top">
            <span class="brand-mark footer-mark">琼</span>
            <div>
              <strong>言通琼岛</strong>
              <p>让海南方言在 AI 时代被继续听见、理解和传承。</p>
            </div>
          </div>
          <span class="footer-slogan">守护语言 · 传承文化</span>
        </div>

        <div class="footer-links">
          <h3>快速链接</h3>
          <RouterLink v-for="item in footerLinks" :key="item.to" :to="item.to">
            {{ item.label }}
          </RouterLink>
        </div>

        <div class="footer-meta">
          <h3>联系我们</h3>
          <a href="mailto:heritage@qiongdao.ai">heritage@qiongdao.ai</a>
          <a href="#project-story">关于项目</a>
          <span class="badge badge-gold">海南自贸港文化项目</span>
        </div>
      </div>

      <div class="footer-bottom">
        <span>© 2025 言通琼岛团队 · 海南方言智能传播与学习平台</span>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { computed, nextTick, onBeforeUnmount, onMounted, ref, watch } from "vue";
import { RouterLink, RouterView, useRoute, useRouter } from "vue-router";
import WaveDivider from "./components/WaveDivider.vue";
import { logout } from "./api/auth";
import { footerLinks } from "./lib/brand-content";
import { clearSession, sessionState } from "./lib/session";

const primaryNavLinks = [
  { label: "首页", to: "/" },
  { label: "学习中心", to: "/learning" },
  { label: "基础翻译", to: "/translate" },
  { label: "语音识别", to: "/recognize" },
  { label: "个人中心", to: "/profile" },
];

const extendedNavLinks = [
  { label: "项目使命", to: "/about" },
  { label: "文化档案", to: "/archive" },
  { label: "发音实验室", to: "/lab/pronunciation" },
  { label: "学习报告", to: "/report" },
  { label: "方言词典", to: "/dictionary" },
  { label: "学习路线", to: "/roadmap" },
  { label: "场景专题", to: "/scenarios/greetings" },
];

const route = useRoute();
const router = useRouter();
const STORAGE_KEY = "yantong-qiongdao-theme";
const theme = ref("light");
const isDark = computed(() => theme.value === "dark");

let revealObserver;

function resolveInitialTheme() {
  const stored = window.localStorage.getItem(STORAGE_KEY);
  if (stored === "light" || stored === "dark") {
    return stored;
  }

  return window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
}

function toggleTheme() {
  theme.value = theme.value === "dark" ? "light" : "dark";
}

function observeRevealTargets() {
  if (!revealObserver) return;

  document.querySelectorAll("[data-reveal]").forEach((element) => {
    if (element.dataset.observed === "true") return;
    element.dataset.observed = "true";
    revealObserver.observe(element);
  });
}

async function handleLogout() {
  try {
    await logout();
  } catch {
    // 即使服务端退出失败，也优先清理前端会话。
  } finally {
    clearSession();
    router.push("/");
  }
}

onMounted(async () => {
  theme.value = resolveInitialTheme();

  revealObserver = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (!entry.isIntersecting) return;
        entry.target.classList.add("is-visible");
        revealObserver.unobserve(entry.target);
      });
    },
    {
      threshold: 0.16,
      rootMargin: "0px 0px -40px 0px",
    },
  );

  await nextTick();
  observeRevealTargets();
});

watch(theme, (value) => {
  window.localStorage.setItem(STORAGE_KEY, value);
});

watch(
  () => route.fullPath,
  async () => {
    await nextTick();
    observeRevealTargets();
  },
);

onBeforeUnmount(() => {
  revealObserver?.disconnect();
});
</script>
