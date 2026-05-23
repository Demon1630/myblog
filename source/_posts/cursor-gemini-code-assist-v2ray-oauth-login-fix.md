---
title: "Cursor 中 Gemini Code Assist 登录卡住问题排查与解决（v2ray 代理用户）"
date: 2026-05-23
categories: 
  - "技术"
tags: 
  - "Cursor"
  - "Gemini Code Assist"
  - "v2ray"
  - "代理"
  - "OAuth"
img: /medias/featureimages/8.jpg
top: false
cover: false
---

# 问题现象

在 Cursor 中安装 Gemini Code Assist 插件后，点击登录按钮，浏览器弹出 Google 授权页面，授权完成后浏览器正常跳转到了 `http://localhost:3380/oauth2redirect?code=...`，但插件界面始终停留在登录页面，没有任何反应。

如果你也用了 **v2ray** 等代理工具，大概率会遇到同样的问题。

# 环境

- Cursor（基于 VS Code 的编辑器）
- Gemini Code Assist v2.82.0
- Windows 11
- v2ray（系统代理模式，端口 127.0.0.1:10809）

# 根因分析

## Gemini Code Assist 的 OAuth 流程

要理解为什么登录卡住，需要先了解 Gemini Code Assist 的登录机制。通过分析扩展源码，它的 OAuth 流程如下：

1. 扩展在本地找一个**随机端口**（如 3380）启动一个 HTTP 服务器
2. 构造回调地址 `http://localhost:{端口}/oauth2redirect`
3. 调用 VS Code API `env.asExternalUri()` 注册这个地址
4. 打开系统浏览器，跳转到 Google OAuth 授权页
5. 用户在浏览器中完成授权
6. Google 将浏览器**重定向回** `http://localhost:{端口}/oauth2redirect?code=...`
7. 扩展的本地 HTTP 服务器收到回调，取出 code，完成登录

## 断点在哪里

整个流程在两个地方受到 v2ray 代理的影响：

### 断点 1：`env.asExternalUri()` 在系统代理下行为异常

扩展调用 `env.asExternalUri(Uri.parse("http://localhost:PORT"))` 时，Cursor（基于 Electron/Chromium）的网络栈在系统代理开启的情况下，可能无法正确解析 localhost 地址，导致回调 URI 注册失败。

### 断点 2：浏览器回调被代理拦截

浏览器完成授权后，Google 重定向到 `http://localhost:{端口}/oauth2redirect?code=...`。虽然 Windows 的代理排除列表中包含 `localhost` 和 `127.*`，但在以下情况仍然会失败：

- **v2ray 开启了 TUN 模式**——工作在网卡层面，无视 Windows 代理排除设置
- **浏览器使用了代理扩展**（如 SwitchyOmega）覆盖了系统排除规则
- **v2ray 路由规则**没有正确放行 localhost 流量

# 解决方案

## 方案一：强制使用 OOB 登录模式（推荐）

Gemini Code Assist 内置了 OOB（Out-of-Band）登录模式，可以绕过 localhost 回调这个环节。在这种模式下：

1. 扩展不再启动本地 HTTP 服务器
2. 回调地址改为 Google 的 `https://sdk.cloud.google.com/authcode_cloudcode.html`
3. 授权完成后，该页面会显示一个**授权码**
4. 扩展界面会出现一个输入框，粘贴授权码即可完成登录

### 操作步骤

在 Cursor 的 `settings.json` 中添加以下配置：

```json
{
  "http.proxy": "http://127.0.0.1:10809",
  "http.proxySupport": "on",
  "geminicodeassist.beta.forceOobLogin": true
}
```

- `http.proxy` —— 告诉 Cursor 使用 v2ray 作为代理
- `http.proxySupport: "on"` —— 启用代理支持（如果设为 `"off"`，Cursor 完全无法联网，浏览器会一直转圈加载）
- `geminicodeassist.beta.forceOobLogin: true` —— 强制启用 OOB 登录模式

**添加后完全重启 Cursor**，重新点击登录。这次浏览器授权完成后会跳转到一个显示授权码的页面，复制该代码，粘贴到 Cursor 中扩展弹出的输入框即可。

## 方案二：临时关闭系统代理完成登录

如果不想修改设置，也可以：

1. 在 v2rayN 中右键 → **关闭系统代理**
2. 完全重启 Cursor
3. 重新尝试 Gemini Code Assist 登录
4. 登录成功后重新开启系统代理

# 排查过程（供参考）

如果你遇到类似问题但不确定原因，可以按以下步骤排查：

**1. 检查 Windows 系统代理状态**

```powershell
Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' | Select-Object ProxyEnable, ProxyServer, ProxyOverride
```

**2. 检查 OAuth 回调是否到达**

在浏览器授权完成后，观察地址栏是否跳转到了 `http://localhost:{端口}/oauth2redirect?...`。如果跳转了但扩展无反应，说明是本地回调接收环节出了问题。

**3. 检查扩展的 OOB 设置项**

在 Cursor 设置中搜索 `geminicodeassist`，查看是否有与 OAuth 或 beta 相关的开关。

# 总结

v2ray 等代理工具与 VS Code/Cursor 扩展的 OAuth 本地回调机制存在兼容性问题。启用 OOB 登录模式可以绕过 localhost 回调，是最干净的解决方案。如果 OOB 模式因版本原因不可用，临时关闭系统代理登录后再开启也不失为一个快捷方法。
