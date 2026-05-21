---
title: "使用aria2插件浏览器直接下载文件到服务器"
date: 2020-07-20
categories: 
  - "技术"
tags: 
  - "离线下载"
---

前面有文章介绍了使用aria2配合服务器搭建离线下载

[使用aria2 + rclone +谷歌无线容量团队盘-实现离线下载](http://www.demon1630.cn/%e4%bd%bf%e7%94%a8aria2-rclone-%e8%b0%b7%e6%ad%8c%e6%97%a0%e7%ba%bf%e5%ae%b9%e9%87%8f%e5%9b%a2%e9%98%9f%e7%9b%98-%e5%ae%9e%e7%8e%b0%e7%a6%bb%e7%ba%bf%e4%b8%8b%e8%bd%bd/)

但下载内容都要复制链接过去，比较麻烦，有时候要是想直接下载就可以使用aria2浏览器插件

搜索插件安装即可

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1595260145-aria1-1024x596.png)

然后右键插件，点击 选项 进行配置

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1595260267-aria2-1024x662.png)

将自己的aria2配置填入 server中即可，然后开启自动拦截下载任务就可以在点击下载文件时直接启动aria2进行下载了
