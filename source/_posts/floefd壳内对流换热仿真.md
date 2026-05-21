---
title: "floefd壳内对流换热仿真"
date: 2022-04-12
categories: 
  - "ansys"
tags: 
  - "floefd"
  - "仿真"
  - "软件"
---

本教程主要讲如何利用floefd进行仿真，软件采用的是floefd for creo，也就是挂载在creo软件内的floefd，软件安装可以到网上找教程

1\. 首先在creo中打开装配体，然后进入floefd界面，由于是仿真内部流动，所以必须保证仿真模型是封闭的，因此先利用floefd界面创建端盖进行封闭

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412091856.png)

创建好后，会在有缺口处出现封闭盖 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412092513.png)

按照操作把所有面的口都封闭起来，此时就创建好了封闭体

2.然后我们检查是否完成封闭 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412092913.png) 如果没有问题，会出现图中⑤所示，显示模型正常 后续还可以把选项中的改善几何体处理勾选上，来尽量避免出现模型问题 3.之后开始创建向导，进行模型仿真基本配置 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412095304.png) 把单位设置按如图所示进行 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412095453.png) 把我们所需要分析的这几个勾选上，由于辐射相对于对流换热量级小很多，所以这里先忽略，重力需要保证方向是向下的，不对的可以进行调整 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412095749.png) 设置好然后点击下一步 这里流体我们选择空气，然后下一步 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412100202.png) 默认材质选择不锈钢321 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412100335.png) 壁面条件默认绝热即可 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412100411.png) 温度设置为环境温度25℃ ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412100805.png)

此时向导的基本设置就已经设置完成了

4.然后开始设置材料 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412101142.png) 点击进入floefd模型树界面，右键固体材料，选择插入固体材料 然后回到几何模型树，选中对应的几何体，选择相应的材料，命名之后确定 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412101456.png) 按照类似操作把里面所有需要设置材料参数的都设置好 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412101714.png) 设置好的会在固体材料列下面显示

5.设置热源 按如图所示进行插入热源 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412102030.png)

类似材料设置，到几何模型树中选择热源几何体，设置相应的产热参数，选择最大温度作为监控量 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412102327.png) 设置好之后在floefd模型树中单击对应选项也可以看到相应设置情况 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412102608.png)

6.设置边界条件 设置强制入口风扇 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412102946.png) 设置对应参数，这里注意，选择入口面时需要在几何中选择，避免选错 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412103450.png)

设置环境压力出口 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412131449.png) 为了便于选择，可以把原来的外壳先隐藏掉 把所有出入口设置好之后，可以看到，有相应的箭头显示流体流动方向 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412104247.png)

7.设置监控目标 首先添加全局监控目标，总压、温度等，在目标处右键-插入全局目标 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412104507.png) ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412104851.png)

也可单独对某一个固体设置监控，目标右键-插入体积目标-选择对应几何体，自己选择想要监控的参数及几何体 在选择过程中如果出现选择不了对应几何体的话可以切换选择筛选 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412105810.png)

8.设置网格 全局网格右键-编辑定义 按需求设置即可 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412105950.png)

9.运行计算 点击上方运行 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412131659.png) 可以看到已经在计算了 求解完成后可以看到各项已经趋于稳定 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412132036.png)

到结果下面选择表面图-插入表面图 然后选择所需表面，选择温度参数 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412132412.png)

由此我们就可以看到固体表面的温度分布情况 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412132610.png)

同时我们插入迹线图来查看流体情况 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412132925.png)

还可以插入探测值来查看某一点温度 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20220412134030.png)
