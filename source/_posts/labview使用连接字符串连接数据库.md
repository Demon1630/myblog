---
title: "labview使用连接字符串连接数据库"
date: 2020-07-06
categories: 
  - "labview"
  - "技术"
tags: 
  - "labview"
  - "数据库"
---

在使用文本编辑udl文件的时候，就可以发现udl里面也只是存储一些字符串内容，我们就可以直接把里面的字符串内容提取出来，作为输入

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1594020472-字符串连接数据库2-1024x376.png)

这种方式避免了dsn或者udl需要创建文件的麻烦，更加直接方便

字符串内容为：Provider=Microsoft.Jet.OLEDB.4.0;Data Source=数据库目录\\数据库.mdb;Persist Security Info=False
