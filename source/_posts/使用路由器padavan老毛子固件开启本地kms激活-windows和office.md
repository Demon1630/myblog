---
title: 使用路由器Padavan老毛子固件开启本地KMS激活 Windows和Office
date: 2021-03-14
categories:
- 技术
tags:
- KMS激活
- windows
- 网站
- 路由器
---
padavan老毛子固件可以使用KMS服务，kms服务可以帮助激活windows和office，之前有写过文章讲如何使用服务器搭建kms服务：

# [Linux安装KMS激活地址服务](http://www.demon1630.cn/linux%e5%ae%89%e8%a3%85kms%e6%bf%80%e6%b4%bb%e5%9c%b0%e5%9d%80%e6%9c%8d%e5%8a%a1/)

这种方法可以用来激活，但存在风险，因为一旦被微软检测到，就可能会受到诉讼什么的，之前我搭建之后没多久被检测到了，然后服务器提供商把我服务器禁掉了一段时间

所以这里讲一下如何用路由器来使用kms激活，风险小很多

首先在使用padavan老毛子固件路由器后台，开启kms服务

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210314102140.png)

之后到电脑上按win+r键，输入cmd开启命令窗口

依次输入：

slmgr.vbs /upk

slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX

slmgr.vbs /skms 192.168.123.1:1688

slmgr  /ato

就可以顺利激活了

然后再运行：

slmgr /xpr

可以查看还剩多久激活日期，到期后只要连着路由器都可以自动激活180天

注意，这里ipk使用的必须是Windows专业版批量激活密钥，这个要不可用后可以到网上搜一个可用的，教育版什么的会无法激活。

对于office激活

先需要使用office零售转vol工具，将office转换为批量授权版

到网站[GitHub - kkkgo/office-C2R-to-VOL: c2r office2016-2019-365\_toVOL](https://github.com/kkkgo/office-C2R-to-VOL)

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210314103323.png)

下载转换工具，然后运行cmd文件，就会自动转换，转换完再打开office就会显示已经激活了
