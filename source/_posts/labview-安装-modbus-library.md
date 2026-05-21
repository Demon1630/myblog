---
title: "labview 安装 modbus Library"
date: 2020-06-29
categories: 
  - "labview"
  - "技术"
tags: 
  - "labview"
---

Modbus是工业通信中常用的协议。若要进行数据端口通讯读取，经常需要安装modbus library

安装可以直接使用VIPM（vi package manage）来安装，前面文章已经介绍了[如何安装VIPM](http://www.demon1630.cn/labview%e5%ae%89%e8%a3%85visa%e5%8f%8a%e7%9b%b8%e5%ba%94%e6%89%a9%e5%b1%95%e5%8c%85/)

打开VIPM，搜索modbus

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1593448433-modbus1.png)

选择进行安装即可

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1593448490-modbus2.png)

选择接受

之后重启labview就可以看到安装的modbus library

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1593448752-modbus4-1024x549.png)

但是这样安装的library里面有很多vi没有，所以想要更多的vi，可以直接下载ni modbus.llb，然后导入到用户库中即可

到官网[http://www.ni.com/example/29756/en/](http://www.ni.com/example/29756/en/)

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1593449225-modbus5-1024x513.png)

下载后解压

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1593449463-modbus6.png)

找到里面的这个NI Modbus.llb文件，把它复制到labview安装目录的usr.lib文件夹中

然后重启labview就可以到用户库中看到所有的vi

![](http://www.demon1630.cn/wp-content/uploads/2020/06/1593449676-modbus7-1024x549.png)

里面包含大部分要用到的vi
