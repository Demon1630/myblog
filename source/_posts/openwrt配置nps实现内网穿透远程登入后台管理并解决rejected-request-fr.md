---
title: "openwrt配置NPS实现内网穿透远程登入后台管理并解决Rejected request from RFC1918 IP to public server address问题"
date: 2021-11-14
categories: 
  - "树莓派"
tags: 
  - "newifi3"
  - "nps"
  - "openwrt"
  - "word"
  - "密码"
  - "新路由3"
  - "旁路由"
  - "树莓派"
  - "路由器"
---

最近在树莓派上安装了openwrt然后配置为旁路由，参考文章：[树莓派3b安装openwrt配置旁路由自由上网](http://www.demon1630.cn/%e6%a0%91%e8%8e%93%e6%b4%be3b%e5%ae%89%e8%a3%85openwrt%e9%85%8d%e7%bd%ae%e6%97%81%e8%b7%af%e7%94%b1%e8%87%aa%e7%94%b1%e4%b8%8a%e7%bd%91/)

发现openwrt功能还是很强大的，但由于其后台管理只能在局域网内进行，但其可以配置内网穿透，包括frp、nps这些常见的，个人觉得nps配置更加简单，之前使用新路由3的时候也写过文章介绍如何使用nps实现远程管理路由器后台：[使用nps远程管理（newifi3）新路由3的Web页面](http://www.demon1630.cn/%e4%bd%bf%e7%94%a8nps%e8%bf%9c%e7%a8%8b%e7%ae%a1%e7%90%86%ef%bc%88newifi3%ef%bc%89%e6%96%b0%e8%b7%af%e7%94%b13%e7%9a%84web%e9%a1%b5%e9%9d%a2/)，前提也是要先在个人服务器上配置好服务端，nps服务端的安装参考文章：[nps实现树莓派内网穿透](http://www.demon1630.cn/nps%e5%ae%9e%e7%8e%b0%e6%a0%91%e8%8e%93%e6%b4%be%e5%86%85%e7%bd%91%e7%a9%bf%e9%80%8f/)，很简单，配置好后到进入nps管理后台

参考文章建立客户端和隧道后，获取到客户端命令

![](https://i.loli.net/2021/11/14/qTiem3Yfn4oaAsj.png) 然后进入openwrt后台，找到nps将客户端命令中内容相继填入就可以了

![](https://i.loli.net/2021/11/14/M1BV8EkYsXDGFnL.png) 然后保存应用，此时就可以用你在nps后台配置的隧道端口加你服务器IP访问openwrt后台了

初次访问的时候可能会报错：Rejected request from RFC1918 IP to public server address

这是因为openwrt默认关闭了远程连接，需要用ssh连接修改权限，ssh的IP输入树莓派IP，默认用户是root，密码是你登入openwrt的密码，默认是password

进入后台后输入：nano /etc/config/uhttpd

![](https://i.loli.net/2021/11/14/HDN7Piuh2qOxGU4.png)

将

option rfc1918\_filter 1

改为

option rfc1918\_filter 0

然后保存推出就可以了

![](https://i.loli.net/2021/11/14/hE5w2zJ1B7CidRV.png)

然后再重新访问应该就没有问题了，不行可以重启一下树莓派
