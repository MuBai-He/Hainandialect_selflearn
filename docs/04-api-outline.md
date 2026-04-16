# 接口设计文档

## 1. 文档说明

本接口文档面向 Web 第一版开发，重点覆盖以下能力：

- 用户注册登录
- 首页数据聚合
- 学习中心数据获取
- 学习完成记录
- 基础翻译
- 收藏与个人中心

第一版不包含：

- 发音评测接口
- 众包语料接口
- 管理后台接口
- 独立 AI 服务接口

这些能力会在后续阶段再补充。

## 2. 接口设计原则

- 接口按业务域划分，避免前端直接感知底层数据结构
- 返回结构尽量统一，便于前端封装
- 第一版优先简单稳定，不做过度抽象
- 翻译相关接口以“短句与高频场景”为主

## 3. 统一返回结构建议

成功返回示例：

```json
{
  "code": 0,
  "message": "success",
  "data": {}
}
```

失败返回示例：

```json
{
  "code": 4001,
  "message": "用户名或密码错误",
  "data": null
}
```

## 4. 认证与用户接口

## 4.1 注册

- 方法：`POST`
- 路径：`/api/v1/auth/register`

请求体示例：

```json
{
  "username": "test_user",
  "email": "test@example.com",
  "password": "12345678"
}
```

返回内容建议：

- 用户基础信息
- JWT token

## 4.2 登录

- 方法：`POST`
- 路径：`/api/v1/auth/login`

请求体示例：

```json
{
  "account": "test_user",
  "password": "12345678"
}
```

返回内容建议：

- JWT token
- 用户信息

## 4.3 退出登录

- 方法：`POST`
- 路径：`/api/v1/auth/logout`

说明：

- 第一版为 JWT 无状态登录
- 退出登录时前端清理 token 即可

## 4.4 获取当前用户信息

- 方法：`GET`
- 路径：`/api/v1/users/me`

返回内容建议：

```json
{
  "id": 1,
  "username": "test_user",
  "nickname": "测试用户",
  "email": "test@example.com",
  "avatarUrl": "",
  "bio": ""
}
```

## 5. 首页接口

## 5.1 获取首页概览数据

- 方法：`GET`
- 路径：`/api/v1/home/overview`

返回内容建议：

```json
{
  "banner": {
    "title": "海南方言智能传播与学习平台",
    "subtitle": "学得会、查得到、记得住"
  },
  "recommendedModules": [],
  "recommendedLessons": [],
  "commonPhrases": []
}
```

说明：

- 首页数据建议由后端做聚合，减少前端多接口拼装

## 6. 学习中心接口

## 6.1 获取学习模块列表

- 方法：`GET`
- 路径：`/api/v1/learning/modules`

返回内容建议：

- 模块 id
- 模块标题
- 模块简介
- 课程数量
- 用户完成进度

## 6.2 获取模块详情

- 方法：`GET`
- 路径：`/api/v1/learning/modules/{moduleId}`

返回内容建议：

- 模块信息
- 课程列表

## 6.3 获取课程详情

- 方法：`GET`
- 路径：`/api/v1/learning/lessons/{lessonId}`

返回内容建议：

- 课程标题
- 课程简介
- 词汇列表
- 短句列表
- 学习状态

## 6.4 标记课程完成

- 方法：`POST`
- 路径：`/api/v1/learning/lessons/{lessonId}/complete`

请求体示例：

```json
{
  "status": "completed"
}
```

返回内容建议：

- 当前课程状态
- 当前模块完成数

## 6.5 获取我的学习进度

- 方法：`GET`
- 路径：`/api/v1/users/me/progress`

返回内容建议：

```json
{
  "completedLessons": 8,
  "inProgressLessons": 3,
  "recentLessons": []
}
```

## 7. 翻译接口

## 7.1 基础翻译

- 方法：`POST`
- 路径：`/api/v1/translate`

请求体示例：

```json
{
  "sourceLang": "mandarin",
  "targetLang": "hainan",
  "text": "你好"
}
```

返回内容建议：

```json
{
  "recordId": 1,
  "sourceLang": "mandarin",
  "targetLang": "hainan",
  "sourceText": "你好",
  "targetText": "示例翻译",
  "note": "结果仅供参考"
}
```

说明：

- 第一版主要支持词语和短句
- 建议限制输入长度，避免超出规则词库能力边界
- `recordId` 可用于前端收藏翻译结果

## 7.2 获取翻译历史

- 方法：`GET`
- 路径：`/api/v1/translate/history`

查询参数建议：

- `page`
- `size`

返回内容建议：

- 历史记录列表
- 总数

## 8. 收藏接口

## 8.1 新增收藏

- 方法：`POST`
- 路径：`/api/v1/favorites`

请求体示例：

```json
{
  "favoriteType": "lesson",
  "targetId": 1001
}
```

支持类型建议：

- `lesson`
- `term`
- `sentence`
- `translation_record`

## 8.2 获取我的收藏

- 方法：`GET`
- 路径：`/api/v1/users/me/favorites`

查询参数建议：

- `favoriteType`
- `page`
- `size`

## 8.3 删除收藏

- 方法：`DELETE`
- 路径：`/api/v1/favorites/{favoriteId}`

## 9. 个人中心接口

个人中心本身不必单独设计大量新接口，建议复用以下接口聚合展示：

- `GET /api/v1/users/me`
- `GET /api/v1/users/me/progress`
- `GET /api/v1/users/me/favorites`
- `GET /api/v1/translate/history`

如果后期聚合逻辑较复杂，可新增：

- `GET /api/v1/users/me/dashboard`

## 10. 鉴权建议

- 首页、学习中心、翻译页允许游客浏览和试用
- 注册登录后可保存进度、收藏和翻译历史
- 收藏、学习完成、个人中心接口需要登录

建议方式：

- 使用 Bearer Token
- 前端统一在请求头中传递 `Authorization`
- token 类型为 `JWT`

## 11. 错误码建议

- `0`：成功
- `4001`：参数错误
- `4002`：用户不存在或密码错误
- `4003`：未登录或 token 无效
- `4004`：资源不存在
- `5000`：服务器内部错误

## 12. 后续扩展接口预留

后续阶段可追加：

- 发音评测接口
- 管理后台内容接口
- AI 增强翻译接口
- 众包语料上传接口

但不建议在第一版接口文档中和当前实现混写。

## 13. 本次改进说明

相较于旧版本，本次文档已完成以下优化：

- 全文改为中文
- 接口范围已收敛到 Web 第一版真实需要
- 删除了旧版中过早加入的发音、众包、后台、AI 服务接口
- 补充了注册、首页、收藏等当前缺失但实际必需的接口
- 统一了接口命名风格与返回结构建议
