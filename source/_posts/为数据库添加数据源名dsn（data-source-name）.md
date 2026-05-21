---
title: "为数据库添加数据源名DSN（Data Source Name）"
date: 2020-05-19
categories: 
  - "labview"
tags: 
  - "labview"
  - "数据库"
---

在labview中调用数据库需要为数据库添加数据源名DSN（Data Source Names）才能连接到实际数据库

需要使用32位ODBC数据源管理器，因为access数据库不支持64位的

在windows10中，搜索ODBC

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1589858507-数据源DSN-969x1024.png)

选择32位的，在用户DSN中选添加，选择Driver do Microsoft Access（\*.mdb）:

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1589858756-数据源DSN2.png)

然后确定，找到需要连接 的数据库：

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1589858861-数据源DSN3.png)

确定之后就为数据库创建了DSN

之后就可以到labview中调用DSN来连接数据库了
