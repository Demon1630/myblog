---
title: "树莓派3b+安装luci版openwrt解决无法连接网络并配置v2ray"
date: 2021-10-17
categories: 
  - "技术"
  - "树莓派"
tags: 
  - "openwrt"
  - "tor"
  - "v2ray"
  - "word"
  - "密码"
  - "树莓派"
  - "路由器"
---

之前有写文章讲如何使用树莓派安装openwrt，参考文章：

# [树莓派3b+安装openwrt并进行配置](http://www.demon1630.cn/%e6%a0%91%e8%8e%93%e6%b4%be3b%e5%ae%89%e8%a3%85openwrt%e5%b9%b6%e8%bf%9b%e8%a1%8c%e9%85%8d%e7%bd%ae/)

 

## 一、安装luci openwrt

文章中只介绍了如何安装openwrt的官方固件，但官网固件可玩性并不高，这里介绍luci固件，项目地址：[https://github.com/SuLingGG/OpenWrt-Rpi](https://github.com/SuLingGG/OpenWrt-Rpi)，固件中包含有许多插件，可玩性更高

![](https://i.loli.net/2021/10/17/LPYaskrcBVAyhTF.png)

进入GitHub项目官网后，点击actions

![](https://i.loli.net/2021/10/17/yse3GJn6T9Ihg4F.png)

进入后找到适合自己的

![](https://i.loli.net/2021/10/17/KRM6gYpF9ayVwOP.png)

然后在右边有最新的版本，直接点击进入，下边有下载地址，复制下面那个[https://openwrt.cc/releases/targets/bcm27xx/bcm2710/](https://openwrt.cc/releases/targets/bcm27xx/bcm2710/)进入就可以

![](https://i.loli.net/2021/10/17/mRtivF6O2bGUrgs.png)

初次安装下载这个factory的文件

![](https://i.loli.net/2021/10/17/yrVsx1q5tvKzXU8.png)

然后刷入树莓派的TF卡中，如何刷入参考开头提到的文章，里面有刷入教程

刷入后插入树莓派开机，此时先不要连接路由器，开机会自动开启一个名称为openwrt的不加密无线网，用电脑连接上去

在浏览器输入192.168.1.1，进入路由器后台，默认密码为password

进入后先修改LAN口设置

![](https://i.loli.net/2021/10/17/8hjQP4SBwZxizsd.png) 找到网络-接口，点击LAN口后的修改

![](https://i.loli.net/2021/10/17/jv1azXIAxCL9UsF.png)这里把ipv4地址修改为192.168.2.1，主要是为避免和后面连接的主路由IP冲突，修改后点击右下角的保存，记住是点击保存，不是保存应用，保存后右上角会出现未保存设置提示，点击进入， 在这里再点击保存并应用

![](https://i.loli.net/2021/10/17/35XtQvuHUoSjhMV.png) 保存并应用后，等待一会，然后断开网络，再重新连接，在浏览器中输入192.168.2.1，就是刚才我们修改后的地址，进入路由器后台，此时开始创建网络连接，点击网络-接口，然后创建新接口，设置参考下图所示，选择有线接口eth0，然后点击提交

![](https://i.loli.net/2021/10/17/EFkLDzwq8GijOvY.png)

然后将接口切换到LAN口，修改物理设置为如图

![](https://i.loli.net/2021/10/17/NdxsDObWfCBivwP.png)

把有线接口eth0留给之前配置的WAN口 ，点击右下角保存，然后点击右上角的未保存设置，进入点击保存并应用

此时可以把主路由器和树莓派通过网线连接起来，可能会断开无线网，电脑重新连接上无线网，进入192.168.2.1后台，理论上此时应该就可以上网了，但实际经常无法连接网络，还需继续进行配置

点击网络-防火墙

![](https://i.loli.net/2021/10/17/vxAZYuSqGUtcTyg.png)

修改区域中设置为如图中所示

![](https://i.loli.net/2021/10/17/m18TyNXJDZaVOzl.png) 点击保存，然后再保存并应用，此时就可以正常上网了

 

## 二、配置v2ray

前面已经在树莓派上安装并配置好了openwrt，并可以顺利上网了，接下来介绍如何配置v2ray

如果有订阅URL可以直接输入

![](https://i.loli.net/2021/10/17/GAwqLRZmk6tUvVn.png)

更新后在下方就会出现所有的节点

如果是自己搭建的，就可以直接导入配置文件

![](https://i.loli.net/2021/10/17/Z8en5uqPXBwtEI2.png)

点击下方的添加，然后导入配置信息，配置信息为你的v2ray配置，是vmess开头的，导入后保存即可

![](https://i.loli.net/2021/10/17/N7tDkeRIPXY5Jil.png) 然后回到客户端界面

![](https://i.loli.net/2021/10/17/F5VaLyREXk3Arwi.png) 选择自己导入的服务器，然后保存并应用即可

此时就可以愉快的上网了，其余功能可以继续开发
