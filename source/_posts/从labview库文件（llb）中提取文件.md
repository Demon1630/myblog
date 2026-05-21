---
title: "从LabVIEW库文件（LLB）中提取文件"
date: 2020-12-21
categories: 
  - "labview"
tags: 
  - "labview"
---

有时候想把llb库中所有的VI提取出来该怎么办

首先先双击该llb文件，打开llb管理器

![](http://www.demon1630.cn/wp-content/uploads/2020/12/1608531418-llb解压1-1024x745.png)

里面可以看到所有的vi，然后点击返回上一级

![](http://www.demon1630.cn/wp-content/uploads/2020/12/1608531564-llb解压2.png)

选中该llb，然后转录该llb

![](http://www.demon1630.cn/wp-content/uploads/2020/12/1608531854-llb解压3.png)

之后就可以把llb里面的vi都提取出来，然后把提取出来vi的文件夹放到user.lib里面就可以到labview程序中的用户库中调用了

转录的时候如果选择“使用.LLX扩展名备份”作为原始LLB的选项，则可以通过把扩展名从.llx重命名为.llb将LLX文件恢复为LLB原始文件
