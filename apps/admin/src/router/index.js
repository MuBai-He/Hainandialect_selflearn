import { createRouter, createWebHistory } from "vue-router";
import DashboardView from "../views/DashboardView.vue";
import ContentView from "../views/ContentView.vue";
import CorpusView from "../views/CorpusView.vue";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: "/", component: DashboardView },
    { path: "/content", component: ContentView },
    { path: "/corpus", component: CorpusView },
  ],
});

export default router;

