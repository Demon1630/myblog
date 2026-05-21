---
title: "使用GitHub+picgo搭建图床并使用免费CDN服务进行加速"
date: 2021-01-11
categories: 
  - "wordpress"
tags: 
  - "图床"
---

所谓图床工具，就是自动把本地图片转换成链接的一款工具，网络上有很多图床工具，就目前使用种类而言，PicGo 算得上一款比较优秀的图床工具。它是一款用 `Electron-vue` 开发的软件，可以支持微博，七牛云，腾讯云COS，又拍云，GitHub，阿里云OSS，SM.MS，imgur 等8种常用图床，功能强大，简单易用。

## 一、准备

GitHub

picgo软件

首先登入GitHub，按图中所示新建一个仓库：

![](https://raw.githubusercontent.com/Demon1630/picBed/master/%E7%A7%81%E4%BA%BA%E5%9B%BE%E5%BA%8A.png)

然后进入设置中获取token

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/%E7%A7%81%E4%BA%BA%E5%9B%BE%E5%BA%8A2.png) ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/%E7%A7%81%E4%BA%BA%E5%9B%BE%E5%BA%8A3.png) ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/%E7%A7%81%E4%BA%BA%E5%9B%BE%E5%BA%8A4.png)

按图中所示一步步操作即可，然后到最下面点击生成token ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/%E7%A7%81%E4%BA%BA%E5%9B%BE%E5%BA%8A5.png)

把生成的token复制下来备用（注意token只显示一次，所以找个地方记录好） 之后去[picgo官网](https://github.com/Molunerfinn/PicGo/releases)下载最新版picgo软件到电脑上 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/%E7%A7%81%E4%BA%BA%E5%9B%BE%E5%BA%8A6.png)

然后就是安装配置picgo

安装好picgo后打开 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/%E7%A7%81%E4%BA%BA%E5%9B%BE%E5%BA%8A7.png)

选择GitHub图床

在1中填入自己的：用户名/仓库名

在2中填入：master

在3中填入之前复制的GitHub上的token

在4中写：img/      就会在GitHub仓库中创建一个img目录，然后上传的图片都在找个目录下

在5中填写[jsdelivr cdn](https://www.jsdelivr.com/?docs=gh)加速链接：https://cdn.jsdelivr.net/gh/用户名/仓库名

使用jsdeliver免费的cdn加速服务，可以避免因为图片放在GitHub上因为国内网络原因导致的访问延迟

之后点击确认即可，然后就可以安心上传图片了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210111192607.png)

上传的图片会显示在相册里

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210111192708.png)

点击复制按钮就可以获得图片的链接，放到文章中就可以使用了

 

 

## 二、后续

在上传中出现过错误：显示服务端错误

报错内容：

StatusCodeError: 404 - {"message":"Branch master not found","documentation\_url":"https://docs.github.com/rest/reference/repos#create-or-update-file-contents"} at new StatusCodeError。。。。。

 

查找后发现原来是因为在新建的GitHub仓库中，没有master分支，而之前在picgo中设置GitHub图库时，设定分支名处写的是默认的master

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210111193328.png)

就是这里

所以解决办法是在之前新建的GitHub仓库中新建一个master分支，并将其设置为默认分支

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210111193615.png)

新建好master分支后就可以正常上传了
