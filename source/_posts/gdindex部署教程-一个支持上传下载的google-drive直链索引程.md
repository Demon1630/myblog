---
title: "GDIndex部署教程——一个支持上传下载的Google Drive直链索引程序"
date: 2020-05-08
categories: 
  - "技术"
tags: 
  - "离线下载"
  - "谷歌云盘"
---

GDIndex是一个GitHub项目，可以实现对Google Drive内文件的索引，实现对其中文件进行上传和下载，由于其流量走cloudflare，所以其下载速度比直接访问google drive要快很多，同时也可以在线观看其中的视频

项目地址：[https://github.com/maple3142/GDIndex/blob/master/README.zh.md](https://github.com/maple3142/GDIndex/blob/master/README.zh.md)

布置很简单，访问：[https://gdindex-code-builder.glitch.me](https://gdindex-code-builder.glitch.me)

参照其中要求配置，获取谷歌授权，获得代码

转到cloudflare中

[![](https://www.demon1630.cf/wp-content/uploads/2020/05/1588917810-GDindex部署-1024x113.png)](https://www.demon1630.cf/gdindex%e9%83%a8%e7%bd%b2%e6%95%99%e7%a8%8b-%e4%b8%80%e4%b8%aa%e6%94%af%e6%8c%81%e4%b8%8a%e4%bc%a0%e4%b8%8b%e8%bd%bd%e7%9a%84google-drive%e7%9b%b4%e9%93%be%e7%b4%a2%e5%bc%95%e7%a8%8b/1588917810-gdindex%e9%83%a8%e7%bd%b2/)

点击workers，

[![](https://www.demon1630.cf/wp-content/uploads/2020/05/1588917914-GDindex部署2-1024x637.png)](https://www.demon1630.cf/gdindex%e9%83%a8%e7%bd%b2%e6%95%99%e7%a8%8b-%e4%b8%80%e4%b8%aa%e6%94%af%e6%8c%81%e4%b8%8a%e4%bc%a0%e4%b8%8b%e8%bd%bd%e7%9a%84google-drive%e7%9b%b4%e9%93%be%e7%b4%a2%e5%bc%95%e7%a8%8b/1588917914-gdindex%e9%83%a8%e7%bd%b22/)

管理workers，创建workers，然后把代码复制上去

[![](https://www.demon1630.cf/wp-content/uploads/2020/05/1588918130-GDindex部署3-1024x480.png)](https://www.demon1630.cf/gdindex%e9%83%a8%e7%bd%b2%e6%95%99%e7%a8%8b-%e4%b8%80%e4%b8%aa%e6%94%af%e6%8c%81%e4%b8%8a%e4%bc%a0%e4%b8%8b%e8%bd%bd%e7%9a%84google-drive%e7%9b%b4%e9%93%be%e7%b4%a2%e5%bc%95%e7%a8%8b/1588918130-gdindex%e9%83%a8%e7%bd%b23/)

此时即可完成GDIndex的部署

[![](https://www.demon1630.cf/wp-content/uploads/2020/05/1588918205-GDindex部署4-1024x388.png)](https://www.demon1630.cf/gdindex%e9%83%a8%e7%bd%b2%e6%95%99%e7%a8%8b-%e4%b8%80%e4%b8%aa%e6%94%af%e6%8c%81%e4%b8%8a%e4%bc%a0%e4%b8%8b%e8%bd%bd%e7%9a%84google-drive%e7%9b%b4%e9%93%be%e7%b4%a2%e5%bc%95%e7%a8%8b/1588918205-gdindex%e9%83%a8%e7%bd%b24/)
