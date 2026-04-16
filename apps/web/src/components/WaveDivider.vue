<template>
  <div class="wave-divider" :style="{ color: toneColor }" aria-hidden="true">
    <svg viewBox="0 0 1440 60" preserveAspectRatio="none">
      <path
        d="M0,30 C360,60 720,0 1080,30 C1260,45 1380,25 1440,30 L1440,60 L0,60 Z"
        fill="currentColor"
      />
    </svg>
  </div>
</template>

<script setup>
import { computed } from "vue";

const props = defineProps({
  tone: {
    type: String,
    default: "var(--bg-surface)",
  },
});

const toneMap = {
  surface: "var(--bg-surface)",
  page: "var(--bg-page)",
  warm: "var(--bg-warm)",
  teal: "var(--bg-teal)",
  dark: "var(--footer-bg)",
};

const toneColor = computed(() => toneMap[props.tone] ?? props.tone);
</script>
