---
title: "树莓派无显示器无网线ssh连接无线网"
date: 2020-01-05
categories: 
  - "树莓派"
tags: 
  - "树莓派"
---

如果没有显示器等外设，同时又没有网线，只能先在树莓派里添加ssh文件，同时在里面添加wifi连接信息，使得树莓派开机就可以启动ssh同时连接上我们预设的wifi，具体操作如下

由于树莓派系统开始时默认是不开启ssh连接的，没有开启ssh就无法连接电脑，后续的操作也就无从谈起。所以首先要先开启树莓派的ssh连接，烧录好系统后，内存卡只有一个boot分区可以被识别，在里面添加一个命名为ssh的空白文件即可实现开机开启ssh

![](http://www.demon1630.cn/wp-content/uploads/2020/01/1578198512-树莓派7.png)

之后往系统里添加wifi信息

首先在内存卡中的boot分区中新建一个**wpa\_supplicant.conf**的文件，并在里面写上树莓派的wifi配置命令：

```
country=CN
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="wifi名称"
    psk="wifi密码"
    key_mgmt=WPA-PSK
    priority=1
}
```

 

其中ssid是wifi名称，psk是自己的wifi密码

添加上去之后即可开机连接上wifi，从而获取树莓派ID，使用ssh连接上去

如何查看树莓派ip地址可以使用软件[Advanced IP Scanner](https://www.advanced-ip-scanner.com/cn/)查看，或者自己可以登入路由器后台查看，使用软件扫描如下：

![](http://www.demon1630.cn/wp-content/uploads/2020/01/1578199454-树莓派8-1024x733.png)

之后使用ssh或者putty软件连接到这个ip上，树莓派默认的登入用户名为pi，登入密码为raspberry

 

如果树莓派一直在闪绿灯，而且一直连接不上wifi，那么可能是因为电源电流太小了，更换一下电源大小即可
