---
title: "采集agilent数据时labview运行后无法停止，正在重置vi 问题"
date: 2020-07-03
categories: 
  - "labview"
  - "试验台架"
tags: 
  - "angilent34970a"
  - "labview"
  - "试验台"
---

在使用labview采集agilent数据时，出现启动vi后无法得到相应，同时也无法停止vi，关闭labview后出现正在重置vi问题，这可能是由于你使用labview远程控制agilent时，你的labview一直在等待agilent扫描完成，但agilent一直没收到你labview停止扫描的命令，或者是你命令错误导致，所以labview一直得不到agilent扫描完成的指令，也就只能一直运行着等待扫描完成 ![](http://www.demon1630.cn/wp-content/uploads/2020/07/1593767697-agilent错误1-1024x549.png)

临时解决办法：在agilent采集仪上，将远程控制切换回本地local控制，然后强制关闭Scan扫描

![](http://www.demon1630.cn/wp-content/uploads/2020/07/1593768052-2agilent错误1-1024x768.png)
