<template>
  <section class="section-band is-surface" data-reveal>
    <div class="page-section auth-layout">
      <article class="auth-story-panel">
        <span class="badge badge-teal">注册</span>
        <h1 class="section-display">
          创建一个自己的学习账户，
          <br />
          让海南话重新回到日常里。
        </h1>
        <p class="section-description">
          注册后会自动登录，你可以立刻保存课程进度、收藏重点表达，并把每一次学习沉淀下来。
        </p>

        <div class="auth-feature-list">
          <article class="auth-feature-card">
            <span class="auth-feature-index is-coral">01</span>
            <div>
              <strong>一注册就能开始记录</strong>
              <p>学习中心、翻译页和个人中心会形成完整的数据闭环。</p>
            </div>
          </article>
          <article class="auth-feature-card">
            <span class="auth-feature-index is-teal">02</span>
            <div>
              <strong>重点内容统一沉淀</strong>
              <p>课程、收藏和翻译历史将一起积累，形成长期可复用的学习资产。</p>
            </div>
          </article>
          <article class="auth-feature-card">
            <span class="auth-feature-index is-gold">03</span>
            <div>
              <strong>面向 Web V1 的最小账户体系</strong>
              <p>足够支撑当前比赛版本，也为后续继续扩展用户画像留出空间。</p>
            </div>
          </article>
        </div>

        <p class="auth-slogan">守护语言 · 传承文化 · 言通琼岛</p>
      </article>

      <article class="auth-form-panel">
        <div class="auth-form-head">
          <h2>创建账户</h2>
          <p>填写基础信息，注册后自动登录。</p>
        </div>

        <form class="auth-form" @submit.prevent="handleRegister">
          <label class="auth-field">
            <span class="field-label">用户名</span>
            <span class="input-shell">
              <span class="input-icon">👤</span>
              <input
                v-model="form.username"
                class="input-control"
                autocomplete="username"
                placeholder="至少 3 个字符"
              />
            </span>
          </label>

          <label class="auth-field">
            <span class="field-label">邮箱</span>
            <span class="input-shell">
              <span class="input-icon">✉️</span>
              <input
                v-model="form.email"
                class="input-control"
                type="email"
                autocomplete="email"
                placeholder="请输入常用邮箱"
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
                autocomplete="new-password"
                placeholder="至少 6 位"
              />
              <button class="password-toggle" type="button" @click="showPassword = !showPassword">
                {{ showPassword ? "隐藏" : "显示" }}
              </button>
            </span>
          </label>

          <div class="button-stack">
            <button class="button button-primary button-lg button-full" type="submit" :disabled="loading || !isFormReady">
              {{ loading ? "正在注册..." : "注册并登录" }}
            </button>
            <RouterLink class="button button-outline-accent button-lg button-full" to="/login">
              去登录
            </RouterLink>
          </div>
        </form>

        <div class="auth-footer">
          <span class="footnote">注册后会直接回到你的个人中心</span>
          <RouterLink class="text-link" to="/login">已经有账号？去登录</RouterLink>
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
import { register } from "../api/auth";
import { setSession } from "../lib/session";

const router = useRouter();
const route = useRoute();
const showPassword = ref(false);
const loading = ref(false);
const message = ref("");
const form = reactive({
  username: "",
  email: "",
  password: "",
});

const isFormReady = computed(
  () =>
    form.username.trim().length >= 3 &&
    /\S+@\S+\.\S+/.test(form.email.trim()) &&
    form.password.length >= 6,
);

async function handleRegister() {
  if (!isFormReady.value) {
    message.value = "请检查用户名、邮箱和密码是否填写完整。";
    return;
  }

  loading.value = true;
  message.value = "";

  try {
    const data = await register({
      username: form.username.trim(),
      email: form.email.trim(),
      password: form.password,
    });
    setSession(data);
    router.push(typeof route.query.redirect === "string" ? route.query.redirect : "/profile");
  } catch (err) {
    message.value = err.message || "注册失败，请稍后再试。";
  } finally {
    loading.value = false;
  }
}
</script>
