# 前端配色说明

这个文件用于沉淀 `apps/web` 当前正在使用的主配色，方便后续在小程序、后台或其他端直接复用，不需要再从 CSS 里反向提取颜色。

配色来源：

- [global.css](src/styles/global.css)

## 设计关键词

- 温润：整体底色偏米白、暖砂色，不走纯白冷调
- 海岛感：主色使用深海绿，体现海南地域与自然感
- 人情味：强调色使用陶土橘，增强口语学习产品的亲近感
- 文化感：辅色加入金色，适合徽标、章纹、进度和荣誉反馈

## 核心颜色

| Token | 色值 | 用途 |
| --- | --- | --- |
| `--color-primary` | `#1f5c5a` | 主按钮、主链接、主品牌色 |
| `--color-primary-hover` | `#174948` | 主按钮 hover / active |
| `--color-accent` | `#c75b3a` | 重点 CTA、强调按钮、风险提示 |
| `--color-accent-hover` | `#af4d30` | 强调按钮 hover / active |
| `--color-secondary` | `#7fa79d` | 次级品牌色、辅助图形、次强调 |
| `--color-gold` | `#c9a35d` | 徽章、荣誉、路线阶段、高亮标签 |
| `--color-success` | `#2c8f68` | 成功状态 |
| `--color-warning` | `#c9a35d` | 警告状态 |
| `--color-danger` | `#c75b3a` | 错误状态 |
| `--color-info` | `#1f5c5a` | 信息状态 |

## 浅色背景

| Token | 色值 | 用途 |
| --- | --- | --- |
| `--bg-page` | `#f7f3eb` | 页面默认背景 |
| `--bg-surface` | `#fcfaf6` | 卡片、浮层、输入框背景 |
| `--bg-warm` | `#f1e9dc` | 暖色区块、浅色强调背景 |
| `--bg-teal` | `#eef4f1` | 绿色语义区块、学习内容背景 |
| `--bg-deep-section` | `#183332` | 深色横幅、页脚、大段落收尾区 |

## 深色模式背景

| Token | 色值 | 用途 |
| --- | --- | --- |
| `--bg-page-dark` | `#0d1414` | 深色页面背景 |
| `--bg-surface-dark` | `#142020` | 深色卡片背景 |
| `--bg-warm-dark` | `#1b1916` | 深色暖调区块 |
| `--bg-teal-dark` | `#13201e` | 深色青绿区块 |
| `--bg-deep-section-dark` | `#091010` | 深色页脚 / 深底大区块 |

## 文字颜色

| Token | 色值 | 用途 |
| --- | --- | --- |
| `--text-primary` | `#1d1a17` | 主标题、正文主文本 |
| `--text-secondary` | `#665c52` | 次级说明文字 |
| `--text-tertiary` | `#988c7c` | 辅助信息、弱化文案 |
| `--text-primary-dark` | `#f3eee6` | 深色模式主文字 |
| `--text-secondary-dark` | `#b8aa98` | 深色模式次级文字 |
| `--text-tertiary-dark` | `#8e8377` | 深色模式弱化文字 |

## 边框与透明层

| Token | 色值 | 用途 |
| --- | --- | --- |
| `--border` | `rgba(29, 26, 23, 0.08)` | 默认边框 |
| `--border-strong` | `rgba(31, 92, 90, 0.18)` | 品牌强化边框 |
| `--border-warm` | `rgba(199, 91, 58, 0.16)` | 暖色边框 |
| `--border-dark` | `rgba(243, 238, 230, 0.1)` | 深色模式边框 |
| `--nav-bg` | `rgba(247, 243, 235, 0.82)` | 顶部导航半透明背景 |
| `--footer-bg` | `#102221` | 页脚背景 |

## 透明态品牌色

这些颜色特别适合做胶囊标签、卡片浅底、hover 态背景。

| Token | 色值 | 用途 |
| --- | --- | --- |
| `--color-primary-light` | `rgba(31, 92, 90, 0.1)` | 主色浅底 |
| `--color-primary-ultra` | `rgba(31, 92, 90, 0.05)` | 更轻的主色浅底 |
| `--color-accent-light` | `rgba(199, 91, 58, 0.12)` | 强调色浅底 |
| `--color-accent-ultra` | `rgba(199, 91, 58, 0.06)` | 更轻的强调色浅底 |
| `--color-secondary-light` | `rgba(127, 167, 157, 0.14)` | 次级品牌浅底 |
| `--color-gold-light` | `rgba(201, 163, 93, 0.14)` | 金色浅底 |

## 组件级使用建议

### 按钮

- 主按钮：`#1f5c5a`
- 主按钮 hover：`#174948`
- 强调按钮：`#c75b3a`
- 强调按钮 hover：`#af4d30`
- 浅色描边按钮：背景使用 `#fcfaf6`，边框使用 `rgba(31, 92, 90, 0.12)`

### 标签 / Badge

- teal 标签：背景用 `rgba(31, 92, 90, 0.1)`，文字用 `#1f5c5a`
- coral 标签：背景用 `rgba(199, 91, 58, 0.12)`，文字用 `#c75b3a`
- gold 标签：背景用 `rgba(201, 163, 93, 0.14)`，文字建议用 `#a06d00`

### 卡片

- 默认卡片背景：`#fcfaf6`
- 页面底色：`#f7f3eb`
- 深色区块卡片：`#183332`
- 普通边框：`rgba(29, 26, 23, 0.08)`

### 文本

- 主标题：`#1d1a17`
- 段落说明：`#665c52`
- 辅助信息：`#988c7c`

## 小程序复用建议

小程序没有 CSS 变量体系时，建议先建立一份常量映射表。

### 推荐命名

```js
export const colors = {
  primary: "#1f5c5a",
  primaryHover: "#174948",
  accent: "#c75b3a",
  accentHover: "#af4d30",
  secondary: "#7fa79d",
  gold: "#c9a35d",
  bgPage: "#f7f3eb",
  bgSurface: "#fcfaf6",
  bgWarm: "#f1e9dc",
  bgTeal: "#eef4f1",
  bgDeep: "#183332",
  textPrimary: "#1d1a17",
  textSecondary: "#665c52",
  textTertiary: "#988c7c",
  success: "#2c8f68",
  warning: "#c9a35d",
  danger: "#c75b3a"
}
```

### 小程序推荐直接复用的 6 个主色

如果后续小程序只想先做最小版本，建议先复用这 6 个：

- `#1f5c5a`：主品牌色
- `#c75b3a`：强调色
- `#7fa79d`：辅助色
- `#c9a35d`：高亮色
- `#f7f3eb`：页面背景
- `#1d1a17`：主文字

## 不建议的做法

- 不要把页面做成纯白背景加高饱和按钮，会丢掉这个项目的文化气质
- 不要新增太多完全不同的颜色体系，后续多端统一会很难
- 不要把金色作为大面积主背景，它更适合做阶段、徽章、点缀
- 不要把橘色和绿色同时大面积铺满一个模块，容易显得乱

## 建议的配色优先级

如果后面继续开发新页面，建议优先按这个顺序选色：

1. 先用主色 `#1f5c5a`
2. 再决定是否需要强调色 `#c75b3a`
3. 再补辅助色 `#7fa79d`
4. 最后才考虑金色 `#c9a35d`

这样能最大限度保持整个系统的统一感。
