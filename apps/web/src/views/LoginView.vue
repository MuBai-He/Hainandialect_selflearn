<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section auth-layout">
      <article class="auth-story-panel">
        <span class="badge badge-coral">登录</span>
        <h1 class="section-display">
          回到上次停下来的地方，
          <br />
          把学习节奏重新接上。
        </h1>
        <p class="section-description">
          登录后会同步学习进度、课程收藏和翻译历史，让你的每一次开口练习都留下痕迹。
        </p>

        <div class="auth-feature-list">
          <article class="auth-feature-card">
            <span class="auth-feature-index is-coral">01</span>
            <div>
              <strong>自动保存学习进度</strong>
              <p>课程完成状态会同步进入个人中心，方便继续接着学。</p>
            </div>
          </article>
          <article class="auth-feature-card">
            <span class="auth-feature-index is-teal">02</span>
            <div>
              <strong>收藏重要内容</strong>
              <p>把课程和翻译结果沉淀下来，形成自己的复习素材。</p>
            </div>
          </article>
          <article class="auth-feature-card">
            <span class="auth-feature-index is-gold">03</span>
            <div>
              <strong>JWT 安全登录态</strong>
              <p>前后端统一走 Bearer Token，联调更稳定，产品感更完整。</p>
            </div>
          </article>
        </div>

        <p class="auth-slogan">守护语言 · 传承文化 · 言通琼岛</p>
      </article>

      <article class="auth-form-panel">
        <div class="auth-form-head">
          <h2>账户登录</h2>
          <p>输入账号与密码继续使用。</p>
        </div>

        <form class="auth-form" @submit.prevent="handleLogin">
          <label class="auth-field">
            <span class="field-label">账号</span>
            <span class="input-shell">
              <span class="input-icon">👤</span>
              <input
                v-model="form.account"
                class="input-control"
                autocomplete="username"
                placeholder="用户名或邮箱"
              />
            </span>
          </label>

          <label class="auth-field">
            <span class="field-label">密码</span>
            <span class="input-shell">
              <span class="input-icon">🔒</span>
              <input
                v-model="form.password"
                class="input-control"
                :type="showPassword ? 'text' : 'password'"
                autocomplete="current-password"
                placeholder="请输入密码"
              />
              <button class="password-toggle" type="button" @click="showPassword = !showPassword">
                {{ showPassword ? "隐藏" : "显示" }}
              </button>
            </span>
          </label>

          <div class="button-stack">
            <button class="button button-primary button-lg button-full" type="submit" :disabled="loading || !isFormReady">
              {{ loading ? "正在登录..." : "登录" }}
            </button>
            <RouterLink class="button button-outline-accent button-lg button-full" to="/register">
              去注册
            </RouterLink>
          </div>
        </form>

        <div class="auth-footer">
          <span class="footnote">支持用户名或邮箱登录</span>
          <RouterLink class="text-link" to="/register">还没有账号？立即注册</RouterLink>
        </div>

        <div v-if="message" class="message-banner">
          {{ message }}
        </div>
      </article>
    </div>
  </section>
</template>

<script setup>
import { computed, reactive, ref } from "vue";
import { RouterLink, useRoute, useRouter } from "vue-router";
import { login } from "../api/auth";
import { setSession } from "../lib/session";

const router = useRouter();
const route = useRoute();
const showPassword = ref(false);
const loading = ref(false);
const message = ref("");
const form = reactive({
  account: "",
  password: "",
});

const isFormReady = computed(
  () => Boolean(form.account.trim()) && Boolean(form.password),
);

async function handleLogin() {
  if (!isFormReady.value) {
    message.value = "请输入完整的账号和密码。";
    return;
  }

  loading.value = true;
  message.value = "";

  try {
    const data = await login({
      account: form.account.trim(),
      password: form.password,
    });
    setSession(data);
    router.push(typeof route.query.redirect === "string" ? route.query.redirect : "/profile");
  } catch (err) {
    message.value = err.message || "登录失败，请稍后再试。";
  } finally {
    loading.value = false;
  }
}
</script>
