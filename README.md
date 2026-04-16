# 海南方言个人智能学习系统

一个面向海南方言学习的 Web 项目仓库，当前主交付聚焦 3 个核心功能：

- 学习中心：按模块和课程组织学习内容
- 基础翻译：支持普通话与海南话的双向查询
- 个人中心：沉淀学习进度、收藏与历史记录

这个仓库已经整理成适合发 GitHub 协作的版本，目标是让新同学拿到代码后，能快速看懂项目、跑起环境、继续开发。

## 项目结构

```text
Hainandialect_selflearn/
├─ apps/
│  ├─ web/         # Vue 3 + Vite 用户端，当前主前端
│  ├─ api/         # Spring Boot 3 + JPA 后端 API，当前主后端
│  ├─ admin/       # 管理端原型，当前非主交付
│  ├─ ai-service/  # AI 服务原型，当前非默认启动链路
│  └─ miniapp/     # 小程序骨架，当前非主交付
├─ database/       # 数据库初始化与种子数据
├─ docs/           # 产品、架构、数据库设计文档
└─ scripts/        # 一次性数据处理脚本
```

## 当前建议关注

如果你只想参与主线开发，优先看下面这些目录：

- `apps/web`
- `apps/api`
- `database`
- `docs`

下面这些目录当前保留在仓库中，但不是主线交付：

- `apps/admin`
- `apps/ai-service`
- `apps/miniapp`

## 技术栈

### 前端

- Vue 3
- Vue Router
- Vite

### 后端

- Spring Boot 3.3
- Spring Data JPA
- MySQL
- JWT

### 本地环境

- Node.js 18+
- npm 9+
- Java 21
- Maven 3.9+
- MySQL 8+
- Docker Desktop（可选）

## 快速开始

### 1. 克隆仓库

```bash
git clone <你的仓库地址>
cd Hainandialect_selflearn
```

### 2. 安装前端依赖

在项目根目录执行：

```bash
npm install
```

### 3. 准备数据库

推荐直接使用 Docker 启一个 MySQL：

```bash
docker compose up -d mysql
```

默认数据库配置与 [docker-compose.yml](docker-compose.yml) 对齐：

- database: `hainan_dialect_platform`
- username: `platform`
- password: `platform123`

如果你不用 Docker，也可以手动创建数据库：

```sql
CREATE DATABASE hainan_dialect_platform
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
```

### 4. 导入 SQL

至少执行下面两份：

```bash
mysql -u platform -p hainan_dialect_platform < database/init.sql
mysql -u platform -p hainan_dialect_platform < database/seed.sql
```

按需补充的数据脚本：

- `database/audio_samples_seed.sql`
- `database/audio_recognition_init.sql`
- `database/dictionary_tracking_init.sql`

### 5. 配置本地后端

共享配置在 [application.yml](apps/api/src/main/resources/application.yml)。

如果你需要保留自己的本机数据库账号、音频目录等私有配置，请新建：

```text
apps/api/src/main/resources/application-local.yml
```

这个文件已经被 [`.gitignore`](.gitignore) 忽略，不会被提交到 GitHub。

示例：

```yaml
spring:
  datasource:
    username: root
    password: your-password

audio:
  dataset-root: D:/your/audio/dataset/path/
```

### 6. 启动项目

启动后端：

```bash
npm run dev:api
```

启动前端：

```bash
npm run dev:web
```

默认地址：

- Web：`http://localhost:5173`
- API：`http://localhost:8080`
- 健康检查：`http://localhost:8080/api/v1/health`

## 常用命令

### 开发命令

```bash
npm run dev:web
npm run dev:admin
npm run dev:api
npm run dev:ai
```

### 构建命令

```bash
npm run build:web
npm run build:admin
mvn -q -DskipTests compile -f apps/api/pom.xml
```

### 端口约定

- Web：`5173`
- Admin：`5174`
- API：`8080`
- AI Service：`8001`

## 当前功能范围

当前主线功能只有 3 个：

1. 学习中心
2. 基础翻译
3. 个人中心

已经从主产品中下线并删除的页面：

- 项目演示
- 文化故事详情
- 词条详情

## 协作说明

### 新协作者建议先看

- `docs/01-product-plan.md`
- `docs/02-system-architecture.md`
- `docs/03-database-design.md`
- `docs/04-api-outline.md`

### 不要提交到仓库的内容

下面这些已经在 [`.gitignore`](.gitignore) 里处理：

- `apps/api/src/main/resources/application-local.yml`
- `apps/web/.env.local`
- `apps/admin/.env.local`
- `data/`
- `dist/`
- `target/`
- `node_modules/`

### 开发建议

- 主线开发优先围绕 `apps/web` 和 `apps/api`
- `admin`、`miniapp`、`ai-service` 当前不要作为主交付继续扩展
- 如果需要改数据库连接或本机路径，优先写到 `application-local.yml`

## 常见问题

### 后端启动失败，提示 8080 端口被占用

说明本机已经有一个 API 实例在运行。先停掉旧进程，再重新执行：

```bash
npm run dev:api
```

### 前端能打开，但接口报错

优先检查：

- 后端是否已启动
- MySQL 是否已启动
- `database/init.sql` 和 `database/seed.sql` 是否已导入

### 只想跑主项目，需要启动哪些服务

只需要：

- MySQL
- `apps/api`
- `apps/web`

## 配色文档

前端配色说明见：

```text
apps/web/color.md
```

这个文件适合后续做小程序、后台或其他端时直接复用。

## 推送到 GitHub

如果当前目录还没有 Git 仓库，可以在项目根目录执行：

```bash
git init -b main
git add .
git commit -m "Initial commit"
```

然后在 GitHub 上新建一个空仓库，注意不要预先勾选 README、`.gitignore` 或 License，再执行：

```bash
git remote add origin <你的仓库地址>
git remote -v
git push -u origin main
```

如果你装了 GitHub CLI，也可以直接执行：

```bash
gh repo create --source=. --private --remote=origin --push
```

GitHub 官方文档：

- [Adding locally hosted code to GitHub](https://docs.github.com/en/migrations/importing-source-code/using-the-command-line-to-import-source-code/adding-locally-hosted-code-to-github)

## 注意

不要把下面这些内容提交到远程仓库：

- 本机数据库密码
- 私有 API Key
- 本地绝对路径
- 私有音频数据

正式推送前，建议先检查一次：

```bash
git status
```
