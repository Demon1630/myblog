---
title: "安装服务器监控探针ServerStatus-Toyo 教程"
date: 2020-05-17
categories: 
  - "宝塔面板"
  - "技术"
  - "搬瓦工"
tags: 
  - "域名"
  - "数据库"
  - "服务器监控"
  - "网站"
---

ServerStatus-Toyo是一个可以同时监控多台服务器的云探针程序，可以直接使用一键安装脚本安装，方便易用 项目地址：[https://github.com/ToyoDAdoubi/ServerStatus-Toyo](https://github.com/ToyoDAdoubi/ServerStatus-Toyo) 

## 1、首先安装服务端：

服务端就是你想要把探针部署的服务器上安装的文件，登入服务器，使用一键安装脚本：

```
wget -N --no-check-certificate https://softs.loan/Bash/status.sh && chmod +x status.sh
备用地址：
```

```
wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/status.sh && chmod +x status.sh

启动脚本安装服务端：
```

```
bash status.sh s

输入1，安装服务端
监听端口可以使用默认，直接回车

```

是否由脚本自动配置HTTP服务(服务端的在线监控网站)\[Y/n\] # 如果你不懂，那就直接回车，如果你想用其他的HTTP服务自己配置，那么请输入 n 并回车。 # 注意，当你曾经安装过 服务端，同时没有卸载Caddy(HTTP服务)，那么重新安装服务端的时候，请输入 n 并回车。 # 如果使用宝塔，可以输入n，然后在宝塔新建一个网站，根目录 修改为：/usr/local/ServerStatus/web 即可！无需数据库！

 

## 这里使用宝塔面板后面部署，所以输入n

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320113247.png)

 

## 至此完成服务端初步安装 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320113305.png) 2、安装客户端

客户端是指你想要监控的服务器，可以同时安装在你部署了服务端的服务器上，如果是部署在安装了服务端的服务器上，则直接启动客户端安装文件：

bash status.sh c

如果在其他服务器上安装客户端，则下载安装文件，与服务端安装文件一样：

```
wget -N --no-check-certificate https://softs.loan/Bash/status.sh && chmod +x status.sh
备用地址：
```

```
wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/status.sh && chmod +x status.sh
```

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320113321.png)

输入1安装客户端

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320113336.png)

至此完成了客户端的安装

## 3、配置服务端

在安装了服务端的服务器上输入 bash status.sh s

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320113353.png)

选7 设置服务器配置

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320113421.png) ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320113436.png)

至此完成服务端配置

## 4、部署服务端

此次使用宝塔面板部署服务端，所以前面安装服务端时选择n进行自己布置,添加网站，根目录修改为

```
/usr/local/ServerStatus/web

```

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320113501.png)

此时完成了服务端的部署，打开域名即可进行访问

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320113517.png)

 

安装目录：/usr/local/ServerStatus

网页文件：/usr/local/ServerStatus/web

配置文件：/usr/local/ServerStatus/server/config.json

客户端查看日志：tail -f tmp/serverstatus\_client.log

服务端查看日志：tail -f /tmp/serverstatus\_server.log
