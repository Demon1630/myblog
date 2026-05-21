---
title: "树莓派3 GPIO 介绍及 RPi.GPIO 库的使用"
date: 2020-06-21
categories: 
  - "wordpress"
---

下图中的40个引脚就是 GPIO 了，把 官方文档 中的介绍总结了一下。

![](http://www.demon1630.cn/wp-content/uploads/2020/06/frc-981774ae586dbc8ae7362a91124de631.jpg)

GPIO (General Purpose Input/Output) 的意思就是 **通用型输入输出**，可以使用 python 的第三方库 RPi.GPIO 进行控制。

下面是画的非常好的 GPIO 模块的引脚图

  

![](http://www.demon1630.cn/wp-content/uploads/2020/06/frc-1f19a9d8813eaec536a00e3818e671bc.png)

一眼望去编号顺序是乱的，但颜色和用途对应的很清楚。

亮黄色是 GPIO，白色的引脚对初学者来说用不上。其他颜色都是**电源**引脚和**地**引脚。

**电源**和**地**不用多说，3.3v 就是 3.3v输出，5v 就是 5v输出 ，地就是地。我们没办法通过软件编程的方法对它们进行设置，这也是为什么它们没有编号。

能软件编程的就是亮黄色的 GPIO 引脚了。

它们有两种基本用法：

1.设置为输出，输出高电平(3.3v)或输出低电平(0v)；

2.设置为输入，这时可以接收信号，这一信号不光可以来自机械开关，还可以是各式各样的传感器或另一台电脑或其他设备。

  

下面是一个使用 RPi.GPIO 库对 GPIO 引脚进行设置的程序，但先看一下它的另一套引脚编号 吧。

PS：将 GPIO 连接到超过 3.3v 的电压上，可能会烧毁 GPIO 模块。

* * *

GPIO 还有另一套引脚编号，是 physical numbers 。如下：

  

![](http://www.demon1630.cn/wp-content/uploads/2020/06/frc-a53f5adf2b12ac6ed0df4f31cc887c1f.png)

它是有规则的，从下往上数就行了。

#### 应该用哪一种？

physical numbers 更简单一点，但推荐使用最开始提到的 GPIO numbers，很多资源都使用这一系统。而且你熟悉之后，就会觉得它并没有那么麻烦。

你使用的哪种编程语言，对选择编号系统也有影响。对 Scratch GPIO , 你只能选用 physical numbers  ; 对 python GPIO，你可以在两种编号系统中选择。

* * *

  

### 使用 RPi.GPIO 进行 GPIO 口的简单控制

这个程序点亮或熄灭一个二极管。电路很简单，如下图。（官方文档中的彩色引脚图不会画，凑合看吧。。）

  

![](http://www.demon1630.cn/wp-content/uploads/2020/06/frc-04c20bfc2053accd65337013d8961a4e.png)

看电路图我们知道只要让 2 脚输出高电平，3 脚输出低电平，LED就会亮了。

但要使用 RPi.GPIO 库完成这一动作的话，就要遵循一定的步骤。

#编程环境是 Raspbian 系统自带的 python3.4 IDLE。

先要导入

> import RPi.GPIO as GPIO

  

然后选择 GPIO numbers 编号系统。

#BCM 对应 GPIO numbers , BOARD 对应 physical numbers。 

> GPIO.setmod(GPIO.BCM)

  

把引脚 2 、3 设置为输出模式

>   
> 
> GPIO.setup(2,GPIO.OUT)
> 
>   
> 
> GPIO.setup(3,GPIO.OUT)
> 
>   

  

让引脚 2 输出高电平，引脚 3 输出低电平。 True 为高电平，False 为低电平。

>   
> 
> GPIO.output(2,True)
> 
>   
> 
> GPIO.output(3,False)
> 
>   

_如果你是在 python 中的交互式命令行中输入代码，那么可能输入倒数第二行代码后 LED 就亮了，尽管此时只把引脚 2 设为了高电平。这可能是因为就算你不设置引脚的输出状态，GPIO 引脚也会输出默认值。而 3 脚的默认值可能就是低电平。_

测试：

>   
> 
> 给 3 脚 True ， LED 熄灭。
> 
>   
> 
> 给 3 脚 False ， LED 点亮。
> 
>   

这就说明程序可以控制 GPIO 口了 。自己试下吧~

* * *

如果在导入 GPIO 包时出现这个错误：No module named 'RPI'

是因为 GPIO 包的名字是  RPi.GPIO  ，i  是小写。
