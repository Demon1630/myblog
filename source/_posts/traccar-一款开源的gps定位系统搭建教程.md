---
title: traccar——一款开源的GPS定位系统搭建教程
date: 2020-04-18
categories:
- 技术
tags:
- gps定位
- vpn
- 宝塔面板
- 密码
- 搬瓦工
- 数据库
- 网站
- 软件
- 邮件
- 邮箱
---
# \[striped\]\[/striped\]

# 一 、什么是traccar

   **[traccar](https://www.traccar.org/)是免费的开源GPS跟踪系统，支持170多种GPS协议和超过1500种型号的GPS跟踪设备。**

traccar可以满足：

- 出租车，货车，卡车/拖车
- 农用设备，车队，集装箱，船舶，全地形车
- 专人跟踪，个人车辆，手机

等跟踪需求

traccar支持多种地图格式，包括卫星地图和二维地图等：

[![](https://www.demon1630.cf/wp-content/uploads/2020/04/1587180782-traccar1-1024x487.png)](https://www.demon1630.cf/traccar-%e4%b8%80%e6%ac%be%e5%bc%80%e6%ba%90%e7%9a%84gps%e5%ae%9a%e4%bd%8d%e7%b3%bb%e7%bb%9f%e6%90%ad%e5%bb%ba%e6%95%99%e7%a8%8b/1587180782-traccar1/)同时，traccar还支持运动轨迹追踪：

[![](https://www.demon1630.cf/wp-content/uploads/2020/04/1587181004-traccar2.png)](https://www.demon1630.cf/traccar-%e4%b8%80%e6%ac%be%e5%bc%80%e6%ba%90%e7%9a%84gps%e5%ae%9a%e4%bd%8d%e7%b3%bb%e7%bb%9f%e6%90%ad%e5%bb%ba%e6%95%99%e7%a8%8b/1587181004-traccar2/)其最高精度可以达到50m，基本满足定位需求。同时由于traccar可以搭建在个人vpn上，同时项目是开源的，所以隐私性具有一定保障。

# 二、如何搭建traccar

###  1、购买vps

首先traccar是搭建在VPS上的，当然也可以搭建在个人电脑上，但不推荐，所以这里主要介绍如何搭建在个人VPS上，所以首先需要有一台vps,我这里使用的是搬瓦工的VPS，如何购买搬瓦工VPS可以看我之前文章 [**如何购买搬瓦工VPS**](https://www.demon1630.cf/%e6%90%ac%e7%93%a6%e5%b7%a5vps%e8%b4%ad%e4%b9%b0/)

### 2、安装宝塔面板

购买完vps后，最好安装上宝塔面板，方便后面对vps的管理，同时由于traccar安装需要安装数据库，使用宝塔面板安装会简单很多，宝塔面板安装可参考 文章 [**vps安装宝塔面板**](https://www.demon1630.cf/vps%e5%ae%89%e8%a3%85%e5%ae%9d%e5%a1%94%e9%9d%a2%e6%9d%bf/)

### 3、安装必要软件

使用xshell或者putty远程登入vps，然后开始安装java配置软件，我vps是centos系统：

```
yum install jre
```

### 然后安装数据库，如果安装了宝塔面板，可以直接在宝塔面板中添加数据库即可： [![](https://www.demon1630.cf/wp-content/uploads/2020/04/1587182268-traccar3-1024x479.png)](https://www.demon1630.cf/traccar-%e4%b8%80%e6%ac%be%e5%bc%80%e6%ba%90%e7%9a%84gps%e5%ae%9a%e4%bd%8d%e7%b3%bb%e7%bb%9f%e6%90%ad%e5%bb%ba%e6%95%99%e7%a8%8b/1587182268-traccar3/)数据库名字取traccar，用户名和密码自己记住。

### 4、服务端安装traccar

```
wget https://github.com/traccar/traccar/releases/download/v4.8/traccar-linux-64-4.8.zip
```

```

```

```
unzip traccar-linux-*.zip
```

```
安装traccar

```

```
./traccar.run
```

创建配置文件 “traccar.xml”

```
nano traccar.xml
```

```
配置如下内容：

```

```
<?xml version='1.0' encoding='UTF-8'?>

<!DOCTYPE properties SYSTEM 'http://java.sun.com/dtd/properties.dtd'>

<properties>

    <entry key="config.default">./conf/default.xml</entry>

    <entry key='web.port'>8082</entry>

    <entry key='geocoder.enable'>false</entry>

    <entry key='database.driver'>com.mysql.jdbc.Driver</entry>
    <entry key='database.url'>jdbc:mysql://localhost/traccar?allowMultiQueries=true&amp;autoReconnect=true&amp;useUnicode=yes&amp;characterEncoding=UTF-8&amp;sessionVariables=sql_mode=''</entry>
    <entry key='database.user'>你的数据库用户名</entry>
    <entry key='database.password'>你的MySQL密码</entry>
    
    <entry key='server.timeout'>120</entry>

</properties>
```

```
替换默认配置文件

```

```
cp traccar.xml /opt/traccar/conf/
```

删除安装压缩包  （可选）安装完就用不到安装包了，删除节省服务器空间

```
rm -f traccar.run README.txt traccar-linux-*.zip
```

```
启动traccar服务

```

```
sudo systemctl start traccar.service
```

```
查看启动状态

```

```
sudo systemctl status traccar.service
```

```
如果看到active即表示启动成功
之后这时候打开浏览器，输入ip:8082进入网站配置
可以把语言配置为中文，默认email和密码是admin，登入后可以尽快修改，此时完成了服务端traccar的安装配置

```

### 5、用户端安装配置traccar

traccar有安卓和苹果客户端，可以到官网下载：[https://www.traccar.org/client](https://www.traccar.org/client)

[![](https://www.demon1630.cf/wp-content/uploads/2020/04/1587183413-traccar5-1024x462.png)](https://www.demon1630.cf/traccar-%e4%b8%80%e6%ac%be%e5%bc%80%e6%ba%90%e7%9a%84gps%e5%ae%9a%e4%bd%8d%e7%b3%bb%e7%bb%9f%e6%90%ad%e5%bb%ba%e6%95%99%e7%a8%8b/1587183413-traccar5/)安卓端还有隐藏版，就是安装配置完后手机上看不到这个软件 :huaji3:

[![](https://www.demon1630.cf/wp-content/uploads/2020/04/1587183770-traccar7.png)](https://www.demon1630.cf/traccar-%e4%b8%80%e6%ac%be%e5%bc%80%e6%ba%90%e7%9a%84gps%e5%ae%9a%e4%bd%8d%e7%b3%bb%e7%bb%9f%e6%90%ad%e5%bb%ba%e6%95%99%e7%a8%8b/1587183770-traccar7/)主要配置如图，服务器地址是自己 http://IP:8082

然后到浏览器自己的traccar管理端配置添加设备

[![](https://www.demon1630.cf/wp-content/uploads/2020/04/1587183950-traccar8.png)](https://www.demon1630.cf/traccar-%e4%b8%80%e6%ac%be%e5%bc%80%e6%ba%90%e7%9a%84gps%e5%ae%9a%e4%bd%8d%e7%b3%bb%e7%bb%9f%e6%90%ad%e5%bb%ba%e6%95%99%e7%a8%8b/1587183950-traccar8/)

在traccar上设备点击添加，如图，在名称上随便设置，编码填入之前手机端上的六位数字编码，之后就配置完成等待数据传输上去即可。

 

如果后面有配置电子围栏等，可以配合邮件通知来做到进出电子围栏发邮件通知，参考官方邮件通知教程

[https://www.traccar.org/notifications/](https://www.traccar.org/notifications/)

找到我们之前在目录/opt/traccar/conf/下面配置的traccar.xml文件，在里面添加这一部分内容，里面的smtp主机和账号密码替换为自己的，可以用163或qq邮箱都可以

```
<entry key='mail.smtp.host'>smtp.gmail.com</entry>
<entry key='mail.smtp.port'>465</entry>
<entry key='mail.smtp.ssl.enable'>true</entry>
<entry key='mail.smtp.from'>traccar@gmail.com</entry>
<entry key='mail.smtp.auth'>true</entry>
<entry key='mail.smtp.username'>traccar@gmail.com</entry>
<entry key='mail.smtp.password'>password</entry>
```

对于163邮箱可以参考如下

```
<entry key='mail.smtp.host'>smtp.163.com</entry>
    <entry key='mail.smtp.port'>465</entry>
    <entry key='mail.smtp.ssl.enable'>true</entry>
    <entry key='mail.smtp.from'>你自己的163邮箱账号</entry>
    <entry key='mail.smtp.auth'>true</entry>
    <entry key='mail.smtp.username'>你自己的163邮箱账号</entry>
    <entry key='mail.smtp.password'>申请的临时smtp密码</entry>
```

保存，然后重启一下traccar服务：

```
sudo systemctl restart traccar.service
```

然后回到自己的traccar后台，把账户的邮箱修改为自己想接收通知的邮箱，然后到通知目录下，选择类型为自己想在什么情况下触发通知，通道选择邮件，勾选上所有设备，然后点击测试通道进行测试，如果可以接收到通知邮件则表示正常，保存即可

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20230507233815.png)
