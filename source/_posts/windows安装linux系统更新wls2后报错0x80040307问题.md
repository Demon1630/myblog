---
title: "Windows安装linux系统更新wls2后报错\"0x80040307\"及无法联外网问题"
date: 2022-10-10
categories: 
  - "技术"
tags: 
  - "linux子系统"
  - "python"
  - "wsl"
---

Windows11目前已经可以安装Linux子系统了，但在系统某一次更新过程中，将wsl1更新到wsl2后，之前安装的linux系统就无法打开了，报错WslRegisterDistribution failed with error: "0x80040307"，打开wsl则显示未安装已分发系统，重新卸载安装还是报同样问题，网上查了一遍，目前解决方案如下：

在目录：C:\\Users\\\*\*\*（用户）目录下，找到.wslconfig文件

编辑它，找到这一行，前面加#号注释掉，这主要可能是因为目录识别到其他位置，导致wsl2无法识别现有linux系统，之后再打开Linux系统就不会报错了 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20221010205704.png)

安装好之后可能会出现无法连外网情况，即无法ping通外网

解决方法：

```
sudo rm /etc/resolv.conf
sudo bash -c 'echo "nameserver 8.8.8.8" > /etc/resolv.conf'
sudo bash -c 'echo "[network]" > /etc/wsl.conf'
sudo bash -c 'echo "generateResolvConf = false" >> /etc/wsl.conf'
```
