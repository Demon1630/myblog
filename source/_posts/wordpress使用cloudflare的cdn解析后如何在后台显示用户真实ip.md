---
title: "WordPress使用cloudflare的CDN解析后如何在后台显示用户真实ip"
date: 2019-11-24
categories: 
  - "wordpress"
tags: 
  - "网站"
  - "网站建设"
---

在WordPress里安装了统计插件，可以显示访问用户的设备和ip信息等情况，但之前由于使用了cloudflare的CDN，导致显示的用户ip都是cloudflare的ip，没有任何作用，所以为了得到用户的真实ip，我们可以通过添加一小段代码来实现，代码如下：

```
//绕过 CDN 代理IP获取客户真实IP地址
if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
{
$list = explode(',',$_SERVER['HTTP_X_FORWARDED_FOR']);
$_SERVER['REMOTE_ADDR'] = $list[0];
}
```

将上面这段代码添加到网站根目录的wp-config.php文件开头中php下即可，记住是根目录下的，不是主题下的：

[![](https://www.demon1630.cf/wp-content/uploads/2019/11/1574577843-获取真实ip-1024x291.png)](https://www.demon1630.cf/wordpress%e4%bd%bf%e7%94%a8cloudflare%e7%9a%84cdn%e8%a7%a3%e6%9e%90%e5%90%8e%e5%a6%82%e4%bd%95%e5%9c%a8%e5%90%8e%e5%8f%b0%e6%98%be%e7%a4%ba%e7%94%a8%e6%88%b7%e7%9c%9f%e5%ae%9eip/1574577843-%e8%8e%b7%e5%8f%96%e7%9c%9f%e5%ae%9eip/)添加后效果如下： [![](https://www.demon1630.cf/wp-content/uploads/2019/11/1574578002-显示真实ip2.png)](https://www.demon1630.cf/wordpress%e4%bd%bf%e7%94%a8cloudflare%e7%9a%84cdn%e8%a7%a3%e6%9e%90%e5%90%8e%e5%a6%82%e4%bd%95%e5%9c%a8%e5%90%8e%e5%8f%b0%e6%98%be%e7%a4%ba%e7%94%a8%e6%88%b7%e7%9c%9f%e5%ae%9eip/1574578002-%e6%98%be%e7%a4%ba%e7%9c%9f%e5%ae%9eip2/)此时已经可以把访问用户的真实ip和地址显示出来，起到一定的监控作用，对于恶意访问的ip也可以进行封禁了
