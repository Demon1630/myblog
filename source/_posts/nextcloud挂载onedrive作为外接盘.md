---
title: "nextcloud挂载onedrive作为外接盘"
date: 2020-11-02
categories: 
  - "技术"
  - "wordpress"
tags: 
  - "nextcloud"
  - "tor"
  - "私有云盘"
  - "网站"
---

使用nextcloud作为私人网盘还是不错的，安装nextcloud可以查看文章

# [vps使用nextcloud搭建个人私有云盘](http://www.demon1630.cn/vps%e4%bd%bf%e7%94%a8nextcloud%e6%90%ad%e5%bb%ba%e4%b8%aa%e4%ba%ba%e7%a7%81%e6%9c%89%e4%ba%91%e7%9b%98/)

虽然很安全方便，但是由于我的vps硬盘大小只有40G，同时上面还安装了蛮多网站的，所以留给储存文件的就比较少了，所以如果想存大量文件还是不太行，所以可以使用onedrive作为外接网盘，接入到nextcloud，从而可以直接在nextcloud中存入文件到onedrive中。

由于nextcloud不能直接挂载onedrive，所以需要先把onedrive挂载在vps上，然后再通过本地文件夹挂载的方式挂载到nextcloud中

关于把onedrive挂载到vps上可以参考文章：

# [linux使用rclone挂载onedrive作为挂载盘](http://www.demon1630.cn/linux%e4%bd%bf%e7%94%a8rclone%e6%8c%82%e8%bd%bdonedrive%e4%bd%9c%e4%b8%ba%e6%8c%82%e8%bd%bd%e7%9b%98/)

完成了挂载之后，到nextcloud的应用中下载启用external storage support这个应用

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604305869-nextcloud2-1024x435.png)

然后到设置里，可以看到有外部存储这选项了

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604306097-nextcloud3-1024x347.png)

进入外部存储可能会发现提示：**“smbclient” 未安装。无法挂载 "SMB / CIFS", "SMB / CIFS 使用 OC 登录信息"。请联系管理员安装。**需要进入SSH安装smbclient。

进入SSH运行命令：

```
yum install libsmbclient libsmbclient-devel
pecl install smbclient
```

**注意：**安装之前进入宝塔面板→php管理→禁用函数里面把“exec”“popen”“putenv”删除不然会安装不上

如果这样出现pecl未安装可以参考文章[https://www.cnblogs.com/sandea/p/9395556.html](https://www.cnblogs.com/sandea/p/9395556.html)进行pecl的安装

pecl安装smbclient扩展完成后会提示

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604306443-nextcloud4.png)

之后就可以发现提示消失了，然后添加存储，选择本地，把之前挂载的onedrive文件夹位置填入配置中就可以了，然后点击√，出现绿色标志√就说明挂载完成了，进入文件中，就可以看到挂载的文件夹了

![](http://www.demon1630.cn/wp-content/uploads/2020/11/1604306713-nextcloud5-1024x462.png)

之后就可以安心上传文件了，onedrive也比较安全
