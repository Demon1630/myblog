---
title: "使用excel提取单元格内部分内容"
date: 2020-06-28
categories: 
  - "技术"
tags: 
  - "excel"
---

对于采集后的数据进行处理，最简单的方法就是使用excel了，但由于数据采集仪输出的数据格式为固定的，所以你可能得到的数据是这样的：

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1593307337-excel提取数据1.png)

里面真正有用的是红框中的，但它与其他内容在一个单元格内，如何把它提取出来就需要用到excel 的提取函数了

这里介绍使用的是MID函数，使用方法为：=MID（text，start-num, num-chars)，其中text为你所要提取的单元格，start-num为起始提取位，num-chars为提取位数

使用方法如图：

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1593307723-excel提取数据2-1024x428.png)

其中A11就是要提取的单元格，26为从单元格从左往右数，8为我们所要提取的数据40.169,1的位数

此时便可以完成提取

但此时可以看到提取的数据中还有个半角逗号（,)，但我们需要的数据中是不能有逗号存在的，所以还要把半角逗号（,)去掉

此时可以利用excel函数SUBSTITUTE，使用方法为=SUBSTITUTE(text,old\_text,new\_text)，其中text为所要进行替换的单元格，old\_text为所要替换的原来内容，new\_text为新内容

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1593308370-excel提取数据3.png)

因为要提取的为半角逗号，所以要用双引号：","

 

此时便完成了半角逗号的去除
