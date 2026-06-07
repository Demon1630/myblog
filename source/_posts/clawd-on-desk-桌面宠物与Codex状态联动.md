---
title: Clawd on Desk：一个会显示 Codex 状态的 Windows 桌面宠物
date: 2026-06-07
categories:
- 工具
- 桌面宠物
tags:
- Clawd on Desk
- Codex
- Electron
- Windows
- 桌面宠物
---
# Clawd on Desk：一个会显示 Codex 状态的 Windows 桌面宠物

`Clawd on Desk` 是一个 Windows 桌面宠物项目，基于原始项目 `clawd-on-desk` 整理而来。和普通桌宠不同的是，这个版本把 `Codex` 的状态也接了进来，可以在桌宠旁边直接看到额度、会话状态和最新回复内容。

本项目地址：[clawd-on-desk](https://github.com/Demon1630/clawd-on-desk "https://github.com/Demon1630/clawd-on-desk")

如果你平时会频繁使用 Codex CLI，这个项目就很实用：不用一直切回终端，也能快速知道当前会话在做什么。
![image.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260607082014806.png)

## 项目特点

这个版本主要做了两件事：

- 保留桌面宠物的基础交互和动画
- 增加 Codex 相关信息展示

具体来说，它支持：

- 桌面宠物悬浮显示
- 主题、动画、托盘菜单和基础设置
- 显示 Codex 5 小时额度和本周额度
- 根据当前时间进度提示额度使用是否偏快
- 显示当前 Codex 会话标题、运行状态和最新回复内容
- 读取 Codex transcript，并支持回复过程中的实时刷新
- 本地读取 Codex 状态，不上传额度、会话或 token

## 安装运行环境

官方说明里列出的环境要求如下：

- Windows 10 或 Windows 11
- Node.js 20 或更高版本
- npm
- Git
- 已安装并登录 Codex CLI

可以先检查环境：

```powershell
node -v
npm -v
git --version
codex --version
```

如果 `codex --version` 无法运行，先安装并登录 Codex CLI，再继续。

## 本地运行

项目的本地运行方式比较直接：

```powershell
git clone https://github.com/Demon1630/clawd-on-desk.git
cd clawd-on-desk
npm install
npm start
```

如果想用开发模式，也可以执行：

```powershell
npm run dev
```

## 打包方式

如果你想生成安装包，可以使用：

```powershell
npm run pack
```

生成正式安装包则使用：

```powershell
npm run build
```

通常打包产物会输出到 `dist/` 或 Electron Builder 对应的输出目录。

## 项目结构

从仓库结构来看，这个项目拆分得比较清楚：

- `src/`：Electron 主进程、渲染层、状态管理和界面逻辑
- `hooks/`：面向 Codex、Claude Code 等工具的 hook 脚本
- `agents/`：不同 agent 的定义和日志监听逻辑
- `themes/`：桌宠主题资源
- `assets/`：图标、音效、SVG 资源
- `pwa/`：PWA 相关资源
- `extensions/`：编辑器扩展相关文件

这说明它不是单一的桌宠动画项目，而是围绕“桌宠 + AI 工具状态展示”做了一整套能力。

## 主题和状态展示

项目里提供了多种 Clawd 状态图，覆盖的场景也比较全：

- idle
- working
- thinking
- sleeping
- notification
- error
- attention
- carrying
- sweeping
- juggling

另外还有 mini mode，适合更小的显示场景。

这些状态图不是只为观感服务，而是和实际使用场景对应的。比如：

- 正在处理任务时显示 working
- 没有操作时切到 idle
- 睡眠或空闲过久时切换 sleeping
- 有通知时显示 notification
- 出错时显示 error

## 为什么它有用

这个项目的核心价值不是“让桌面更可爱”，而是让 Codex 的运行状态更容易被看见。

很多时候我们在本地跑 AI 工具，会遇到下面这些问题：

- 不知道当前会话在执行什么
- 不清楚额度还剩多少
- 终端窗口太多，不方便来回切换
- 想快速看最新回复，但不想翻 transcript

`Clawd on Desk` 就是把这些信息放到了桌面上，减少切窗口的成本。

## 适合谁用

这个项目比较适合以下几类人：

- 日常使用 Codex CLI 的开发者
- 喜欢桌面宠物，但希望它更实用的人
- 想把 AI 工具状态可视化的人
- 想在 Windows 桌面上放一个轻量状态面板的人

如果你只是想要一个单纯的桌宠，它也能满足；如果你更在意工作流，它会更有价值。

## 总结

`Clawd on Desk` 把桌面宠物和 Codex 状态展示结合到了一起，做成了一个很轻量、但又很实用的 Windows 工具。

它保留了桌宠的陪伴感，又补上了 AI 工具状态可视化这部分能力。对于经常使用 Codex CLI 的人来说，这是一个值得试试的小项目。

## 原项目说明

本文介绍的项目基于原始项目 `rullerzhou-afk/clawd-on-desk` 整理而来，建议保留原始来源说明，方便后续了解项目演进和分支关系。
