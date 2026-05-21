---
title: "新路由3开启aria2同时使用nps实现远程推送下载"
date: 2021-01-21
categories: 
  - "技术"
tags: 
  - "newifi3"
  - "nps"
  - "新路由3"
  - "离线下载"
  - "路由器"
---

新路由3配有一个USB3.0的接口，可以利用起来实现离线下载，虽然直接开启后可以实现离线下载，但它的aria管理页面必须要连接路由器网络才能进入，不能实现远程推送，但结合nps 的内网穿透服务，就可以很方便实现远程推送下载了

## 一、开启aria2服务

首先要在路由器的usb接口上接个优盘或者硬盘，然后到路由器管理后台

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210121154135.png)

选择usb应用程序

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210121154315.png)

找到最下面 ，打开aria2，记住不要开启ssl/tls加密，否则无法正常连接

此时点击web control就可以进入aria2下载管理页面了

## 二、远程推送下载

这里就需要使用之前讲到的nps内网穿透服务了

参考文章：[使用nps远程管理（newifi3）新路由3的Web页面](http://www.demon1630.cn/%e4%bd%bf%e7%94%a8nps%e8%bf%9c%e7%a8%8b%e7%ae%a1%e7%90%86%ef%bc%88newifi3%ef%bc%89%e6%96%b0%e8%b7%af%e7%94%b13%e7%9a%84web%e9%a1%b5%e9%9d%a2/)

创建一个新的nps服务，端口为6800

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210121160700.png)

同时服务器也要在防火墙中放行服务端端口

这里要用到一个浏览器插件，参考文章：

[使用aria2插件浏览器直接下载文件到服务器](http://www.demon1630.cn/%e4%bd%bf%e7%94%a8aria2%e6%8f%92%e4%bb%b6%e6%b5%8f%e8%a7%88%e5%99%a8%e7%9b%b4%e6%8e%a5%e4%b8%8b%e8%bd%bd%e6%96%87%e4%bb%b6%e5%88%b0%e6%9c%8d%e5%8a%a1%e5%99%a8/)安装配置好插件

然后利用浏览器插件aria2

在里面新建一个，如果有配置多个RPC配置，想用哪个下载就需要点击下面的激活，之后就可以使用不同的rpc配置，下载到不同的地方去

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210121160940.png)

前面填nps服务的服务器ip，后面的端口号填你配置的nps中的端口，不是6800

之后就可以在这里面进行下载，将会远程下载到你路由器上的usb设备中
