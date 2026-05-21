---
title: "搬瓦工vps的IP被封  V2Ray+WebSocket(ws)+TLS+Nginx+网站+Cloudflare"
date: 2020-05-19
categories: 
  - "宝塔面板"
  - "技术"
  - "搬瓦工"
  - "wordpress"
tags: 
  - "cloudflare"
  - "v2ray"
  - "windows"
  - "word"
  - "wordpress"
  - "免费域名"
  - "图标"
  - "域名"
  - "宝塔面板"
  - "控制"
  - "搬瓦工"
  - "网站"
  - "邮件"
---

这里介绍的vps系统为centos7，其他系统建议重装系统为centos7，总体思路是这样的

首先先安装宝塔面板，参考文章：[VPS安装宝塔面板](http://www.demon1630.cn/vps%e5%ae%89%e8%a3%85%e5%ae%9d%e5%a1%94%e9%9d%a2%e6%9d%bf/)

宝塔面板安装完进去后，一键安装网站搭建环境，包括nginx和php等5个软件，php最好选最新版本，其他版本可能有时候会出错。

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210320110522.png)

安装完成后创建网站，创建网站需要有一个域名，域名购买可以参考文章：[免费域名申请](http://www.demon1630.cn/%e5%85%8d%e8%b4%b9%e5%9f%9f%e5%90%8d%e7%94%b3%e8%af%b7/)、[付费域名购买](http://www.demon1630.cn/wordpress%e4%bb%98%e8%b4%b9%e5%9f%9f%e5%90%8d%e8%b4%ad%e4%b9%b0%e6%9b%b4%e6%94%b9%e5%9f%9f%e5%90%8d/)，购买完成后需要使用cloudflare进行域名解析，参考文章：[使用cloudflare解析域名](http://www.demon1630.cn/%e4%bd%bf%e7%94%a8cloudflare%e8%a7%a3%e6%9e%90%e5%9f%9f%e5%90%8d%e5%b9%b6%e9%9a%90%e8%97%8f%e6%90%ac%e7%93%a6%e5%b7%a5%e7%9c%9f%e5%ae%9eip/)解析完后先把DNS中的云朵点灰色，灰色代表域名直接解析到你vps的ip地址上，因为后面安装v2ray时需确保域名与你主机的ip对应，安装完后再把云朵点亮就可以使用cloudflare隐藏你真实ip。

这里先把云朵点灰色:

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210602173248.png)

解析完后进入宝塔面板，安装伪装网站

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210602173430.png)

添加完网站后，需要添加网站证书，就是https证书

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210602171125.png)

点击网站链接，点击左侧的ssl，然后选择免费的 let's encrypt，申请证书就可以了，然后右上角选择强制https就可以了

做完这些后开始正式安装v2ray

使用xshell连接到vps

首先安装一些必备软件，执行命令

```
yum install -y curl
```

 

```
yum install -y unzip
```

然后安装v2ray，目前有很多一键安装脚本，如2333的，不过好像这个脚本现在安装完无法启动v2ray，而且由于它使用了caddy，会与nginx出现端口冲突，所以不建议使用，直接使用官方安装v2ray的脚本，确保不会出错，运行命令

```
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
```

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210602174308.png)

出现这样的结果说明安装完成了，安装的位置及一些配置文件位置都可以在这看到

编辑v2ray的配置文件    关键！！

运行命令进入配置文件编辑：

```
nano /usr/local/etc/v2ray/config.json
```

把里面的{}删掉，然后把下面的内容复制进去，把自己的域名填进去，其他的可以不用改，避免出错

```
下面4个位置可根据自身需要修改：（不了解就不要改）
"path": "/ws/", ##这里是路径，配合Nginx转发；
"port": 10010, ##这里是需要Nginx转发的端口；
"alterId": 100, ##这里是额外ID；
"id": "00b93379-2d11-4392-a600-52f1d7ea0148", ##这里是UUID。
```

```
{
  "inbound": {
    "streamSettings": {
      "network": "ws", 
      "wsSettings": {
        "path": "/ws/", 
        "headers": {
          "Host": "自己的域名"
        }
      }
    }, 
    "protocol": "vmess", 
    "port": 10010, 
    "settings": {
      "clients": [
        {
          "alterId": 100, 
          "security": "auto", 
          "id": "eb3ca677-0c5e-45fd-9ef1-28b130cdd478", 
          "level": 1
        }
      ]
    }
  }, 
  "outboundDetour": [
    {
      "tag": "blocked", 
      "protocol": "blackhole", 
      "settings": {}
    }
  ], 
  "outbound": {
    "protocol": "freedom", 
    "settings": {}
  }, 
  "log": {
    "access": "/var/log/v2ray/access.log", 
    "loglevel": "warning", 
    "error": "/var/log/v2ray/error.log"
  }, 
  "routing": {
    "settings": {
      "rules": [
        {
          "ip": ["geoip:private"], 
          "type": "field", 
          "outboundTag": "blocked"
        }
      ]
    }, 
    "strategy": "rules"
  }
}
```

 

赋予日志写入权限：

```
chown -R nobody /var/log/v2ray
```

设置开机启动

```
systemctl enable v2ray
```

启动v2ray

```
systemctl start v2ray
```

查看v2ray运行状态

```
systemctl status v2ray
```

出现这样的就说明v2ray运行正常了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210602171510.png)

这样就可以进行下一步

进入宝塔面板，进入添加的网站，修改配置文件，在最后一行大括号结尾前添加如下代码，里面的10010是前面v2ray中配置的端口，必须对应起来

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

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210602171626.png)

在宝塔面板重启Nginx

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210602171722.png)

此时v2ray服务端就算搭建好了，然后配置客户端，windows上下载v2rayN：[https://github.com/v2ray/v2ray-core/releases](https://github.com/v2ray/v2ray-core/releases)

客户端配置如图

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210602175801.png)

然后就可以愉快的上网了，记得到cloudflare中把云朵点亮，确保IP被隐藏了

使用本方法可以保证网站和v2ray共存，后续还可以在vps上继续搭建网站
