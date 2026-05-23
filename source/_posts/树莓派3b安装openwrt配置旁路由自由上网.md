---
title: 树莓派3b安装openwrt配置旁路由自由上网
date: 2021-11-13
categories:
- 树莓派
tags:
- openwrt
- v2ray
- 密码
- 旁路由
- 树莓派
- 路由器
---
前面有文章讲了树莓派安装luci版openwrt作为路由自由上网，参考文章：[树莓派3b+安装luci版openwrt解决无法连接网络并配置v2ray](http://www.demon1630.cn/%e6%a0%91%e8%8e%93%e6%b4%be3b%e5%ae%89%e8%a3%85luci%e7%89%88openwrt%e8%a7%a3%e5%86%b3%e6%97%a0%e6%b3%95%e8%bf%9e%e6%8e%a5%e7%bd%91%e7%bb%9c%e5%b9%b6%e9%85%8d%e7%bd%aev2ray/)

但由于树莓派自身信号不是很好，还是不如好一点的路由器信号好，最近入手了一个京东云，采用wifi6，信号强度和稳定性都不错，但是由于不打算把其刷为openwrt，所以其本身的可玩性不高，也不能直接通过路由器之间自由上网。故考虑用树莓派作为旁路由，然后京东云wifi作为ap，就可以同时实现了

树莓派刷openwrt的过程和前面文章中的一样，参考文章：[树莓派3b+安装luci版openwrt解决无法连接网络并配置v2ray](http://www.demon1630.cn/%e6%a0%91%e8%8e%93%e6%b4%be3b%e5%ae%89%e8%a3%85luci%e7%89%88openwrt%e8%a7%a3%e5%86%b3%e6%97%a0%e6%b3%95%e8%bf%9e%e6%8e%a5%e7%bd%91%e7%bb%9c%e5%b9%b6%e9%85%8d%e7%bd%aev2ray/)   只是在配置过程中不同

树莓派刷好openwrt后先不要连接网线，开机然后电脑连接树莓派wifi，进入后台，默认密码是password

![](https://i.loli.net/2021/11/13/XRZWnSqzfrdsFlh.png) 进入后台后，修改LAN口

![](https://i.loli.net/2021/11/13/SUpc7WgXfD8xQ5v.png)按照如图所示进行修改， 主要是修改网关和DNS服务器为主路由IP地址

![](https://i.loli.net/2021/11/13/EndoJGQAKvp6qSI.png) 然后关闭树莓派的DHCP服务，因为DHCP还是由主路由来提供，然后保存应用

保存应用后就要把树莓派连接到主路由，此时已经无法访问树莓派默认路由192.168.1.1了，树莓派连接到主路由后，电脑连接主路由wifi，然后访问前面配置的树莓派IP地址

![](https://i.loli.net/2021/11/13/DFd3tZXr4MN6kqJ.png)

此时就可以重新进入树莓派后台，然后测试一下看是否树莓派能联网

![](https://i.loli.net/2021/11/13/htWBSnxifFzQRy6.png) 之后还必须配置防火墙，在后面黏贴

```text
iptables -t nat -I POSTROUTING -j MASQUERADE
```

然后重启防火墙 ![](https://i.loli.net/2021/11/13/htWBSnxifFzQRy6.png) 此时可能还会有问题，还需把树莓派的端口桥接关闭

![](https://i.loli.net/2021/11/13/UKOlB1u8PJXceT5.png) 把桥接接口取消勾选，然后选择eth0网口，保存应用

此时树莓派上已经配置好了，接下来启动树莓派的旁路由功能

我们需要将设备指向旁路由，用来体验软路由中的一些功能，这里有两种做法，一种是需要利用旁路由功能的设备改IP地址启动，另一种是所有设备的数据都经过旁路由处理。

为了避免如果树莓派关闭或者出问题影响主路由，这里介绍第一种方式，就是不改动主路由，通过在设备上将网关等设定为树莓派来实现旁路由功能

![](https://i.loli.net/2021/11/13/Q5KMnrZHALuwvXB.png)

如手机上连接主路由wifi，然后将其设置为静态路由，修改路由器和DNS为树莓派也就是我们旁路由的IP地址即可

![](https://i.loli.net/2021/11/13/3F5UsJ8nczr7XyZ.png)

电脑上则修改WiFi为手动IP设置，然后网关和dns修改为树莓派旁路由IP即可

要是想所有设备都走旁路由，则进入主路由的后台，找到DHCP服务器，最最要的就是修改网关那一个选项，网关那里填写旁路由的管理地址就行。
