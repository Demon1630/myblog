---
title: "labview创建子vi的两种方法"
date: 2020-07-01
categories: 
  - "labview"
tags: 
  - "labview"
---

有两种创建labview子vi的方法

## 一、将vi转变为子vi

在创建完vi后，此时这个vi还不能被其他vi调用，因为还没有为其添加接线端类型

下面以简单的加法vi介绍

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1593594055-子vi1-1024x549.png)

这是一个简单的计算两个数加法的vi

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1593594283-子vi2-1024x560.png)

修改模式为自己所需样式

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1593594574-子vi3-1024x684.png)

照上图所示完成vi端口与控件的对应

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1593594767-子vi4-1024x549.png)

完成对图标的修改，然后保存，就可以对其进行调用了

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1593594929-子vi5.png)

## 二、将vi中某部分创建为子vi

有时候在编写完一个vi后，发现这个vi中的一部分会需要经常用到，或者为了节省空间，就可以将vi中的一部分转变为子vi，从而进行调用

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1593595198-子vi6-1024x549.png)

如图选择某一部分创建子vi

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1593595330-子vi7-1024x459.png)

创建完成后，双击打开子vi就可以如一中所述对子vi进行图标等的编辑，然后把子vi保存即可

 

还可以对vi添加说明信息，右键子vi图标，选择vi属性

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1593605005-子vi8.png)

类别中选择说明信息，然后在里面添加说明内容即可

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1593605050-子vi9.png)

在调用子vi时，鼠标点击一下子vi，在即时帮助下就可以看到前面添加的说明内容，可以让子vi更具有可读性

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1593605097-子vi10.png)
