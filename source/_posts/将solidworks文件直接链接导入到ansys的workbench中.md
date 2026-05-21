---
title: "将solidworks文件直接链接导入到ansys的workbench中"
date: 2021-09-21
categories: 
  - "技术"
  - "推荐软件"
tags: 
  - "ansys"
  - "solidworks"
  - "workbench"
---

使用ansys中的workbench进行仿真分析的时候，绘制三维结构可以使用ansys自带的SpaceClaim或者DesignModeler，默认双击打开的是SpaceClaim，右键可以选择使用DesignModeler。这两个软件虽然都可以绘制三维输出到ansys后续仿真过程中 ![](https://i.loli.net/2021/09/21/O8sxCcG9i2MvrL6.png)

但有时候我们的零部件是使用solidworks绘制的，或者太过复杂的结构使用ansys中的这两个软件绘制也很麻烦，这时候就要使用solidworks将绘制好的三维输出到ansys中，用于后续的网格划分和仿真分析。

通常可以将solidworks绘制好文件，然后保存为通用格式输入到DesignModeler中进行进一步结构优化，消除一些不封闭的面，或者直接输入到workbench中，文件格式通常是step，但也可以直接将solidworks与ansys接口连接起来，直接从solidworks中输出到workbench

首先使用使用ansys自带的CAD config manager，打开这个软件：

![](https://i.loli.net/2021/09/21/R3iG6hrLxZvnFAo.png)

注意：要使用管理员模式打开，否则后续会出错误

打开后可以看到可以链接到ansys的一些二维三维软件，找到solidworks并勾选上

![](https://i.loli.net/2021/09/21/4Gpu7EODLFxbeCz.png) 然后点击下一个

![](https://i.loli.net/2021/09/21/OciHLJrE3lT8k1S.png) 点击配置选定的CAD界面，此时就可以看到配置链接成功的提示，然后退出，打开solidworks就可以看到与ansys的接口了

![](https://i.loli.net/2021/09/21/YWCkKQTfU1MZuc7.png) 注意：solidworks 中的文件必须先保存才能输入到ansys中的workbench中，输入成功后会自动打开workbench，里面结构已经更新完了

![](https://i.loli.net/2021/09/21/Wt7Ygd6QN9bhezs.png)

之后我们就可以将其输出到下一步的网格划分等步骤去

使用这种接口连接的方式，可以省去导入导出，较为方便，但如果绘制的solidworks文件中存在一些不闭合的面或线等，可能会在后续网格划分中出问题，这时候就需要先对三维结构进行一些提前处理，这个下次再介绍
