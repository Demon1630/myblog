---
title: "初次使用树莓派并启用root管理员（登录root管理员）"
date: 2020-05-11
categories: 
  - "树莓派"
tags: 
  - "树莓派"
---

初次使用树莓派系统时，默认用户是pi ，密码为raspberry。

要想使用root帐号，或者说开启root用户，可使用pi用户登录，执行下面命令（此命令是给root账户设置密码的，当切换到root管理员后，此命令无效）

```plain
sudo passwd root
```

_说明：sudo是linux系统管理指令，是允许系统管理员让普通用户执行一些或者全部的root命令的一个工具，如halt，reboot，su等等_

执行此命令后系统会提示输入两遍的root密码（用来确保你记住了密码）。

接着输入下面命令，用来解锁root账户

```plain
sudo passwd --unlock root
```

用下面命令切换到root管理员

```html
su root
```

会提示输入密码

当从root用户切换到pi用户后，我们再次使用su passwd root来修改密码，会报错

 

![](http://www.demon1630.cn/wp-content/uploads/2020/05/frc-f0304cebbcbed5c9505ff777f4093968.png)

本文来源于互联网:[初次使用树莓派并启用root管理员（登录root管理员）](https://blog.csdn.net/farYang/article/details/50779767)
