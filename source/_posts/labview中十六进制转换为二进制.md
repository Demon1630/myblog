---
title: "labview中十六进制转换为二进制"
date: 2020-10-08
categories: 
  - "labview"
  - "试验台架"
tags: 
  - "labview"
  - "邮件"
---

在labview中进行MODBUS通讯时，有需要将十六进制转换为二进制的需求

![](http://www.demon1630.cn/wp-content/uploads/2020/10/1602136870-十六进制转换为二进制1-1024x110.png)

就比如这里面的通讯协议里有需要将0300的十六进制转换为0000011的二进制，从而读取相应数据出来

![](http://www.demon1630.cn/wp-content/uploads/2020/10/1602136969-十六进制转换为二进制2-1024x414.png)

源码如图，就可以将输入的十六进制转换为二进制

![](http://www.demon1630.cn/wp-content/uploads/2020/10/1602137045-十六进制转换为二进制3.png)

这里需要注意的是十六进制需要写成03 00，中间有空格的形式，否则出来的就是错误的

需要源码可以留言或发邮件给我
