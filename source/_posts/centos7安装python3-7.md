---
title: centos7安装python3.7和部分库
date: 2021-06-14
categories:
- python
tags:
- python
- python3
- telegram
---
按照命令一步步来，实在不行重装系统后再重新开始安装

## 先配置安装环境

在根目录上执行，先切换到根目录：cd /

```
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel
```

```
yum install libffi-devel -y
```

## 下载安装包

切换目录到 你的root目录下：  #：cd /root

```
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
```

```
tar -xvJf  Python-3.7.0.tar.xz
```

（如果你的环境没有安装 wget 的话，下载时可能会报错：：：**\-bash: wget: command not found**

\-----解决方法：先安装再下载python3 ：#：yum -y install wget）

## 开始编译安装

```
mkdir /usr/local/python3
```

```
cd Python-3.7.0
```

```
./configure --prefix=/usr/local/python3
```

（注： 当你输入上面的命令执行时，可能会报错：**configure: error: no acceptable C compiler found in $PATH**

\------解决办法：安装 gcc 环境 ：yum install -y gcc   ，安装成功后重新执行  #：./configure --prefix=/usr/python）

```
make && make install   
```

## 创建软件连接

```
ln -s /usr/local/python3/bin/python3 /usr/local/bin/python3
```

```
ln -s /usr/local/python3/bin/pip3 /usr/local/bin/pip3
```

此时已经安装完成，使用命令查看

```
python3 --version
```

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614163236.png)

 

## 升级pip3

```
python3 -m pip install --upgrade pip
```

 

安装requests库

```
pip3 install requests
```

安装bs4

```
pip3 install beautifulsoup4
```

安装fake\_useragent

```
pip3 install fake_useragent
```

安装telegram

```
pip3 install python-telegram-bot
```

安装smtplib

```
pip3 install PyEmail
```

安装openpyxl

```
pip3 install openpyxl
```

安装wordcloud

```
pip3 install wordcloud
```

安装jieba

```
pip3 install jieba
```

安装selenium

pip3 install selenium
