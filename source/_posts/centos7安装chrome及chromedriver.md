---
title: "Centos7安装chrome及chromedriver"
date: 2021-12-02
categories: 
  - "技术"
tags: 
  - "python"
---

服务器上部署了Centos7，在学习selenium过程中，为实现在centos7服务器上也能用selenium调用浏览器，需要给centos7安装chrome，首先安装google的epel源

```
vi /etc/yum.repos.d/google.repo
[google]
name=Google-x86_64
baseurl=http://dl.google.com/linux/rpm/stable/x86_64
enabled=1
gpgcheck=0
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub 
```

**yum update , 然后yum install google-chrome-stable**

正常来说已经安装好chrome了，之后还需下载chromedriver

首先查看服务器中chrome版本：google-chrome --version

![](https://i.loli.net/2021/11/21/bKwzrMQ5LR3a2gO.png)

[https://npm.taobao.org/mirrors/chromedriver/](https://npm.taobao.org/mirrors/chromedriver/)到这个网址找到对应版本的下载到服务器中利用python进行调用就可以了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/3653dbc965b61684601d6e3b1e76ea6.png)
