---
title: "kali linux使用apt-get更新全过程"
date: 2021-01-11
categories: 
  - "kali-linux"
tags: 
  - "kali-linux"
  - "tor"
---

### _0x00 修改更新源_

```
:~#vim /etc/apt/sources.list          //使用vim编辑器打开更新源文件
```

修改之前可以先备份

```
:~#copy /etc/apt/sources.list /etc/apt/sources.list.bak //
```

将旧的更新源使用'#'注释掉 在以下更新源中选择一个复制

> 中科大 deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
> 
> 阿里云 deb http://mirrors.aliyun.com/kali kali-rolling main non-free contrib deb-src http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
> 
> 清华大学 deb http://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free deb-src https://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free
> 
> 浙大 deb http://mirrors.zju.edu.cn/kali kali-rolling main contrib non-free deb-src http://mirrors.zju.edu.cn/kali kali-rolling main contrib non-free
> 
> 官方源 deb http://http.kali.org/kali kali-rolling main non-free contrib deb-src http://http.kali.org/kali kali-rolling main non-free contrib

使用:wq保存退出

* * *

### _0x01 使用更新源进行软件和系统的升级_

```
:~#sudo apt-get update 
//同步 /etc/apt/sources.list 和 /etc/apt/sources.list.d 中列出的源的索引这样才能获取到最新的软件包
//只是更新apt的资源列表
:~#sudo apt-get upgrade 
:~#sudo apt-get dist-upgrade 
//通常情况下将两个放一起处理
```

> **tips**: apt-get upgrade 和 apt-get dist-upgrade 本质上是没有什么不同的。 只不过，dist-upgrade 会识别出当依赖关系改变的情形并作出处理，而upgrade对此情形不处理。 例如软件包 a 原先依赖 b c d，但是在源里面可能已经升级了，现在是 a 依赖 b c e。这种情况下，dist-upgrade 会删除 d 安装 e，并把 a 软件包升级，而 upgrade 会认为依赖关系改变而拒绝升级 a 软件包。 **from** :https://www.cnblogs.com/kungfupanda/archive/2013/01/15/2861718.html

* * *

### _0x02 删除旧文件和缓存文件_

```
:~#sudo apt-get autoclean //清理旧版本的软件缓存
:~#sudo apt-get clean //清理所有软件缓存
:~#sudo apt-get autoremove //删除系统不再使用的孤立软件
```
