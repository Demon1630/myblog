---
title: "为树莓派装上 CentOS 7 系统"
date: 2021-11-21
categories: 
  - "wordpress"
---

   

## **⚠️ 注意**

在操作之前，请先备份好树莓派 SD 卡上的重要数据。接下来的操作会抹掉整张 SD 卡！

## **一、前言**

由于我的 Linux 学习之路是从 CentOS 系统开始的，所以 CentOS 一直以来也是我心目中最完美的 Linux 发行版。而在服务器操作系统中，CentOS 的份额也一直处在首位。

去年初我买了个树莓派来折腾。买来之后本来是想拿它来搭个小型服务器的，但是我天真地以为树莓派是 ARM 架构的，肯定没有 CentOS 这种服务器操作系统，而我大部分的服务器配置方法都是基于 CentOS 整理的，又懒得研究其它发行版的配置方法，所以只用它官方的 Raspbian 系统来玩一玩 GPIO 以及 HomeKit……

一次偶然的机会，我发现了 CentOS 居然也有 ARM 版本！然后就……

本文纯属个人经验分享，仅供参考。另外，这个系统的内核和跟 Raspbian 一样也是 32 位的。

好吧，话不多说，进入正题吧。

## **二、我用到的东西**

- 硬件：Raspberry Pi 3 Model B、MacBook Pro、32G SD 卡和读卡器。
- 软件：ARM 版 CentOS 7.4.1708、macOS、The Unarchiver。

## **三、下载 & 解压 ARM 版 CentOS**

使用浏览器打开 [CentOS 官网的下载页面](https://link.zhihu.com/?target=http%3A//mirror.centos.org/altarch/7/isos/armhfp/)：

![](https://pic1.zhimg.com/v2-35c904c10fdf3bd188c67e0718294020_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2021/11/frc-9fdee42babd99088c8e6f265075b77d9.jpg)

  
然后选择对应的硬件版本即可下载。

> 如果下载速度太慢或者无法下载，可以使用 `aria2` 之类的下载工具来加速下载。

建议在下载完之后，检查一下文件的 SHA256 校验和是否与 `sha256sum.txt` 文件中的一致。

> macOS 检测 SHA256 命令：`shasum -a 256` 。

下载完成后，您会发现这个文件的后缀名是 `.xz`。它是一个压缩的磁盘映像文件，并不能直接使用。

我这里用「The Unarchiver」这个 App 来解压它。

![](https://pic1.zhimg.com/v2-3c10e172ecadcb83672798bb407bb80c_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2021/11/frc-4a80fadca3b8473efa287e182cb6de8a.jpg)

￼  
解压完成后，会得到一个后缀名为 `.img` 的文件，这个才是真正的磁盘映像文件。

## **四、安装**

> 为了保险起见，请先移除 Mac 上的所有外接磁盘，再把树莓派上的 SD 卡放入读卡器然后插到 Mac 上。

### **4.1 找出磁盘对应的设备文件**

打开「终端」，然后执行以下命令：

```text
diskutil list 
```

然后通过磁盘的总容量找到设备名。比如我的是 `/dev/disk2`。

### **4.2 卸载 SD 卡已挂载的分区**

> 如果 SD 卡中含有 macOS 所能识别的分区（比如 FAT32），都会自动被挂载。如果不卸载的话，那么下面的烧写操作将无法进行。  
> 如果插入 SD 卡之后，在桌面上没有发现有挂载了新的分区，或者弹出了「此电脑不能读取您插入的磁盘。」的提示，则此步可跳过。  
> 请**不要**在桌面上将已挂载的分区直接拖到废纸篓中，这样的话系统会把整个磁盘卸载掉，那么下面的烧写操作也将无法进行。

请先将以下命令中的 改成 4.1 获取的设备文件名，然后执行命令：

```text
diskutil umount `mount | grep "" | awk '{print $3}'` 
```

例如我的是：

```text
diskutil umount `mount | grep "/dev/disk2" | awk '{print $3}'` 
```

### **4.3 将磁盘映像文件烧写到 SD 卡中**

先输入 `sudo dd if=`，然后将解压出来的 `.img` 文件拖到终端窗口中。再输入 `of=`，回车输入管理员密码执行，映像文件就会被烧写到 SD 卡中。

> 请将上面的 改成 4.1 获取的设备文件名。

例如我的是：

```text
sudo dd if=/Users/zenandidi/Downloads/CentOS-Userland-7-armv7hl-Minimal-1708-RaspberryPi3.img of=/dev/disk2
```

> 执行完命令之后，请耐心等待烧写完成。

下面是前面几个步骤截图：

![](https://pic2.zhimg.com/v2-5643f5524e5d498b0894f173c4345909_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2021/11/frc-0af0bd8776e6b4a5abdf5731b040d7b3.jpg)

￼

烧写完成之后，SD 卡中有一个分区会被自动挂载，请卸载它（在桌面上将已挂载的分区直接拖到废纸篓中即可）。然后把 SD 卡装进树莓派中。

## **五、连接到树莓派**

使用网线将树莓派连接到带有 DHCP 服务器且跟 Mac 在同一网段的网络中，然后让树莓派通电，等待约 30 秒之后使用 `ssh` 连接到树莓派。

> 树莓派的 IP 地址可以通过查询 DHCP 服务器上的信息或者局域网扫描软件（比如 Fing）来获取。

执行以下命令：

```text
ssh root@ 
```

出现 `The authenticity of host 'XXX' can't be established.` 的提示，输入 `yes` 回车即可。

> 如果出现 `WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!` 的提示，请根据提示清理一下 `.ssh/known_hosts`。具体方法这里就不赘述了。

默认的登录密码为 `centos`。

例如我的是：

```text
ssh root@192.168.188.222 
```

![](https://pic1.zhimg.com/v2-a692600d67e2e414959868323a94ae38_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2021/11/frc-82e202a4b33765224dee4072e9797544.jpg)

> 如果您有带 HDMI 输入接口显示器和键盘鼠标的话，也可以直接使用带外配置。

## **六、配置 Wi-Fi 网络**

> 如果不需要使用 Wi-Fi 网络的话可以跳过此步骤。  
> 配置 Wi-Fi 非常简单，使用 CentOS 中自带的 `NetworkManager` 工具即可配置。

执行以下命令：

```text
nmtui 
```

选择 `启用连接` 然后回车。

![](https://pic2.zhimg.com/v2-ff27b1b943bf7d0d6aedbb6e32d3b329_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2021/11/frc-854b25cb817431caef1ba966444afcf7.jpg)

选择需要连接的 Wi-Fi 网络然后输入密码即可连接。

![](https://pic1.zhimg.com/v2-67c44d33dd7021bdb0ab812da7a375a0_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2021/11/frc-5d8e28ecdf9bc1713ff58100b6bf5aac.jpg)

> 注：暂时不能用此方法配置企业级的（802.1X） Wi-Fi。

## **七、扩展根分区**

> 由于系统默认的映像把根分区的空间设定得很小，因此我们需要手动扩展根分区。  
> 虽然系统上自带了一个 `rootfs-expand` 自动扩展根分区的脚本，但是不知道为什么我使用了没有任何效果。所以还是得手动操作一下。

执行以下命令：

```text
fdisk /dev/mmcblk0 
```

执行完之后，输入 `d` -> 按 2 下回车 -> 输入 `n` -> 按 5 下回车 -> 输入 `w` -> 按回车。

如果出现 `设备或资源忙` 提示的话不用管它。

过程如下图：

![](https://pic3.zhimg.com/v2-f35bcb5d4f3b04e9293d80923f493706_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2021/11/frc-c9dc2a4669d9600cc16182b10e132356.jpg)

然后执行 `reboot` 重启树莓派。

重启之后重新连接到树莓派，然后执行以下命令：

```text
resize2fs /dev/mmcblk0p3 
```

根分区的扩展就完成了。

扩展完成后可以执行 `df -h` 来检查扩展是否成功。

过程如下图：

![](https://pic1.zhimg.com/v2-dd32d95fafa3b86e1cf7e2180b0e9e48_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2021/11/frc-bd0989b54d3bf4a9f6ba7c26c1e54444.jpg)

## **八、添加 EPEL 软件源**

> EPEL 软件源收录了很多自带软件源没有的常用的软件。在 x86 版 CentOS 上，我们可以很方便地用 `yum -y install epel-release` 来添加 EPEL 软件源，但是在 ARM 版 CentOS 上就行不通了。  
> 不过我们可以通过手动修改 `yum` 源的配置文件来添加它。

执行以下命令：

```text
cat  /etc/yum.repos.d/epel.repo
[epel]
name=Epel rebuild for armhfp
baseurl=https://armv7.dev.centos.org/repodir/epel-pass-1/
enabled=1
gpgcheck=0
EOF 
```

至此，树莓派版的 CentOS 安装以及基本配置就完成了。请尽情享受 CentOS 和树莓派的乐趣吧！
