---
title: "通过usb转ttl线连接电脑与树莓派"
date: 2020-07-11
categories: 
  - "树莓派"
tags: 
  - "树莓派"
---

电脑连树莓派有很多连法，如使用wifi或者网线连接，前面也有文章讲到如何在没有显示器下使用wifi连接树莓派，见文章：[树莓派无显示器无网线ssh连接无线网](http://www.demon1630.cn/%e6%a0%91%e8%8e%93%e6%b4%be%e6%97%a0%e6%98%be%e7%a4%ba%e5%99%a8%e6%97%a0%e7%bd%91%e7%ba%bfssh%e8%bf%9e%e6%8e%a5%e6%97%a0%e7%ba%bf%e7%bd%91/)

但有时候你如果想搞点其他，可以尝试购买一根usb转ttl线连接树莓派

淘宝上大概八九块钱一根

## ![](http://www.demon1630.cn/wp-content/uploads/2020/07/1594431950-QRV19HPIY@2300L70L-1016x1024.jpg)

## 系统设置

在安装好树莓派系统后，打开里内存卡，可以看到里面有一个文件叫config.txt，打开后在文件最后添加代码：

```
# Fix UART
enable_uart=1
```

然后按照线名称将线接到树莓派上，记住txd和rxd反接即可，然后接3v和接地线连上去，如果后面显示打开树莓派ssh后显示电压过低，可以尝试把3v换为5v接上去

把usb接到电脑上

打开ssh进行配置

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1594432430-ttl连接树莓派1.png)

 

协议选择serial

然后配置串口

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1594432474-ttl连接树莓派2.png)

串口按如图配置即可

然后给树莓派上电，连接ssh

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1594432746-ttl连接树莓派3.png)

进入后可能会停在这个页面，直接回车即可进入登入显示
