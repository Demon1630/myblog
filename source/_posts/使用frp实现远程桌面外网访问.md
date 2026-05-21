---
title: "使用frp实现远程桌面外网访问"
date: 2019-12-07
categories: 
  - "技术"
  - "树莓派"
tags: 
  - "树莓派"
---

frp是一个可用于内部网穿透的高级反向代理应用程序，支持tcp，udp协议，为http和https应用协议提供了额外的能力，并且尝试性支持了点对点穿透。之前就有用过它来进行内网穿透，实现了外网访问局域网内的树莓派，使用起来比较方便，之前有用过花生壳，但因为这个免费功能比较缺失，用起来虽然简单，但自己有服务器后用frp就很方便了

至于远程桌面是用来在其他设备上访问电脑的，我主要是用ipad来访问我的windows电脑，这里用的软件是RD client

条件：一台服务器

在服务器上安装frp：[https://github.com/fatedier/frp/releases](https://github.com/fatedier/frp/releases)到这里找到对应的frp进行下载到服务器上

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113201039.png)

 

找到对应的安装包，然后右键复制安装包下载链接地址

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113201116.png)

使用ssh连接到服务器上，使用wget下载对应安装包：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113201153.png)

下载后解压缩：

```
tar -xvf 安装包
```

然后进入安装包内进行配置：

作为服务器端，需要配置的是frps.ini文件，frps表示作为服务器，frpc表示作为客户端

使用vim编辑frps.ini文件：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113201421.png)

配置按照默认的即可，或者自己可以修改一下端口，但必须确保端口在防火墙中已经开启了

接下来到客户端配置：

根据客户端系统下载对应的安装包，解压，然后配置frpc.ini文件

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113201503.png)

配置尽量按照我的来，确保不出问题，同时端口需确保在服务器防火墙中打开了，之前我就出现过问题就是因为没有放行相关端口

之后就可同时启动服务器端的frp和客户机上的frp软件启动方法看教程：[https://github.com/fatedier/frp/blob/master/README\_zh.md](https://github.com/fatedier/frp/blob/master/README_zh.md)里面有关于frp的详细介绍及用法，再有不懂的谷歌百度。

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113202031.png)

出现如图所示即表示服务器与客户机已经成功建立连接了

同时电脑上需开启远程桌面

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113201525.png)

windows 10系统直接在这里开启即可，其余系统自行百度

然后我们到ipad上搜索下载微软远程桌面：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113201547.png)

然后在软件里进行配置：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113201705.png)

端口号确保和之前在客户机上设置的监听端口remote\_port保持一致

启动后即可连接上了
