<template>
  <div class="admin-shell">
    <aside class="sidebar">
      <div class="sidebar-brand">
        <strong>言通琼岛后台</strong>
        <span>Content + Review + Analytics</span>
      </div>
      <nav class="sidebar-nav">
        <RouterLink to="/">总览</RouterLink>
        <RouterLink to="/content">内容管理</RouterLink>
        <RouterLink to="/corpus">语料审核</RouterLink>
      </nav>
    </aside>

    <main class="admin-main">
      <RouterView />
    </main>
  </div>
</template>

<script setup>
import { RouterLink, RouterView } from "vue-router";
</script>

