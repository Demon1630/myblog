---
title: "vps使用nextcloud搭建个人私有云盘"
date: 2020-04-21
categories: 
  - "技术"
tags: 
  - "搬瓦工"
  - "数据库"
  - "私有云盘"
  - "网站"
---

云盘的好处我就不多说了，不管是从确保数据安全、方便分享、容量大等方面来说都很不错，不过使用其他企业的云盘，总是不安全，之前像360云盘这些说不定就给你关了，目前国内还是百度云独大，毕竟用户体量在那，不过也采用限速这些手段逼你买会员，不过也不能怪别人，毕竟带宽费用占很大一部分。所以为了安全，搭建自己的私人云盘有时候很方便。

现在有很多开源的私有云盘方案，这里主要采用nextcloud来搭建。

这里是在搬瓦工vps上安装的，采用宝塔面板安装，宝塔面板的安装参考之前文章：[vps安装宝塔面板](https://www.demon1630.cf/vps%e5%ae%89%e8%a3%85%e5%ae%9d%e5%a1%94%e9%9d%a2%e6%9d%bf/)

### 1、前提

首先需要有域名，然后将自己的域名解析到自己的vps的ip

免费域名申请和解析可以参考之前文章：

[免费域名申请](http://www.demon1630.cn/%e5%85%8d%e8%b4%b9%e5%9f%9f%e5%90%8d%e7%94%b3%e8%af%b7/)      [使用cloudflare解析域名](http://www.demon1630.cn/%e4%bd%bf%e7%94%a8cloudflare%e8%a7%a3%e6%9e%90%e5%9f%9f%e5%90%8d%e5%b9%b6%e9%9a%90%e8%97%8f%e6%90%ac%e7%93%a6%e5%b7%a5%e7%9c%9f%e5%ae%9eip/)

在做好这两步后就可以开始到宝塔面板安装nextcloud

### 2、创建网站

进入宝塔面板中，添加网站

![](http://www.demon1630.cn/wp-content/uploads/2020/04/1587458053-owncloud2-1024x492.png)

创建完后到文件夹下找到创建的网站文件夹：

先到[nextcloud官网](https://nextcloud.com/install/#instructions-server)上找到下载安装包地址，右键复制好

![](http://www.demon1630.cn/wp-content/uploads/2020/04/1587458380-owncloud3-1024x465.png)

然后到网站文件夹下使用远程下载进行下载：

![](http://www.demon1630.cn/wp-content/uploads/2020/04/1587458579-owncloud4-1024x485.png)

下载好解压把文件夹内文件全部剪切出来放到网站根目录下，之前先把网站根目录下的几个默认文件先删除

剪切好后就可以到浏览器中输入域名网址进行安装nextcloud

### 3、安装nextcloud

浏览器中输入域名进入安装界面

![](http://www.demon1630.cn/wp-content/uploads/2020/04/1587458958-owncloud1-1024x586.png)

把之前创建网站时的数据库名和密码填入进行安装

安装完成即可进入管理页面

![](http://www.demon1630.cn/wp-content/uploads/2020/04/1587459139-owncloud5-1024x476.png)

后面的文件管理等可以自行查看帮助文档
