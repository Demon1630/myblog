---
title: "搬瓦工免费及付费更改被封或未被封ip地址方法"
date: 2019-09-04
categories: 
  - "搬瓦工"
tags: 
  - "搬瓦工"
  - "网站"
  - "邮件"
---

## 如何更改搬瓦工ip地址

在购买搬瓦工之后，可能大部分人是用于搭建梯子，但由于使用不当或者受到牵连，可能由于不可抗拒的原因，会导致原有的搬瓦工ip被禁，或者可能有时候自己想更换ip等，这时候需要进行ip地址更换，主要有免费及付费方法。

所以有两种情况，第一种是ip未被封，第二种是ip已经被封，对于这两种情况的解决方法是不一样的。

### 第一种情况下，ip未被封

这时候更换ip地址就很简单了，首先登入搬瓦工后台，如何登入搬瓦工后台请看[搬瓦工VPS购买](http://www.demon1630.cn/搬瓦工vps购买/)这篇文章，进入后台后如图所示：

![](http://www.demon1630.cn/wp-content/uploads/2019/09/后台更换ip-1024x508.png)

 

选择Migrate to another DC:

![](https://www.demon1630.cf/wp-content/uploads/2019/09/更换ip-1024x473.png)

这里面可以看到搬瓦工在不同地区的机房，同时显示如果更换机房的话会改变ip地址，所以通过更换机房所在地可以实现更换ip的目的。这里推荐使用CN2机房，因为目前来说搬瓦工机房排序是：

**HK > DC6 CN2 GIA-E ≈ DC9 CN2 GIA > DC8 CN2 > DC3 CN2 > DC2 QNET ≈ DC4 MCOM**

这主要是根据访问速度等来进行测试的，但选择CN2机房会使得原有流量变为原来的0.33，如图所示，这是因为CN2机房的价格 本来就与普通机房的价格不一样，所以如果一开始购买的不是CN2机房的话，迁移到CN2机房会导致流量变为原来的0.33，所以这也看个人需求。如果ip未被封，按照此方法迁移完成后就可实现更改ip的目的。

### 第二种情况，IP被封

一旦出现ip被封，此时是无法根据此方法进行更换ip的，这时候更换ip会出现报错：

 Migration backend is currently not available for this VPS. Please try again in 10-15 minutes. (734152)

此时ip被封后不管怎么迁移都会报错，显示无法迁移成功，至于如何检测是否是ip被封，可以参考文章如何检测[搬瓦工ip或端口被封](https://www.bandwagonhost.net/1934.html)

 

如果确定是ip被封，此时就需要用其他办法来更换ip了，毕竟不可能就这样放弃。

此时可以登入搬瓦工后台后访问：[https://kiwivm.64clouds.com/main-exec.php?mode=blacklistcheck](https://kiwivm.64clouds.com/main-exec.php?mode=blacklistcheck) ，这是搬瓦工检测是否ip被封的网站，检测结果如果出现 **IP BLOCKED**，就是被封了，出现 **IP NOT BLOCKED**，就是没被封。

显示被封之后，搬瓦工有免费换被封IP的服务，每隔 70 天可以免费更换一次被封IP地址。注意事项：

- **首次申请免费更换IP没有时间限制**。也就是说，如果你买完第二天就因为使用不当被封了，那你第二天就能直接申请免费更换IP。
- 第二次以及之后的免费更换IP，需要在上一次更换的时间点之后的 70 天。
- 只有被封的IP才能申请免费更换（同时需要满足上面的时间限制），没有被封的IP没法申请免费更换。

如果 IP 被封，在上面步骤访问[https://kiwivm.64clouds.com/main-exec.php?mode=blacklistcheck](https://kiwivm.64clouds.com/main-exec.php?mode=blacklistcheck)后出现**IP BLOCKED,**同时还会出现 Replace Main IP 的字样，点击进行更换即可：

![](http://www.demon1630.cn/wp-content/uploads/2019/09/被封ip-1024x242.png)

![](https://www.demon1630.cf/wp-content/uploads/2019/09/被封ip-1024x242.png)当然如果免费更换ip时限未到，有时候可能过一个多月也有可能ip会被解封，或等到可以免费更换ip后再进行更换，当然不想等那么久，还可以进行付费更换ip，访问[https://bwh88.net/ipchange.php](https://bwh88.net/ipchange.php)后可以看到：

![](http://www.demon1630.cn/wp-content/uploads/2019/09/付费更换ip-1024x657.png)

![](https://www.demon1630.cf/wp-content/uploads/2019/09/付费更换ip-1024x657.png)点击Request IP Change提交申请即可，价格在8~9美元之间波动，提交申请之后会有工作人员给你更换ip，一般在24小时之内会更换好，到时候会发邮件通知。

以上就是免费更换ip及付费更换ip的方法！
