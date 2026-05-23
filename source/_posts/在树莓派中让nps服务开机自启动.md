---
title: 在树莓派中让nps服务开机自启动
date: 2021-01-16
categories:
- 树莓派
tags:
- nps
- 树莓派
---
之前文章中有介绍如何配置nps内网穿透：[nps实现树莓派内网穿透](http://www.demon1630.cn/nps%e5%ae%9e%e7%8e%b0%e6%a0%91%e8%8e%93%e6%b4%be%e5%86%85%e7%bd%91%e7%a9%bf%e9%80%8f/)

这里介绍一下如何开机自启动树莓派上布置的nps服务

在之前解压的nps服务目录下创建文件npc.sh

写入：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210116163255.png)

然后给npc.sh文件修改权限：

```
sudo chmod 777 npc.sh

```

文前。npc的安装，以及配置什么的就不写了。现在只记录如何在树莓派中让npc客户端开机自启。

* * *

### 第一步。（我的npc文件是在/home/pi/npc的文件夹中。）

现在文件中创建npc.sh文件。

```
#!/bin/sh
cd /home/pi/npc
./npc -server=149.129.103.241:8024 -vkey=123456789 -type=tcp < /dev/null > /dev/null 2>1 &
```

其中的第二行，是先切换到npc文件所在的文件夹中。第三行，是在服务端获取的启动npc的命令。

然后给npc.sh文件修改权限

```
sudo chmod 777 start.sh
```

然后在rc.local中添加该脚本：

```
sudo nano /etc/rc.local

在最后一行exit 0前添加：
```

```
/home/pi/npc/npc.sh start

前面是你的nps所在的目录，按照自己目录修改就像

到此就可以开机启动nps服务了
```
