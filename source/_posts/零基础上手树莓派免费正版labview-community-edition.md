---
title: 零基础上手树莓派+免费正版LabVIEW Community Edition
date: 2020-05-21
categories:
- labview
- 树莓派
tags:
- labview
- 树莓派
- 视频
---
上个月底，针对个人项目使用的LabVIEW Community Edition（LabVIEW大众版和LabVIEW NXG大众版）正式发布。LabVIEW大众版将**免费**提供给非商业用户使用，该版本提供了与LabVIEW专业版相同的功能。

![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-b6d50f14311f8528cd806182742a648c-1024x283.png)

其中包含LINX工具包的更新版本，以帮助工程爱好者将LabVIEW应用程序连接或部署到主流的计算硬件上，例如Arduino、Raspberry Pi和BeagleBoard等。

![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-53d99b79dd550e695e6006f2ca02d6f5-1024x414.png)

![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-806bfe4ed034cfd73335106d1e6faf5f-1024x413.png)

**不要钱的正版软件**配套才**几百块钱的“树莓派”！****零基础**入门！

265元的最新一代树莓派+0元LabVIEW大众版上手demo视频：

Step by Step一步一步跟我做：

********硬件准备********

1. 安装了LabVIEW 2020 Community Edition的电脑（**注意：**下载软件安装包时的账号与安装完成后在NI许可证管理器中激活软件时的账号需**一致**，才能**正常免费激活**）
    
2. 树莓派4b【小编测试用的是最新一代的树莓派4b（单价265元起），如果用树莓派3代（单价238元）或2代（单价小于200元）亦可】+microSD卡
    
3. 树莓派4b USB type-C电源线
    
4. 树莓派4b micro HDMI视频线+显示器
    
5. 键盘鼠标
    
6. 面包板+杜邦线+LED
    

********软件准备********

1. 免费的LabVIEW大众版软件（小编这里以LabVIEW 2020 Community Edition为例）  传送门：
    
    https://www.ni.com/zh-cn/shop/labview/select-edition/labview-community-edition.html
    
2. 正确下载并烧录到microSD卡的Raspbian镜像（小编demo中烧录的是Raspbian Buster with desktop and recommended software）
    
    传送门：
    
    https://www.raspberrypi.org/downloads/
    

********树莓派上的操作步骤********

1\. Raspbian正常启动后，确保树莓派与电脑处于同一个wifi局域网，在command line中输入

```
ifconfig
```

获得树莓派的IP地址，小编的树莓派4b的IP地址为：

192.168.50.121

2\. 在树莓派中开启SSH

![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-3b17a9139e66e56d206876f53add4731-1024x884.png)

********电脑上开始第一个LabVIEW树莓派项目********

1.  打开LabVIEW
    
    ![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-0522b55950b3360fefe7afbb8c876ab7-1024x669.png)
    
2. 选择
    
    Tools/MakerHub/LINX/LINX Target Configuration...
    
    ![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-d5f7a0019e1b5d82cb2079a21778962c-1024x668.png)
    
3. 在LINX对话框中输入我们树莓派的IP地址，User name以及Password
    
    ![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-17a1791d4f54d7e23408e5898b87a2ab-1024x615.png)
    
4. 点击connect后，如果连接正确，则可以在最底下的状态栏中看到Successfully connected to the target，点击左边的Connection，可以看到树莓派的图标出现了
    
    ![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-ba0afe92486cba829a67b11f623ede9b-1024x614.png)
    
5. 点击左侧的Installation，可以看到尚未配置的树莓派上Installed Version为空
    
    ![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-739538a68b2a0c149b24a504eed8606d-1024x613.png)
    
6. 点击Upgrade来对树莓派上的软件进行升级，这里根据网速和系统不同可能需要等待几分钟时间，升级成功后状态如下
    
    ![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-39d8eb3b467e091f406fe3ed820a2ef7-1024x615.png)
    
7. 于是我们可以点击Launch Example来开启第一个LabVIEW+树莓派项目了。右键点击LabVIEW项目树中的树莓派图标，点击connect（注意需要再次确认下，这里看到树莓派IP地址和上面配置的IP地址一致，小编这里是192.168.50.121）
    
    ![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-390e66a4ac2fd33cf3ae6c70a044199b-1024x544.png)
    
8. 成功连接到树莓派后可以发现项目树中Raspberry Pi树莓图标右下角的指示灯被“点亮”了，表示连接成功。
    
    ![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-d53a304709bcc4de547ce91a03900c46-1024x544.png)
    
9. 在运行上图右侧的VI之前，我们先根据树莓派的GPIO引脚定义，将一个LED的正极连接到pin7，将LED的负极连接到pin9（GND）
    
    ![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-7c046ab2486b5376ccb5a689f4a29230-720x1024.png)
    
10. 点击LabVIEW的运行按钮，等待程序部署成功
     
     ![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-15e740390b7bb3cb76193e27ee365542-1024x544.png)
     
11. 此时点击VI前面板上的布尔输入控件，就能控制LED的亮和灭了。
     
     ![](http://www.demon1630.cn/wp-content/uploads/https://pic2.zhimg.com/v2-644cd7d75fc7854b0773b4912e6c8271_b.jpg)
     

小编的安装环境是Windows 10 pro 64bit， Intel x64 Core-i7-8665 CPU@1.9GHz， 16GB RAM， Raspberry Pi 4B-4GB version，Raspbian Buster with desktop and recommended software（February 2020）. 在不同的软硬件组合中可能会出现一些不兼容的情况。欢迎扫码和我们联系交流， 开动你的脑筋来动手玩转LabVIEW+树莓派等高性价比开源硬件吧！

或者访问：https://www.wjx.top/jq/77852210.aspx

**主讲教师**
