---
title: "群晖使用alist挂载阿里云盘到本地"
date: 2023-06-03
categories: 
  - "技术"
tags: 
  - "nas"
  - "云盘"
  - "密码"
  - "群晖"
---

使用群晖NAS，虽然可以将很多文件保存到本地，但有时候还是需要从网盘下载到本地或者用网盘作为本地备份，避免本地NAS出问题导致资料丢失，这里介绍使用alist工具进行同步，alist介绍见官网[https://alist.nn.ci/zh/](https://alist.nn.ci/zh/)

首先需要在群晖里安装alist，需要用到外部套件源，推荐矿神：[https://spk.imnks.com/](https://spk.imnks.com/)（DSM6），如果是DSM7的使用[https://spk7.imnks.com/](https://spk7.imnks.com/)

将这个套件源添加到套件中心里： ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603190725.png)

点击设置，然后进入套件来源，新增，将前面的矿神网址添加进去 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603191057.png)

添加进去后，在常规这里，勾选允许任何发行者安装

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603191345.png) 然后搜索alist进行安装即可

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603191620.png)

使用默认用户名和密码admin，alist进入后台

找到存储这里，点击添加 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603191912.png)

选择阿里云盘Open

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603192028.png) 主要配置挂载路径，即在你NAS本地的路径

根文件夹ID是指你想同步的阿里云盘的文件夹ID，如果配置root，则表示阿里云盘整个文件夹，如果要指定某个文件夹，则进入阿里云盘网页版，进入到对应文件夹下面，网址最后的一串数字字母就是对应的ID ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603192649.png)

对于令牌，则需要进入到此页面进行扫码获取：

[https://alist.nn.ci/tool/aliyundrive/request.html](https://alist.nn.ci/tool/aliyundrive/request.html) 进入之后点击扫码，出现一个二维码，用手机上的阿里云盘app扫码，点击下方的I have scan获取对应的token令牌，复制过去即可 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603192831.png) 然后点击添加就可以添加成功

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603193009.png) 此时已经可以在alist主页看到挂载成功的阿里云盘内容了

然后回到群晖，安装一个cloud Sync套件，打开点击添加WebDAV，配置对应的路径

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603193448.png)

服务器地址填入alist主页地址，填入alist主页的账户和密码即可

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603193541.png)

然后到页面点击刚创建的WebDAV，点击任务列表，新增 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603193747.png)

然后对路径进行配置即可

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230603193344.png)

此时就可以完成配置了
