---
title: "树莓派3B  vnc分辨率设置"
date: 2020-05-11
categories: 
  - "树莓派"
tags: 
  - "树莓派"
---

树莓派3B在使用vnc的时候分辨率特别低，甚至无法显示整个桌面，所以需要对vnc登录的分辨率进行设置。其实在树莓派3上设置vnc的分辨率很简单，只需要用sudo raspi-config命令就能设置。

设置方法是在终端输入：sudo raspi-config 命令，然后按下面的顺序选择分辨率设置 **Advanced Options > Resolution。**

![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-f98ebe138a8ec43032351d6e39724c45.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-2d3b731a1616fa508c1fe96d60650ca2.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-8892f948d36986ea52403ef83ee15f07.jpg)

**自己的显示器分辨率可以通过鲁大师检测得到**

**![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-7bc8805d8df0fc3794c593c8e1168bca.png)**

**最后重启树莓派就行了。**本文来源于互联网:[树莓派3B vnc分辨率设置](https://blog.csdn.net/hu5566798/article/details/80928484)
