---
title: 自建bitwarden管理全平台密码
date: 2021-03-20
categories:
- 技术
- 推荐软件
tags:
- bitwarden
- docker
- wordpress
- 密码
- 搬瓦工
- 网站
---
现在各种登入网站什么的，创建了许多密码，为了避免密码泄露，用了多个密码，但密码多了，根本记不住，之前一直是使用浏览器记住密码，虽然很方便，同时也可以自动填充密码，但是有时候还是不方便，比如无法在手机app上进行登入什么的，每次都要到浏览器中查看密码才行，而且用浏览器记住密码也不一定很安全。

现在的密码管理软件比较好的就是1password，但好像需要付费，所以。。。。后面了解到bitwarden这个开源的密码管理项目，就想着尝试一下，结果正香。。。

bitwarden可以使用项目自带的服务器，只需创建自己的主账号就可以，也可以选择在自己服务器上搭建，有自己的服务器当然选择自己建了，建在自己服务器上也省心，而且项目是开源的，所以安全上基本不用怕

### Bitwarden和bitwarden\_rs

bitwarden\_rs项目延伸自Bitwarden，bitwarden\_rs使用Rust实现了Bitwarden相似的功能，两者均开源。不过Bitwarden需要较多的依赖（如MSSQL），占用内存也比较大，如果是个人或家庭使用，推荐更加轻量的bitwarden\_rs，并且bitwarden\_rs还可以免费使用Bitwarden的一些高级功能，如附件上传、TOTP等功能。

### 安装bitwarden\_rs

本文提供了Docker安装方式，因此我们需要先安装Docker（**注意：OpenVZ虚拟化不支持Docker**），安装Docker方法如下：

```
#安装Docker
yum -y install docker
#启动docker
systemctl start docker
#开机自启
systemctl enable docker
```

接下来使用Docker拉取bitwarden\_rs镜像并运行

```
docker pull bitwardenrs/server:latest
docker run -d --name bitwarden -v /bw-data/:/data/ -p 80:80 bitwardenrs/server:latest
```

上方使用了80端口，如果您已经安装了WEB服务，可能会导致冲突，可以将bitwarden\_rs映射的端口修改为其它，比如8880

```
docker run -d --name bitwarden -v /bw-data/:/data/ -p 8880:80 bitwardenrs/server:latest
```

### 配置反向代理

前面就配置好了bitwarden的docker了，但还需要在服务器上配置反向代理，从而可以利用自己的域名访问bitworden服务

首先要知道怎么创建网站，这里参考之前的文章：

# [搬瓦工使用宝塔面板搭建网站](http://www.demon1630.cn/%e6%90%ac%e7%93%a6%e5%b7%a5%e4%bd%bf%e7%94%a8%e5%ae%9d%e5%a1%94%e9%9d%a2%e6%9d%bf%e6%90%ad%e5%bb%ba%e7%bd%91%e7%ab%99/)

域名的话可以自己购买域名或者使用免费域名

参考文章：

# [免费域名申请](http://www.demon1630.cn/%e5%85%8d%e8%b4%b9%e5%9f%9f%e5%90%8d%e7%94%b3%e8%af%b7/)

# [WordPress付费域名购买+更改域名](http://www.demon1630.cn/wordpress%e4%bb%98%e8%b4%b9%e5%9f%9f%e5%90%8d%e8%b4%ad%e4%b9%b0%e6%9b%b4%e6%94%b9%e5%9f%9f%e5%90%8d/)

# [使用cloudflare解析域名并隐藏搬瓦工真实ip](http://www.demon1630.cn/%e4%bd%bf%e7%94%a8cloudflare%e8%a7%a3%e6%9e%90%e5%9f%9f%e5%90%8d%e5%b9%b6%e9%9a%90%e8%97%8f%e6%90%ac%e7%93%a6%e5%b7%a5%e7%9c%9f%e5%ae%9eip/)

使用cloudflare可以利用一个一级域名创建无数个子域名,方便网站的创建

创建好网站后:

在宝塔面板中进入网站管理界面:

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320102918.png)

首先先申请ssl证书,因为bitwarden访问过程中如果没有使用https的话是无法访问的

申请完之后,进行反向代理

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320103130.png)

反向代理添加如图所示,   http://127.0.0.1:8880     后面的端口号根据自己前面配置docker中的映射端口来定

添加完成之后,访问自己的域名,就可以进入bitwarden管理界面了,创建一个账户即可,bitwarden支持将1password和浏览器密码导入等功能,可以自己去尝试

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320103602.png)

同时还可以生成复杂密码等，可以在安卓手机或苹果手机上下载bitwarden的app，同时也可以在浏览器上安装扩展插件，使用app可以实现密码自动填充等，非常方便

 

使用app和插件时要注意：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320103955.png)

首先先进入左上角设置

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320104113.png)

在自托管环境中填入自己服务器的地址，之后才可以进行登入
