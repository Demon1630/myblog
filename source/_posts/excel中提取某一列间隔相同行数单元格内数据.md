---
title: "excel中提取某一列间隔相同行数单元格内数据"
date: 2021-02-27
categories: 
  - "excel"
tags: 
  - "excel"
---

有时候需要对excel中某一列中数据，将其间隔相同行数中的数据提取到一起来

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210227140453.png) 如图，需要将间隔5行的数据提取到一起来

这时候就可以使用函数offset

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210227140642.png)

函数使用为 =OFFSET($H$5,(ROW(A1)-1)\*5,0)

其中，$H$5为参考单元格，\*5中的5为需要间隔的行数

据此就可以将其全部提取出来
