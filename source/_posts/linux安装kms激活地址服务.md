---
title: "Linux安装KMS激活地址服务"
date: 2020-05-17
categories: 
  - "技术"
tags: 
  - "windows激活"
---

## 介绍

`KMS`是`Key Management System`的缩写，也就是密钥管理系统。这里所说的`KMS`毋庸置疑就是用来激活`VOL`版本的`Windows`和`Office`的`KMS`啦。经常能在网上看到有人提供的`KMS`服务器地址，那么你有没有想过自己也来搞一个这样的服务呢？而这样的服务在`Github`上已经有开源代码实现了； 本文就是在这个开源代码的基础上，开发了适用于三大`Linux`发行版的一键安装`KMS`服务的脚本

## 关于

1、本脚本适用于三大`Linux`发行版，其他版本则不支持。 2、KMS服务安装完成后会加入开机自启动。 3、默认记录日志，其日志位于`/var/log/vlmcsd.log`

## 方法

使用root用户登录，运行以下命令：

```
wget --no-check-certificate https://github.com/teddysun/across/raw/master/kms.sh && chmod +x kms.sh && ./kms.sh
```

`KMS`服务需要使用`1688`端口，防火墙需要放行； 安装完成后，输入以下命令查看端口号`1688`的监听情况

```
netstat -nxtlp | grep 1688
```

返回值类似于如下这样就表示OK了；

```
tcp        0      0 0.0.0.0:1688          0.0.0.0:*            LISTEN      3200/vlmcsd         
tcp        0      0 :::1688               :::*                 LISTEN      3200/vlmcsd
```

本脚本安装完成后，会将`KMS`服务加入开机自启动；

## 命令

启动:`/etc/init.d/kms start` 停止:`/etc/init.d/kms stop` 重启:`/etc/init.d/kms restart` 状态:`/etc/init.d/kms status`

## 卸载

使用 root 用户登录，运行以下命令：

```
./kms.sh uninstall
```

## 使用

## 激活支持说明

> **支持Windows操作系统(VL) Office软件(VL)** **支持最新的Windows 10 和 Office 2019**

## Windows激活方法

**PC端以管理员身份运行CMD（命令提示符）** [![](https://sunpma.com/usr/uploads/2019/10/1879320344.png)](https://sunpma.com/usr/uploads/2019/10/1879320344.png) **然后依次输入以下命令：**

```
slmgr /skms 你的ip地址
slmgr /ato
slmgr /xpr
```

**等待出现以下弹窗就说明成功激活了** [![](https://sunpma.com/usr/uploads/2019/12/521896607.png)](https://sunpma.com/usr/uploads/2019/12/521896607.png) [![](https://sunpma.com/usr/uploads/2019/12/584297664.png)](https://sunpma.com/usr/uploads/2019/12/584297664.png) [![](https://sunpma.com/usr/uploads/2019/12/1806899802.png)](https://sunpma.com/usr/uploads/2019/12/1806899802.png)

## Office激活方法

**PC端以管理员身份运行CMD（命令提示符）** **输入命令进入 Office 默认安装目录** **Office2016 / Office365 / Office2019 进入默认安装目录** **32位office：**

```
cd C:\Program Files (x86)\Microsoft Office\Office16
```

**64位office：**

```
cd C:\Program Files\Microsoft Office\Office16
```

**Office2013 进入默认安装目录** **32位office：**

```
cd C:\Program Files (x86)\Microsoft Office\Office15
```

**64位office：**

```
cd C:\Program Files\Microsoft Office\Office15
```

**Office2010 进入默认安装目录** **32位office：**

```
cd C:\Program Files (x86)\Microsoft Office\Office14
```

**64位office：**

```
cd C:\Program Files\Microsoft Office\Office14
```

**然后再依次输入以下命令：**

```
cscript ospp.vbs /sethst:你的ip地址
cscript ospp.vbs /act
cscript ospp.vbs /dstatus
```

## 说明

> **KMS方式单次激活有效期为180天，每隔一段时间系统会自动从KMS服务器请求续期** **所以保持稳定的ip即可，这些都是自动的，可以一直使用，无需再人为干预**
