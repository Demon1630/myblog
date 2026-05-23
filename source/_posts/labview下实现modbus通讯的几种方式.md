---
title: LabVIEW下实现Modbus通讯的几种方式
date: 2020-07-30
categories:
- labview
- 技术
tags:
- labview
- 控制
---
## 1\. Modbus简介

Modbus是Modicon公司（现在已经被施耐德收购成为了施耐德旗下品牌）为其PLC通讯而开发的一种通讯协议，从1979年问世至今，已经成为工业通讯领域的业界标准（De facto)，最初的Modbus通讯协议仅支持串口，分为Modbus RTU和ACSII两种信号传输模式（一般基于RS485串口通信媒介），而随着时代进步，Modbus也与时俱进，新增了Modbus TCP版本，可以通过以太网进行通讯，此外，Modbus还有一个Modicon专用的Modbus Plus（Modbus +）版本。和其他工业通信协议相比，Modbus主要的优点包括内容公开没有版权要求，不用支付额外费用、硬件要求简单容易部署、使用广泛便于系统集成。Modbus采用半双工的通讯方式，由1个子站和多个从站组成，允许多个设备连接在同一个网络上进行通讯。

## 2\. LabVIEW实现Modbus通讯的方式

针对Modbus的串口和TCP两种不同的方式，在LabVIEW中通常可以通过以下几种方法实现Modbus通讯。其中一些实现方式需要安装LabVIEW 数据记录与监控（DSC）模块.

- Modbus RTU/ASCII的实现方式
- 通过VISA直接进行串口操作实现
- 通过LabVIEW DSC模块中的Modbus模块实现
- 通过LabVIEW DSC模块中的OPC模块实现
- Modbus TCP
- 通过LabVIEW标准的TCP模块实现
- 通过LabVIEW DSC模块中的Modbus模块实现
- 通过LabVIEW DSC模块中的OPC模块实现

以下就几种实现方式进行示例与说明。

## 3\. LabVIEW通过VISA实现Modbus串口通信

VISA（ Virtual Instrument Software Architecture，虚拟仪器软件架构），是美国国家仪器公司（NI）推出的通用串行通讯软件，最初用于NI公司LabVIEW等软件与串行设备进行通讯，现在已成为工业通讯的标准之一。通过VISA通讯时，软件会自动扫描机器中的串口资源供选择，对于没有串口的笔记本电脑，则通常需要通过USB-RS485的转换线来实现虚拟串口。找到串口后，建立必要的VISA资源，然后在此基础上进行通讯。采用VISA通讯时串口通讯的数据以及CRC校验值等均需要自行计算并保证准确，否则可能导致通讯失败。采用LabVIEW的VISA实现Modbus的程序示例如下图。

![](https://pic1.zhimg.com/v2-5606274bfa5258236fde17187ed1d04c_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2020/07/frc-1010f4e3a13ea32fb1288caad6350f34.jpg)

![](https://pic2.zhimg.com/v2-dedc1ff0a63447f74b0bd40b35431e0d_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2020/07/frc-608456a052ca8b7af8fcec51a4e2d216.jpg)

## 4\. LabVIEW通过Modbus模块实现Modbus通讯

在安装了DSC扩展包后，在LabVIEW下实现Modbus通讯最方便的方法是采用Modbus模块。这时只需要选择相应的命令模块即可实现通讯与命令，而不需要自行写入相应的字符串命令。采用Modbus模块的时，可方便地在RTU和TCP两种协议中转换，根据需要选择不同协议。这是LabVIEW多态的一个非常好的示例。程序见下图。

![](https://pic3.zhimg.com/v2-b30be4a7eef68b5131dae76ee2146f2f_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2020/07/frc-b39cc72b6572174256b2e995a0d1ffc0.jpg)

![](https://pic1.zhimg.com/v2-86b520801b37995b0aab43feb2953494_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2020/07/frc-0e7abbef0595d92b952f82caebb32c39.jpg)

## 5.LabVIEW 采用TCP模块实现Modbus通讯

在没有DSC模块的情况下，或是有特殊要求的时候，也可以直接使用LabVIEW内置的TCP模块编写Modbus通信程序。其过程与采用Modbus模块比较相似，只是在第一步建立连接时要指定Modbus通讯端口等参数，默认情况下Modbus TCP使用502端口。如果通讯不上，有必要检查防火墙是否允许该端口通讯。采用TCP模块实现Modbus通讯的程序如下。

![](https://pic3.zhimg.com/v2-99ba2a499a2f844ca4b9f0e9fb5006f1_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2020/07/frc-0aea3cbaca60bf0889b2ef993392daf8.jpg)

![](https://pic3.zhimg.com/v2-88c02cf5d07256b138f86e8dc620b3f3_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2020/07/frc-bd8de133fe71d86523848f99b1dcc5c2.jpg)

## 6\. LabVIEW采用OPC协议实现Modbus通信

OPC全称是OLE for Process Control，用于过程控制的OLE协议。OLE是Object Linking and Embedding，对象连接与嵌入的缩写，这是基于微软的COM技术实现数据交换的一个协议。COM指的不是互联网域名的.com，是Component Object Model（部件对象模型）的缩写——这一段解释真拗口，简言之在OPC协议出现前，工业设备之间的通讯非常繁琐复杂，而OPC将这一过程大大简化，通过OPC协议可以将各种基于不同协议的工业设备连接起来。当然，OPC协议也有一定的代价，通讯速度与可靠性、实时性都没有原生协议好。因此，在可以通过原生协议完成通讯的情况下，应尽量避免采用OPC。

OPC协议的实现要通过两部分完成。首先是OPC服务器，这是软件程序与不同协议下工业设备通讯的中间件，相当于网关。在OPC服务器下设置要连接的工业设备，把需要读/写的变量设置在其中，供OPC客户端访问。通过LabVIEW编程实现的部分相当于OPC客户端，用于从OPC服务器端读写数据。关于LabVIEW下使用OPC协议的通讯办法，NI官方有详细的文档资料。搭建的OPC服务器示意如下。

![](https://pic4.zhimg.com/v2-00521b1e204120da5282f50b3998032a_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2020/07/frc-a565ee1900fd8c7c126b18fdb542e37a.jpg)

## 结语

Modbus协议作为一种通用的工业通讯标准，在业界得到非常广泛的应用，LabVIEW作为NI公司主力产品，同样有着相当广泛的用途，采用LabVIEW实现Modbus通讯协议，在实践中有着非常重要的意义。
