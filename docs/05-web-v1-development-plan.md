# Web 第一版开发计划

## 1. 版本目标

本计划用于指导海南方言智能传播与学习平台 Web 第一版开发落地。

你已经确认的第一版范围如下：

- 保留 `首页`
- 保留 `注册登录`
- 保留 `学习中心`
- 保留 `基础翻译`
- 保留 `个人中心`
- 前端使用 `Vue`
- 后端使用 `Spring Boot`
- 数据库使用 `MySQL`

本版本目标不是一次性做成完整 AI 平台，而是先做出一个可以上线演示、可以实际体验、可以继续迭代的 Web MVP。

## 2. 当前仓库现状

当前仓库 `Hainandialect_selflearn` 已经具备初始骨架：

- `apps/web`：已有 Vue + Vite 基础页面
- `apps/api`：已有 Spring Boot 基础项目
- `database`：已有初始化脚本目录
- `docs`：已有产品、架构、数据库、API 草稿文档

当前 `apps/web` 已有页面：

- `HomeView`
- `LearningView`
- `TranslateView`
- `CultureView`

第一版需要做的结构调整：

- 保留 `HomeView`
- 保留 `LearningView`
- 保留 `TranslateView`
- 删除或停用 `CultureView`
- 新增 `LoginView`
- 新增 `RegisterView`
- 新增 `ProfileView`

## 3. 第一版产品边界

## 3.1 本版必须做

- 首页品牌展示和入口导航
- 用户注册、登录、退出
- 学习中心内容浏览
- 课程详情与学习完成记录
- 普通话与海南方言基础翻译
- 个人中心学习记录与收藏

## 3.2 本版不做

- 数字人
- 发音打分
- 实时语音识别
- 三语互译中的英语能力
- 知识图谱可视化
- 社区互动
- 独立管理后台

说明：

第一版建议不做独立后台，课程、词条、翻译词库先通过 `seed.sql` 或 JSON 初始化导入，先把用户侧主流程跑通。

## 4. Web 第一版页面结构图

```text
Web V1
├─ /
│  ├─ 顶部导航
│  ├─ Hero 主视觉
│  ├─ 平台介绍
│  ├─ 快速入口
│  ├─ 推荐课程
│  ├─ 常用短句
│  └─ 页脚
├─ /login
│  └─ 登录页
├─ /register
│  └─ 注册页
├─ /learning
│  ├─ 学习中心首页
│  ├─ 模块列表
│  ├─ 课程卡片
│  └─ 我的学习进度摘要
├─ /learning/module/:moduleId
│  └─ 模块详情页
├─ /learning/lesson/:lessonId
│  ├─ 课程内容
│  ├─ 词汇列表
│  ├─ 常用短句
│  ├─ 小练习
│  └─ 完成学习按钮
├─ /translate
│  ├─ 翻译输入区
│  ├─ 翻译方向切换
│  ├─ 结果展示区
│  ├─ 常用表达推荐
│  └─ 历史记录
└─ /profile
   ├─ 用户资料
   ├─ 学习统计
   ├─ 最近学习
   ├─ 我的收藏
   └─ 退出登录
```

## 5. 页面模块设计

## 5.1 首页

目标：

- 建立产品认知
- 让用户快速进入学习或翻译
- 提高注册转化

页面模块：

- 顶部导航
- Slogan 与产品介绍
- 开始学习按钮
- 立即翻译按钮
- 推荐课程卡片
- 常用海南话短句卡片
- 平台特色说明
- 页脚信息

首页接口建议：

- `GET /api/v1/home/overview`

返回内容建议：

- 热门模块
- 推荐课程
- 常用短句
- 平台展示文案

## 5.2 注册登录页

目标：

- 完成用户身份建立
- 为学习进度、收藏和翻译记录提供绑定能力

页面模块：

- 登录表单
- 注册表单
- 表单校验提示
- 登录成功跳转
- 去注册/去登录切换

第一版建议：

- 登录方式先做 `用户名/邮箱 + 密码`
- 不做短信登录
- 使用 JWT 或基于 Token 的登录态

接口建议：

- `POST /api/v1/auth/register`
- `POST /api/v1/auth/login`
- `POST /api/v1/auth/logout`
- `GET /api/v1/users/me`

## 5.3 学习中心

目标：

- 提供系统化的学习入口
- 形成“浏览 -> 学习 -> 完成 -> 记录”的闭环

页面模块：

- 学习模块分类
- 模块简介
- 课程卡片列表
- 用户当前学习进度
- 继续学习入口

学习模块建议：

- 基础问候
- 日常交流
- 餐饮点单
- 交通出行
- 常见称呼

课程详情建议包含：

- 课程标题与简介
- 词汇列表
- 短句列表
- 注释与普通话释义
- 练习题
- 学习完成按钮

接口建议：

- `GET /api/v1/learning/modules`
- `GET /api/v1/learning/modules/{moduleId}`
- `GET /api/v1/learning/lessons/{lessonId}`
- `POST /api/v1/learning/lessons/{lessonId}/complete`
- `GET /api/v1/users/me/progress`

## 5.4 基础翻译页

目标：

- 满足用户即时查询需求
- 为学习模块提供辅助能力

页面模块：

- 输入框
- 翻译方向切换
- 翻译结果卡片
- 常用表达推荐
- 历史记录
- 收藏结果按钮

第一版翻译策略：

- 不直接接复杂 AI 模型
- 优先使用 `词库 + 短句模板 + 规则匹配`
- 先保证高频场景短句可用

支持方向：

- 普通话 -> 海南方言
- 海南方言 -> 普通话

接口建议：

- `POST /api/v1/translate`
- `GET /api/v1/translate/history`
- `POST /api/v1/favorites`

## 5.5 个人中心

目标：

- 聚合用户状态
- 强化连续学习感

页面模块：

- 用户头像与昵称
- 学习天数
- 已学课程数
- 最近学习记录
- 收藏词条/短句
- 历史翻译记录
- 退出登录

接口建议：

- `GET /api/v1/users/me`
- `GET /api/v1/users/me/progress`
- `GET /api/v1/users/me/favorites`
- `GET /api/v1/translate/history`

## 6. 用户主流程

## 6.1 游客流程

```text
首页 -> 浏览介绍 -> 点击学习中心/翻译页 -> 试用部分功能 -> 引导注册
```

## 6.2 注册用户学习流程

```text
注册/登录 -> 进入学习中心 -> 选择模块 -> 打开课程 -> 学习词汇和短句 -> 完成练习 -> 标记完成 -> 个人中心查看进度
```

## 6.3 翻译流程

```text
进入翻译页 -> 输入文本 -> 选择方向 -> 查看结果 -> 收藏结果 -> 在个人中心查看历史
```

## 7. 技术方案

## 7.1 前端技术栈

- `Vue 3`
- `Vite`
- `Vue Router`
- `Pinia`
- `Axios`
- 原生 CSS 或 CSS Modules

说明：

- 第一版公共 Web 不强制引入重量级 UI 组件库
- 页面数量不多，优先用自定义组件保证风格统一
- 如后续开发效率需要，可再补 `Element Plus`

## 7.2 后端技术栈

- `Spring Boot 3`
- `Spring Web`
- `Spring Validation`
- `Spring Data JPA`
- `MySQL 8`
- `JWT` 身份认证

说明：

- 第一版先不拆 AI 服务
- 翻译逻辑放在 Spring Boot 内部实现
- 这样更适合快速完成 MVP

## 7.3 数据库

- `MySQL 8`

用途：

- 用户信息
- 学习内容
- 用户学习进度
- 收藏
- 翻译词库
- 翻译历史

## 7.4 部署方式

MVP 推荐：

- 前端：Vite build 后静态部署
- 后端：Spring Boot 单体服务
- 数据库：MySQL 单实例

后续可扩展：

- Nginx
- Docker Compose
- Redis
- 独立 AI 服务

## 8. 项目骨架规划

## 8.1 前端目录规划

目标目录：

```text
apps/web
└─ src
   ├─ api
   │  ├─ auth.js
   │  ├─ home.js
   │  ├─ learning.js
   │  ├─ translate.js
   │  └─ user.js
   ├─ assets
   ├─ components
   │  ├─ common
   │  ├─ home
   │  ├─ learning
   │  ├─ translate
   │  └─ profile
   ├─ layouts
   │  └─ MainLayout.vue
   ├─ router
   │  └─ index.js
   ├─ stores
   │  ├─ auth.js
   │  ├─ learning.js
   │  └─ app.js
   ├─ styles
   │  ├─ global.css
   │  └─ variables.css
   ├─ utils
   │  ├─ request.js
   │  └─ storage.js
   ├─ views
   │  ├─ HomeView.vue
   │  ├─ LoginView.vue
   │  ├─ RegisterView.vue
   │  ├─ LearningView.vue
   │  ├─ LessonDetailView.vue
   │  ├─ TranslateView.vue
   │  └─ ProfileView.vue
   ├─ App.vue
   └─ main.js
```

当前骨架调整动作：

- 保留现有 `HomeView.vue`
- 保留现有 `LearningView.vue`
- 保留现有 `TranslateView.vue`
- 用 `ProfileView.vue` 替换 `CultureView.vue`
- 新增登录注册页
- 在 `router/index.js` 中补充鉴权与路由守卫

## 8.2 后端目录规划

目标目录：

```text
apps/api
└─ src/main/java/com/yantongqiongdao/platform
   ├─ common
   │  ├─ exception
   │  ├─ response
   │  └─ utils
   ├─ config
   ├─ controller
   │  ├─ AuthController.java
   │  ├─ HomeController.java
   │  ├─ LearningController.java
   │  ├─ TranslateController.java
   │  └─ UserController.java
   ├─ domain
   │  ├─ entity
   │  ├─ dto
   │  └─ vo
   ├─ repository
   ├─ security
   │  ├─ JwtTokenProvider.java
   │  ├─ JwtAuthenticationFilter.java
   │  └─ SecurityConfig.java
   ├─ service
   │  ├─ AuthService.java
   │  ├─ HomeService.java
   │  ├─ LearningService.java
   │  ├─ TranslateService.java
   │  └─ UserService.java
   └─ YanTongQiongDaoApplication.java
```

需要新增依赖：

- `spring-boot-starter-data-jpa`
- `spring-boot-starter-security`
- `mysql-connector-j`
- `jjwt`

## 8.3 数据库目录规划

```text
database
├─ init.sql
├─ seed.sql
└─ migration
   ├─ V1__create_users.sql
   ├─ V2__create_learning_tables.sql
   ├─ V3__create_translate_tables.sql
   └─ V4__seed_base_content.sql
```

## 9. 数据表设计建议

第一版建议只保留最小必要表。

## 9.1 用户相关

- `users`
- `user_profiles`

## 9.2 学习内容相关

- `learning_modules`
- `learning_lessons`
- `lesson_terms`
- `lesson_sentences`

## 9.3 用户学习行为相关

- `user_lesson_progress`
- `user_favorites`

## 9.4 翻译相关

- `translation_dictionary`
- `translation_records`

## 9.5 推荐字段

### users

- `id`
- `username`
- `email`
- `password_hash`
- `status`
- `created_at`

### learning_modules

- `id`
- `title`
- `description`
- `level`
- `sort_order`
- `status`

### learning_lessons

- `id`
- `module_id`
- `title`
- `summary`
- `difficulty`
- `sort_order`
- `status`

### lesson_terms

- `id`
- `lesson_id`
- `mandarin_text`
- `hainan_text`
- `pinyin_note`
- `meaning_note`

### lesson_sentences

- `id`
- `lesson_id`
- `mandarin_text`
- `hainan_text`
- `meaning_note`

### user_lesson_progress

- `id`
- `user_id`
- `lesson_id`
- `status`
- `completed_at`

### user_favorites

- `id`
- `user_id`
- `favorite_type`
- `target_id`
- `created_at`

### translation_dictionary

- `id`
- `source_lang`
- `target_lang`
- `source_text`
- `target_text`
- `note`

### translation_records

- `id`
- `user_id`
- `source_lang`
- `target_lang`
- `source_text`
- `target_text`
- `created_at`

## 10. 接口规划

## 10.1 认证接口

- `POST /api/v1/auth/register`
- `POST /api/v1/auth/login`
- `POST /api/v1/auth/logout`
- `GET /api/v1/users/me`

## 10.2 首页接口

- `GET /api/v1/home/overview`

## 10.3 学习接口

- `GET /api/v1/learning/modules`
- `GET /api/v1/learning/modules/{moduleId}`
- `GET /api/v1/learning/lessons/{lessonId}`
- `POST /api/v1/learning/lessons/{lessonId}/complete`
- `GET /api/v1/users/me/progress`

## 10.4 翻译接口

- `POST /api/v1/translate`
- `GET /api/v1/translate/history`

## 10.5 收藏接口

- `POST /api/v1/favorites`
- `GET /api/v1/users/me/favorites`
- `DELETE /api/v1/favorites/{favoriteId}`

## 11. 翻译实现方案

第一版翻译建议采用轻量方案：

```text
输入文本
-> 文本预处理
-> 精确匹配词库
-> 常用短句匹配
-> 简单规则替换
-> 输出结果
```

优点：

- 不依赖复杂模型
- 开发周期短
- 便于手工修正
- 适合课程内容和高频场景

缺点：

- 泛化能力有限
- 长文本效果一般

所以第一版翻译输入建议限制为：

- 单词
- 短语
- 短句

不建议第一版就支持长段落。

## 12. 开发排期

建议总周期：`5 周到 6 周`

## 第 1 周：需求冻结与骨架调整

目标：

- 冻结第一版范围
- 完成页面结构与接口草图
- 调整现有仓库骨架

任务：

- 完成开发计划确认
- 确认路由结构
- 确认数据库最小表结构
- 前端补 `LoginView`、`RegisterView`、`ProfileView`
- 后端补认证、用户、学习、翻译模块空壳

交付物：

- 最终开发计划文档
- 路由清单
- 数据表清单
- 项目骨架目录

## 第 2 周：首页与认证模块

目标：

- 完成首页和用户注册登录闭环

任务：

- 首页模块搭建
- 注册登录页面开发
- JWT 登录认证
- 用户信息接口
- 前后端联调登录态

交付物：

- 可访问首页
- 可注册登录
- 登录后可获取当前用户信息

## 第 3 周：学习中心模块

目标：

- 完成学习内容浏览与学习记录

任务：

- 学习中心列表页
- 模块详情页
- 课程详情页
- 学习完成接口
- 我的进度摘要
- 初始化课程与词条数据

交付物：

- 用户可浏览模块和课程
- 用户可完成课程并记录状态

## 第 4 周：翻译模块与个人中心

目标：

- 完成基础翻译和个人中心

任务：

- 翻译页面开发
- 翻译词库与规则实现
- 翻译历史记录
- 收藏功能
- 个人中心页面开发

交付物：

- 用户可进行基础翻译
- 用户可查看历史翻译和收藏
- 用户可在个人中心查看学习统计

## 第 5 周：联调与测试

目标：

- 完成 Web 第一版联调与问题修复

任务：

- 页面联调
- 接口联调
- 样式统一
- 边界场景验证
- 错误处理补全

交付物：

- 可演示版本
- 联调问题清单
- 修复完成记录

## 第 6 周：优化与部署

目标：

- 完成上线前准备

任务：

- 页面细节优化
- 数据初始化优化
- 部署配置整理
- 测试环境发布
- 演示脚本整理

交付物：

- 测试环境地址
- 部署文档
- 演示版本

## 13. 任务拆分建议

## 13.1 前端任务

- 路由重构
- 公共布局
- 五个核心页面开发
- 登录态管理
- 请求封装
- 个人中心数据展示

## 13.2 后端任务

- 用户认证
- 学习模块接口
- 翻译模块接口
- 收藏与进度接口
- 通用返回结构
- 异常处理

## 13.3 数据任务

- 建表
- 初始化数据
- 课程种子数据整理
- 翻译词库初始化

## 14. 种子内容建议

第一版建议先准备以下内容量级：

- `5` 个学习模块
- 每个模块 `4` 到 `6` 节课程
- `150` 到 `250` 个高频词汇
- `80` 到 `120` 条常用短句
- `100` 到 `200` 条翻译词库

这样既能支撑演示，也不会导致前期内容整理压力过大。

## 15. 第一版验收标准

- 用户可以正常注册、登录、退出
- 首页可以正常展示平台信息和入口
- 学习中心可以浏览模块、课程、课程详情
- 用户可以完成课程并记录进度
- 用户可以进行基础双向短句翻译
- 用户可以收藏课程或翻译内容
- 个人中心可以展示用户信息、学习统计、收藏和历史

## 16. 风险与应对

## 16.1 范围膨胀

风险：

- 开发中途又加入文化页、数字人、发音评分，导致节奏失控

应对：

- 第一版只做五个页面
- 其它需求全部放进 V2 需求池

## 16.2 翻译效果不稳定

风险：

- 一开始就追求 AI 效果，结果接口不稳定、效果不可控

应对：

- 第一版使用词库和规则
- 只支持高频短句

## 16.3 内容准备不足

风险：

- 页面做好了，但没有足够课程和词条支撑体验

应对：

- 优先准备种子内容
- 每周固定补充内容

## 16.4 技术栈过重

风险：

- 同时上很多框架，团队节奏被拖慢

应对：

- Web 端先用 Vue 基础栈
- 后端先用单体 Spring Boot

## 17. 建议的启动顺序

如果你现在立刻开工，最推荐的顺序是：

1. 先改 `apps/web` 路由和页面壳子
2. 再补 `apps/api` 的认证与学习接口
3. 再建 MySQL 表和导入种子数据
4. 再联调学习中心
5. 最后补翻译和个人中心

## 18. 结论

这一版 Web 开发计划的核心思路是：

- 页面先收敛到五个
- 技术先收敛到 Vue + Spring Boot + MySQL
- 架构先保持单体、轻量、可快速交付
- 翻译先用规则词库方案，不被 AI 模型卡住
- 内容先用种子数据喂起来，尽快做出完整闭环

这样做的好处是，团队可以尽快拿到一个真正能跑起来的版本，后面无论是继续接 AI 能力，还是继续做小程序、后台、知识图谱，都会更稳。
