---
title: "v2ray使用68端口绕过校园网wifi认证上网"
date: 2021-06-01
categories: 
  - "技术"
tags: 
  - "v2ray"
  - "免登录"
  - "网站"
  - "视频"
---

# 原理

在我们连接到某个需要Web认证的热点后，我们已经获得了一个内网IP。在未认证时，如果我们访问HTTP网站，就会路由解析器会劫持我们的http请求然后把我们重定向到一个登录认证界面。访问HTTPS时，为响应超时。

但部分UDP的端口还是开放的，例如53、67、68、69。

因此，我们就可以把我们访问网络的流量都走开放的这几个端口，从而避免登入而实现上网

# 工具

首先需要有一台服务器，国内或国外的都可以，因为我们访问网络的流量都要通过这台服务器进行转发

这里我们利用68端口，首先在服务器上开启68端口，在防火墙中放行

然后在服务器上安装v2ray，可以使用2333的一键安装脚本

```
bash <(curl -s -L https://git.io/v2ray.sh)
```

 

如果是国内主机，可能会出现无法连接脚本问题，因为这个脚本需要访问github，这时可以修改主机hosts文件，添加GitHub的解析

```
#修改/etc/hosts文件，新增一行：
13.250.177.223 github.com
```

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210601194134.png)

启动脚本后，选择1安装，然后选择9，伪装成微信视频流量 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210601194250.png)

这里端口必须选择68，其余的默认就可以

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210601194402.png)

然后回车安装即可

安装完成后就是配置客户端的v2ray，可以去官网下载带有图形界面的v2rayN：[https://github.com/2dust/v2rayN/releases](https://github.com/2dust/v2rayN/releases)

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210601194756.png)

下载后运行v2rayN.exe就可以，然后添加VMess服务器配置

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210601194945.png)

配置参考服务器中生成的v2ray信息，也可以输入v2ray qr获取二维码直接导入

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210601195100.png)

参考配置写入就可以了

然后启动v2ray，连接上校园网不用登入也可以直接访问网络，如果出现无法访问问题，可能需要改用其他端口，可以先自行测试开放的端口
