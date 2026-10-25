---
title: 怎么用muse连接并管理我的电脑和VPS
date: 2026-10-25
---

# 怎么用muse连接并管理我的电脑和VPS

> 一篇记录贴：Rio 平时跑在一台云端虚拟机里，我的 VPS 和家里电脑都不跟它在同一个局域网。这篇文章讲清楚它是怎么连上这两台机器的，以及中间踩过的坑。

## 总览：两条完全不同的路

```
Rio 的虚拟机
  ├─ 路线 A：出站代理 + SSH ──→ 腾讯云 VPS（公网服务器）
  └─ 路线 B：Tailscale 内网 + SSH ──→ 家里的 Windows 电脑
```

两条路的共同点只有一个：**全程 SSH + 密钥登录，不用密码**。不同点在于"怎么找到对方"——VPS 有公网地址，直接连；家里的电脑在 NAT 后面，没有公网地址，得靠虚拟组网先"进门"。

---

## 路线 A：连 VPS

VPS 是腾讯云的一台海外服务器，上面跑着 Docker（FreshRSS、青龙、RSSHub）、宝塔和一堆定时脚本。Rio 要上去巡检、改脚本、拉数据库，都走这条路。

### 连接方式

- **协议**：标准 SSH，22 端口
- **认证**：密钥登录（ed25519），不接受密码
- **关键点**：Rio 所在虚拟机的出站流量要经过运行环境的 HTTP 代理，所以 SSH 不是直连，而是用 `nc` 发一个 `CONNECT` 请求，让代理把 TCP 隧道打通，再在隧道里跑 SSH：

```bash
ssh -o ProxyCommand="nc -X connect -x <代理地址> %h %p" \
    -i ~/.ssh/id_ed25519 \
    -o BatchMode=yes \
    -o StrictHostKeyChecking=accept-new \
    muse@<服务器地址>
```

几个参数的意思：

- `ProxyCommand`：告诉 SSH 先经过代理建隧道，而不是直连；
- `BatchMode=yes`：全程不弹交互式密码输入，密钥不对就直接失败，不会卡在等密码上；
- `StrictHostKeyChecking=accept-new`：第一次连时记录服务器主机指纹，之后指纹变了就拒绝，防止中间人。

### 平时用它干什么

- 拉取 FreshRSS 数据库做每日三档简报；
- 巡检：看异常登录、失败登录、新增监听端口、容器状态、磁盘占用；
- 维护青龙脚本和 VPS 上的定时 watcher（慢慢买价格监控、降温提醒、股市简报、招行盯盘）。

---

## 路线 B：连家里的 Windows 电脑

这条路比 VPS 麻烦得多，因为家里的电脑没有公网 IP，传统 SSH 根本找不到它。

### 为什么选 Tailscale

家里已经有几台设备要互联：QNAP NAS、Windows 电脑、海外 VPS，再加上 Rio 的虚拟机。Tailscale 是基于 WireGuard 的组网工具，给每台设备发一个虚拟内网 IP，设备之间不管在哪都能像在同一个局域网里一样互访。个人版免费、不限速（直连跑满自有带宽），比起之前用的贝锐蒲公英免费档的成员数限制，这个场景下更合适。

组网完成后，Rio 的虚拟机在 tailnet 里叫 `muse`，Windows 电脑叫 `demon`，两者之间先通内网，再跑 SSH——隧道走的是运行环境代理上一个专门的端口，和连 VPS 的端口不一样。

### Windows 端要开 OpenSSH Server

Tailscale 只解决"找得到"，真操作还得靠 SSH 服务端。Windows 自带 OpenSSH Server，但安装过程一波三折：

1. **系统自带的安装方式卡住了**：设置里添加可选功能和 `Add-WindowsCapability` 命令都卡在下载不动，疑似 Windows 更新源的问题；
2. **改走 GitHub 手动安装**：从 Win32-OpenSSH 发布页下载 `OpenSSH-Win64.msi`，双击装到 `C:\Program Files\OpenSSH`，绕开了 Windows 更新；
3. **注册并启动服务**（管理员 PowerShell）：

```powershell
cd 'C:\Program Files\OpenSSH'
powershell -ExecutionPolicy Bypass -File install-sshd.ps1
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
```

4. **放公钥**：Rio 的公钥要写进 `authorized_keys`。这里有个容易踩的坑——**管理员账户的 sshd 默认不读用户文件夹里的文件**，而是只认系统位置的 `C:\ProgramData\ssh\administrators_authorized_keys`，两份都写上最稳妥。

### 最大的乌龙：电脑名不是用户名

第一次验证连通时，SSH 一直报 `Permission denied (publickey)`。查了半天，最后发现：`whoami` 显示的是 `电脑名\用户名`，电脑名叫 Demon，但真正的登录用户名是另一串——之前一直拿电脑名当用户名登录，当然认不出钥匙。换成真实用户名，一次就通了。

---

## 传文件：scp 直传，不走第三方

验证完连通，第一件事就是从桌面取文件。流程是：

1. 在电脑上把目标文件复制到临时文件夹，改成纯英文名（中文文件名在编码转换那步会出问题，直接写中文名复制会报错）；
2. 用 `scp` 沿同一条 SSH 隧道把文件拉到 Rio 的虚拟机，改回原名，并核对字节数一致；
3. 删掉电脑上的临时文件，桌面原文件不动。

全程点对点，没有经过任何网盘或文件传输网站。

顺带一提：查桌面的时候还发现，这台电脑的桌面被重定向到了 D 盘，默认的 C 盘桌面路径是空的——找桌面文件得去 D 盘那个位置。

---

## 安全要点

- **密钥登录，不用密码**：密码不会出现在聊天记录、脚本和日志里；
- **主机指纹校验**：第一次记录，之后变了就拒绝；
- **BatchMode**：不回落到交互密码，防止被钓鱼式地套密码；
- **审批卡**：第一次连某个内网地址时，需要机主在批准卡上点一下才放行；
- **临时文件及时清理**：中转用的临时副本传完就删，不在电脑上留多余文件；
- **只读优先**：体检、查文件这类操作都是只读命令；改配置、装软件这类动作会先说明再动手。

---

## 踩过的坑，一句话总结

| 坑 | 教训 |
|---|---|
| Windows 更新源卡住，装不上 OpenSSH | 换 GitHub MSI 离线装，绕开更新源 |
| 装完找不到 `install-sshd.ps1` | 先查服务在不在，服务已注册就不用跑脚本 |
| 管理员账户钥匙放错位置 | 用户文件和系统位置两份都写 |
| 拿电脑名当用户名 | `whoami` 的斜杠后面那部分才是用户名 |
| 中文文件名传输出错 | 先按特征匹配、复制成英文临时名再传 |
| 桌面在默认路径找不到 | 先查系统真实的桌面路径，别假设在 C 盘 |
