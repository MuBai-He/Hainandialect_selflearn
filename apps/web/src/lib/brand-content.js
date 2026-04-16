export const homeStatTargets = [
  {
    value: 3200,
    suffix: "+",
    label: "收录词汇",
    note: "覆盖日常高频场景",
  },
  {
    value: 8,
    suffix: "",
    label: "学习模块",
    note: "从入门到流利",
  },
  {
    value: 156,
    suffix: "",
    label: "精选课程",
    note: "循序渐进闭环",
  },
];

export const productStructureCards = [
  {
    key: "home",
    tone: "coral",
    badge: "首页",
    title: "先被吸引，再愿意点开",
    description:
      "把文化温度、产品价值和第一步入口放在同一屏，让评委 30 秒内抓到项目气质。",
  },
  {
    key: "learning",
    tone: "teal",
    badge: "学习中心",
    title: "从真实场景进入语言",
    description:
      "围绕问候、点餐、出行、节庆等日常使用场景，把知识拆成容易吸收的小节。",
  },
  {
    key: "profile",
    tone: "gold",
    badge: "个人中心",
    title: "把学习记录沉淀下来",
    description:
      "课程进度、翻译历史与收藏内容集中沉淀，让文化学习真正形成回流。",
  },
];

export const cultureTrend = [
  { year: "2000", value: 92 },
  { year: "2005", value: 87 },
  { year: "2010", value: 78 },
  { year: "2015", value: 66 },
  { year: "2020", value: 54 },
  { year: "2025", value: 43 },
];

export const heroTranslationDemo = {
  direction: "普通话 → 海南话",
  input: "你好，多少钱？",
  output: "汝好，若干钱？",
  pinyin: "Lṳ hó, jiō-gán-chîⁿ?",
  quickTags: ["你好", "谢谢", "多少钱"],
};

export const quickTranslateExamples = {
  mandarin: ["你好", "多少钱", "去哪里", "谢谢", "没关系"],
  hainan: ["汝好", "若干钱", "去叨位", "多谢", "免客气"],
};

export const scenarioModules = [
  {
    slug: "greetings",
    title: "日常问候",
    lessons: 18,
    difficulty: "入门",
    tone: "coral",
    icon: "🗣",
    description: "从打招呼、礼貌表达到寒暄回应，学会第一句开口。",
    lessonsPreview: [
      {
        id: "greetings-hello",
        title: "你好与再会",
        summary: "掌握见面问候、离开告别和最常见的礼貌回应。",
        difficulty: "入门",
        estimatedMinutes: 12,
        terms: [
          {
            id: "greetings-hello-term-1",
            mandarinText: "你好",
            hainanText: "汝好",
            pinyinNote: "Lṳ hó",
            meaningNote: "最常用的见面问候。",
          },
          {
            id: "greetings-hello-term-2",
            mandarinText: "再见",
            hainanText: "再会",
            pinyinNote: "Zài huē",
            meaningNote: "离开时最自然的告别表达。",
          },
        ],
        sentences: [
          {
            id: "greetings-hello-sentence-1",
            mandarinText: "你好，很高兴见到你。",
            hainanText: "汝好，见着汝真欢喜。",
            meaningNote: "初次见面的友好表达。",
          },
          {
            id: "greetings-hello-sentence-2",
            mandarinText: "那我们下次再会。",
            hainanText: "按呢，咱下摆再会。",
            meaningNote: "自然收尾的日常告别句。",
          },
        ],
      },
      {
        id: "greetings-polite",
        title: "礼貌表达",
        summary: "学会谢谢、请、没关系这些海南话里最常出现的温和语气。",
        difficulty: "入门",
        estimatedMinutes: 14,
        terms: [
          {
            id: "greetings-polite-term-1",
            mandarinText: "谢谢",
            hainanText: "多谢",
            pinyinNote: "Do xiā",
            meaningNote: "高频感谢表达。",
          },
          {
            id: "greetings-polite-term-2",
            mandarinText: "没关系",
            hainanText: "免客气",
            pinyinNote: "Mián kheh-khì",
            meaningNote: "礼貌回应时很常用。",
          },
        ],
        sentences: [
          {
            id: "greetings-polite-sentence-1",
            mandarinText: "谢谢你来帮忙。",
            hainanText: "多谢汝来帮手。",
            meaningNote: "表达感谢时更显亲切。",
          },
          {
            id: "greetings-polite-sentence-2",
            mandarinText: "不用客气，慢慢来。",
            hainanText: "免客气，慢慢来。",
            meaningNote: "温和安抚语气。",
          },
        ],
      },
    ],
  },
  {
    slug: "dining",
    title: "餐厅点餐",
    lessons: 22,
    difficulty: "入门",
    tone: "teal",
    icon: "🍜",
    description: "从点菜、口味到结账，快速掌握餐桌边最实用的表达。",
    lessonsPreview: [
      {
        id: "dining-menu",
        title: "点菜与询价",
        summary: "学会点餐时的高频问句，包括价格、分量和推荐。",
        difficulty: "入门",
        estimatedMinutes: 14,
        terms: [
          {
            id: "dining-menu-term-1",
            mandarinText: "多少钱",
            hainanText: "若干钱",
            pinyinNote: "Jiō-gán-chîⁿ",
            meaningNote: "市场、餐馆都很常见。",
          },
          {
            id: "dining-menu-term-2",
            mandarinText: "来一份",
            hainanText: "来一盘",
            pinyinNote: "Lâi it pûaⁿ",
            meaningNote: "点单时最顺手的表达。",
          },
        ],
        sentences: [
          {
            id: "dining-menu-sentence-1",
            mandarinText: "这道菜多少钱？",
            hainanText: "这盘菜若干钱？",
            meaningNote: "先问价格再决定是否下单。",
          },
          {
            id: "dining-menu-sentence-2",
            mandarinText: "老板，帮我来一份。",
            hainanText: "老板，帮我来一盘。",
            meaningNote: "点菜时最自然的说法。",
          },
        ],
      },
      {
        id: "dining-taste",
        title: "口味偏好",
        summary: "学会表达咸淡、辣度以及是否打包等细节需求。",
        difficulty: "入门",
        estimatedMinutes: 16,
        terms: [
          {
            id: "dining-taste-term-1",
            mandarinText: "少辣",
            hainanText: "少辣",
            pinyinNote: "Siáu lua̍h",
            meaningNote: "点海南菜时特别常用。",
          },
          {
            id: "dining-taste-term-2",
            mandarinText: "打包",
            hainanText: "包走",
            pinyinNote: "Pau tsáu",
            meaningNote: "结账前常会说到。",
          },
        ],
        sentences: [
          {
            id: "dining-taste-sentence-1",
            mandarinText: "这道菜请做得清淡一点。",
            hainanText: "这盘菜请煮淡一点。",
            meaningNote: "表达口味偏好。",
          },
          {
            id: "dining-taste-sentence-2",
            mandarinText: "吃不完可以帮我打包吗？",
            hainanText: "食未完，能帮我包走无？",
            meaningNote: "常见的用餐需求。",
          },
        ],
      },
    ],
  },
  {
    slug: "transport",
    title: "出行交通",
    lessons: 20,
    difficulty: "进阶",
    tone: "gold",
    icon: "🚌",
    description: "问路、坐车、换乘、打车，一页打通出行场景中的语言障碍。",
    lessonsPreview: [
      {
        id: "transport-directions",
        title: "问路定位",
        summary: "学会问地点、辨方向和确认距离，适合旅游与日常通勤。",
        difficulty: "进阶",
        estimatedMinutes: 15,
        terms: [
          {
            id: "transport-directions-term-1",
            mandarinText: "去哪里",
            hainanText: "去叨位",
            pinyinNote: "Khì tô-uī",
            meaningNote: "高频问路句核心。",
          },
          {
            id: "transport-directions-term-2",
            mandarinText: "前面",
            hainanText: "头前",
            pinyinNote: "Thâu-tsîng",
            meaningNote: "指路时常用方位词。",
          },
        ],
        sentences: [
          {
            id: "transport-directions-sentence-1",
            mandarinText: "请问火车站怎么走？",
            hainanText: "请问火车站按怎走？",
            meaningNote: "游客和本地通勤都用得到。",
          },
          {
            id: "transport-directions-sentence-2",
            mandarinText: "一直往前走就到了。",
            hainanText: "一直向头前行就到。",
            meaningNote: "最常见的指路方式。",
          },
        ],
      },
      {
        id: "transport-taxi",
        title: "打车与换乘",
        summary: "掌握上车、报地名、确认价格和下车提醒等关键表达。",
        difficulty: "进阶",
        estimatedMinutes: 18,
        terms: [
          {
            id: "transport-taxi-term-1",
            mandarinText: "到这里",
            hainanText: "到这位",
            pinyinNote: "Kàu tsit-uī",
            meaningNote: "上车后确认目的地。",
          },
          {
            id: "transport-taxi-term-2",
            mandarinText: "下车",
            hainanText: "落车",
            pinyinNote: "Lo̍h-tshia",
            meaningNote: "抵达终点时使用。",
          },
        ],
        sentences: [
          {
            id: "transport-taxi-sentence-1",
            mandarinText: "师傅，请送我到这里。",
            hainanText: "师傅，请载我到这位。",
            meaningNote: "打车场景常用。",
          },
          {
            id: "transport-taxi-sentence-2",
            mandarinText: "到了叫我一下。",
            hainanText: "若到位请叫我一下。",
            meaningNote: "换乘和打车都很适合。",
          },
        ],
      },
    ],
  },
  {
    slug: "shopping",
    title: "购物砍价",
    lessons: 16,
    difficulty: "实用",
    tone: "coral",
    icon: "🛒",
    description: "逛市场、问价格、比品质、讲价钱，学会最有生活感的一组表达。",
    lessonsPreview: [
      {
        id: "shopping-price",
        title: "询价与比价",
        summary: "学会在市场和小店里自然问价、确认份量和比较品质。",
        difficulty: "实用",
        estimatedMinutes: 14,
        terms: [
          {
            id: "shopping-price-term-1",
            mandarinText: "便宜一点",
            hainanText: "平一点",
            pinyinNote: "Piâⁿ it-tiám",
            meaningNote: "砍价时的核心表达。",
          },
          {
            id: "shopping-price-term-2",
            mandarinText: "新鲜",
            hainanText: "新鲜",
            pinyinNote: "Sin-sian",
            meaningNote: "买海鲜、水果时很高频。",
          },
        ],
        sentences: [
          {
            id: "shopping-price-sentence-1",
            mandarinText: "这个还能再便宜一点吗？",
            hainanText: "这项还能阁平一点无？",
            meaningNote: "礼貌砍价句式。",
          },
          {
            id: "shopping-price-sentence-2",
            mandarinText: "今天的海鲜新鲜吗？",
            hainanText: "今旦个海产新鲜无？",
            meaningNote: "海岛日常高频场景。",
          },
        ],
      },
      {
        id: "shopping-pay",
        title: "付款与确认",
        summary: "从结账到确认数量，补齐购物场景的收尾表达。",
        difficulty: "实用",
        estimatedMinutes: 12,
        terms: [
          {
            id: "shopping-pay-term-1",
            mandarinText: "收据",
            hainanText: "单仔",
            pinyinNote: "Tan-á",
            meaningNote: "付款后需要确认时使用。",
          },
          {
            id: "shopping-pay-term-2",
            mandarinText: "扫码",
            hainanText: "扫码",
            pinyinNote: "Sáu-má",
            meaningNote: "现代支付场景新高频词。",
          },
        ],
        sentences: [
          {
            id: "shopping-pay-sentence-1",
            mandarinText: "帮我开一下收据。",
            hainanText: "帮我开个单仔。",
            meaningNote: "商务小店都适用。",
          },
          {
            id: "shopping-pay-sentence-2",
            mandarinText: "我扫码给你。",
            hainanText: "我扫码予汝。",
            meaningNote: "移动支付时代的自然说法。",
          },
        ],
      },
    ],
  },
  {
    slug: "family",
    title: "家庭称呼",
    lessons: 14,
    difficulty: "入门",
    tone: "teal",
    icon: "👨‍👩‍👧",
    description: "从家人称谓到长幼礼貌，进入海南人最有烟火气的交流语境。",
    lessonsPreview: [
      {
        id: "family-elders",
        title: "长辈称呼",
        summary: "掌握妈妈、阿婆、阿公等家庭里最常用的关系称呼。",
        difficulty: "入门",
        estimatedMinutes: 11,
        terms: [
          {
            id: "family-elders-term-1",
            mandarinText: "妈妈",
            hainanText: "阿母",
            pinyinNote: "A-bú",
            meaningNote: "家庭日常最核心称谓。",
          },
          {
            id: "family-elders-term-2",
            mandarinText: "外婆",
            hainanText: "阿婆",
            pinyinNote: "A-pô",
            meaningNote: "长辈称呼里很有地域温度的一词。",
          },
        ],
        sentences: [
          {
            id: "family-elders-sentence-1",
            mandarinText: "这是我的妈妈。",
            hainanText: "这位是我个阿母。",
            meaningNote: "介绍家人时使用。",
          },
          {
            id: "family-elders-sentence-2",
            mandarinText: "阿婆今天身体好吗？",
            hainanText: "阿婆今旦身躯好无？",
            meaningNote: "海南家庭里很常听见的问候。",
          },
        ],
      },
      {
        id: "family-children",
        title: "晚辈与亲昵称呼",
        summary: "学会日常里对孩子、兄弟姐妹和家中晚辈的亲昵称呼。",
        difficulty: "入门",
        estimatedMinutes: 13,
        terms: [
          {
            id: "family-children-term-1",
            mandarinText: "弟弟",
            hainanText: "细弟",
            pinyinNote: "Sè-tē",
            meaningNote: "本地口语常见称呼。",
          },
          {
            id: "family-children-term-2",
            mandarinText: "孩子",
            hainanText: "囝仔",
            pinyinNote: "Kiáⁿ-á",
            meaningNote: "南方语系里都有温度的说法。",
          },
        ],
        sentences: [
          {
            id: "family-children-sentence-1",
            mandarinText: "我弟弟今天回来了。",
            hainanText: "我细弟今旦转来。",
            meaningNote: "家庭交流高频句。",
          },
          {
            id: "family-children-sentence-2",
            mandarinText: "这个孩子真可爱。",
            hainanText: "这位囝仔真古锥。",
            meaningNote: "带有生活温度的评价表达。",
          },
        ],
      },
    ],
  },
  {
    slug: "festival",
    title: "节庆习俗",
    lessons: 24,
    difficulty: "进阶",
    tone: "gold",
    icon: "🎊",
    description: "把军坡节、年节问候、祭海习俗等文化场景做成更有记忆点的课程。",
    lessonsPreview: [
      {
        id: "festival-newyear",
        title: "年节问候",
        summary: "围绕春节、元宵等节日祝福，感受海南话里的节庆仪式感。",
        difficulty: "进阶",
        estimatedMinutes: 16,
        terms: [
          {
            id: "festival-newyear-term-1",
            mandarinText: "恭喜发财",
            hainanText: "恭喜发财",
            pinyinNote: "Kiong hí huat-tsâi",
            meaningNote: "节日祝词中的固定高频。",
          },
          {
            id: "festival-newyear-term-2",
            mandarinText: "平安顺遂",
            hainanText: "平安顺势",
            pinyinNote: "Pêng-an sūn-sī",
            meaningNote: "祝福语气更温厚。",
          },
        ],
        sentences: [
          {
            id: "festival-newyear-sentence-1",
            mandarinText: "祝你新年平安顺遂。",
            hainanText: "祝汝新年平安顺势。",
            meaningNote: "适合拜年和贺卡。",
          },
          {
            id: "festival-newyear-sentence-2",
            mandarinText: "过节记得回来吃饭。",
            hainanText: "过节记得转来食饭。",
            meaningNote: "很有家庭氛围的节庆表达。",
          },
        ],
      },
      {
        id: "festival-custom",
        title: "军坡与庙会表达",
        summary: "围绕海南民俗节庆中的高频词汇，理解地方文化语境。",
        difficulty: "进阶",
        estimatedMinutes: 18,
        terms: [
          {
            id: "festival-custom-term-1",
            mandarinText: "热闹",
            hainanText: "闹热",
            pinyinNote: "Nāu-jia̍t",
            meaningNote: "节庆语境常用形容词。",
          },
          {
            id: "festival-custom-term-2",
            mandarinText: "祭海",
            hainanText: "祭海",
            pinyinNote: "Tsè-hái",
            meaningNote: "带有明显地方文化特色。",
          },
        ],
        sentences: [
          {
            id: "festival-custom-sentence-1",
            mandarinText: "今天庙会特别热闹。",
            hainanText: "今旦庙会特别闹热。",
            meaningNote: "地方生活感很强。",
          },
          {
            id: "festival-custom-sentence-2",
            mandarinText: "村里明天要去祭海。",
            hainanText: "村内明旦欲去祭海。",
            meaningNote: "体现海南海洋文化。",
          },
        ],
      },
    ],
  },
  {
    slug: "medical",
    title: "医疗急救",
    lessons: 18,
    difficulty: "实用",
    tone: "coral",
    icon: "🏥",
    description: "从描述症状到寻求帮助，把关键时刻最需要的话先准备好。",
    lessonsPreview: [
      {
        id: "medical-symptom",
        title: "症状描述",
        summary: "学会说疼痛位置、发热头晕和身体不舒服等关键表达。",
        difficulty: "实用",
        estimatedMinutes: 15,
        terms: [
          {
            id: "medical-symptom-term-1",
            mandarinText: "头晕",
            hainanText: "头眩",
            pinyinNote: "Thâu-hān",
            meaningNote: "常见症状表达。",
          },
          {
            id: "medical-symptom-term-2",
            mandarinText: "发烧",
            hainanText: "起烧",
            pinyinNote: "Khí-siō",
            meaningNote: "看病时的高频关键词。",
          },
        ],
        sentences: [
          {
            id: "medical-symptom-sentence-1",
            mandarinText: "我今天有点头晕。",
            hainanText: "我今旦有淡薄头眩。",
            meaningNote: "自述症状时适合直接使用。",
          },
          {
            id: "medical-symptom-sentence-2",
            mandarinText: "孩子从昨晚开始发烧。",
            hainanText: "囝仔昨暝开始起烧。",
            meaningNote: "家庭医疗场景很常见。",
          },
        ],
      },
      {
        id: "medical-help",
        title: "求助与就医",
        summary: "掌握请医生帮忙、去医院、拿药等关键表达。",
        difficulty: "实用",
        estimatedMinutes: 17,
        terms: [
          {
            id: "medical-help-term-1",
            mandarinText: "医生",
            hainanText: "医生",
            pinyinNote: "I-sing",
            meaningNote: "正式医疗场景核心称呼。",
          },
          {
            id: "medical-help-term-2",
            mandarinText: "药",
            hainanText: "药仔",
            pinyinNote: "Io̍h-á",
            meaningNote: "拿药取药时的高频词。",
          },
        ],
        sentences: [
          {
            id: "medical-help-sentence-1",
            mandarinText: "请帮我找一下医生。",
            hainanText: "请帮我寻一下医生。",
            meaningNote: "需要帮助时的直接表达。",
          },
          {
            id: "medical-help-sentence-2",
            mandarinText: "这副药要怎么吃？",
            hainanText: "这包药仔爱按怎食？",
            meaningNote: "拿药时非常实用。",
          },
        ],
      },
    ],
  },
  {
    slug: "business",
    title: "商务社交",
    lessons: 24,
    difficulty: "进阶",
    tone: "teal",
    icon: "💼",
    description: "适合接待、介绍、合作沟通，让地方语言在现代交流里继续被听见。",
    lessonsPreview: [
      {
        id: "business-intro",
        title: "商务介绍",
        summary: "学会自我介绍、介绍团队和表达欢迎，建立专业又亲近的第一印象。",
        difficulty: "进阶",
        estimatedMinutes: 18,
        terms: [
          {
            id: "business-intro-term-1",
            mandarinText: "合作",
            hainanText: "合作",
            pinyinNote: "Ha̍p-tsok",
            meaningNote: "商务场景高频概念词。",
          },
          {
            id: "business-intro-term-2",
            mandarinText: "欢迎",
            hainanText: "欢迎",
            pinyinNote: "Huân-gîng",
            meaningNote: "接待外来访客时常用。",
          },
        ],
        sentences: [
          {
            id: "business-intro-sentence-1",
            mandarinText: "欢迎来到海南，我们很高兴见到你。",
            hainanText: "欢迎来到海南，见着汝阮真欢喜。",
            meaningNote: "兼具礼貌和地域温度。",
          },
          {
            id: "business-intro-sentence-2",
            mandarinText: "这是我们负责合作的团队。",
            hainanText: "这队是阮负责合作个团队。",
            meaningNote: "介绍团队时的简洁表达。",
          },
        ],
      },
      {
        id: "business-meeting",
        title: "会议沟通",
        summary: "把确认需求、安排时间和表达共识等现代沟通内容融入本地语境。",
        difficulty: "进阶",
        estimatedMinutes: 19,
        terms: [
          {
            id: "business-meeting-term-1",
            mandarinText: "时间",
            hainanText: "时间",
            pinyinNote: "Sî-kan",
            meaningNote: "确认排期时高频出现。",
          },
          {
            id: "business-meeting-term-2",
            mandarinText: "安排",
            hainanText: "安排",
            pinyinNote: "An-pâi",
            meaningNote: "商务会谈场景常用。",
          },
        ],
        sentences: [
          {
            id: "business-meeting-sentence-1",
            mandarinText: "我们下午再确认一次时间。",
            hainanText: "阮下晡再确认一摆时间。",
            meaningNote: "会议跟进语句。",
          },
          {
            id: "business-meeting-sentence-2",
            mandarinText: "相关安排我们会尽快通知。",
            hainanText: "相关安排阮会紧通知。",
            meaningNote: "正式且有温度的结尾表达。",
          },
        ],
      },
    ],
  },
];

export const fallbackProfileState = {
  profile: {
    username: "qiongdao_demo",
    nickname: "琼语学友",
    email: "heritage@qiongdao.ai",
    bio: "守护语言 · 传承文化 · 言通琼岛",
  },
  progress: {
    completedLessons: 18,
    inProgressLessons: 6,
    recentLessons: [
      {
        lessonId: "greetings-polite",
        lessonTitle: "礼貌表达",
        status: "completed",
        updatedAt: "2026-04-07T09:20:00",
      },
      {
        lessonId: "dining-menu",
        lessonTitle: "点菜与询价",
        status: "in_progress",
        updatedAt: "2026-04-06T20:10:00",
      },
      {
        lessonId: "festival-custom",
        lessonTitle: "军坡与庙会表达",
        status: "in_progress",
        updatedAt: "2026-04-05T18:30:00",
      },
    ],
  },
  favorites: [
    {
      id: "fav-1",
      favoriteType: "lesson",
      title: "点菜与询价",
      subtitle: "餐厅点餐 · 高频生活表达",
      createdAt: "2026-04-06T20:20:00",
    },
    {
      id: "fav-2",
      favoriteType: "translation_record",
      title: "你好，多少钱？",
      subtitle: "汝好，若干钱？",
      createdAt: "2026-04-06T20:25:00",
    },
    {
      id: "fav-3",
      favoriteType: "sentence",
      title: "过节记得回来吃饭。",
      subtitle: "节庆习俗 · 情感叙事短句",
      createdAt: "2026-04-05T18:40:00",
    },
  ],
  history: [
    {
      id: "history-1",
      sourceText: "你好，多少钱？",
      targetText: "汝好，若干钱？",
      sourceLang: "mandarin",
      targetLang: "hainan",
      createdAt: "2026-04-06T20:25:00",
    },
    {
      id: "history-2",
      sourceText: "去哪里",
      targetText: "去叨位",
      sourceLang: "mandarin",
      targetLang: "hainan",
      createdAt: "2026-04-05T19:10:00",
    },
    {
      id: "history-3",
      sourceText: "多谢",
      targetText: "谢谢",
      sourceLang: "hainan",
      targetLang: "mandarin",
      createdAt: "2026-04-05T08:50:00",
    },
  ],
};

export const footerLinks = [
  { label: "首页", to: "/" },
  { label: "学习中心", to: "/learning" },
  { label: "基础翻译", to: "/translate" },
  { label: "个人中心", to: "/profile" },
  { label: "项目使命", to: "/about" },
  { label: "文化档案", to: "/archive" },
  { label: "项目演示", to: "/showcase" },
];

export function getModuleBySlug(slug) {
  return scenarioModules.find((module) => module.slug === slug) ?? null;
}

export function getLessonById(lessonId) {
  for (const module of scenarioModules) {
    const lesson = module.lessonsPreview.find((item) => item.id === lessonId);
    if (lesson) {
      return {
        ...lesson,
        moduleSlug: module.slug,
        moduleTitle: module.title,
        moduleTone: module.tone,
      };
    }
  }
  return null;
}

export function getToneClass(tone) {
  if (tone === "teal") return "is-teal";
  if (tone === "gold") return "is-gold";
  return "is-coral";
}

export function getDifficultyTone(difficulty) {
  if (difficulty === "进阶") return "badge-teal";
  if (difficulty === "实用") return "badge-gold";
  return "badge-coral";
}

export function getStatusTone(status) {
  if (status === "completed") return "badge-teal";
  if (status === "in_progress") return "badge-gold";
  return "badge-coral";
}
