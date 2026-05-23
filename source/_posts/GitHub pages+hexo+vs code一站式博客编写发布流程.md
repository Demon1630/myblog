---
title: GitHub pages+hexo+vs code一站式博客编写发布流程
date: 2026-05-21
categories:
- 技术
tags:
- Hexo
- GitHub Pages
- VS Code
img: /medias/featureimages/0.jpg
summary: 精简优雅的 Hexo 博客搭建与发布全纪录。
top: false
cover: false
---
## 前言

作为一个技术人员，拥有自己的博客网站是一件很有意义的事情。以前搭建博客往往需要购买服务器、域名，还要配置数据库、环境等，既费钱又费时。而利用 **GitHub Pages + Hexo** 这套方案，完全免费就能搭建一个美观、快速、易维护的个人博客网站，配合 VS Code 进行写作，体验非常流畅。

## 一、认识 Hexo 和 GitHub Pages

**Hexo** 是一个基于 Node.js 的静态博客框架，支持 Markdown 语法，可以一键生成静态页面，拥有丰富的主题和插件生态。

**GitHub Pages** 是 GitHub 提供的免费静态网站托管服务，每个用户都可以创建一个 `用户名.github.io` 的仓库，将静态文件部署上去后即可通过该域名访问。

两者的结合是目前最流行的免费博客搭建方案之一。

## 二、环境准备

### 1. 安装 Node.js

Hexo 基于 Node.js，需要先安装它。前往 [Node.js 官网](https://nodejs.org/) 下载 LTS 版本并安装。安装完成后打开终端验证：

```bash
node -v
npm -v
```

### 2. 安装 Git

Git 用于版本管理和部署博客到 GitHub。从 [Git 官网](https://git-scm.com/) 下载安装。安装后配置基本信息：

```bash
git config --global user.name "你的名字"
git config --global user.email "你的邮箱"
```

### 3. 安装 VS Code

VS Code 是目前最好用的 Markdown 编辑器之一，支持实时预览、快捷键、插件扩展等。从 [VS Code 官网](https://code.visualstudio.com/) 下载安装即可。

## 三、安装并配置 Hexo

### 1. 全局安装 Hexo

```bash
npm install -g hexo-cli
```

### 2. 初始化博客项目

```bash
hexo init myblog
cd myblog
npm install
```

`hexo init` 会自动生成博客的基础目录结构，主要包括：

- `source/_posts/` — 存放文章 Markdown 文件
- `themes/` — 存放主题文件
- `_config.yml` — 博客配置文件

### 3. 本地预览

```bash
hexo server
```

打开浏览器访问 `http://localhost:4000`，即可看到默认的 Hexo 博客页面。按 `Ctrl + C` 可以停止服务。

## 四、配置博客信息

编辑博客根目录下的 `_config.yml` 文件，修改基本配置：

```yaml
# 网站
title: 我的博客
subtitle: 记录技术与生活
description: 用文字记录成长
author: 你的名字
language: zh-CN
timezone: Asia/Shanghai

# URL
url: https://你的用户名.github.io
```

根据自己的需要修改标题、描述、作者等信息。

## 五、更换主题

Hexo 默认的主题是 landscape，比较简约。可以在 Hexo 官网主题商店挑选喜欢的主题。以流行的 **NexT** 主题为例：

```bash
git clone https://github.com/next-theme/hexo-theme-next themes/next
```

然后在 `_config.yml` 中修改主题配置：

```yaml
theme: next
```

主题的详细配置在 `themes/next/_config.yml` 中，可以按需修改菜单、侧边栏、样式等。

## 六、创建 GitHub 仓库

1. 登录 GitHub，点击右上角 `+` → `New repository`
2. 仓库名称填 `你的用户名.github.io`（必须严格一致）
3. 设为 Public，其他默认，点击创建

## 七、部署到 GitHub Pages

### 1. 安装部署插件

```bash
npm install hexo-deployer-git --save
```

### 2. 配置部署信息

在 `_config.yml` 末尾添加：

```yaml
deploy:
  type: git
  repo: https://github.com/你的用户名/你的用户名.github.io.git
  branch: main
```

### 3. 生成并部署

```bash
hexo clean
hexo generate
hexo deploy
```

部署完成后，访问 `https://你的用户名.github.io` 即可看到你的博客上线了。

## 八、使用 VS Code 编写博客

### 1. 用 VS Code 打开博客项目

在 VS Code 中打开博客所在的文件夹，方便管理文章和配置。

### 2. 新建文章

在终端中执行：

```bash
hexo new "文章标题"
```

这会在 `source/_posts/` 目录下生成一个 Markdown 文件，包含基本的 Front-matter 头部信息：

```markdown
---
title: 文章标题
date: 2026-05-21
tags:
---
```

### 3. 使用 Markdown 写作

VS Code 对 Markdown 有很好的支持：

- `Ctrl + Shift + V` 打开实时预览
- 支持代码高亮、表格、数学公式等
- 安装 `Hexo Utils` 等插件可以提升写作效率

### 4. 发布流程

写完文章后的发布流程非常简单：

```bash
hexo clean       # 清理缓存
hexo generate    # 生成静态文件
hexo deploy      # 部署到 GitHub
```

可以将这三条命令合并为一个 npm 脚本，在 `package.json` 中添加：

```json
"scripts": {
  "deploy": "hexo clean && hexo generate && hexo deploy"
}
```

之后只需执行：

```bash
npm run deploy
```

即可一键发布。

## 九、绑定自定义域名（可选）

如果想使用自己的域名而非 `用户名.github.io`，可以参考以下步骤：

1. 在域名管理后台添加 CNAME 解析，指向 `用户名.github.io`
2. 在博客 `source` 目录下创建 `CNAME` 文件，内容填你的域名
3. 重新部署即可

## 十、日常写作流程总结

当一切配置完成后，每次写博客只需要三步：

1. `hexo new "新文章标题"` — 新建文章
2. 在 VS Code 中编写 Markdown 内容
3. `npm run deploy` — 一键部署上线

整个过程无需接触服务器，无需担心数据库，只需一个浏览器和一个编辑器就能完成从写作到发布的全流程。

## 结语

GitHub Pages + Hexo + VS Code 是一套非常适合技术写作者的博客方案，零成本、高效率、易维护。希望这篇教程能帮助你快速搭建起属于自己的博客，开始记录和分享你的技术与生活。
