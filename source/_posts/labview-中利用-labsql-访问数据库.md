---
title: "LabVIEW 中利用 LabSQL 访问数据库"
date: 2020-05-19
categories: 
  - "labview"
tags: 
  - "labview"
  - "数据库"
  - "邮件"
---

## **0** 引言（基于数据库管理数据的虚拟仪器系统）

虚拟仪器 VI（virtual instruments）是 National Instruments 公司在其产品 LabVIEW 中首先提出的创新概念。随着现代测试技术与仪器技术的发展，目前虚拟仪器概念已经发展成为一种创新的仪器设计思想，成为设计复杂测试系统和测试仪器的主要方法和手段。同时 LabVIEW 也以成为测试与测量领域的工业标准应用编程软件。

现代的测试测量系统大多需要对被测目标进行全方位检测，多传感器网络协调应用，从而有利于获取对目标系统的全面认识，这同时也会使产生的数据量急剧增长。面对大量的数据信息无论是手工数据管理还是文件系统管理方式都无法正确反映各类数据之间的密切联系，都不能有效的管理和组织数据。因此以数据库为中心，以数据管理为重点，构建的基于数据库管理数据的虚拟仪器系统是现代的测试测量系统的发展趋势。其结构框图如图 1 所示：

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1589880397-labsql访问数据库1.png)

但由于 LabVIEW 本身并不具备数据库访问功能，因此以 LabVIEW 编制的虚拟仪器系统需要其它辅助的方法来进行数据库访问。

## **1  LabVIEW** 中与数据库接口的方法

在基于数据库的虚拟仪器测量测试系统中，很重要的一部分工作是对实时采集地的数据进行显示、查询、统计、生成报表分析等。这其中涉及的最主要的任务就是对数据的读取和写入，即与数据库系统进行交互。据笔者所知，在 LabVIEW 编程环境下，通常通过以下几种方法来完成与数据库的接口。

- 利用 NI 公司的附加工具包 LabVIEW SQL Toolkit 进行数据库访问。但是这种工具包比较昂贵，对于很多 LabVIEW 用户来讲，这个价格是不可能承受的。
- 利用其他语言如 Visual C++编写 DULL 程序访问数据库，再利用 LabVIEW 所带的

DULL 接口访问该程序，这样可以实现间接访问数据库。但这样工作量太大。

- 利用 LabVIEW 的 ActiveX 功能，调用 Microsoft ADO 控件，利用 SQL 语言实现数据库访问。利用这种方式进行数据库访问需要用户对 Microsoft ADO 控件以及 SQL 语言有较深的了解，并且需要从底层进行复杂的编程才能实现。这对于大多数用户来讲也是不现实的。

这几种方法虽然都可以完成对数据库的访问，但各有缺点不能满足系统对数据库实时访问的要求。本文提出通过 LabVIEW 用户开发的免费 LabVIEW 数据库访问的工具包 LabSQL 来解决以上存在的问题。

## **2**  数据库访问的工具包 **LabSQL** 简介

LabSQL 是一个免费的、多数据库、跨平台的 LabVIEW 数据库访问工具包。目前的版本是 LabSQL Release 1.1，LabSQL 支持 Windows 操作系统中任何基于 OBDC 的数据库，包括 Acess,SQL Server,Orcale,Pervasive,Sybase 等。LabSQL 是利用 Microsoft ADO 以及 SQL 语言来完成数据库访问，将复杂的底层 ADO 及 SQL 操作封装成一系列的 LabSQL VIs。利用 LabSQL 几乎可以访问任何类型地数据库，执行各种查询，对记录进行各种操作。它的优点是易于理解，操作简单，不熟悉 SQL 语言的用户也可以很容易地使用。只需进行简单地编程，就可在 LabVIEW 中实现数据库访问。它还有一个最大的优点是源代码开放，并且是全面免费的。（注：LabSQL 的下载网址 http://jeffreytravis.com）

将下载的工具包解压到labview安装目录下的user.lib下即可，然后重启labview就可以在库函数中找到labsql函数了：

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1589889785-labsql访问数据库6.png)

Microsoft ADO 简介：Microsoft AciveX Data Objects（ADO）是微软最新的数据库访问技术，可以用于编写通过 OLE DB 提供者对在数据库服务器中的数据进行访问和操作的应用程序。OLE DB 是一个底层的数据访问接口，用它可以访问各种数据源，包括传统的关系型数据库以及电子邮件系统和自定义的商业对象。ADO 为用户提供了一个 OLE DB 的 Automation 封装接口。如同不同的数据库系统需要它们自己的 ODBC 驱动程序一样，不同的数据源要求它们自己的 OLE DB 提供者（OLE DB provider）。

SQL 作为关系型数据库中的一种通用的结构化查询语言，它的主要功能就是同各种数据库建立联系，进行沟通。SQL 语句可以用来执行各种各样的操作，例如更新数据库中的数据，从数据库中提取数据等。目前绝大多数的关系型数据库管理系统，如 Orcale，Sybase，

Microsoft SQL Server,Access 等都采用了 SQL 语言表标准。

## **3  LabVIEW** 中对 **LabSQL** 的使用

3.1LabVIEW中加入LabSQL

在 LabVIEW 安装目录中的 user.lib 文件夹中新建一个名为 LabSQL 的文件夹，并将下载得到的 LabSQL.zip 压缩文件中所有文件解压到这个文件夹中。解压缩后的文件包括 LabSQL ADO functions 和 Examples 两个文件夹，以及 ADO210.CHM 和 README\_FIRST.txt 两个文件。再次运行时，LabVIEW 的功能模块就会自动加载 LabSQL。

### 3.2LabSQL 的配置

LabSQL 与数据库之间是通过 ODBC 连接，用户需要在 ODBC 中指定数据源名称和驱动程序。因此在使用 LabSQL 之前，首先需要在 Windows 操作系统中的 ODBC 数据源中创建一个 DSN(data source name,数据源名)。LabSQL 与数据库之间的连接就是建立在 DSN 基础之上的。其连接流程如图 2 所示。

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1589880465-labsql访问数据库2.png)

### 3.3LabSQL VIs 分类

LabSQL VIs 按照功能可分为四类：Command VIs；

Connection VIs；Recordset VIs；Top Level VIs。

Command VIs 的功能是完成一系列的基本 ADO 操作，例如，创建或删除一个 Command，对数据库中的某一个参数进行读或写等。

 

图 2：LabSQL 与数据库连接框图

 

Connection VIs 的功能是管理 LabVIEW 与数据库之间的连接。

Recordset VIs 用于对数据库中的记录进行各种操作，例如，创建或删除一条记录，对记录中的某一条目进行读或写等。

Top Level VIs 属于顶层的 LabSQL 应用，对前三类 LabSQL VIs 某些功能的封装，例如，

SQL Execute.VIs 可用于直接执行 SQL 命令。

**3.4** 利用 **LabSQL** 开发的基本步骤

利用 LabSQL 在数据库操作中可实现应用程序与数据库之间的数据交互传递。一般的简单操作步骤如图 3 所示。

## **4   LabSQL** 应用实例 

本应用实例是基于 VI 的某型装备的随动测试系统，该测试系统需要对事先存储的各测试点的基本资料，标准值、上下限值进行读取，然后与采集的数据值进行计算、判断，并进行状态记录存储和管理。其数据库采用的是 Microsoft Access 系统，它的使用和维护较简单，并且能够满足本系统的需要。限于篇幅，本文只对打开数据库、查询指定的记录的字段值和向数据库添加、删除、修改记录的实现方法作一下介绍，以起到抛砖引玉的作用。图四即为笔者编写的对数据库进行简单操作

的框图。

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1589886282-labsql访问数据库3.png)

                                                                               图 3：数据库操作的基本步骤

 

图四：利用 LabSQL 访问数据库的框图

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1589886302-labsql访问数据库4.png)

具体步骤如下：

第一步：首先通过ADO Create.vi创建一个Connection对象，然后利用ADO Connection

Open.vi 建立与数据库的连接，数据库由字符串ConnectionString“DSN=myDB”。（myDB 是一个在Windows ODBC数据源中创建的一个DSN,并与想要连接的数据库相连接。

第二步：利用 ADO Recordset Create.vi 创建一个 Recordset 对象，然后利用 ADO

Recordset Open.vi打开Recordset对象，并同时利用SQL查询命令获得数据库表中的全部或部分记录。

第三步：通过功能选择按钮来选择控制对数据库的操作（查询、添加、删除、修改）。

第四步：利用ADO Recordset Close.vi和ADO Connection Close.vi关闭与数据库之间的连接。

以上所举的例子只是对数据库的基本操作，如果综合利用 LabSQL 的四类 VIs，就可以实现复杂的数据库操作。另外注意 Microsoft ADO 控件具有远程数据库访问的功能，但是LabSQL 并没有开发这一功能。
