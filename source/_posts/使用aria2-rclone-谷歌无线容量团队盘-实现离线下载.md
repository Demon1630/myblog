---
title: 使用aria2 + rclone +谷歌无线容量团队盘-实现离线下载
date: 2020-05-05
categories:
- 技术
- 推荐软件
- 搬瓦工
- wordpress
tags:
- wordpress
- 域名
- 宝塔面板
- 搬瓦工
- 离线下载
- 网站
- 谷歌云盘
---
## 1.前提

首先需要有自己的vps，这里以搬瓦工vps为例，如何获取搬瓦工vps可以查看文章：[搬瓦工vps购买教程](http://www.demon1630.cn/%e6%90%ac%e7%93%a6%e5%b7%a5vps%e8%b4%ad%e4%b9%b0/)

同时还需要在vps上安装宝塔面板，便于后面的文件安装管理，安装教程：[vps安装宝塔面板](http://www.demon1630.cn/vps%e5%ae%89%e8%a3%85%e5%ae%9d%e5%a1%94%e9%9d%a2%e6%9d%bf/)

其次有自己的谷歌无限容量团队盘，参考文章：[获取谷歌云无限团队盘](http://www.demon1630.cn/%E8%8E%B7%E5%8F%96%E8%B0%B7%E6%AD%8C%E4%BA%91%E6%97%A0%E9%99%90%E5%9B%A2%E9%98%9F%E7%BD%91%E7%9B%98/)

 

做好这几步后开始下面的安装

## 2.安装aria2

这里使用 大佬的[Aria2 一键安装管理脚本](https://github.com/P3TERX/aria2.sh)，执行下面的代码下载并运行脚本

```
bash <(wget -qO- git.io/aria2.sh)
```

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588661605-googledrive2.png)

输入1即会进行自动安装

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588661799-googledrive3.png)

输入y进行下载安装

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588662590-googledrive5.png)直接回车

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588662670-googledrive6.png)

把配置文件内容复制保存下来，后面需要用到

## 3.安装Aria2Ng

Aria2Ng是网页版的aria2管理界面

这里需要用到类似于创建WordPress网站的方式，前提是在安装宝塔面板时已经一键安装了LNMP

aria2Ng可以直接用vps的ip，也可以用域名，如果采用域名的话需要将域名解析到自己的ip地址上，参考之前搭建网站的文章：[使用宝塔面板搭建网站](http://www.demon1630.cn/%e6%90%ac%e7%93%a6%e5%b7%a5%e4%bd%bf%e7%94%a8%e5%ae%9d%e5%a1%94%e9%9d%a2%e6%9d%bf%e6%90%ad%e5%bb%ba%e7%bd%91%e7%ab%99/)，只不过这里不是下载WordPress安装包，而是下载aria2Ng安装包到网站文件夹中

到[ariaNg项目](https://github.com/mayswind/AriaNg/releases)地址中找到最新版本安装包，右键获取下载地址到宝塔面板创建的网站文件夹下用远程下载下载下来

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588662460-googledrive4-1024x616.png)

 

远程下载下来并解压缩

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588662938-googledrive7-1024x505.png)

域名解析到vps的ip后就可以访问自己的域名进入AriaNg管理界面

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588663120-googledrive8-1024x489.png)

此时还是显示未连接，点击AriaNg设置，进行配置

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588663454-googledrive9-1024x321.png)

此时即可进行连接

网站尽量不要开启ssl加密，有可能导致aria2无法连接

## 4.安装配置rclone

安装依赖：

```
yum -y install fuse
```

采用官方一键安装脚本

```
curl https://rclone.org/install.sh | sudo bash
```

安装完成后输入 rclone config进行配置

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588664385-googledrive10.png)

 

输入n 新建一个

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588664516-googledrive11.png)

 

name处随便输入一个名字，但要记住，后面须用到

然后找到google drive对应的编号

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588664638-googledrive12.png)

这里是13，然后输入13

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588664722-googledrive13.png)

后面配置如图

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588666037-googledrive14.png)![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588666348-googledrive15.png)![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588666551-googledrive16.png)![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588666715-googledrive17.png)至此完成rclone挂载谷歌团队盘的配置

 

之后须将rclone挂载到vps磁盘并进行进程守护，从而在重启服务器时仍然可以自动挂载

参考文章进行挂载：

[linux使用rclone挂载onedrive作为挂载盘](http://www.demon1630.cn/linux%e4%bd%bf%e7%94%a8rclone%e6%8c%82%e8%bd%bdonedrive%e4%bd%9c%e4%b8%ba%e6%8c%82%e8%bd%bd%e7%9b%98/)

## 5.配置自动上传脚本

[Aria2 一键安装管理脚本 增强版](https://p3terx.com/go/aHR0cHM6Ly9naXRodWIuY29tL1AzVEVSWC9hcmlhMi5zaA==) 整合了 [Aria2 完美配置](https://p3terx.com/go/aHR0cHM6Ly9naXRodWIuY29tL1AzVEVSWC9hcmlhMl9wZXJmZWN0X2NvbmZpZw==) ，安装后会附带一些列增强功能脚本，Rclone 自动上传脚本就是其中之一。由于默认不启用，所以需要手动启用

打开 /root/.aria2/autoupload.sh自动上传脚本进行编辑，按照脚本中的中文注释进行修改，一般只要改这两处

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588694787-googledrive18.png)

 

之后修改/root/.aria2/aria2.conf

![](http://www.demon1630.cn/wp-content/uploads/2020/05/1588695308-googledrive19.png)

 

最后重启aria2

```
service aria2 restart
```

当你进行完以上所有操作，现在下载文件就会自动上传至相应的网盘，本地的文件也会自动删除。
