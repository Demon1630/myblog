---
title: "在labview中调用图表时每次进行清零"
date: 2020-07-23
categories: 
  - "labview"
  - "技术"
  - "文章采集"
tags: 
  - "labview"
---

## 问题详述

我在LabVIEW的前面板上有一个图表和一个图形，但我找到的能清除它的唯一方法是右键单击图表或图形，然后从快捷菜单中选择**数据操作»清除图表**或**数据操作»清除图形** 。有没有办法以编程方式清除图表或图形？

## 解决方案

用于清除图表或图的方法会根据不同的前面板对象而发生变化。下面将介绍清除这些对象的方式。

波形图表：

1. 右键单击图表，然后选择**创建»属性节点****»历史数据。**
2. 右键单击**历史数据**并选择**更改为写入。**
3. 右键单击**历史数据终端，**然后选择**创建常量。**

_执行此代码时会将空数据写入图表以清除历史记录。_

![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kHYr&feoid=00N0Z00000HEWRt&refid=0EM0Z000000WAyb)

波形图：

编程使用属性节点或调用节点以清除图形

属性节点：

1. 右键单击图形并选择**数据操作»清除图形** 以清除图形**。**
2. 右键单击图形，然后选择**创建»属性节点** **»值。**
3. 右键单击**值，**然后选择**更改为写入。**
4. 右键单击**值终端，**然后选择**创建常量。**这会将空数据写入图形，并在执行此代码时清除图形。

![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kHYr&feoid=00N0Z00000HEWRt&refid=0EM0Z000000WAyg)

调用节点：

1. 右键单击图形并选择**数据操作»清除图形**，以清除图形**。**
2. 右键单击图形，然后选择**创建»调用节点****»重新初始化为默认值。**

![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kHYr&feoid=00N0Z00000HEWRt&refid=0EM0Z000000WAyl)

## 相关信息

在8.0之前的LabVIEW版本中，如果波形数据已写入图表，则无法创建常量。反之，可以使用下面描述的任一种方法。

波形图和波形图表（属性节点）：

1. 右键单击该属性节点，然后选择**创建»控件。**
2. 转到前面板，右键单击新创建的控件，选择**高级»隐藏控件。**

![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kHYr&feoid=00N0Z00000HEWRM&refid=0EM0Z000000WAyq)

![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kHYr&feoid=00N0Z00000HEWRM&refid=0EM0Z000000WAyv)

波形图（调用节点）：

1. 右键单击并选择**数据操作»清除图形，**以清除图形**。**
2. 右键单击图形，然后选择**创建»调用节点** **»重新初始化为默认值。**

![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kHYr&feoid=00N0Z00000HEWRM&refid=0EM0Z000000WAz0)
