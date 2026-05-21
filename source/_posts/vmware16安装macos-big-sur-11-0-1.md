---
title: "VMware16安装macOS Big Sur 11.0.1"
date: 2021-10-06
categories: 
  - "wordpress"
tags: 
  - "windows"
  - "控制"
---

## 下载 macOS Big Sur 11.0.1

https://pan.baidu.com/s/1WrO1A0hBivUftApiM3dVng  
提取码99zb

## 下载并安装VMware16

下载地址：https://download3.vmware.com/software/wkst/file/VMware-workstation-full-16.0.0-16894299.exe

序列号：  
ZF3R0-FHED2-M80TY-8QYGC-NPKYF  
YF390-0HF8P-M81RQ-2DXQE-M2UT6  
ZF71R-DMX85-08DQY-8YMNC-PPHV8

## 安装unlocker

默认安装好的VMware16没有MacOS选项，需要先安装`unlocker`，下载地址：  
https://github.com/paolo-projects/auto-unlocker/releases

安装后：

  

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-0b28132f5fe1c64b9c35ae71b2e63138.png)

image

## 创建虚拟机

打开 VMware Workstation 16 ，选择 “创建新的虚拟机”

  

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-9d0aad3172687b1ce7b8fed9aae4a7ab.png)

image

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-5dda2b7aa5f4b5a5639116e3e60105e7.png)

image

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-ca3d4fd59766dda4055b68e8d4d2aadf.png)

image

### 选择macOS11.0

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-6b393797c9284276c0c4b34af5a12ace.png)

image

### 选择处理器数量

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-ca99f474cbac224c2e317cc4ac77e425.png)

image

### 设置虚拟机内存

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-06d0af985a8ca410ecdc413a7977d6fa.png)

image

### 选择网络类型

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-e89fae789488d7471eed0ce560f412c0.png)

image

### 选择I/O控制器类型

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-3cdf32e4a3f495ce5892b045e1d1ebb5.png)

image

### 选择磁盘类型

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-4ab7a34ab8f40d88aa41728bc187ce46.png)

image

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-92d7aedfd1f00c5cabbabc64abd50789.png)

image

### 指定磁盘容量

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-c803638ade72cb797bb768db75f185db.png)

image

## 配置虚拟机

创建完虚拟机后，找到虚拟机文件位置，编辑`macOS 11.0.vmx`文件，在末尾添加：

1. `smbios.reflectHost = "TRUE"`
2. `hw.model = "MacBookPro16,1"`
3. `board-id = "Mac-E1008331FDC96864"`

## 挂载安装镜像

点击“编辑虚拟机设置”，选择“CD/DVD”选项。

  

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-a43ff9a8358629087ab53cb6a46e3f8e.png)

image

保存以后点击“开启虚拟机”

## 安装 macOS

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-65422a33d7eddf0485fe2f63f427ab79.png)

image

### 选择安装语言

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-2fcaca01963e3c411e440b15f0c05a6c.png)

image

### 选择磁盘工具

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-706a712063def85d8bd41abd0f5be1ac.png)

image

### 磁盘初始化

找到名称为 `VMware Virtual SATA Hard Drive Media` 的磁盘，选中该磁盘，点击`抹掉`，格式选择 `APFS`  

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-55654b9d7e0d3e8e7d50645108428cd7.png)

image

退出磁盘工具，选择 `安装 macOS` 并继续  

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-1435c3d38dcf25e67e0a06cd16ce02a4.png)

image

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-9129ad9e7982ecb86c86baae228fac1c.png)

image

### 选择安装位置

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-07ff4f334b638953488f0cfe9d34e8b4.png)

image

### 开始安装

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-c82cd5f33b7e0e62fb44b5c3c3f98cce.png)

image

## 配置macOS

### 选择国家和地区

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-7205cac5be983662fe05ff1f6a3814cd.png)

image

### 选择网络连接方式

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-22148acc597004d6a7c9eea59bc3df89.png)

image

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-d7aa39f25914d24d5ec01a67daa6ebab.png)

image

**提示网络连接失败的解决办法：**  
1、回到windows，控制面板-网络连接-右键属性-`VMware Network Adapter VMnet1`–`IPV4设置`–`自动获取ip地址`–`自动获得dns服务器`；  
2、打开windows服务，打开服务：`VMware DHCP Sevice`和`VMware NAT Service`;  

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-68fc28ad9911c205cfd21ee8d1d427cb.png)

image

### 迁移助理

选择`以后`  

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-1ed0738db908068283c50ad6e6675d81.png)

image

### 设置apple ID

选择`稍后设置`  

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-3e38aa5bc22d6d2d52d9db915c5537d8.png)

image

### 创建账户

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-c589ef06fc535298a60f974769ae2f1a.png)

image

## 安装 VMware Tools

在 VMware 的 虚拟机(M) 菜单栏中选择 安装 VMware Tools(T)… 选项。

  

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-276b4de6e108a9caeda3e259816cdba4.png)

image

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-96a6b78eac1e9dd148e6141fb4c1a26f.png)

image

安装过程会触发多个安全限制，请按照提示转到设置里的安全设置里解锁，最后完成安装。

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-ffcb7c7e840e3e5ac0b8622c23de75df.png)

image

完成安装后必须重启系统，然后点击虚拟机上的进入全屏模式，macOS即可全屏显示。

## 安装Xcode

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-d8fed8ec019f2b7660e00d07629f29da.png)

image

控制台中显示效果：

  

![](http://www.demon1630.cn/wp-content/uploads/2021/10/frc-3136e54008e399d6f1c54fe6c01223f3.png)

image
