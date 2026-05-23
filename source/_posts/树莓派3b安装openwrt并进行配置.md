---
title: 树莓派3b+安装openwrt并进行配置
date: 2021-07-07
categories:
- 树莓派
tags:
- openwrt
- 密码
- 新路由3
- 树莓派
- 路由器
---
之前有写文章讲使用新路由3刷老毛子固件从而实现上校园网和fq：

# [newifi 3 路由器刷入老毛子固件教程](http://www.demon1630.cn/%e5%b0%8f%e7%99%bd%e4%b9%9f%e8%83%bd%e5%88%b7%ef%bc%8cnewifi-3-%e8%b7%af%e7%94%b1%e5%99%a8%e5%88%b7%e5%85%a5%e8%80%81%e6%af%9b%e5%ad%90%e5%9b%ba%e4%bb%b6%e6%95%99%e7%a8%8b/)

 

刚好手上有一个树莓派3b+吃灰，同样可以通过刷openwrt来当路由器使用，性能相当强悍

## 准备工作：

树莓派3B+及其电源，一张SD卡（以及读卡器），一根网线，联网电脑。

相应操作流程类似于在树莓派上刷系统，可以参考文章：[树莓派烧录系统](http://www.demon1630.cn/%e6%a0%91%e8%8e%93%e6%b4%be%e7%83%a7%e5%bd%95%e7%b3%bb%e7%bb%9f/)，下载相应的软件，操作流程也是类似的

 

## 下载openwrt固件

固件可以去网上搜或者直接到官网下载，我这里是到官网下载的：[https://firmware-selector.openwrt.org/](https://firmware-selector.openwrt.org/)，到这里搜索对应自己固件的openwrt版本，比如我的树莓派3b+：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210707102936.png) 点击搜索对应版本然后下载

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210707103101.png) 或者也可以到官网中所有固件中查找下载：[https://openwrt.org/zh/toh/views/toh\_fwdownload](https://openwrt.org/zh/toh/views/toh_fwdownload)这里面包含有所有的固件

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210707103631.png) 下载完成固件后就刷入TF卡中即可

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210707103812.png)

之后插入树莓派，然后用网线将树莓派与电脑连接起来

在浏览器中输入192.168.1.1就可以进入树莓派openwrt后台，初次登入无需密码直接就可以登入

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210707171657.png)

进入后台后设置系统密码,到system-administration-router password

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210707172040.png)

 

## 配置树莓派上网

先开启wifi

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210707173308.png)

开启后点击无线WiFi的Edit

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210707173601.png)

在mode这里选择Legacy，只有这个模式才可以开启2.4GHz的WiFi，其余模式只能开启5GHz，如果你的电脑只能连接2.4GHz的记得开启这个模式，但实测采用2.4GHz网速差很多，不过也够用

然后点击save，最后点击save&Apply 就将wifi配置好了

配置Wan口

点击Network-Interfaces，然后点击添加新端口，填入WAN，选择eth0

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210707175322.png)

创建完成后编辑wan口

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210707175909.png)

修改后保存并应用,如果主路由地址为192.168.1.1，此时要修改

然后将树莓派与路由器用网线连接，此时连接树莓派wifi，openwrt就可以上网了
