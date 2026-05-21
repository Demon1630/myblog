---
title: "【工具】Fiddler使用教程"
date: 2023-07-19
categories: 
  - "推荐软件"
tags: 
  - "软件"
---

   

[](https://link.zhihu.com/?target=https%3A//www.cnblogs.com/hong-fithing/p/7582947.html)

**一、Fiddler简介**

Fiddler是最强大最好用的Web调试工具之一， 它能记录所有客户端和服务器的http和https请求。允许你监视、设置断点、甚至修改输入输出数据。Fiddler包含了一个强大的基于事件脚本的子系统，并且能使用.net语言进行扩展。换言之，你对HTTP 协议越了解，你就能越掌握Fiddler的使用方法。你越使用Fiddler，就越能帮助你了解HTTP协议。Fiddler无论对开发人员或者测试人员来说，都是非常有用的工具。

## **二、Fiddler的工作原理**

Fiddler 是以代理web服务器的形式工作的，它使用代理地址:127.0.0.1，端口:8888。 当Fiddler退出的时候它会自动注销， 这样就不会影响别的程序。不过如果Fiddler非正常退出，这时候因为Fiddler没有自动注销，会造成网页无法访问。 解决的办法是重新启动下Fiddler。

个人理解：fiddler是一个抓包工具，当浏览器访问服务器会形成一个请求，此时，fiddler就处于请求之间，当浏览器发送请求，会先经过fiddler，然后在到服务器；当服务器有返回数据给浏览器显示时，也会先经过fiddler，然后数据才到浏览器中显示，这样一个过程，fiddler就抓取到了请求和响应的整个过程。

正常退出方式：

![](https://pic2.zhimg.com/v2-4981449ce4891e60619abb0f95e517a1_b.jpg)

![](data:image/svg+xml;utf8,\<svg%20xmlns='http://www.w3.org/2000/svg'%20width='325'%20height='250'\>\</svg\>)

<figure>

![](https://pic4.zhimg.com/v2-d1e03a685f8775e499d20728b867f7ef_b.jpg)

![](data:image/svg+xml;utf8,\<svg%20xmlns='http://www.w3.org/2000/svg'%20width='851'%20height='492'\>\</svg\>)

<figcaption>

Fiddler界面

</figcaption>

</figure>

**三、Fiddler抓包解析**

### **1.左侧面板**

<figure>

![](https://pic4.zhimg.com/v2-81026cd6f81aab225e1ab6fa032669e7_b.jpg)

![](data:image/svg+xml;utf8,\<svg%20xmlns='http://www.w3.org/2000/svg'%20width='833'%20height='234'\>\</svg\>)

<figcaption>

Fiddler左侧面板

</figcaption>

</figure>

**抓包工具面板功能**

**#** :HTTP Request的顺序，从1开始，按照页面加载请求的顺序递增。

**Result** : HTTP响应的状态

**Protocol**：请求使用的协议（如HTTP/HTTPS）

**HOST**：请求地址的域名/ip

**URL**：请求的服务器路径和文件名，也包含GET参数

**BODY**：请求的大小，以byte为单位

**Content-Type**：请求响应的类型

**Caching**：请求的缓存过期时间或缓存控制header的值

**Process**：发出此请求的Windows进程及进程ID

**Comments** ：用户通过脚本或者菜单给此session增加的备注

**custom**：用户可以通过脚本设置的自定义值

### **2.右侧面板**

<figure>

![](https://pic1.zhimg.com/v2-299c6a0c8dafb3fb4d38d2f382605150_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/07/frc-3f62cb8ea89909f5a53f52f2a28f3fcd.jpg)

<figcaption>

Fiddler右侧面板

</figcaption>

</figure>

**Statistics统计页签**

通过该页签， 用户可以通过选择多个会话来得来这几个会话的总的信息统计，比如多个请求和传输的字节数。选择第一个请求和最后一个请求， 可获得整个页面加载所消耗的总体时间。从条形图表中还可以分别出哪些请求耗时最多， 从而对页面的访问进行访问速度优化

**inspectors检查页签**

它提供headers、textview、hexview,Raw等多种方式查看单条http请求的请求报文的信息，它分为上下两部分：上部分为HTTP Request（请求）展示，下部分为HTTPResponse（响应）展示

**AutoResponse自动响应页签**

Fiddler最实用的功能， 它可以抓取在线页面保存到本地进行调试， 大大减少了在线调试的困难， 可以让我们修改服务器端返回的数据， 例如让返回都是HTTP404或者读取本地文件作为返回内容。

可设置打开某网页显示自己想要的内容，比如抓取百度链接，点击add rule，设置如下所示：

![](https://pic2.zhimg.com/v2-483c0bf267578e720f34d1a8456d9625_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/07/frc-3dbb9c69568e4f21f7f01c6f03e799a6.jpg)

![](https://pic1.zhimg.com/v2-38747222556fbd56eeebcc8ce4ab45e0_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/07/frc-ec81b5a0740d6fd5f6879ecd2b9ef547.jpg)

到百度页面刷新即可显示该图片

**composer构建页签**

支持手动构建和发送HTTP， HTTPS和FTP请求， 我们还可以从web session列表中拖曳session， 把它放到composer选项卡中， 当我们点击Execute按钮， 把请求发送到服务器端。操作如下图所示：

![](https://pic2.zhimg.com/v2-22b800fb4cd6be36dcc515780d0960e9_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/07/frc-3742b83e96723ac104aa0b2da7191597.jpg)

这样设置发送的请求，就不是浏览器发出的了，而是fiddler发出的，查看inspectors里面的信息便可看出

**log日志页签**： 打印日志

**Filters过滤页签**

过滤器可以对左侧的数据流列表进行过滤， 我们可以标记、 修改或隐藏某些特征的数据流。

![](https://pic4.zhimg.com/v2-b805d15889abc1ad514abcfcaa03ee4f_b.jpg)

![](data:image/svg+xml;utf8,\<svg%20xmlns='http://www.w3.org/2000/svg'%20width='847'%20height='437'\>\</svg\>)

### **过滤功能具体使用**

①选择Filters页签，勾选use Filters勾选 Request Headers 中的 Hide if url contains 过滤项

②在里面输入：REGEX:(?insx)/\[^?/\]\*.(css|ico|jpg|png|gif|bmp|wav)(?.\*)?$

REGEX: 表示启用正则表达式(?insx) 设置正则解释的规则，忽略大小写等。

此表达式表示过滤掉 url 中包括 css、ico、jpg 等后缀的请求

③勾选 Request Headers中的show only if URL contains，在里面输入

REGEX:(?insx).\*.?[http://baidu.com/home](https://link.zhihu.com/?target=http%3A//baidu.com/home).\* 只显示： [http://baidu.com/Home](https://link.zhihu.com/?target=http%3A//baidu.com/Home)

Fiddler过滤指定域名

第二个选项是只监控以下网址，如只监控百度，在下面的输入框里填上[http://www.baidu.com](https://link.zhihu.com/?target=http%3A//www.baidu.com)

“No Host Filter”不设置hosts过滤

“Hide The Following Hosts”隐藏过滤到的域名

“Show Only The Following Hosts”只显示过滤到的域名

“Flag The Following Hosts”标记过滤到的域名

**Timeline时间轴页签**

时间轴，也称为Fiddler的瀑布图，展示网络请求时间的功能。 每个网络请求都会经历域名解析、建立连接、发送请求、接受数据等阶段。把多个请求以时间作为 X 轴， 用图表的形式展现出来， 就形成了瀑布图。 在左侧会话窗口点击一个或多个（同时按下 Ctrl 键），Timeline 便会显示指定内容从服务端传输到客户端的时间

## **四、Fiddler命令行工具**

Fiddler的左下角有一个命令行工具叫做QuickExec,允许你直接输入命令。

常见得命令有：

**help** ： 打开官方的使用页面介绍， 所有的命令都会列出来

**cls** ： 清屏 (Ctrl+x 也可以清屏)

**select** ： 选择会话的命令， 选择所有相应类型select image、select css、select html

**?sometext** ： 查找字符串并高亮显示查找到的会话列表的条目，？[http://qq.com](https://link.zhihu.com/?target=http%3A//qq.com)

**\>size** : 选择请求响应大小小于size字节的会话

**\=status/=method/@host**:查找状态、方法、主机相对应的session会话，=504，=get，@[http://www.qq.com](https://link.zhihu.com/?target=http%3A//www.qq.com)

**quit**：退出fiddler

Bpafter，Bps, bpv, bpm, bpu这几个命令主要用于批量设置断点

Bpafter xxx: 中断 URL 包含指定字符的全部 session 响应

Bps xxx:中断 HTTP 响应状态为指定字符的全部 session 响应。

Bpv xxx:中断指定请求方式的全部 session 响应

Bpm xxx:中断指定请求方式的全部 session 响应，等同于bpv xxx

Bpu xxx:与bpafter类似。

## **五、Fiddler手机抓包**

①启动Fiddler， 打开菜单栏中的 Tools > Fiddler Options， 打开“FiddlerOptions” 对话框

②在“Fiddler Options”对话框切换到“Connections” 选项卡， 然后勾选“Allowromote computers to connect” 后面的复选框， 然后点击“OK” 按钮

③在本机命令行输入： ipconfig， 找到本机的ip地址。

④打开android设备的“设置” ->“WLAN”，找到你要连接的网络，在上面长按，然后选择“修改网络”，弹出网络设置对话框，然后勾选“显示高级选项”（不同的手机，设置方法有所不同）

⑤在“代理” 后面的输入框选择“手动”，在“代理服务器主机名”后面的输入框输入电脑的ip地址，在“代理服务器端口”后面的输入框输入8888， 然后点击“保存” 按钮

⑥然后启动android设备中的浏览器，访问百度的首页，在fiddler中可以看到完成的请求和响应数据

![](https://pic1.zhimg.com/v2-295ec619f482e57ce9fd956ec2d44030_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/07/frc-62fc9825c535cde62fef8d134c4bbc6c.jpg)

**备注**： 如果是Android模拟器中ip要填写10.0.2.2，genymotion模拟器中ip要填写:10.0.3.2，手机实机中ip填电脑的ip，端口就是burp或者fiddler监听的端口 ，要处于同一网络下

只过滤手机接口且不影响电脑网络设置：

1.在电脑运行窗口中，输入Cmd 查找到电脑的Ip地址和计算机名。查找Ip：Ipconfig ，查看计算机名：set computername

2.在 Fiddler 的 QuickExec 区块，输入以下指令，并按下 Enter 确认。

prefs set fiddler.network.proxy.registrationhostname +你的电脑名称(刚才查询的)

![](https://pic4.zhimg.com/v2-efd356f3425b28559f2c6b26faef694f_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/07/frc-3cd5ed3df4e5f2e0898eabc2a88bf3f1.jpg)
