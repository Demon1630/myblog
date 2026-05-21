---
title: "使用agilent 34970a中的EZ Temperature .vi读取热电偶温度时过多通道无法读取完整问题"
date: 2020-08-06
categories: 
  - "labview"
  - "制冷技术"
tags: 
  - "labview"
---

在labview中使用EZ temperature.vi读取agilent 34970a通道上的温度时，出现采集通道数超过32个就后面的无法读取出来的问题

 

![](http://www.demon1630.cn/wp-content/uploads/2020/08/1596705597-采集通道数不完整1-1024x504.png)

如图所示，理论上是采集从101到120,201到220共四十个通道的数据，但实际上，只采集到了31个完整数据，第32个及之后的都没有采集到![](http://www.demon1630.cn/wp-content/uploads/2020/08/1596705649-采集通道数不完整2-1024x578.png)

解决方法：

调大EZ temperature.vi中采集字节数大小，之前默认是500，调整为1000就可以完整读取到全部40个数据了，如果还不能采集完整，继续调大

![](http://www.demon1630.cn/wp-content/uploads/2020/08/1596708108-采集通道数不完整3-1024x549.png)
