import { fallbackProfileState, scenarioModules } from "./brand-content";

export const aboutProjectStats = [
  {
    value: "3,200+",
    label: "收录词汇",
    note: "覆盖问候、点餐、节庆、出行等高频生活场景",
  },
  {
    value: "156",
    label: "精选课程",
    note: "围绕真实表达组织，让学习与使用同时发生",
  },
  {
    value: "30 秒",
    label: "作品识别点",
    note: "让评委迅速感受到文化温度、科技方法与完成度",
  },
];

export const aboutPillars = [
  {
    key: "culture",
    tone: "teal",
    badge: "文化研究",
    title: "把海南话放回真实生活，而不是只做成静态词表",
    description:
      "从问候、节庆、家庭称呼、市场交易这些生活切片切入，让语言回到人和场景之间。",
    points: ["生活场景驱动", "地方表达保留温度", "兼顾年轻用户学习习惯"],
  },
  {
    key: "ai",
    tone: "coral",
    badge: "AI 介入",
    title: "用 AI 做翻译、跟读、推荐，而不是替代文化本身",
    description:
      "平台强调 AI 的辅助性，让技术成为文化传承的点亮器，而不是喧宾夺主的主角。",
    points: ["基础翻译入口", "发音实验演示", "学习路径智能推荐"],
  },
  {
    key: "archive",
    tone: "gold",
    badge: "档案沉淀",
    title: "让每一次学习，都为地方语言留下更清晰的数字痕迹",
    description:
      "通过词条、故事、模块与个人记录，形成一个持续扩展的海南语言文化档案层。",
    points: ["词典化整理", "故事化叙事", "个人化学习报告"],
  },
];

export const aboutMilestones = [
  {
    year: "2024.09",
    title: "项目立项",
    description: "从“听得懂但不会说”的真实断层出发，明确产品要同时服务传播与学习。",
  },
  {
    year: "2024.12",
    title: "内容整理",
    description: "围绕问候、点餐、节庆、出行等场景整理首批高频词句和课程结构。",
  },
  {
    year: "2025.03",
    title: "Web 第一版",
    description: "完成首页、学习中心、翻译、个人中心和一套完整的文化科技视觉语言。",
  },
  {
    year: "2025.06",
    title: "AI 能力扩展",
    description: "逐步接入发音评分、场景推荐与更多文化内容沉淀机制。",
  },
];

export const aboutProcessSteps = [
  {
    index: "01",
    title: "采集与整理",
    description: "从生活表达、地方习俗、口述记忆中整理可学习的语言材料。",
  },
  {
    index: "02",
    title: "结构化成课程",
    description: "把表达拆成模块、课程、词句、例句，形成持续可学的最小单元。",
  },
  {
    index: "03",
    title: "AI 辅助再呈现",
    description: "以翻译、跟读、个性化推荐等方式，帮助更多用户重新开口。",
  },
];

export const archiveOverviewStats = [
  { value: "12", label: "档案主题", note: "覆盖语言、节庆、家庭称呼与日常表达" },
  { value: "24", label: "口述片段", note: "为故事详情页提供具有地方温度的叙事内容" },
  { value: "8", label: "地域切片", note: "按场景与文化差异组织观察视角" },
];

export const archiveTimeline = [
  {
    period: "古代至海洋交流期",
    title: "海岛语言的形成",
    description: "海南方言在长期迁徙、贸易与海洋交流中逐渐形成自己的音系与表达方式。",
  },
  {
    period: "近现代乡土生活",
    title: "口耳相传的日常语言",
    description: "从赶集、婚礼、祭祀到邻里问候，方言承载的是代际之间最直接的情感表达。",
  },
  {
    period: "普通话普及之后",
    title: "理解在，表达变弱",
    description: "大量年轻人仍能听懂，但主动使用频率下降，造成“会听不会说”的断层。",
  },
  {
    period: "数字文化时代",
    title: "用技术重启地方语言",
    description: "数字化记录、结构化课程与 AI 交互入口，使地方语言有机会被再次激活。",
  },
];

export const archiveRegions = [
  {
    key: "haikou",
    tone: "teal",
    region: "海口府城",
    title: "城市与市井交汇的口语层",
    description: "更适合从问候、市场交流、日常出行等高频场景切入。",
  },
  {
    key: "wenchang",
    tone: "gold",
    region: "文昌侨乡",
    title: "饮食与乡音并存的记忆层",
    description: "家常称呼、饮食习惯与归乡叙事里保留了更浓的地方语感。",
  },
  {
    key: "qionghai",
    tone: "coral",
    region: "琼海渔港",
    title: "海风与劳作气息中的表达层",
    description: "包含更多与海边生活、交易、出海节奏相关的短句和口头语。",
  },
  {
    key: "wanning",
    tone: "teal",
    region: "万宁山海线",
    title: "旅游交流与本地方言交织层",
    description: "在服务、交通与商业表达中能看到地方语言与现代生活的共存。",
  },
];

export const archiveTermCards = [
  {
    id: "entry-lu-ho",
    tone: "coral",
    term: "汝好",
    pinyin: "Lṳ hó",
    note: "最自然的见面问候，既朴素也很有地方亲切感。",
  },
  {
    id: "entry-do-xia",
    tone: "teal",
    term: "多谢",
    pinyin: "Do xia",
    note: "礼貌表达高频出现，也是最容易建立开口成就感的入门词。",
  },
  {
    id: "entry-jio-gan-chinn",
    tone: "gold",
    term: "若干钱",
    pinyin: "Jiō-gán-chîⁿ",
    note: "市场、餐馆、旅游场景里出现频率极高的生活表达。",
  },
  {
    id: "entry-mian-khe",
    tone: "teal",
    term: "免客气",
    pinyin: "Mián kheh-khì",
    note: "最带温度的回应之一，体现海南话里的柔和语气。",
  },
];

export const storyArchive = [
  {
    id: "harbor-voices",
    category: "口述故事",
    tone: "teal",
    title: "港口边的招呼声",
    subtitle: "清晨渔市里，一句句短短的海南话比喇叭更早醒来。",
    excerpt:
      "在海边，语言不只是交流工具，它还是判断关系、亲疏和节奏的一种方式。",
    paragraphs: [
      "天刚亮，港口边已经热闹起来。有人在搬筐，有人在对价，也有人远远地抬手打一声招呼。比起正式完整的句子，人们更习惯用短促、熟悉、带温度的海南话来确认彼此的存在。",
      "这种语言往往不需要解释，因为它来自共同的生活经验。哪怕只是一句“汝好”或者一句关于价格的追问，也包含了地方生活最直接的信任感。",
      "当年轻人慢慢离开熟悉的场景，语言最先退到耳朵里，再慢慢退到记忆里。我们想做的，是把这些还活着的声音重新组织起来，让它们有机会回到今天的日常。",
    ],
    quote: "一门语言真正消失之前，往往先失去的是日常被说出的机会。",
    fragments: [
      "“今日鱼鲜无？”是清晨市场最常出现的开场。",
      "“若干钱？”背后不是交易冷感，而是一种熟人社会的自然互动。",
      "“食饭未？”很多时候既是问候，也是关心。",
    ],
    tags: ["渔市", "口语", "日常问候"],
  },
  {
    id: "festival-homecoming",
    category: "节庆记忆",
    tone: "gold",
    title: "节日回家的那顿饭",
    subtitle: "节庆场景里，方言往往最先被重新唤醒。",
    excerpt:
      "越是在团聚的时候，人越会回到最熟悉、最不需要翻译的那套表达。",
    paragraphs: [
      "逢年过节，很多平时少说方言的人会在回到家门口之后，自然而然地切换口音。不是刻意，而是因为熟悉的餐桌、亲戚的称呼和节日的秩序本来就和这门语言一起存在。",
      "有些表达也许平时很少用，但一到节庆就会重新出现。它们像一种通行证，让人迅速回到家庭与村落共同体之中。",
      "如果说课堂能让人学会词汇，那么节庆就能让人重新理解一门语言为什么值得被继续保存。",
    ],
    quote: "地方语言最柔软的地方，不在词典里，而在饭桌与家门口。",
    fragments: [
      "长辈一开口，称呼和语气就把关系重新摆正。",
      "节庆表达里常常夹带祝福、规劝与家族秩序。",
      "很多年轻人是在节日里重新意识到自己仍然听得懂家乡话。",
    ],
    tags: ["节庆", "家庭", "归乡"],
  },
  {
    id: "schoolyard-echo",
    category: "代际观察",
    tone: "coral",
    title: "校园里的回声",
    subtitle: "孩子们能听懂家里说的话，却越来越少主动开口。",
    excerpt:
      "语言的消退常常不是突然的，而是在一代人身上慢慢从“会说”变成“会听”。",
    paragraphs: [
      "在校园与城市化生活里，普通话拥有更强的通用性，这当然带来了便利。但与此同时，地方语言开始被压缩到家庭内部，甚至进一步缩小到只剩长辈之间使用。",
      "很多孩子对海南话并不陌生，他们能听懂，也知道某些词是什么意思，只是缺少可以安心开口的环境和动力。",
      "这也是平台要做学习与翻译入口的原因。我们希望给年轻人一个不尴尬、不陌生、可以重新练习地方语言的界面。",
    ],
    quote: "当一门语言失去年轻人的开口，它离消失就会更近一步。",
    fragments: [
      "听得懂，是连接仍在；不会说，是表达断层已经发生。",
      "数字产品可以不是替代口耳相传，而是新的接力方式。",
      "一套好看的界面，也是在为地方语言争取新的注意力。",
    ],
    tags: ["校园", "代际", "传承"],
  },
];

export const pronunciationExercises = [
  {
    id: "hello",
    tone: "teal",
    label: "入门问候",
    mandarin: "你好",
    hainan: "汝好",
    pinyin: "Lṳ hó",
    focus: "注意首音开口和尾音收束，节奏要短而稳。",
    targetScore: 92,
    waveform: [28, 46, 70, 58, 36, 76, 54, 34, 62, 44, 26, 52],
    mistakes: ["尾音拖得过长", "第二拍重音不够明显", "整体节奏过于普通话化"],
    tips: ["先跟读两遍短音节", "把语速略放慢", "先模仿抑扬，再追求连贯"],
  },
  {
    id: "thanks",
    tone: "coral",
    label: "礼貌表达",
    mandarin: "谢谢",
    hainan: "多谢",
    pinyin: "Do xia",
    focus: "前音要更干净，后音轻收，不要拖成双重重音。",
    targetScore: 88,
    waveform: [22, 34, 64, 72, 48, 28, 44, 58, 66, 38, 24, 32],
    mistakes: ["前后重音过于平均", "声调转折不够明确", "收尾不够轻巧"],
    tips: ["先单独练第一拍", "跟着示范做强弱变化", "练完后再连读整词"],
  },
  {
    id: "price",
    tone: "gold",
    label: "生活高频",
    mandarin: "多少钱",
    hainan: "若干钱",
    pinyin: "Jiō-gán-chîⁿ",
    focus: "中段节奏最关键，疑问语气要自然上扬。",
    targetScore: 85,
    waveform: [34, 44, 40, 60, 82, 68, 56, 48, 74, 62, 46, 38],
    mistakes: ["疑问上扬不够明显", "中段停顿位置不自然", "尾音太重"],
    tips: ["分成两段先读", "保留疑问语气", "模仿市场问价的自然速度"],
  },
];

export const pronunciationInsightCards = [
  {
    tone: "teal",
    title: "先学短词，再学整句",
    description: "对于方言学习，先把最短的高频词练顺，比一次背长句更能建立开口信心。",
  },
  {
    tone: "coral",
    title: "节奏比字面更重要",
    description: "很多时候难点不在单字，而在整句的起伏和收束方式。",
  },
  {
    tone: "gold",
    title: "模仿生活中的语气",
    description: "问候、问价、致谢本身都有场景情绪，带着场景去练会更自然。",
  },
];

export const reportHighlights = [
  {
    title: "本周最常练模块",
    value: "日常问候",
    note: "说明你已经开始建立稳定开口习惯。",
  },
  {
    title: "最常用翻译词句",
    value: "你好，多少钱？",
    note: "高频生活表达最适合作为第一阶段积累。",
  },
  {
    title: "当前学习建议",
    value: "转入餐厅点餐模块",
    note: "把问候能力延伸到完整对话，形成更强记忆链路。",
  },
];

export const reportBadges = [
  {
    tone: "coral",
    title: "开口第一句",
    description: "完成第一组问候表达并主动跟读。",
  },
  {
    tone: "teal",
    title: "生活场景实践者",
    description: "连续学习 7 天，并完成两个高频生活模块。",
  },
  {
    tone: "gold",
    title: "文化记忆守护者",
    description: "浏览文化档案与故事页，并收藏重要词条。",
  },
];

export const reportWeeklyActivity = [
  3, 4, 6, 5, 7, 4, 2,
  4, 6, 5, 7, 8, 5, 3,
  5, 7, 8, 6, 7, 6, 4,
  4, 6, 7, 8, 6, 5, 4,
];

export const roadmapStages = [
  {
    id: "starter",
    tone: "teal",
    badge: "阶段一",
    title: "先让自己敢开口",
    duration: "第 1-2 周",
    goal: "优先掌握问候、感谢、问价这类最容易进入真实生活的短表达。",
    modules: ["greetings", "dining", "family"],
    outcomes: ["能完成见面问候", "能在餐馆做基础表达", "能听懂家庭高频称呼"],
  },
  {
    id: "practice",
    tone: "coral",
    badge: "阶段二",
    title: "把短词连成完整场景",
    duration: "第 3-4 周",
    goal: "从问路、购物、节庆表达切入，把学习转化成具体生活能力。",
    modules: ["transport", "shopping", "festival"],
    outcomes: ["能问路与确认方向", "能在市场询价", "能理解节庆中的常用表达"],
  },
  {
    id: "fluency",
    tone: "gold",
    badge: "阶段三",
    title: "把语言放进更复杂的关系里",
    duration: "第 5-6 周",
    goal: "进入医疗、商务、复合交流场景，让表达更有应变能力。",
    modules: ["medical", "business"],
    outcomes: ["能做基础求助表达", "能完成礼貌商务沟通", "能更稳定地保持方言语感"],
  },
];

export const roadmapPrinciples = [
  {
    title: "先高频",
    description: "先学最常会说出口的表达，建立成就感。",
  },
  {
    title: "再场景",
    description: "用真实生活场景把词和句粘在一起，降低遗忘率。",
  },
  {
    title: "后沉淀",
    description: "通过收藏、记录和复盘，让学习逐渐形成个人资产。",
  },
];

export function getRoadmapModules(stage) {
  return stage.modules
    .map((slug) => scenarioModules.find((module) => module.slug === slug))
    .filter(Boolean);
}

export function getSuggestedModules(currentSlug) {
  return scenarioModules.filter((module) => module.slug !== currentSlug).slice(0, 3);
}

export const reportSummary = {
  learnerName: fallbackProfileState.profile.nickname,
  completedLessons: fallbackProfileState.progress.completedLessons,
  inProgressLessons: fallbackProfileState.progress.inProgressLessons,
  favoriteCount: fallbackProfileState.favorites.length,
  translationCount: fallbackProfileState.history.length,
};
