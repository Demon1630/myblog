---
title: "使用宝塔面板在已有网站下使用Lychee搭建图床"
date: 2020-01-04
categories: 
  - "宝塔面板"
  - "wordpress"
tags: 
  - "图床"
  - "域名"
  - "搬瓦工"
  - "数据库"
  - "网站"
---

之前一直在研究怎么搭建自己的图床，这里介绍一下如何使用Lychee搭建，因为之前搭建网站的时候使用了宝塔面板，所以这里也介绍如何使用宝塔面板来实现

首先是使用了宝塔面板搭建好网站，如何使用宝塔面板搭建网站可以看之前文章：[搬瓦工使用宝塔面板搭建网站](http://www.demon1630.cn/%e6%90%ac%e7%93%a6%e5%b7%a5%e4%bd%bf%e7%94%a8%e5%ae%9d%e5%a1%94%e9%9d%a2%e6%9d%bf%e6%90%ad%e5%bb%ba%e7%bd%91%e7%ab%99/)，之后进入宝塔面板后台，直接远程下载Lychee安装包到网站目录下面，Lychee项目地址：[https://github.com/electerious/Lychee/blob/master/docs/Installation.md](https://github.com/electerious/Lychee/blob/master/docs/Installation.md)

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320111920.png)

右键选择复制直接下载的链接地址，然后到宝塔面板后台，进入网站根目录下，远程下载下Lychee安装包 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320112028.png)

下载完成之后解压缩

然后使用xshell连接vps，进入解压缩后的文件夹，对里面的文件夹进行权限分配：chmod -R 775 uploads/ data/

之后到浏览器中打开www.你的网址/Lychee-master/,其中Lychee-master是你解压后的文件夹就可以看到登入页面

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320112050.png)

这里由于之前就创建过网站，而且图床是放在网站下面的，所以这里数据库直接使用了网站的数据库，输入数据库信息就可以登入上去，创建自己的用户名了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320112118.png)

之后就可以在里面进行图片上传什么的操作，也可以获取图片直链

如果一开始没有搭建好网站，就需要先创建网站，然后直接将Lychee安装包解压后放到根目录下，同样的数据库使用创建网站时的数据库，这时候访问就是直接访问自己的网址域名了，不需要访问下面的文件夹

 

 

更新,后面使用picgo搭建图床,发现更加方便,可以参考文章:

# [使用GitHub+picgo搭建图床并使用免费CDN服务进行加速](http://www.demon1630.cn/%e4%bd%bf%e7%94%a8githubpicgo%e6%90%ad%e5%bb%ba%e5%9b%be%e5%ba%8a%e5%b9%b6%e4%bd%bf%e7%94%a8%e5%85%8d%e8%b4%b9cdn%e6%9c%8d%e5%8a%a1%e8%bf%9b%e8%a1%8c%e5%8a%a0%e9%80%9f/)
