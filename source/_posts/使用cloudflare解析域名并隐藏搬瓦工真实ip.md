---
title: "使用cloudflare解析域名并隐藏搬瓦工真实ip"
date: 2019-11-23
categories: 
  - "搬瓦工"
  - "wordpress"
tags: 
  - "cloudflare"
  - "控制"
  - "搬瓦工"
  - "网站"
---

之前有写一篇文章，讲了如何直接使用搬瓦工自带的shadowsocks，详情见[瓦工安装shadowsocks及其控制面板](http://www.demon1630.cn/%E6%9D%BF%E7%93%A6%E5%B7%A5%E5%AE%89%E8%A3%85shadowsocks%E5%8F%8A%E5%85%B6%E6%8E%A7%E5%88%B6%E9%9D%A2%E6%9D%BF/)， 里面有讲到如果为了简单起见，不愿意搞太过于复杂的话，只是想安心上网，就可以直接使用这个教程里的，省去许多配置麻烦。

不过随着现在墙越来越高，使用shadowsocks的都经常容易被封IP，特别是对于搬瓦工来说，由于IP被封后免费更换IP服务已经取消了，只能进行付费更换IP，付费更换IP教程在[搬瓦工更改ip](http://www.demon1630.cn/搬瓦工更改ip/),这也就导致了使用shadowsocks非常危险，一个不小心就被封，就很难受了，所以这里介绍一种安全上网的方式，使用v2＋cloudflare，通过使用这种方式，就可以实现隐藏自己服务器真实ip，避免IP被封的情况发生。

首先准备工作：

一个域名

因为这是将我们的流量伪装成上网的流量，因此我们首先需要申请一个域名，如何申请免费域名可以看之前的文章[免费域名申请](https://www.demon1630.cf/%e6%90%ac%e7%93%a6%e5%b7%a5%e4%bd%bf%e7%94%a8v2%ef%bc%8bcloudflare%e5%ae%9e%e7%8e%b0ip%e9%9a%90%e8%97%8f%e4%bb%a3%e7%90%86/)，在文章里有讲如何申请免费域名。

接下来我们需要将域名解析到我们服务器的公网ip上，这里以搬瓦工为例，到[cloudflare网站](https://www.cloudflare.com/)里，注册登入后：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320104525.png)

如图点击添加域名，将域名添加进去 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320104606.png)

这里我们选择0美元的就行，然后继续

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320104636.png)

之后我们可以看到我们添加的域名：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320104708.png) 在这里添加解析，把我们的域名解析到我们服务器的ip上，那个云朵状的点击一下变成灰色，灰色表示我们不使用cloudflare代理ip，此时我们的域名就是直接解析到我们的ip上了，添加解析成功后，我们还需要到我们之前申请免费域名的网站上把DNS解析服务器修改为cloudflare的：

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320104734.png)

将上面的两个服务器名称记下来，然后我们到免费域名网站上修改

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320104925.png)

点击manage domain

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320105103.png)

这里点击nameservers

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320105135.png)

如图将我们cloudflare里的两个服务器名称填入，然后点击change nameservers，然后我们回到cloudflare页面

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320105209.png)

点击done，check nameservers

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320105233.png)

之后页面会跳到这里，我们等待一会，等解析生效，基本上一两分钟就可以了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320105310.png)

 

此时可以看到解析已经生效了，等待一会，我们可以到[ip监测网站](http://ping.chinaz.com)上查看我们的域名是否解析到了我们的ip上

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320105326.png)

把我们的域名进行ping检测

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320105348.png)

这里我们可以看到响应的ip，此时ip应该就是我们服务器的ip，如果之前在cloudflare里将那朵小云点击为黄色的话此时解析出来的就是cloudflare的ip了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320105418.png)

如图，将小云朵点击一下，显示为穿过云朵，此时表示使用了cloudflare的服务器来隐藏ip了，此时我们再去ip检测网站检查我们的域名，就会发现此时解析出来的ip不再是我们自己的

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320105455.png)

如图，此时显示的ip归属地位cloudflare的，此时也就实现了我们隐藏ip的目的

至此域名解析已经完成，后面我们需要根据情况来将小黄云点亮或者点击为灰色，就是当我们需要我们的域名解析为我们服务器ip时将小黄云点击为灰色，当我们需要隐藏ip时将小黄云点亮
