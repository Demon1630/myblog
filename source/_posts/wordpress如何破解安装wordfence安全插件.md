---
title: "Wordpress如何破解安装Wordfence安全插件"
date: 2019-11-30
categories: 
  - "wordpress"
tags: 
  - "网站"
---

安全是我们首先要考虑的问题，所以建议大家建站后安装一个安全插件，更好的保护自己的网站免遭攻击，这里介绍一下wordfence这个插件吧

[![](https://www.demon1630.cf/wp-content/uploads/2019/11/1575081522-09393E98-01B5-4ED5-9986-911ED35601DC-1024x715.png)](https://www.demon1630.cf/wordpress%e5%a6%82%e4%bd%95%e7%a0%b4%e8%a7%a3%e5%ae%89%e8%a3%85wordfence%e5%ae%89%e5%85%a8%e6%8f%92%e4%bb%b6/1575081522-09393e98-01b5-4ed5-9986-911ed35601dc/)

基本上可以满足我们的需求了，但要想使用全部功能，需要付费订阅，但是吧，作为对技术的追求（穷），我们这里介绍一下如何进行破解，但还是建议能付费尽量付费吧，版权意识还是要有的，下面介绍一下主要步骤吧。

### 一 安装wordfence插件

首先在网站后台把wordfence安装好，如何安装插件这里就不介绍了，自行百度

### 二 后台更改文件

使用FTP或者ssh或宝塔面板，在自己的网站目录下找到

wp-content/plugins/wordfence/lib/wordfenceClass.php这个文件，打开后进行更改

找到下面这段代码：

```
if (!WFWAF_SUBDIRECTORY_INSTALL && $waf = wfWAF::getInstance()) {
```

然后在这行代码下面的$siteurl = wfUtils::wpSiteURL();代码下放，添加上下面这4行代码：

```
wfConfig::set('isPaid', 1);
wfConfig::set('keyType', wfAPI::KEY_TYPE_PAID_CURRENT);
!!wfConfig::set('isPaid', 1);
!!wfConfig::set('keyType', wfAPI::KEY_TYPE_PAID_CURRENT);
```

[![](https://www.demon1630.cf/wp-content/uploads/2019/11/1575082903-E5A7FFB4-64FB-46BE-9AA9-0E65625FD74C-1024x533.jpeg)](https://www.demon1630.cf/wordpress%e5%a6%82%e4%bd%95%e7%a0%b4%e8%a7%a3%e5%ae%89%e8%a3%85wordfence%e5%ae%89%e5%85%a8%e6%8f%92%e4%bb%b6/1575082903-e5a7ffb4-64fb-46be-9aa9-0e65625fd74c/)效果如图所示，这就破解完成了，相对于其他直接安装破解版插件，这种方法的还是比较安全的，因为上传别人的插件，谁也不知道里面有没有包恶意代码

这是基于我的wordfence版本为7.4.1，其他版本的没有试过，暂时不知道效果怎么样，然后能支持正版就尽量支持正版吧
