---
title: linux使用rclone挂载onedrive作为挂载盘
date: 2020-11-01
categories:
- 技术
- wordpress
tags:
- windows
---
**注意：**服务器最好是KVM的，OpenVZ需要给你的服务商发TK告诉他们开一下FUSE，如果没有FUSE是没办法挂载的。

首先我们需要先获取到onedrive的access\_token

获取方式：先到[https://rclone.org/downloads/](https://rclone.org/downloads/)下载win版本的Rclone

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604230100-rclone挂载onedrive1-1024x647.png)

下载后解压，把文件夹更名为rclone

然后使用CMD，进入rclone目录，输入如下代码：

```
rclone authorize "onedrive"
```

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604232212-rclone挂载onedrive2-1024x535.png)

之后会自动打开浏览器，进行授权，授权成功后就会获得access-token，就是图中一大堆的代码，把{}里内容全部复制好备用

到这里，在windows下的工作都做完了，之后要到vps中进行操作

参考文章[安装rclone](http://www.demon1630.cn/%e4%bd%bf%e7%94%a8aria2-rclone-%e8%b0%b7%e6%ad%8c%e6%97%a0%e7%ba%bf%e5%ae%b9%e9%87%8f%e5%9b%a2%e9%98%9f%e7%9b%98-%e5%ae%9e%e7%8e%b0%e7%a6%bb%e7%ba%bf%e4%b8%8b%e8%bd%bd/)安装好rclone

输入  rclone config

然后输入n新建一个

名字自己随便取，我这里就直接输入onedrive

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604232964-rclone挂载onedrive3.png)

选择onedrive，根据自己的显示进行选择，不同版本可能序号不一样

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604233038-rclone挂载onedrive4.png)

下面就是client\_id>和client\_secret> ，这两项直接回车，不管

到result这里输入之前windows下复制的内容

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604233332-rclone挂载onedrive5.png)

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604233450-rc-1024x433.png)

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604233509-rclone挂载onedrive7.png)

照着操作，到这里就配置好了，之后就是挂载

创建一个文件夹 :

```
mkdir /home/onedrive
```

```
rclone mount onedrive: /home/onedrive --allow-other --allow-non-empty --vfs-cache-mode writes
```

在运行挂载命令后，SSH窗口会出现中断，光标丢失，此时关掉窗口即可。如需另外再挂载网盘，只需要重新连接。

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604233777-rclone挂载onedrive8.png)

输入 df -h就可以看到onedrive挂载上去了

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604234003-rclone挂载onedrive9.png)

至此已经完成了onedrive的挂载

 

执行完以上操作虽然已经挂载成功，但是只是临时挂载，如果重启服务器或者关机就失效了，所以还有要完成以下任务。

> 如果rclone不在`/usr/bin/`目录的话（可以通过`which rclone`命令查询是否在这个目录），需要先把rclone的可执行文件复制到`/usr/bin`。

新建一个`rclone.service`文件：

```
vi /usr/lib/systemd/system/rclone.service

写入：

```

```
[Unit]
Description = rclone

[Service]
User = root
ExecStart = /usr/bin/rclone mount mydriver:share  /home/onedrive --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --umask 000
Restart = on-abort

[Install]
WantedBy = multi-user.target
```

```
其中，mydrive是之前设置的网盘名（onedrive），share是指你要挂载的网盘里的文件夹，全部挂载就直接留空格就可以， /home/onedrive是你要挂载到vps上的位置，需要先mkdir这个文件夹

```

现在就可以用systemctl来启动rclone了：

```
systemctl start rclone
```

设置开机启动：

```
systemctl enable rclone
```

停止、查看状态可以用：

```
systemctl stop rclone
systemctl status rclone
```

```
如果你想挂载多个网盘，那么将systemd配置文件的rclone.service改成rclone1.service即可，重启动什么的同样换成rclone1。可以配置多个rclone.service文件

```
