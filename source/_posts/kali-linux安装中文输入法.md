---
title: Kali Linux安装中文输入法
date: 2021-01-08
categories:
- kali-linux
tags:
- kali-linux
---
# Kali Linux安装中文输入法

Kali Linux系统安装后，默认没有中文输入法。如果用户需要输入汉字，则需要安装中文输入法。下面将介绍安装小企鹅中文输入法，并进行配置。操作步骤如下所示：

（1）安装小企鹅中文输入法。执行命令如下所示：

apt-get  install  fcitx-table-wbpy  fonts-wqy-microhei  fonts-wqy-zenhei -y

（2）启动输入法。执行命令如所示：

fcitx

（3）设置环境变量。修改~/.bashrc文件，添加以下内容。如下所示：

export XMODIFIERS="@im=fcitx"

export XIM=fcitx

export XIM\_PROGRAM=fcitx

（4）重新启动系统，即可使用小企鹅中文输入法。其中，默认使用“Ctrl+空格”切换输入法。如果不想要使用默认设置，在程序中搜索fcitx配置并启动，即可修改快捷键。
