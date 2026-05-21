---
title: "nps实现树莓派内网穿透"
date: 2021-01-16
categories: 
  - "树莓派"
tags: 
  - "nps"
  - "控制"
  - "搬瓦工"
  - "树莓派"
  - "网站"
---

前面有写过用frp进行内网穿透：

[使用frp实现远程桌面外网访问](http://www.demon1630.cn/%e4%bd%bf%e7%94%a8frp%e5%ae%9e%e7%8e%b0%e8%bf%9c%e7%a8%8b%e6%a1%8c%e9%9d%a2%e5%a4%96%e7%bd%91%e8%ae%bf%e9%97%ae/)

，这次介绍nps

nps是一款轻量级、高性能、功能强大的**内网穿透**代理服务器。目前支持**tcp、udp流量转发**，可支持任何**tcp、udp**上层协议（访问内网网站、本地支付接口调试、ssh访问、远程桌面，内网dns解析等等……），此外还**支持内网http代理、内网socks5代理**、**p2p等**，并带有功能强大的web管理端。

官网地址:[https://github.com/ehang-io/nps](https://github.com/ehang-io/nps)

# 服务端

服务端就是自己有公网IP的服务器，我这里使用的是搬瓦工的vps，安装的是Centos 7 x 86\_64系统

到[nps官网releas](https://github.com/ehang-io/nps/releases)中找到自己对应的系统，我这里安装的是linux\_amd64\_server.tar.gz，其他系统的根据自己系统找对应的

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116141806.png)

右键复制链接地址

然后用ssh连接自己的服务器

创建目录：

mkdir /ipt/nps

进入目录中，使用wget下载linux\_amd64\_server.tar.gz

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116141947.png)

下载后解压缩：

`tar -xvf 安装包`

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116142030.png)

安装

```
 ./nps install
```

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116142126.png)

配置文件在：  `/etc/nps/conf/``nps.conf`

修改默认web管理界面的端口号和登入用户名和密码等： ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116144535.png)

之后启动

sudo nps start

之后就可以访问： 你的ip:8080/ 控制台，用户名和密码是配置文件中你修改的的 `web_username` 和 `web_password`

8080是默认端口，记得在防火墙中放行

如果无法访问，到之前的nps解压目录中，运行

./nps

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116150011.png)

如果出现这样的报错消息，说明你的配置文件中端口被占用了，需要修改80和443端口为其他端口

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116150219.png)

把这两个端口修改为其他的就行，记得防火墙中放行，同时也记得放行8024端口，是客户端与服务端连接的默认端口

然后再启动nps服务，访问ip+8080端口就可以访问了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116150421.png)

输入配置文件中的登入用户名和密码,就可以进入后台，默认用户名admin，密码123

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116150649.png)

之后新增客户端：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116151958.png)

除了备注修改一下，其他默认即可

之后就可以看到客户端配置

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116152226.png)

客户端命令记录下来，之后配置客户端时需要使用

到这里服务端配置就基本结束了。

nps其他命令：

```
# 配置文件重载
$ sudo nps reload

# 停止
$ nps stop

# 重启
$ nps restart

# 服务端更新
$ nps-update update
```

 

# 客户端

前面安装好服务端的nps后，需要安装客户端的nps，同样到[nps官网](https://github.com/ehang-io/nps/releases)中找到对应系统的安装文件下载下来

我的客户端使用Raspbian系统的树莓派，arm架构，虽然芯片是64位，但系统是32位的。所以下载 linux\_arm\_client.tar.gz 下载并解压

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116171847.png)

在解压目录下运行之前服务端复制的命令

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116152454.png)

连接成功后会显示

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116153229.png)

如果出错可能是端口没有开放导致，查看服务端配置文件中端口是否在防火墙中都打开了

到这里就完成nps的客户端和服务端的连接

# 配置ssh外网连接

前面讲完了如何使用nps连接服务端和客户端树莓派，但我们最终目的是为了通过外网访问到树莓派，这里介绍如何配置ssh的外网访问

在服务端web页选择 tcp隧道 -> 新增

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116154828.png)

服务端端口需要新建一个，之后不要忘记在服务器防火墙放行此端口。目标ip端口写树莓派ssh端口号:22，不用写树莓派的IP就可以

之后在外网通过ssh连接服务器 ip:服务端端口就可以连接到我们本地的客户端了
