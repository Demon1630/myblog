---
title: '[日常踩坑系类] Python pip安装时，报错ValueError: check_hostname requires server_hostname'
date: 2021-06-27
categories:
- 技术
tags:
- python
- 故障排查
---
## 现象

换了台新环境，安装第三方库老是报错，如图：  
ValueError: check\_hostname requires server\_hostname  
![](http://www.demon1630.cn/wp-content/uploads/2021/06/frc-6eac5c7b1c50c31cad87e5282f9ae6b1.png)

## 处理方法

网上查找资料，关闭代理，解决！  
Proxy->use a proxy server  
中文：代理->使用代理（关闭）  
![](http://www.demon1630.cn/wp-content/uploads/2021/06/frc-b20aee97b6b4247b902a7145bdf712ea.png)

## 再次安装，成功

![](http://www.demon1630.cn/wp-content/uploads/2021/06/frc-7d14c4059e5809d2c6ab5953760af25a.png)

文章来源于互联网:[\[日常踩坑系类\] Python pip安装时，报错ValueError: check\_hostname requires server\_hostname](https://blog.csdn.net/bl_yang/article/details/116742097)
