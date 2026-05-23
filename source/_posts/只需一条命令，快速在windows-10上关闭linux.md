---
title: 只需一条命令，快速在Windows 10上关闭Linux
date: 2022-11-26
categories:
- wordpress
tags:
- windows
- wsl
- 视频
---
尽管Windows Subsystem for Linux(WSL)是与windows10一起运行Linux发行版的一种方便方法，但轻量级虚拟机将继续在后台运行，即使你退出命令shell，也会浪费系统资源。

如果你希望在使用完Linux发行版(Ubuntu、Kali、Debian等)后立即终止它，或者需要重新启动它，那么可以使用wsl命令手动关闭一个或所有发行版。

  

![](https://pic3.zhimg.com/v2-98728738b6297f062a4c276189cd4c3e_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2022/11/frc-d0d1e9ef9580d3de8e939bfcd40748c9.jpg)

  

### 一、如何在WSL 2上终止Linux发行版

要在Windows Subsystem for Linux上终止Linux发行版，请使用以下操作：

1.在任务栏搜索栏中搜索“命令提示符”，右键单击顶部结果，然后选择“以管理员身份运行”选项。

2.键入以下命令以查看所有正在运行的WSL发行版，然后按Enter：

wsl --list --verbose

3.输入以下命令以关闭Linux发行版，然后按Enter：

wsl -t DISTRO-NAME

在命令中，确保将DISTRO-NAME替换为要关闭的发行版的名称，例如，wsl -t Ubuntu-20.04。

4.(可选)键入以下命令以确认发行版不再运行，然后按Enter：

wsl --list --verbose

完成这些步骤后，在Linux 2的Windows子系统上运行的发行版将正常关闭。

  

![](https://pic1.zhimg.com/v2-78167967034fc90b4c62e2d26bea4f3c_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2022/11/frc-8dc2104a94ca6dd438029ebf0213c7b2.jpg)

  

### 二、如何终止WSL 2上的所有Linux发行版

要关闭Windows 10上运行的所有WSL发行版，请使用以下操作：

1.在任务栏搜索栏中搜索“命令提示符”，右键单击顶部结果，然后选择“以管理员身份运行”选项。

2.键入以下命令以查看所有正在运行的WSL发行版，然后按Enter：

wsl --list --verbose

3.输入以下命令以关闭Linux发行版，然后按Enter：

wsl --shutdown

4.(可选)键入以下命令以确认发行版不再运行，然后按Enter：

wsl --list --verbose

完成这些步骤后，所有WSL发行版将立即终止。

  

![](https://pic1.zhimg.com/v2-fc80258d89f0168862fbea538b096788_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2022/11/frc-17494dfb1892104db2983d340c83f7ba.jpg)

  

如果需要重新启动Linux发行版，只需从开始菜单或使用wsl --distribution DISTRO-NAME命令在命令提示符下再次将其打开。请记住将DISTRO-NAME替换为发行版的实际名称。

**最后**

**特别推荐一个分享C/C++和算法的优质内容，学习交流，技术探讨，面试指导，简历修改...还有超多源码素材等学习资料，零基础的视频等着你！**

**还没关注的小伙伴，可以长按关注一下：**

  

![](https://pic4.zhimg.com/v2-34322f3428d809eff0bfadd2872d3b87_b.gif)

![](http://www.demon1630.cn/wp-content/uploads/2022/11/frc-08c5cc47881829f5444b55b533a78f0a.gif)
