---
title: "excel中散点图自定义趋势线公式中常量精确度或小数点后位数"
date: 2021-02-21
categories: 
  - "excel"
tags: 
  - "excel"
---

使用excel散点图可以很方便的绘制出趋势线，从而获得两个变量间的数学关系，但默认生成的公式有时候精确度不够，比如说只保留了常量有限的位数，当两个趋势线公式很接近的时候，可能会使得显示的公式一样，这时候就需要自定义提高公式的精度

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210221092746.png) ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210221092833.png) 如图所示，两个散点图中使用的数据并不相同，但由于精度不够，使得两个趋势线公式的斜率是一样的，这明显不对

解决办法：自定义精度 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210221093228.png) 首先选中趋势线，右键，然后打开设置趋势线格式侧边框 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210221093126.png) 之后如图在下拉菜单中，选择趋势线格式菜单 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210221093500.png) 在类别里面选择数字，然后将位数调整为自己需要的，我这里调整为8位 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210221093527.png) ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210221093822.png) 此时可以看到两个趋势线公式已经明显不同了
