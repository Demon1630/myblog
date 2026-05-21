---
title: "Kali-Linux-2020.1 设置中文，汉化。"
date: 2021-01-11
categories: 
  - "kali-linux"
tags: 
  - "kali-linux"
---

 

# Kali-Linux-2020.1 设置中文，汉化。

```
Kali Linux团队在Twitter上宣布：“新的一年是进行重大改变的好时机，因此，我们宣布在  
即将发布的2020.1版本中，Kali安全模型也将进行重大改革——默认非root用户。”
```

所以使用kali之前版本的汉化方法可能会出现权限问题。(注意:汉化前先换源，不然可能会出问题。)

1. kali 2020.1 汉化
    
    打开终端，输入：

`sudo dpkg-reconfigure locales`

这时可能会让你输入root密码 ，默认的密码是：kali

然后选择字符编码： en\_US.UTF-8（要完全汉化的话把这个去掉，如果只是想解决中文乱码就留着）、zh\_CN.GBK、zh\_CN.UTF-8 （用空格选定）

接着选择字符： zh\_CN.UTF-8

2. 解决编码错误显示问题,终端输入：

`sudo apt-get install ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy`

设置完之后输入：

`sudo reboot`

重启就好了。 ![](http://www.demon1630.cn/wp-content/uploads/2021/01/frc-28fe4bc43060061996dde07a1a88b53a.png) 附：[Kali-Linux-2020.2 设置中文，汉化及换源方法](https://blog.csdn.net/weixin_44823747/article/details/107477695?utm_medium=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param)

文章来源于互联网:[Kali-Linux-2020.1 设置中文，汉化。](https://blog.csdn.net/weixin_44823747/article/details/104173742)
