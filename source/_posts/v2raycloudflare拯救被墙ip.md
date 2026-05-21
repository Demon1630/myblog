---
title: "V2ray+cloudflare拯救被墙ip"
date: 2020-06-24
categories: 
  - "宝塔面板"
  - "技术"
  - "搬瓦工"
tags: 
  - "搬瓦工"
  - "网站"
---

## 前言

v2ray是一种类似于shadowsocks的代理平台，但功能更强大，具体介绍可以看官网介绍：[https://toutyrater.github.io/](https://toutyrater.github.io/)

使用cloudflare是因为cloudflare是一个解析平台，使用它可以帮你把你的域名使用cloud flare的ip进行解析，而cloudflare的ip是会不断变化的，这时候GW就无法探测到你的ip地址，也就无法进行封锁，所以如果你的IP被封或者想要防止被封，就可以使用cloudflare来解析你的域名。

 

## 前提

      **1.购买了自己的域名**

购买免费域名可以参考文章：[免费域名申请](http://www.demon1630.cn/%e5%85%8d%e8%b4%b9%e5%9f%9f%e5%90%8d%e7%94%b3%e8%af%b7/)

付费域名购买参考文章：[付费域名购买](http://www.demon1630.cn/wordpress%e4%bb%98%e8%b4%b9%e5%9f%9f%e5%90%8d%e8%b4%ad%e4%b9%b0%e6%9b%b4%e6%94%b9%e5%9f%9f%e5%90%8d/)

免费和付费域名各又优缺点，可以自行对比

  **2.把域名的NS地址修改为了cloudflare的NS地址**

把域名解析到cloudflare可以参考文章：[使用cloudflare解析域名并隐藏真实ip](http://www.demon1630.cn/wordpress%e4%bb%98%e8%b4%b9%e5%9f%9f%e5%90%8d%e8%b4%ad%e4%b9%b0%e6%9b%b4%e6%94%b9%e5%9f%9f%e5%90%8d/)

      **3.系统需要重装为：Centos 7   （本操作都是基于此系统下进行的，所以其他系统不保证成功）**

     **4.安装好宝塔面板**

宝塔面板安装教程可以参考文章：[vps安装宝塔面板](http://www.demon1630.cn/vps%e5%ae%89%e8%a3%85%e5%ae%9d%e5%a1%94%e9%9d%a2%e6%9d%bf/)

这些工作做好之后就可以进行后续操作了

## 一、在cloudflare上解析域名

前面我们把购买的一级域名添加到cloudflare上之后，我们可以使用任意的二级域名来作为我们的代理域名，比如我的网址strivefysfxyh.com就是一个一级域名，但www.strivefysfxyh.com就属于二级域名了，一个一级域名可以有很多个二级域名，所以我们可以使用一个其他的二级域名来进行解析

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1592964795-v2ray使用1-1024x436.png)

## 二、宝塔面板添加网站

安装宝塔面板时把lnmp安装好，到宝塔 面板网站目录下点击添加站点

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1592965049-v2ray使用2.png)

按如图配置，然后为网站添加ssl

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1592965150-v2ray使用3.png)

## 三、安装v2ray.fun面板

运行脚本：

```
wget -N --no-check-certificate https://raw.githubusercontent.com/FunctionClub/v2ray.fun/master/install.sh && bash install.sh
```

进行安装，记住用户名、密码和端口号

宝塔面板 “安全” - “防火墙” 放行上面的V2ray面板监听端口

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1592965638-v2ray使用4-1024x742.png)

登陆V2ray.fun控制面板；登陆方式是：IP:5000，输入账号（admin）、密码（admin）登陆； 点击控制面板菜单中的“修改连接 ”

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1592965928-v2ray使用5-1024x567.png)

## 四、添加V2ray的ws path 路径

```
vi /etc/v2ray/config.json
```

编辑config.json文件

修改"path": "",为"path":"/ws/", ，这里的“/ws/”可以自行修改，但是要跟后面的保持一致

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1592966173-v2ray使用6.png)

打开宝塔管理面板 - 网站，进入刚才新建的网站站点管理，在管理界面点击配置文件；在网站配置文件的最后一个“｝”之前添加如下参数

```
location /ws {
proxy_redirect off;
proxy_pass http://127.0.0.1:10010;
proxy_http_version 1.1;
proxy_set_header Upgrade $http_upgrade;
proxy_set_header Connection "upgrade";
proxy_set_header Host $http_host;
}
```

这里的端口10010修改为自己在v2ray面板上设置的端口号

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1592966347-v2ray使用7.png)

## 五、在宝塔面板里面重启Nginx，在SSH里面重启V2ray

重启V2ray的命令如下：

```
service v2ray restart
```

## 六、回到Cloudflare域名管理面板的DNS选项，将域名的小黄云点亮

## 七、到电脑客户端上添加VMess服务器

下载v2ray客户端：[https://github.com/v2ray/v2ray-core/releases](https://github.com/v2ray/v2ray-core/releases)

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1592966697-v2ray使用8.png)

按图所示进行填写即可，此时就可以使用此代理进行fq了
