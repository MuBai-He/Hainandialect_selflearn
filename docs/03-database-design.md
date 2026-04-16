# 数据库设计文档

## 1. 设计目标

数据库设计需要支撑当前 Web 第一版的最小闭环，同时保证后续扩展空间。

当前版本重点支持以下业务：

- 用户注册登录
- 首页内容展示
- 学习模块与课程展示
- 学习完成记录
- 基础翻译
- 收藏与翻译历史

## 2. 设计原则

- 先满足当前 MVP，再逐步扩展
- 内容数据与用户行为数据分离
- 结构尽量清晰，避免过早引入复杂表关系
- 翻译能力先依赖结构化词库，不依赖模型侧存储

## 3. 当前版本核心数据域

## 3.1 用户域

- `users`
- `user_profiles`

## 3.2 学习内容域

- `learning_modules`
- `learning_lessons`
- `lesson_terms`
- `lesson_sentences`

## 3.3 用户学习行为域

- `user_lesson_progress`
- `user_favorites`

## 3.4 翻译域

- `translation_dictionary`
- `translation_records`

## 4. 表优先级

## 4.1 第一版必须有

- `users`
- `user_profiles`
- `learning_modules`
- `learning_lessons`
- `lesson_terms`
- `lesson_sentences`
- `user_lesson_progress`
- `user_favorites`
- `translation_dictionary`
- `translation_records`

## 4.2 后续版本可增加

- `dialect_regions`
- `pronunciation_assets`
- `knowledge_nodes`
- `knowledge_edges`
- `crowdsourcing_submissions`
- `cultural_articles`

说明：

旧版本里有一些偏长期规划的表，例如知识图谱、众包语料、发音评测等，这些暂不建议放进第一版核心建模中。

## 5. 核心关系

```text
users -> user_profiles
users -> user_lesson_progress
users -> user_favorites
users -> translation_records

learning_modules -> learning_lessons
learning_lessons -> lesson_terms
learning_lessons -> lesson_sentences
learning_lessons -> user_lesson_progress
```

## 6. 主要表设计建议

## 6.1 users

用途：

- 存储用户基础账号信息

建议字段：

- `id` bigint 主键
- `username` varchar(50) 唯一
- `email` varchar(100) 唯一
- `password_hash` varchar(255)
- `status` varchar(20)
- `created_at` datetime
- `updated_at` datetime

说明：

- 第一版建议支持用户名和邮箱登录
- 密码必须加密存储

## 6.2 user_profiles

用途：

- 存储用户补充资料

建议字段：

- `id` bigint 主键
- `user_id` bigint 唯一
- `nickname` varchar(50)
- `avatar_url` varchar(255)
- `bio` varchar(255)
- `created_at` datetime
- `updated_at` datetime

## 6.3 learning_modules

用途：

- 表示学习中心下的模块

建议字段：

- `id` bigint 主键
- `title` varchar(100)
- `description` varchar(255)
- `level` varchar(20)
- `sort_order` int
- `status` varchar(20)
- `created_at` datetime
- `updated_at` datetime

建议初始模块：

- 基础问候
- 日常交流
- 餐饮点单
- 交通出行
- 常见称呼

## 6.4 learning_lessons

用途：

- 表示模块中的具体课程

建议字段：

- `id` bigint 主键
- `module_id` bigint
- `title` varchar(100)
- `summary` varchar(255)
- `difficulty` varchar(20)
- `estimated_minutes` int
- `sort_order` int
- `status` varchar(20)
- `created_at` datetime
- `updated_at` datetime

## 6.5 lesson_terms

用途：

- 存储课程中的词汇内容

建议字段：

- `id` bigint 主键
- `lesson_id` bigint
- `mandarin_text` varchar(100)
- `hainan_text` varchar(100)
- `pinyin_note` varchar(100)
- `meaning_note` varchar(255)
- `sort_order` int
- `created_at` datetime
- `updated_at` datetime

## 6.6 lesson_sentences

用途：

- 存储课程中的短句内容

建议字段：

- `id` bigint 主键
- `lesson_id` bigint
- `mandarin_text` varchar(255)
- `hainan_text` varchar(255)
- `meaning_note` varchar(255)
- `sort_order` int
- `created_at` datetime
- `updated_at` datetime

## 6.7 user_lesson_progress

用途：

- 记录用户课程学习状态

建议字段：

- `id` bigint 主键
- `user_id` bigint
- `lesson_id` bigint
- `status` varchar(20)
- `completed_at` datetime
- `created_at` datetime
- `updated_at` datetime

状态建议：

- `not_started`
- `in_progress`
- `completed`

## 6.8 user_favorites

用途：

- 存储用户收藏内容

建议字段：

- `id` bigint 主键
- `user_id` bigint
- `favorite_type` varchar(20)
- `target_id` bigint
- `created_at` datetime

说明：

- `favorite_type` 可用于区分课程、词汇、短句、翻译记录等

## 6.9 translation_dictionary

用途：

- 存储基础翻译词库

建议字段：

- `id` bigint 主键
- `source_lang` varchar(20)
- `target_lang` varchar(20)
- `source_text` varchar(255)
- `target_text` varchar(255)
- `note` varchar(255)
- `created_at` datetime
- `updated_at` datetime

说明：

- 第一版翻译主要依赖该表进行匹配

## 6.10 translation_records

用途：

- 记录用户翻译历史

建议字段：

- `id` bigint 主键
- `user_id` bigint 可为空
- `source_lang` varchar(20)
- `target_lang` varchar(20)
- `source_text` varchar(255)
- `target_text` varchar(255)
- `created_at` datetime

说明：

- 未登录用户也可以试用翻译，因此 `user_id` 可为空

## 7. 索引建议

- `users(username)`
- `users(email)`
- `learning_lessons(module_id, sort_order)`
- `lesson_terms(lesson_id, sort_order)`
- `lesson_sentences(lesson_id, sort_order)`
- `user_lesson_progress(user_id, lesson_id)`
- `user_favorites(user_id, favorite_type, created_at)`
- `translation_dictionary(source_lang, target_lang, source_text)`
- `translation_records(user_id, created_at)`

## 8. 数据治理建议

- 所有内容表保留 `created_at` 和 `updated_at`
- 涉及排序展示的表统一保留 `sort_order`
- 课程和模块统一保留 `status`
- 第一版种子数据建议通过 SQL 或脚本统一导入
- 当后续引入方言地域差异时，再增加 `dialect_region` 相关字段或独立表

## 9. 后续扩展建议

如果后续进入 AI 增强阶段，可再追加以下设计：

- `dialect_regions` 支撑多地区口音
- `pronunciation_assets` 支撑标准音频
- `pronunciation_assessments` 支撑发音测评
- `knowledge_nodes` 与 `knowledge_edges` 支撑知识图谱
- `crowdsourcing_submissions` 支撑用户语料上传

## 10. 本次改进说明

相较于旧版本，本次文档已完成以下优化：

- 全文改为中文
- 将数据库范围压缩到真正支撑 Web 第一版所需
- 删除了旧版中不适合当前阶段的过度设计
- 补充了更贴近实现的表字段建议
- 让数据库设计与当前产品计划、开发计划保持一致
