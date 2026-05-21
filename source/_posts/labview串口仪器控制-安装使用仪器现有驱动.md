---
title: "LabVIEW串口仪器控制—安装使用仪器现有驱动"
date: 2020-05-18
categories: 
  - "labview"
  - "技术"
tags: 
  - "labview"
  - "网站"
---

## 声明：很多仪器是没有驱动的。所以，具体问题具体分析。

另外声明：所谓的驱动，也就是[封装](http://bbs.elecfans.com/zhuti_packaging_1.html)好的底层的串口[通信](http://bbs.elecfans.com/zhuti_wireless_1.html)程序，也是程序而已，只不过别人帮你做成了子 VI，让自己容易用。

所以：不要弄混淆了概念。

国外的很多仪器，都是有现成的 LV 程序驱动的，这个时候，我们到网上搜搜就行了。如果你要做仪器驱动，你最好先到网上搜搜，看有木有现成的。有现成的，开发速度就好多啦。如果手边的仪器搜不到现成的驱动，那就只能自己写了。

下面讲解怎么安装现成的驱动。 ①，网站下载篇，前面这个帖子讲了。 [http://bbs.elecfans.com/jishu\_467276\_1\_1.html](http://bbs.elecfans.com/jishu_467276_1_1.html) 有兴趣可以看看。 下面是通过 LabVIEW 软件下载。 我下面手把手教下 在 LV 软件里下载安装。

首先在 LV 的帮助菜单里，找到 查找仪器驱动 <ignore\_js\_op>![](http://bbs.elecfans.com/data/attachment/forum/201501/23/145320o40k6u5ba5j074q9.jpg.thumb.jpg)

然后就会弹出一个仪器查找界面。如果你已经连接好了仪器的硬件，且仪器支持IDN？ 这个 SCPI 指令的话。

可以使用扫描仪器按钮，扫描一下你的仪器。因为使用那个指令，如果仪器连接好没错误，会返回一个仪器本身的仪器类型和版本的。这个时候，LV 就知道是什么仪器连接到了。这个需要查仪器说明书指令。 <ignore\_js\_op>![](http://bbs.elecfans.com/data/attachment/forum/201501/23/145425igqznznml30yzoro.jpg.thumb.jpg)

如果仪器木有连接好，或者没扫描出来（没扫描出来原因太多了。没装 VISA 驱动，电缆没连接好，仪器参数不对等。）自己想下载驱动。就自己选型号了，见下图。选型号，然后点击搜索。

我们下面搜索 Keithley2400.好了，点击搜索。 <ignore\_js\_op>![](http://bbs.elecfans.com/data/attachment/forum/201501/23/145525prt5qtozqkkkzp5a.jpg.thumb.jpg)

然后会搜出来。注意看右边的驱动信息。开发环境，版本，还有支持的接口等。 <ignore\_js\_op>![](http://bbs.elecfans.com/data/attachment/forum/201501/23/145626t2ooavzqa972roob.jpg.thumb.jpg)

从上图可以看出，这个仪器支持串口和 GPIB 口。还有支持的型号，有 2400，2410 等。 <ignore\_js\_op>![](http://bbs.elecfans.com/data/attachment/forum/201501/23/145704p5dddrdpdvnqyct5.jpg.thumb.jpg)

找到了驱动后，就点击安装，然后 LV 会自动给你安装到 instr.lib 文件夹下面。然后就可以在程序面板，仪器 IO 里，找到自己的驱动了。然后就可以调用了。 <ignore\_js\_op>![](http://bbs.elecfans.com/data/attachment/forum/201501/23/145757jtkndl63zqqqdaw7.jpg.thumb.jpg)

每个仪器驱动，会提供对应的调用例子，大家看下例子，大概知道怎么用就好了。有时候，自己把例子稍微改动一点点，就变成自己的程序了。还是很方便的。有仪器驱动，还是先看仪器。不然看仪器的 SCPI 指令是很麻烦的，一本说明书往往很长，而且大多是英文的。

下载好的驱动和例子，在这个地址：你安装的文件夹下下的这个路径。\\Na[ti](http://bbs.elecfans.com/zhuti_715_1.html)onal Instruments\\LabVIEW 2011\\instr.lib <ignore\_js\_op>![](http://bbs.elecfans.com/data/attachment/forum/201501/23/145953iiii9xqjv28s8iix.jpg.thumb.jpg)

仪器的例子，在上面的文件夹 Example下，自己连接仪器，配置程序参数和仪器的通讯参数，运行试试看。

参数什么的，最好对着说明书看看，国外的仪器，一般功能很强大，而你需要了解的命令，可能一点点而已。

声明：国外的仪器，有些有驱动（程序）的，有些是木有的。有现成的驱动仪器，最好使用现成的，这样开发速度更快。

文章来源于：

## [小草手把手教你LabVIEW串口仪器控制—安装使用仪器现有驱动](https://www.cnblogs.com/mrchige/p/6238027.html)
