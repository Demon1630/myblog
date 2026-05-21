---
title: "使用gclone实现免VPS流量在不同谷歌团队盘间进行转存"
date: 2021-01-17
categories: 
  - "技术"
tags: 
  - "离线下载"
  - "谷歌云盘"
---

前面有文章写到用rclone挂载谷歌团队盘和OneDrive

[linux使用rclone挂载onedrive作为挂载盘](http://www.demon1630.cn/linux%e4%bd%bf%e7%94%a8rclone%e6%8c%82%e8%bd%bdonedrive%e4%bd%9c%e4%b8%ba%e6%8c%82%e8%bd%bd%e7%9b%98/)

[使用aria2 + rclone +谷歌无线容量团队盘-实现离线下载](http://www.demon1630.cn/%e4%bd%bf%e7%94%a8aria2-rclone-%e8%b0%b7%e6%ad%8c%e6%97%a0%e7%ba%bf%e5%ae%b9%e9%87%8f%e5%9b%a2%e9%98%9f%e7%9b%98-%e5%ae%9e%e7%8e%b0%e7%a6%bb%e7%ba%bf%e4%b8%8b%e8%bd%bd/)

然后也写了如何用rclone进行多谷歌团队盘备份

[rclone多网盘互拷备份](http://www.demon1630.cn/rclone%e5%a4%9a%e7%bd%91%e7%9b%98%e4%ba%92%e6%8b%b7%e5%a4%87%e4%bb%bd/)

进行多网盘备份主要是因为谷歌团队盘不够稳定，经常可能哪个团队盘就不能用了，所以一般要备好三个团队盘进行互拷备份，避免翻车。

但是使用rclone进行互拷备份的时候需要走vps的流量，而且是双份流量，所以一旦你的团队盘里面存的文件比较多，有个一两百G你的vps的流量就会吃不消，所以这里介绍一下gclone，它进行互拷备份的时候不需要走vps的流量，而且速度很快，基本上10G只要十几秒就行

gclone官网：[https://github.com/donwa/gclone](https://github.com/donwa/gclone)

安装gclone命令：

```
bash <(wget -qO- https://git.io/gclone.sh)
```

安装成功后运行gclone,测试安装是否成功，得到命令如下

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210117231226.png)

运行gclone看到有命令命令输出就说明安装成功了

可以使用gclone挂载谷歌团队盘，步骤和rclone一样，只不过是运行gclone config，其他的参考rclone挂载就行

如果已经使用rclone挂载好了，就不用再进行gclone挂载，直接进行gclone的互拷备份就行

```
gclone copy g1s:{1qMBhAIjgQKTp-Eitxs0k1pHpeZrTNjZI} g2s:{1q2696hdHYcD4EimOBVvq4BpM-EhzPlOE}  --drive-server-side-across-configs
其中g1s为网盘1配置名，g2s为网盘2配置名，替换成你自己的即可。
1qMBhAIjgQKTp-Eitxs0k1pHpeZrTNjZI只指的是别人团队盘或者共享盘的目录ID
1q2696hdHYcD4EimOBVvq4BpM-EhzPlOE指的是你自己GD的目录ID

OneDrive拷贝到谷歌云盘
```

```
rclone copy -P od:abc gd:abc --ignore-errors --stats-one-line

```
