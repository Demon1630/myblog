---
title: "VMware在windows更新后无法启动问题"
date: 2019-11-09
categories: 
  - "推荐软件"
  - "wordpress"
tags: 
  - "windows"
---

VMware虚拟机在windows更新后，突然发现无法启动了，出现如图所示报错：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163436.png)

 

此时会要求安装VMware的更新版本，解决方法有卸载安装的windows更新，但不推荐，因为可能会导致系统问题，而且之后也会要求你继续更新windows，因此接下来介绍直接更新VMware的方法，可以永久解决此类问题。

首先去[VMware官网](https://my.vmware.com/en/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/15_0)下载最新的版本，

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163459.png)

 

然后卸载之前的老版本：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163526.png)

选择下一步：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163550.png)

选择删除：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163823.png)

这里选择保留产品配置和产品许可证信息，方便我们安装新版本时使用

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163606.png)

 

点击删除，然后等待卸载完成

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163628.png)

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163658.png)

之后到注册表中将VMware删除，按照如图所示，找到VMware，然后右键删除：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163922.png)

 

然后打开任务管理器找到服务选项：

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163938.png)

然后找到windows installer服务，右键启动：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320164000.png)

之后启动VMware安装程序

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320164023.png)

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320164100.png)

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320164208.png)

之后到网上找一些许可证密钥激活就可：

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320164138.png)
