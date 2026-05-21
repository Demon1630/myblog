---
title: "跳动的心-Font Awesome 图标源码"
date: 2020-10-17
categories: 
  - "技术"
  - "wordpress"
tags: 
  - "图标"
  - "网站建设"
---

有女朋友的可以来看了，实现使用Font Awesome的爱心图标跳动

```
<i class="fa fa-heartbeat" style="font-size:36px;color:red" id="myheart" ><link type="text/css" rel="stylesheet" href="animate.css" /></i>
```

把这段代码加入到footer.php文件中关于页脚的合适位置，

再添加一个animate.css文件

添加如下代码：

```
@keyframes heartAnimate{ 
    0%,100%{transform:scale(1);}                     /*0%,100%时保持图形的原大小*/
    10%,30%{transform: scale(0.9);}                 /*10%,30%时图形缩小成0.9倍*/
    20%,40%,60%,80%{transform:scale(1.1);}          /*20%,40%,60%,80%时图形扩大成1.1倍*/
    50%,70%{ transform:scale(1.1);}                 /*50%,70%时图形扩大成1.1倍*/
}
#myheart{
     color:red;                             /*心当然要是红色的啦*/
    animation: heartAnimate 1s infinite;       /*心当然要是跳动的啦*/
}
```

就可以实现在页脚上加上跳动的心了，详细可以查看我的页脚

![](http://www.demon1630.cn/wp-content/uploads/2020/10/1602947885-跳动的心.png)
