---
title: "威联通安装alist并挂载pikpak"
date: 2026-10-14
categories:
  - "技术"
tags:
  - "nas"
  - "云盘"
  - "威联通"
  - "alist"
  - "pikpak"
  - "docker"
img: /medias/featureimages/0.jpg
summary: 在威联通上通过 Docker 部署 AList，把 PikPak 挂进 File Station，以及 HBS 3 为什么搬运不了挂载盘、该用什么替代
top: false
cover: false
---
威联通自带的 File Station 只能管本地盘。想把 PikPak 这类网盘纳入 NAS 的目录树，需要一座“桥”——AList 把各种网盘聚合成一个统一的虚拟目录，再通过 WebDAV 暴露出来，威联通这边用 File Station 装载远程文件夹，就能像本地目录一样读写。

本文记录一次完整的落地过程，顺便把踩过的坑一起记下来。AList 官网：[https://alist.nn.ci/zh/](https://alist.nn.ci/zh/)

## 一、在威联通上安装 AList

有两条路：Container Station 跑 Docker，或者装第三方打包的 QPKG 套件。推荐 Docker——更新方便，数据卷独立，迁移和备份都简单。

### 方式 A：Docker 部署（推荐）

**第一步，建目录。** 打开 File Station，在 Container 共享文件夹下新建 `alist` 目录（也可以放你自己的 Docker 路径）。

**第二步，创建应用。** 打开 Container Station，左侧 **应用程序（Applications）→ 创建（Create）**，应用名称填 `alist`，在 YAML 框里粘贴：

```yaml
version: '3.3'
services:
    alist:
        image: 'xhofe/alist:latest'
        container_name: alist
        volumes:
            - '/share/Container/alist:/opt/alist/data'
        ports:
            - '5244:5244'
        environment:
            - PUID=0
            - PGID=0
            - UMASK=022
        restart: always
```

注意把 `/share/Container/alist` 换成你实际建的目录路径。点击创建，等镜像下载并启动。

### 卡在拉镜像：502 Bad Gateway 与国内加速源

第一次创建大概率失败，因为威联通连不上 Docker 官方仓库 `registry-1.docker.io`。最直接的办法是 SSH 上去手动拉，再回 Container Station 创建。

先在 控制台 → 网络 & 文件服务 → Telnet / SSH 里开启 SSH，然后：

```bash
ssh admin@你的NAS_IP
```

用国内加速地址拉取，哪个通用哪个：

```bash
docker pull docker.1ms.run/xhofe/alist:latest
docker pull docker.xuanyuan.me/xhofe/alist:latest
docker pull m.daocloud.io/xhofe/alist:latest
```

我这边 DaoCloud 的公共节点直接回了 `received unexpected HTTP status: 502 Bad Gateway`，换成前两个就通了。

拉下来后打回原标签，这样前面那段 YAML 一个字都不用改：

```bash
docker tag docker.1ms.run/xhofe/alist:latest xhofe/alist:latest
```

回到 Container Station 重新创建应用，本地已有镜像，不会再触发超时。

### 获取初始密码

容器启动后有两种方式：

- **看日志**：Container Station 里点开 alist 容器，进 日志（Logs），搜 `admin password`，启动时会打印类似 `Initializer admin password: xxxxxxxx`。
- **直接重置**：进 终端机（Terminal），或者在 SSH 里执行：

```bash
docker exec -it alist ./alist admin set 你的新密码
```

然后浏览器打开 `http://NAS的IP:5244`，账号 `admin` 登录。

### 方式 B：QPKG 原生套件

不想碰 Docker 的话：App Center → 右上角齿轮 → 勾选“允许安装非 QNAP 签名的应用程序”，然后去 GitHub 或第三方套件源下载对应 CPU 架构（x86_64 / ARM）的 `.qpkg`，App Center 右上角加号手动安装。装完桌面会出现图标，同样访问 5244 端口。缺点是升级要自己重装。

## 二、在 AList 里挂载 PikPak

登录 AList 后台 → 左侧 **管理 → 存储 → 添加**。

### 首选：WebDAV 驱动（会员）

PikPak 会员自带 WebDAV 功能，地址是 `https://dav.mypikpak.com`，国内可直连，而且完全绕开了账号密码校验和 Token 续期的所有麻烦。先在 PikPak App 或网页端进入 **设置 → 实验室功能 → WebDAV**，开启后复制 URL、用户名和密码。

回到 AList：

| 字段          | 值                                                  |
| ------------- | --------------------------------------------------- |
| 驱动          | **WebDAV**（注意不是 PikPak，选错就白折腾了） |
| 挂载路径      | `/pikpak`（随便起）                               |
| URL           | `https://dav.mypikpak.com`                        |
| 用户名 / 密码 | PikPak 给的那一对                                   |

保存即可。

### 备选：PikPak 原生驱动（普通账号）

| 字段        | 值                   |
| ----------- | -------------------- |
| 驱动        | PikPak               |
| 用户名      | 绑定的邮箱           |
| 密码        | PikPak 登录密码      |
| 根文件夹 ID | 留空即根目录         |
| WebDAV 策略 | **302 重定向** |

**前提条件**：如果账号是通过 Google / Facebook 等第三方授权快捷注册的，必须先去 PikPak 官网绑定一个邮箱并单独设置登录密码，否则 AList 无法用账号密码登录。

WebDAV 策略选 302 重定向，播放视频或下载时会直接调用直链，不经过威联通中转，速度快很多。

## 三、原生驱动的报错排查

用原生 PikPak 驱动，大概率会在这两个错误上来回碰。记录一下排查顺序。

### ErrorCode: 4126 / invalid_grant / AccessProhibited

**含义**：存储条目已经在后台建好了，但初始化（登录连接）失败。表现是存储列表里能看到这一项，状态却是禁用或报错，点进去看不到文件。所以不用重新新建，直接编辑那一项就行。

原因按概率排序：

1. **IP 地域或风控限制**（最常见）。PikPak 判定登录来源 IP 处于受限地区，或短时间登录太频繁，直接拦截授权。让 NAS 流量走代理，或者换香港 / 新加坡 / 日本节点再试。
2. **账号没设独立密码**，第三方快捷登录的账号走不通授权校验。
3. **Token 自动获取失败**。

### ErrorCode: 4002 / captcha_invalid / captcha_token expired

**含义**：刷新令牌过期了，而且自动续期时撞上了人机验证，AList 在后台续不上。

排查顺序：

1. **刷新令牌方法选错了**。这个卡了我最久——把“刷新令牌方法（Refresh token method）”从 Oauth2 改成 **HTTP**，然后重新抓一次 refresh_token 填进去保存。
2. **同一个 PikPak 账号挂了多个存储项**。PikPak 每次刷新令牌，上一个令牌立刻作废。第一个挂载点一刷新，第二个挂载点的旧 Token 就瞬间失效，抛出 4002。解决办法是删掉多余的存储项，只保留一个根目录挂载，要进子目录直接在 AList 根目录里点进去。
3. **真的触发风控了**。去电脑浏览器重新登录一次 PikPak 网页端，手动过掉验证码，然后重新提取最新的 refresh_token 填回 AList。

### 刷新令牌怎么抓

新版 AList 有两条路：

**让它自己抓（最省事）**：用户名密码填对，“刷新令牌方法”选 Oauth2，令牌框留空，直接点保存。AList 会在后台登录并把 Token 自动回填。如果这样还报 4126，说明官方风控挡了后台的自动登录，只能走下面手动抓。

**手动抓**：

1. 浏览器登录 PikPak 网页版
2. F12 → **Application**（应用）标签页 → 左侧 **Local Storage** → 点开 `https://mypikpak.com`
3. 在右侧找以 `credentials` 或 `pp_client_credentials` 开头的 Key（或者直接搜 `refresh_token`）
4. 点击它，在下方信息栏找到 `"refresh_token": "xxxxxx"`，复制引号里那一串
5. 粘贴到 AList 的“刷新令牌”输入框保存

说实话，如果你有会员，这一整节都可以跳过——直接用 WebDAV 驱动，稳定性完全不是一个量级。

## 四、把 AList 挂载到威联通 File Station

到这一步 AList 里能看到 PikPak 了，但威联通的 File Station 里还什么都没有。这两套系统是独立的：AList 是跑在容器里的独立服务，自己管一套虚拟目录；威联通默认根本不知道它的存在。

这里有个容易搞混的点：AList 存储里填的那个“挂载路径 `/pikpak`”，只是 AList **网页里**的展示位置，跟威联通本地目录没有任何关系，不会自动出现在 File Station 里。必须手动装载一次。

**AList 的 WebDAV 连接信息：**

- 地址：`http://NAS的IP:5244/dav`
- 用户名：`admin`
- 密码：你的 AList 管理员密码

**在 File Station 里装载：**

使用HybridMount文件型云网关app，可以把alist里面的文件夹挂载到里面去，或者使用下面的方法

1. 打开 File Station（文件总管）
2. 点右上角 **“...”** → **装载远程文件夹**（部分版本叫“连接网络文件夹”）
3. 连接类型选 **WebDAV**
4. 填写：
   - 名称：`PikPak_AList`（随便起个好记的）
   - URL：`http://NAS的IP:5244/dav` —— **注意必须带 `/dav` 后缀**
   - 用户名 / 密码：AList 的
5. 点 **测试**，提示连接成功后再点确定

装载完成后，File Station 左侧就会多出这个网络文件夹，里面完整显示你在 AList 里挂载的 PikPak 内容。

有个小细节：地址填 `127.0.0.1` 或局域网 IP 都行，走本机回环还能省一跳。

## 五、把 PikPak 内容搬到 NAS 本地

挂载好之后，自然会想：能不能自动把 PikPak 里的东西“移动”到 NAS 本地，搬完就释放云端空间？

### 使用HBS 3

在HBS3 这个app里面，创建主动同步作业，选择移动，然后单向从挂载在File Station中的pikpak文件夹中内容移动到NAS里面一个文件夹，就可以实现搬完释放云端空间

## 小结

1. **能用 WebDAV 就别用原生 PikPak 驱动**。原生驱动要跟 refresh_token、人机验证、IP 风控长期斗争，WebDAV 把这些全绕开了。有会员的话没有任何理由选前者。
2. **一个 PikPak 账号在 AList 里只挂一个存储项**。多挂载点会互相踢 Token，是 4002 报错的高频来源。
3. **AList 的“挂载路径”和威联通的挂载点是两回事**。前者只是 AList 网页里的目录位置，后者必须去 File Station 手动装载一次才会出现。
4. **HBS 3 是备份工具，不是搬运工具**。要把云盘内容搬到本地并释放云端空间，用 `rclone move` 或自己的脚本，别指望同步任务。
5. **永远不要对网络虚拟盘做“剪切”**。先复制、再校验、最后手动删源，任何一步出问题都还有退路。
