---
title: "使用scrcpy将手机投屏到电脑上"
date: 2021-05-05
categories: 
  - "技术"
tags: 
  - "scr"
  - "scrcpy"
  - "手机投屏"
  - "投屏"
  - "控制"
---

scrcpy就是通过adb调试的方式来将手机屏幕投到电脑上，并可以通过电脑控制您的Android设备。它可以通过USB连接，也可以通过Wifi连接（类似于隔空投屏），而且不需要任何root权限，不需要在手机里安装任何程序。scrcpy同时适用于GNU / Linux，Windows和macOS。

scrcpy是开源项目，项目地址：[https://github.com/Genymobile/scrcpy](https://github.com/Genymobile/scrcpy)

由于scrcpy只有命令行版，也可以下载一个Scrcpy-GUI的软件，通过软件界面操作，项目地址：[https://github.com/Tomotoes/scrcpy-gui](https://github.com/Tomotoes/scrcpy-gui)

 

## 1.手机开启adb调试

如miui系统，在 " 我的设备->全部参数"  连续点击miui 版本  就可以开启开发者模式

开启“开发者选项”。然后在 “设置”->“更多设置”->“开发者选项” 中同时开启 `USB调试` 和 `USB调试(安全设置)`。

 

## 2.电脑操作

到开源地址上下载对应版本scrcpy包

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210505195423.png)

然后解压出来，进入目录，输入cmd，打开命令行窗口，或者使用cmd将目录切换到文件夹中：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210505195621.png)

## 3.有线连接

将手机通过数据线连接到电脑，然后选择传输文件，信任电脑

在cmd中输入：scrcpy

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210505201259.png)

此时就可以看到手机已经投屏到电脑上了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210505201640.png)

## 4.无线连接

此时已经完成了有线连接，scrcpy也可以使用无线连接：

手机和电脑需要处于同一个局域网内

先用数据线连接到手机，然后同样在文件夹中输入cmd进入命令行

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210505201931.png)

输入：adb tcpip 6666

后面的6666为端口号，后面需要用到，可以自定义

然后断开USB数据线连接，在找到手机的IP地址，然后在命令行输入：adb connect 192.168.123.59:6666

192.168.123.59为手机ip地址，自行修改

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210505202425.png)

显示已经连接到手机，然后同样输入：scrcpy

就可以连接上了 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210505202648.png)

 

## 5.快捷键设置

| 操作 | 快捷键 |
| --- | :-- |
| 全屏 | alt+f |
| 向左旋转屏幕 | alt+← _(左箭头)_ |
| 向右旋转屏幕 | alt+→ _(右箭头)_ |
| 将窗口大小重置为1:1 (匹配像素) | alt+g |
| 将窗口大小重置为消除黑边 | alt+w \| _双击¹_ |
| 点按 `主屏幕` | alt+h \| _鼠标中键_ |
| 点按 `返回` | alt+b \| _鼠标右键²_ |
| 点按 `切换应用` | alt+s |
| 点按 `菜单` (解锁屏幕) | alt+m |
| 点按 `音量+` | alt+↑ _(上箭头)_ |
| 点按 `音量-` | alt+↓ _(下箭头)_ |
| 点按 `电源` | alt+p |
| 打开屏幕 | _鼠标右键²_ |
| 关闭设备屏幕 (但继续在电脑上显示) | alt+o |
| 打开设备屏幕 | alt+Shift+o |
| 旋转设备屏幕 | alt+r |
| 展开通知面板 | alt+n |
| 收起通知面板 | alt+Shift+n |
| 复制到剪贴板³ | alt+c |
| 剪切到剪贴板³ | alt+x |
| 同步剪贴板并粘贴³ | alt+v |
| 注入电脑剪贴板文本 | alt+Shift+v |
| 打开/关闭FPS显示 (在 stdout) | alt+i |
| 捏拉缩放 | Ctrl+_按住并移动鼠标_ |

其余操作： 息屏时候右键唤醒屏幕

左键模拟点击，右键模拟返回

更多操作可以查看说明文档：[https://github.com/Genymobile/scrcpy/blob/master/README.zh-Hans.md](https://github.com/Genymobile/scrcpy/blob/master/README.zh-Hans.md)

在开启了无线连接后，如果要重新进行有线连接，需要先使用:    adb disconnect 192.168.123.59:6666    断开连接才行
