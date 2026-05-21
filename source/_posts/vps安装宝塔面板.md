---
title: "vps安装宝塔面板"
date: 2019-11-11
categories: 
  - "宝塔面板"
  - "搬瓦工"
tags: 
  - "密码"
  - "网站"
---

对于使用VPS的用户来说，如果不是很熟悉Debian、centos等系统，想搭建网站或者管理vps可能就比较困难了，这里推荐安装宝塔面板帮助管理vps，首先用xshell连接我们的vps，然后安装宝塔面板（对于centos用户来说，如果是Debian系统的把yum改为apt-get即可）：

推荐使用系统为CentOS 7.x系统，因为我之前用其他系统有出现过问题，所以推荐使用CentOS 7.x系统确保不会出现问题。

```
yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh
```

如果用户的ip已经被墙了的话需要使用国外备用节点安装：

```
##如果IP被封了，建议用宝塔官方美国备用节点：
yum install -y wget && wget -O install.sh http://128.1.164.196:5880/install/install_6.0.sh && sh install.sh
```

开始安装：选择y就可，之后就会开始自动安装

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320111650.png)

安装完成之后就会有连接和用户密码等信息，保存下来，接下来登入宝塔面板会用到：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320111721.png)

在浏览器上输入上面的链接，会提示输入用户名和密码：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320111737.png)

之后就会登入进入宝塔面板主页，在里面可以对vps进行管理，也可以一键部署网站，非常方便

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320111803.png)
