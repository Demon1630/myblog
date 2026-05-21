---
title: "labview使用udl文件连接数据库"
date: 2020-07-06
categories: 
  - "labview"
tags: 
  - "labview"
  - "数据库"
---

ADO （ActveXData Objeles ）是微软利用自动化服务器技术开发的数据库接口。它不同于传统的ODBC，ODBC仅支持关系型数据库，而ADO对关系型数据库和非关系型数据库都提供了支持。

如同ODBC的DSN一样，使用UDL(通用数据库连接)文件也可以指定ADO的连接字符串。创建UDL文件有三种常用方法。 ◆复制一个现有的UDL文件后，更改名称，然后双击文件，通过“ 连接属性”对话框连接到数据库文件。 ◆在操作系统快捷菜单中， 选择“创建数据库连接(UDL )”项。某些版本的快捷菜单中可 能不显示该项。 ◆通过LabVIEW菜单中，单击“工具”菜单下的"Create Data Link”项，创建UDL。创建UDL文件后，双击该文件，即可打开“连接属性”对话框并配置数据库连接属性。

不同类型的数据库文件必须选择对应的提供者，比如MDB数据库文件的提供者应该选择‘JET4.0OLEDB Provider”,而SQL服务器应该选择“ SQL Server"。

如果出现双击udl文件后无法编辑的问题，可以直接对udl进行文本编辑，使用文本编辑器打开udl文件

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1594014991-udl连接数据库1-1024x138.png)

只需把指定的data source地址修改一下即可。

创建好udl文件后，连接数据库的程序框图如图：

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1594015271-udl连接数据库2-1024x233.png)

把udl放到地址中即可
