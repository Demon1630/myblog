---
title: sndcpy将手机声音投送到电脑上
date: 2021-05-05
categories:
- 技术
- 推荐软件
tags:
- 投屏
- 声音
---
前面文章中讲述了如何使用scrcpy将手机投屏到电脑：

# [使用scrcpy将手机投屏到电脑上](http://www.demon1630.cn/%e4%bd%bf%e7%94%a8scrcpy%e5%b0%86%e6%89%8b%e6%9c%ba%e6%8a%95%e5%b1%8f%e5%88%b0%e7%94%b5%e8%84%91%e4%b8%8a/)

，但投屏上去手机的声音还是在手机上，无法使用电脑播放，此时可以使用sndcpy将手机声音投送到电脑

sndcpy是一个开源项目，项目地址：[https://github.com/rom1v/sndcpy](https://github.com/rom1v/sndcpy)

电脑上需先安装一个软件：[https://www.videolan.org/](https://www.videolan.org/)

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210506004738.png)

免费的，下载好VLC，安装到默认位置后不用管，到sndcpy项目地址，下载对应安装包解压缩

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210506004929.png)

 

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210506003248.png)

里面也有adb.exe软件，类似于投屏文章中讲到的，使用adb将电脑与手机连接，然后双击sndcpy.bat文件，之后会在手机上安装一个软件，同意就好了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210506004247.png) ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210506004138.png)

安装完成后，在手机上进行授权，然后在命令行中回车，就可以将手机声音在电脑上播放

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210506004516.png)

回车后会显示Playing audio... 就说明此时已经将手机声音投放到电脑了，打开电脑音量混合器也可以看到VLC运行，可以在这里调节音量大小 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210506004645.png)
