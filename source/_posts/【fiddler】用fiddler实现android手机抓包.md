---
title: 【fiddler】用fiddler实现android手机抓包
date: 2021-12-12
categories:
- wordpress
tags:
- 抓包
---
#   
一、fiddler的简介

fiddler是位于客户端和服务器端之间的代理，也是目前最常用的抓包工具之一 。

它能够记录客户端和服务器之间的所有 请求，可以针对特定的请求，分析请求数据、设置断点、调试web应用、修改请求的数据，甚至可以修改服务器返回的数据，功能非常强大，是web调试的利器。

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-491c636d57ef361a28014a64f70f6066.png)

**注意：**

Fiddler 是以代理web服务器的形式工作的，它使用默认代理地址:127.0.0.1，端口:8888，也就是说默认监听在安装本机的127.0.0.1::8888，如果需要抓局域网内其他机器的包，需要勾选上 “Allow remote computersto connect” ，允许远程设备连接，会设置监听为0.0.0.0:8888

当Fiddler退出的时候它会自动注销，这样就不会影响别的 程序。不过如果Fiddler非正常退出，这时候因为Fiddler没有自动注销，会造成网页无法访问，解决的办法是重新启动下Fiddler。

  

# 二、安装fiddler

  

官网：https://www.telerik.com/download/fiddler

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-f1cee8b63851b66b66ba784723c2f19e.png)

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-429c9584dda798b08020165270bfee71.png)

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-1395a97a2b892893d6d3d0f5662c8f28.png)

# 三、fiddler设置

  

**1.设置HTTPS**

Tools --> Options-->HTTPS

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-2d3ce90aa69791164d79fe44f6a9212d.png)

选中"Decrpt HTTPS traffic",    Fiddler就可以截获HTTPS请求，第一次会弹出证书安装提示，若没有弹出提示，勾选Actions-> Trust Root Certificate

另外，如果你要监听的程序访问的 HTTPS 站点使用的是不可信的证书，则请接着把下面的 “Ignore servercertificate errors” 勾选上。

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-3187db0ceab00baa5ce616fa3cf0de75.png)

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-c97898b5f8f9e2948283165b2f7492c0.png)

**手机上设置代理后，这时候fiddler上抓到的是pc和app所有的请求，如果pc上打开网址，会很多，这时候就需要开启过滤功能了**

**设置过滤：我们本次是抓取局域网内android的http包，为减少干扰，设置  from remote clients only**

from all processes   抓所有的请求 

from browsers only  只抓浏览器的请求 

from non-browsers only  只抓非浏览器的请求 

from remote clients only  只抓远程客户端请求

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-f6810acbe18113175faf680d2832f55c.png)

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-ba4addf303743fc8d44e935e237cc1f0.png)

点击Yes，留意一下红框里面的内容，DO\_NOT\_TRUST\_FiddlerRoot ,这个就是证书的名称

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-f85165a5b87e9d40c5d49a04d3dcd117.png)

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-e9f5ce99b6a29824bfdd3f2e8faba5d7.png)

点击确定，这样Fiddler证书就已经添加成功了

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-fe98fee2a27db4e9e489aff409f6e598.png)

**查看证书，Actions—>open windows certificate Manager**

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-d3081253842b5971f119697f79b97209.png)

**证书名称就是之前提醒大家留意的 DO\_NOT\_TRUST\_FiddlerRoot**

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-ddce1c80cee3e848f24b515c3837cd02.png)

  

**2.设置允许远程连接**

Tools --> Options-->Connections

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-973c3b1b439517a632d5cc424ccb03a5.png)

**3\. 重启fillder，使得配置生效**

**4\. 查看端口监听**

**netstat -ano | findstr "8888"**

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-4dca59dd268a6a805ce4c611a120631b.png)

#   

# 四、android端设置

首先查看电脑的 IP 地址，确保手机和电脑在同一个局域网内

win+R，调出cmd窗口

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-8b8133a8883895a4541bfa78e5a94c9e.png)

输入ipconfig，IPv4地址即为本机ip

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-daf6a5771a999c3140d2a9d702e31fcd.png)

或者可以直接在fiddler上 将鼠标放置于 Online 菜单上，会显示本机IP

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-3200a5c107c287cfaa3e99e74d3bf880.png)

  

  

**设置代理**

关闭 4G、5G网络，使用WIFI，使得手机和fiddler在同一局域网

  

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-8e635a78097047b8aa8c939d326baf26.png)

  

  

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-33df4d83cc69f6e0ab40ff6e97b75405.png)

  

打开手机浏览器，输入ip:端口下载证书，如：192.168.1.105:8888

  

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-30ded68f85af3b3d6132cd5e591e256e.png)

  

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-b62a3aad0877fa6b7436e83a18431ea4.png)

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-38337e12d3d56161fe8a9e721af1e57a.png)

  

  

安装证书查看：打开手机设置，搜索“信任”，可以看到“信任的凭据”

  

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-0ca4fb72f4579eb34549e2bad2e8262f.png)

  

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-ba8e16944016316c13146c10a8726873.png)

  

**注：每连一台fiddler，fiddler提供的证书都是不一样的，测试完一个场景，记得在证书管理里删除，因为这个证书只对应这台fiddler，没法用于连其他的fiddler。**

  

  

通过上面基本，配置就全部结束了，可以抓包测试了，有好几个链接有session\_id，选其中一个，直接点右侧的json可以很方便的看到自己的session\_id了，=号后面的那一长串字母就是。

**session\_id是自己账户的重要标识，为了安全请注意不要随意外传，自己用用就行了.**

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-0a190cc659db2f33b255d50102953d82.png)

  

  

# 五、抓包测试

  

设置好fiddler

设置好android网络代理

打开android手机被抓包APP

使用fiddler抓包，查看抓包内容

![](http://www.demon1630.cn/wp-content/uploads/2021/12/frc-024155dfac6776dfbfd95a72baa9598c.png)

**现在我们捋一下：**

1\. 电脑端安装fiddler，设置端口监听(xx.xx.xx.xx:8888)，设置系统信任fiddler软件证书

2 手机和电脑在同一局域网，手机关闭4G/5G流量

3\. 手机设置网络代理，指向局域网中fiddler的地址（IP+PORT）

4\. 在手机端用浏览器通过 fiddler的地址（xx.xx.xx.xx:8888）下载fiddler证书并安装，注意此证书仅对此fiddler有效

5\. 抓包测试完毕，记得关闭手机中的代理，删除手机端安装的fiddler证书，不然换一个网络环境，手机上网会受影响

  

本篇主要是用fiddler实现android手机抓包的基础设置，工具安装设置完成后，其他抓包技巧，请参考其他文章探索！

  

# 六、参考

  

Fiddler安卓手机APP抓包

https://www.cnblogs.com/hsyfighting/p/11757860.html

  

**Android/IOS手机使用Fiddler抓包**

https://www.cnblogs.com/tangdongchu/p/4178334.html

  

**Fiddler实现iPhone手机抓包**

https://www.cnblogs.com/yanh0606/p/8203221.html

https://blog.csdn.net/weixin\_39633171/article/details/109756478

**fiddler配置及使用教程**

https://www.cnblogs.com/woaixuexi9999/p/9247705.html

**使用Fiddler模拟客户端http响应**

https://www.cnblogs.com/tangdongchu/p/4178552.html
