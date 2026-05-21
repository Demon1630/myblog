---
title: "使用uptime-status搭建网站监控面板"
date: 2021-03-24
categories: 
  - "wordpress"
tags: 
  - "cloudflare"
  - "tor"
  - "域名"
  - "网站"
  - "网站监控"
  - "邮箱"
---

uptime status是基于uptimerobot 的api调用的网站监控面板，uptimerobot是一家能够提供服务器定时监控服务的网站，可以利用其服务器监测你的网站响应状态

# 创建UptimeRobot 监控API

首先先到UptimeRobot官网注册一个免费账号：[https://uptimerobot.com/](https://uptimerobot.com/)

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210324133831.png)

之后到他后台添加一个新监控：add new monitor

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210324133941.png)

类型选择https，然后把自己的通知邮箱勾选上

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210324134522.png)

把域名填上去就可以了，之后点击右下角create monitor

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210324134735.png)

之后点击 My Settings--API Settings--Monitor-Specific API Keys   在monitor中输入你创建的monitor名字，然后点击创建API key

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210324135202.png)

把获得的api key复制下来备用

# 安装uptime status面板

之后使用宝塔面板使用域名创建一个网站，创建方法参考文章：

# [使用宝塔面板搭建网站](http://www.demon1630.cn/%e6%90%ac%e7%93%a6%e5%b7%a5%e4%bd%bf%e7%94%a8%e5%ae%9d%e5%a1%94%e9%9d%a2%e6%9d%bf%e6%90%ad%e5%bb%ba%e7%bd%91%e7%ab%99/)

创建完成后，在网站根目录下下载最新版的 uptime status包：[https://github.com/yb/uptime-status/releases/latest](https://github.com/yb/uptime-status/releases/latest)

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210324141308.png)

下载这个编译好的，不要下载源码

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210324141730.png)

解压缩后编辑这个config.js文件，修改ApiKeys为自己之前复制的api

此时访问自己的网站就可以看到布置完成了

# 使用cloudflare workers反代创建自己的服务器接口

但由于最近 [UptimeRobot](https://www.daniao.org/tag/uptimerobot/) 官方的接口经常抽风，表现为响应头中丢失 CROS，导致跨域出错~

就会出现你自己的网站上的监控一直在转圈，无法正常显示

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210324142451.png)

在最新的1.5.1版本中，作者加入了自定义接口功能，使用cloudflare 的workers创建

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210324142755.png)

 

进入cloudflare 点击workers-管理workers，然后点击创建workers

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210324143016.png)

把原先脚本中内容删除，复制代码进去

```
const handleRequest = async ({ request }) => {
  let url = new URL(request.url);
  let response = await fetch('https://api.uptimerobot.com' + url.pathname, request);
  response = new Response(response.body, response);
  response.headers.set('Access-Control-Allow-Origin', '*');
  response.headers.set('Access-Control-Allow-Methods', '*');
  response.headers.set('Access-Control-Allow-Credentials', 'true');
  response.headers.set('Access-Control-Allow-Headers', 'Content-Type,Access-Token');
  response.headers.set('Access-Control-Expose-Headers', '*');
  return response;
}

addEventListener('fetch', (event) => {
  event.respondWith(handleRequest(event));
});
```

然后点击保存并部署，就可以获得对应的域名

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210324143250.png)

把这个域名复制下来，进入网站编辑config.js文件

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210324143408.png)

把它替换到这个ApiDomain中即可，之后再访问页面就可以正常显示监控状态了

示例：[https://jiankong.strivefysfxyh.com/](https://jiankong.strivefysfxyh.com/)
