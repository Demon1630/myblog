---
title: "fluent案例教程：二维混合管模型"
date: 2022-02-11
categories: 
  - "ansys"
  - "技术"
  - "推荐软件"
tags: 
  - "ansys"
  - "fluent"
  - "workbench"
---

物理模型如图所示，为二维流道混合模型，冷热水混合后流出，主要涉及到二维模型绘制及网格划分及对应的求解

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211210128.png)

二维模型可以使用ICEM进行建模及网格划分，因为二维模型一般比较简单，采用DM和SC对于这种二维模型进行网格划分时容易出问题 # 一、模型建立 先打开workbench，将ICEM 拖放到工作窗口中 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211210753.png) 双击model打开ICEM

先使用绝对坐标系或者相对坐标创建所有的体征点 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211211617.png) 创建好之后再用线段连接所有点得到二维模型 最终根据要求创建好如图所示的二维模型 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211212724.png)

二维模型创建好后需进行网格划分，先创建块，操作如下 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211213459.png) 此时完成块的初步生成，观察几何模型可以发现，此模型形状近似于T型变形，所以需对生成的块进行切割成T型结构 使用块切割工具进行切割 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211214143.png) 这里注意，可以把块显示清楚 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211214333.png) 然后把左下角和右下角的多余块删除获得T型块 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211214548.png) 之后进行块的关联 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211214719.png) 要关联的顶点与点（前方为顶点号，后方为点编号）： 33-1， 13-8， 37-4， 42-5， 34-6， 21-7， 43-3， 38-2。 顶点关联完成后把线也关联上去，可以利用如图所示方式查看关联是否正确 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211220150.png) 之后开始进行网格划分，需要设置网格尺寸，先设定一个总体尺寸 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211220636.png) 先暂定最大尺寸为2 设定全局网格后，需对块进行更新 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211220919.png) 此时可以进行网格预览 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211221128.png) 可以看到网格太宽，需调整全局网格中最大网格尺寸，将全局最大尺寸调整到0.2，然后再看网格质量 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211221608.png) 网格质量主要看四点： 1、长宽比Aspect ratio最好小于5 2、最小角Min angle最好不小于18° 3、Determinant 3x3x3越接近1越好 4、总体质量Quality越接近1越好

查看网格质量后，寻找问题网格，进行优化 比如可以如图所示将关联节点进行移动，来增大角度 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211222220.png)

还可以通过调整单边节点数来调整网格长宽比 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211222953.png)

同时对于管道网格，还可以调节管道边缘处和中心处网格疏密程度到不一致 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211223352.png)

调整好网格质量之后还需生成网格，前面都是预览网格 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220211224410.png) 这时生成的是非结构化网格
