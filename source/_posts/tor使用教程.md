---
title: "tor使用教程"
date: 2019-10-31
categories: 
  - "tor"
  - "推荐软件"
tags: 
  - "tor"
  - "搬瓦工"
---

可能很多人都知道怎么翻墙，因为现在网上也有很多的翻墙软件和方法，如我之前写的[使用搬瓦工安装shadowsocks](https://www.demon1630.cf/%e6%9d%bf%e7%93%a6%e5%b7%a5%e5%ae%89%e8%a3%85shadowsocks%e5%8f%8a%e5%85%b6%e6%8e%a7%e5%88%b6%e9%9d%a2%e6%9d%bf/)就算是比较简单的自己搭建梯子的方法。但可能很多人对于tor并不是很了解，在百度上的有关于[tor](https://baike.baidu.com/item/%E6%B4%8B%E8%91%B1%E5%A4%B4/10295569)的解释,简单来说，tor就是一种通过使用不同的在全球各地的代理服务器来实现隐藏自身真实ip的行为。因为在我们上网的时候，我们自身的很多信息都通过我们的浏览器泄漏出去了，我们可以使用[IP地址监测](https://browserleaks.com/ip)来查看自己的ip地址、设备型号甚至是我们自己的坐标。可能有些人对这些并不是很重视，但看过[棱镜计划](https://baike.baidu.com/item/%E6%A3%B1%E9%95%9C%E9%97%A8)的人应该都知道网络监控，所以为了保护自身隐私，有些时候可以使用tor来达到隐身上网的目的，当然，[暗网](https://baike.baidu.com/item/%E6%9A%97%E7%BD%91/8694490)也是tor浏览器的一个应用方向，但这里不做介绍。

本文主要来讲一下如何使用tor实现上网（tor在无法翻墙的时候也可以用作翻墙工具，但由于其需要经过多个代理，所以速度并不是很快，在实在没有办法的情况下可以试一下）。

首先下载tor：到此网址找到自己对应版本和语言的，然后下载[https://www.torproject.org/zh-CN/download/languages/](https://www.torproject.org/zh-CN/download/languages/)

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320162731.png)

下载完之后直接双击就可以了，tor浏览器是免安装的，所以在运行之后只会生成一个文件，保留好这个文件就可以了。然后进入tor页面：

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320162807.png)

鉴于国内的网络环境，直接连接基本上是不可能连接的上的，选择配置：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320162835.png)

 

这里选择我所在的国家对tor进行了审查，然后选择内置网桥，内置网桥如果有哪个不能用可以换着用，然后点击右下角的连接：

然后tor就会自动配置代理链路：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320162918.png)

 

如果没什么问题的话就可以连上网了：

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163000.png)

上youtube什么的都基本上没问题，但由于使用了多次代理转换，所以网速也是比较感人：

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163028.png)

这里我们可以看到其走的代理路径，可以看到是有一个网桥和两个代理地址，由于代理地址是时刻在改变的，所以我们所访问的网址就很难追踪我们的实际地址了，这也是tor的原理，一层层的代理，从而实现保护个人隐私的目的。

如果我们自己本来就有代理软件如shadowsocks或者是v2ray等，这时候就可以不需要使用网桥，直接使用自己的代理，因为使用自己的代理速度会比网桥快很多：

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163049.png)

此时选择使用代理访问，然后配置如图所示，但是端口需要查看自己设置的，如果使用v2ray来作为代理的话，在v2ray上需要配置如图所示：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163151.png)

选择参数设置

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163212.png)

这里主要需要配置的内容就是这个本地监听端口，这也是在tor上配置时填写的端口，需要保持一致，同时开启流量探测这里需要把√取消掉，配置好之后就可以使用了。在使用代理来连接tor之后，速度比使用网桥快上很多，基本上可以看youtube上的1080高清，当然前提是你的代理速度也足够快：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320163236.png)

使用tor对于对隐私比较重视的人来说还是挺有用的，如果无法打开tor下载页面的可以留言寻求帮助
