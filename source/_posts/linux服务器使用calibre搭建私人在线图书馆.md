---
title: "linux服务器使用calibre搭建私人在线图书馆"
date: 2023-05-07
categories: 
  - "技术"
  - "推荐软件"
tags: 
  - "calibre"
  - "docker"
  - "个人图书馆"
  - "宝塔面板"
  - "密码"
  - "网站"
---

有时候我们在网上找了很多电子书下载下来，但一直没有一个很好的存储管理图书的工具，后面找起来啥的就很麻烦，这里推荐一个在线的图书管理工具：calibre

主页如图，非常简单明了，而且可以在线搜索图书内容，获取封面和简介等，很好用

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507121117.png) 这里介绍一下搭建安装过程，采用docker来安装

网上有推荐 [technosoft2000/calibre-web](https://registry.hub.docker.com/r/technosoft2000/calibre-web/) 版本的，也有推荐[linuxserver/calibre-web](https://registry.hub.docker.com/r/linuxserver/calibre-web/)版本的，但technosoft2000版本的作者已经停止维护更新了，安装后出现无法打开问题，linuxserver版本的安装后有出现无法转换图书格式的问题，因此这里都不推荐，经过查找最终找到了一个国人维护的版本：[johngong/calibre-web](https://registry.hub.docker.com/r/johngong/calibre-web)，非常好用，配置基本都设置好了，开箱即用，不用再做额外配置，后面安装都是采用johngong/calibre-web这个版本

首先需要在你服务器上安装docker和宝塔面板，便于后续安装，docker安装可以参考教程

# [史上最全Docker环境安装指南](http://www.demon1630.cn/%e5%8f%b2%e4%b8%8a%e6%9c%80%e5%85%a8docker%e7%8e%af%e5%a2%83%e5%ae%89%e8%a3%85%e6%8c%87%e5%8d%97-2/)

宝塔面板安装教程可以参考

# [vps安装宝塔面板](http://www.demon1630.cn/vps%e5%ae%89%e8%a3%85%e5%ae%9d%e5%a1%94%e9%9d%a2%e6%9d%bf/)

其实进入其部署的网站：[https://registry.hub.docker.com/r/johngong/calibre-web](https://registry.hub.docker.com/r/johngong/calibre-web)就可以看到其详细介绍了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507122327.png)

首先拉取docker镜像，docker：

```
docker pull johngong/calibre-web
```

之后启动镜像：

```
docker create  \
    --name=calibre-web  \
    -p 8083:8083  \
    -p 8080:8080  \
    -v /配置文件位置:/config  \
    -v /书库:/library  \
    -v /自动添加文件夹:/autoaddbooks  \
    -e UID=1000  \
    -e GID=1000  \
    -e CALIBRE_SERVER_USER=用户名  \
    -e CALIBRE_SERVER_PASSWORD=用户密码 \
    --restart unless-stopped  \
    johngong/calibre-web:latest
```

里面的：/配置文件位置、/书库、/自动添加文件夹  都可以自定义，是用来放置图书文件和相关配置文件的地址，后面的用户名、密码也需要自己配置，后面可以用来登录，如果不知道怎么配置可以参考我下面的配置位置

```
docker create  \
    --name=calibre-web  \
    -p 8083:8083  \
    -p 8080:8080  \
    -v /data/calibre/config:/config  \
    -v /data/calibre/books:/library  \
    -v /data/autoaddbooks:/autoaddbooks  \
    -e UID=1000  \
    -e GID=1000  \
    -e CALIBRE_SERVER_USER=mm  \
    -e CALIBRE_SERVER_PASSWORD=mm11 \
    --restart unless-stopped  \
    johngong/calibre-web:latest
```

启动好之后进入宝塔面板后台，需要将8083、8080端口放行，点击宝塔面板中安全-添加端口规则，填入8083、8080然后确定就可以为这两个端口放行了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507123240.png)

找到前面配置的书库和配置文件夹，还需要将其权限做一下调整为777，既允许所有的读取和写入，避免后面无法上传图书等问题

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507122939.png)

此时已经完成了配置，就可以登入图书馆了，登录地址是IP:8083

默认登录名是admin，密码admin123，也可以使用前面创建的用户名和密码登入，但先用admin登入，其权限更大，可以做一些配置

点击管理权限-编辑基本配置

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507123708.png)

找到里面的功能配置，勾选上启用上传，启用注册也可以勾选上，然后点击保存

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507123827.png)

此时刷新一下页面，可以看到右上角会出现上传书籍的按钮，点击上传，找到下载的离线电子书文件上传即可 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507124308.png) 下滑到下面点击获取元数据 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507124406.png) 之后就会自动根据图书名字在网上搜索对应图书 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507124553.png) 找到合适的来源，点击图书封面，就可以将其应用到对应的图书上，然后点击下方的保存即可

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507124719.png) 此时书籍和对应的封面就出现在首页了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507124830.png) 后面还可以对图书格式进行转换，点击对应图书，点击编辑元数据，在左边找到书籍格式转换

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507125010.png) 此时就可以将txt格式转换为通用的EPUB格式，点击任务列表可以看到转换进度

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507125116.png) 后面就可以安心阅读图书了
