import { createRouter, createWebHistory } from "vue-router";
import { isAuthenticated } from "../lib/session";
import AboutProjectView from "../views/AboutProjectView.vue";
import CultureArchiveView from "../views/CultureArchiveView.vue";
import DialectRecognizerView from "../views/DialectRecognizerView.vue";
import DictionaryView from "../views/DictionaryView.vue";
import HomeView from "../views/HomeView.vue";
import LearningReportView from "../views/LearningReportView.vue";
import LearningRoadmapView from "../views/LearningRoadmapView.vue";
import LearningView from "../views/LearningView.vue";
import LessonDetailView from "../views/LessonDetailView.vue";
import LoginView from "../views/LoginView.vue";
import ModuleDetailView from "../views/ModuleDetailView.vue";
import ProfileView from "../views/ProfileView.vue";
import PronunciationLabView from "../views/PronunciationLabView.vue";
import RegisterView from "../views/RegisterView.vue";
import ScenarioDetailView from "../views/ScenarioDetailView.vue";
import TranslateView from "../views/TranslateView.vue";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: "/", name: "home", component: HomeView },
    { path: "/login", name: "login", component: LoginView },
    { path: "/register", name: "register", component: RegisterView },
    { path: "/learning", name: "learning", component: LearningView },
    {
      path: "/learning/module/:moduleId",
      name: "module-detail",
      component: ModuleDetailView,
    },
    {
      path: "/learning/lesson/:lessonId",
      name: "lesson-detail",
      component: LessonDetailView,
    },
    { path: "/translate", name: "translate", component: TranslateView },
    {
      path: "/recognize",
      name: "dialect-recognizer",
      component: DialectRecognizerView,
    },
    {
      path: "/profile",
      name: "profile",
      component: ProfileView,
      meta: { requiresAuth: true },
    },
    {
      path: "/about",
      name: "about-project",
      component: AboutProjectView,
    },
    {
      path: "/archive",
      name: "culture-archive",
      component: CultureArchiveView,
    },
    {
      path: "/lab/pronunciation",
      name: "pronunciation-lab",
      component: PronunciationLabView,
    },
    {
      path: "/report",
      name: "learning-report",
      component: LearningReportView,
      meta: { requiresAuth: true },
    },
    {
      path: "/dictionary",
      name: "dictionary",
      component: DictionaryView,
    },
    {
      path: "/roadmap",
      name: "learning-roadmap",
      component: LearningRoadmapView,
    },
    {
      path: "/scenarios/:scenarioKey",
      name: "scenario-detail",
      component: ScenarioDetailView,
    },
  ],
});

router.beforeEach((to) => {
  if (to.meta.requiresAuth && !isAuthenticated()) {
    return {
      name: "login",
      query: {
        redirect: to.fullPath,
      },
    };
  }
  return true;
});

export default router;
