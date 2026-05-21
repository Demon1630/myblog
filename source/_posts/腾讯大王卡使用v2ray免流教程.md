---
title: "腾讯大王卡使用v2ray免流教程"
date: 2021-06-06
categories: 
  - "推荐软件"
tags: 
  - "v2ray"
  - "免流"
  - "域名"
---

腾讯虽然对于老用户可以每个月给1G通用流量，然后对于腾讯系应用可以免流40G，但如果只用腾讯王卡，1G通用流量基本上不够，这时候就可能要买1元/G的日租流量包，不划算，这里就介绍如何用vps搭建v2ray来实现免流

首先要有一台vps，因为流量需要通过走这台vps实现流量伪装

登录vps，使用脚本安装v2ray

```
bash <(curl -s -L https://git.io/v2ray.sh)
```

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210606110821.png)

选择1安装，然后选择3 websocket

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210606110944.png)

端口必须配置为80，然后记得在vps的防火墙中放行80端口，其他默认就可以了，然后安装就可以了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210606111217.png)

等安装完成，然后输入 v2ray url ，就可以获取配置链接，进入手机的v2ray中导入就可以了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210606111626.png)

进入v2ray 中，点击导入的配置文件，在伪装域名里填入腾讯的免流域名：short.weixin.qq.com，然后在路径处填入 斜杠/

v2ray需要配置为全局模式，从而代理所有流量

```
腾讯大王卡：tx.flv.huya.com
腾讯大王卡：short.weixin.qq.com
腾讯大王卡：szextshort.weixin.qq.com
腾讯大王卡：short.weixin.qq.com
百度圣卡：data.video.qiyi.com
阿里宝卡：vali-dns.cp31.ott.cibntv.net
阿里宝卡：gw.alicdn.com
api.mobile.youku.com
米粉卡混淆参数：api.ad.xiaomi.com
```

其余卡混淆可以参考配置，最后自己再上网看看是否免流，避免出错

 

如果要开启热点让其他设备也使用免流流量，首先手机app上要设置允许来自局域网的连接，具体设置如图所示：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/467c4e181ce75f043de384937e88b6f.jpg)

之后，到电脑上设置网络，手动设置代理，设置如图：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210801161336.png)

端口设置为手机app上的http代理端口10809，然后地址设置为你的手机热点的IP地址，可以在电脑上进入cmd>ipconfig /all查看，一般你电脑IP为192.168.1.5，则手机热点IP一般为192.168.1.1，之后电脑上的流量就可以通过手机v2ray进行免流。

如果出现断联或者网络差的问题，可以尝试到手机开发者模式中，关闭共享网络硬件加速

最后最好先尝试一下看电脑流量是否实现了免流，避免造成经济损失。
