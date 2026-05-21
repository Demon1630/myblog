---
title: "网站使用cloudflare配置ssl时出现重定向次数过多而无法访问问题"
date: 2020-08-22
categories: 
  - "技术"
  - "wordpress"
tags: 
  - "网站"
  - "网站建设"
---

在将域名添加到cloudflare后，启用其ssl，但出现访问网站时出现重定向次数过多而无法访问的问题

![](http://www.demon1630.cn/wp-content/uploads/2020/08/1598062486-ssl导致重定向次数过多1.png)

这其实可能是由于cloudflare启用的ssl模式和服务器使用的ssl不匹配的原因

默认情况下，CloudFlare 启用的 SSL 模式是 灵活，还有三个选项是 关闭、完全、完全(严格)：

![](http://www.demon1630.cn/wp-content/uploads/2020/08/1598062597-ssl导致重定向次数过多2-1024x537.png)

这四种方式之间的区别如下：

![](http://www.demon1630.cn/wp-content/uploads/2020/08/1598062808-ssl5.png)

用户端到 CloudFlare 的访问称之为 A，CloudFlare 到服务端的访问称之为 B：

Off：全程 HTTP；

Flexible：A 使用 HTTPS，B 使用 HTTP，称为灵活加密；

Full：全程使用 HTTPS，允许 B 程服务端使用自签名证书；

Full(strict)：全程使用 HTTPS，与 Full 的区别在于 B 程服务端必须使用有效的可信任证书；

 

从这里就可以看出为什么会出现重定向次数过多而无法访问了

当服务端启用 HTTPS 时，一般都会再强制 HTTP 跳转 HTTPS，而 CloudFlare 默认启用的 SSL 策略是 Flexible。也就是说，当用户访问时，对于用户看到是 HTTPS，但对于服务器来说，访问方式却是 HTTP，所以服务器返回的状态都是 301重定向，就会导致网页显示重定向次数过多而无法访问

 

解决方法很简单，将cloudflare上的 SSL 策略由 **灵活** 设为 **完全** 或者 **完全(严格)** 即可

![](http://www.demon1630.cn/wp-content/uploads/2020/08/1598063110-ssl导致重定向次数过多3-1024x504.png)
