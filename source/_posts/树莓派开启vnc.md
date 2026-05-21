---
title: "树莓派开启VNC"
date: 2020-01-05
categories: 
  - "树莓派"
tags: 
  - "树莓派"
---

使用ssh连接上树莓派后需对其进行一些配置

由于使用ssh连接的话不会启动配置软件，输入命令raspi-config，启动配置

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113203415.png)

首先开启VPN连接：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113203443.png)

进入interfacing options，

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113203500.png)

选择vnc，然后确认开启即可启动vnc
