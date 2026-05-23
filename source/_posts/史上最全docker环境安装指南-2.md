---
title: 史上最全Docker环境安装指南
date: 2020-05-18
categories:
- 技术
tags:
- docker
---
### 一、思考❓❔

### 1.什么是Docker?

![](https://pic4.zhimg.com/v2-3f19e0456a9079a01c35b67b4a2ea20f_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-f00224ee1654e27eead63fa3821ccfe6.jpg)

- 装应用的容器
- 开发、测试、运维都偏爱的容器化技术
- 轻量级
- 扩展性
- 一次构建、多次分享、随处运行

### 2.安装Docker难不难?

![](https://pic3.zhimg.com/v2-800ef02cb6ad12a642fb20a3a66e2576_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-b5c4b0a888d2fd5e14422d6ecb6a7224.jpg)

- So easy！
- 此文看过之后，读者一定会有一个docker环境

### 二、Windows上安装Docker

![](https://pic1.zhimg.com/v2-ffa2dab718394aa282c1716b64ead588_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-0aff06aabe281d321ade9a66af36b232.jpg)

### 1.在Windows 10上安装Docker

- 系统需求

操作系统内存其他Windows 10 64 bit **（家庭版不行）**4GB以上开启Hyper-V（大多数电脑默认会开启）

- 下载安装包
    - `https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe`
- 按照安装向导next即可
- 运行
    - 不会自动启动
    - 在开始菜单搜索Docker, 打开即可

![](https://pic2.zhimg.com/v2-def0ff26899f231442bcfc1c10829ae9_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-92b66b86809053a9b69bd668857c948e.jpg)

- 细节配置, 可参考这个链接（`https://docs.docker.com/docker-for-windows/#docker-settings-dialog`）
- 测试是否安装成功
    - 在CMD中运行如下命令, 有显示版本号或者显示"Hello from Docker!", 则代表安装成功

```text
> docker --version

Docker version 19.03.1

> docker run hello-world
docker : Unable to find image 'hello-world:latest' locally
...

latest:
Pulling from library/hello-world
ca4f61b1923c:
Pulling fs layer
ca4f61b1923c:
Download complete
ca4f61b1923c:
Pull complete
Digest: sha256:97ce6fa4b6cdc0790cda65fe7290b74cfebd9fa0c9b8c38e979330d547d22ce1
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.
...
```

2.在Windows 老版本安装Docker

- 在老版本Windows上安装Docker需要满足如下条件

操作系统内存其他Windows 7 , 8, 8.14GB以上开启Hyper-V（大多数电脑默认会开启）

- - 下载Docker ToolBox安装包
        - `https://github.com/docker/toolbox/releases/download/v19.03.1/DockerToolbox-19.03.1.exe`

 

- 安装
    - 检测版本
    - 对于**Windows 8 或者 8.1**, 打开任务管理器 -> 性能 -> 虚拟化已启用

![](https://pic1.zhimg.com/v2-da6e09ce1158b517104e53bffa2844d0_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-6f9d8689b58ae35e53d256f5f3744de4.jpg)

\- 对于**Windows 7**可以使用这个工具去检测是否开启虚拟化`https://www.microsoft.com/en-us/download/details.aspx?id=592`

- 双击exe安装包, 按照安装向导next即可

![](https://pic4.zhimg.com/v2-2ceb1500e7b492e8c29caf543f413767_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-35001c8e735dc6c8ee5a2dc7fa4cbe9b.jpg)

- 测试是否安装成功
    - 在桌面查找Docker QuickStart图标双击开启Docker

![](https://pic1.zhimg.com/v2-def47982f9f04a2365e0304d20439580_b.png)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-c146b6e58d3ae2e47719e526d664015b.png)

- 如果出现**User Account Control** 提示, 点击是
- 会出现一个bash终端
- 运行docker run hello-world, 如果出现"Hello from Docker.", 则代表运行成功

```text
$ docker run hello-world
Unable to find image 'hello-world:latest' locally
Pulling repository hello-world
91c95931e552: Download complete
a8219747be10: Download complete
Status: Downloaded newer image for hello-world:latest
Hello from Docker.
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker Engine CLI client contacted the Docker Engine daemon.
 2. The Docker Engine daemon pulled the "hello-world" image from the Docker Hub.
    (Assuming it was not already locally available.)
 3. The Docker Engine daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker Engine daemon streamed that output to the Docker Engine CLI client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

For more examples and ideas, visit:
 https://docs.docker.com/userguide/
```

### 三、在Linux上安装Docker

![](https://pic1.zhimg.com/v2-0dc1e3a2984337762a549c4041ba3a4c_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-2bbfb7393d65aa0871f6b0bcffdf16e2.jpg)

### 1.在Centos上安装

- - linux内核版本依赖
        - kernel version >= 3.8
        - 可以使用如下命令查看
        - `uname -a | awk '{split($3, arr, "-"); print arr[1]}'`

 

- 如果已安装过Docker, 需要移除老版本的Docker

```text
sudo yum remove docker 
                  docker-client 
                  docker-client-latest 
                  docker-common 
                  docker-latest 
                  docker-latest-logrotate 
                  docker-logrotate 
                  docker-engine
```

- 添加Docker repository yum源

```text
# 国内源, 速度更快, 推荐
sudo yum-config-manager 
    --add-repo 
    https://mirrors.ustc.edu.cn/docker-ce/linux/centos/docker-ce.repo

# 官方源, 服务器在国外, 安装速度慢
# $ sudo yum-config-manager 
#     --add-repo 
#     https://download.docker.com/linux/centos/docker-ce.repo
```

- 开始安装Docker Engine

```text
sudo yum makecache fast
sudo yum install docker-ce docker-ce-cli containerd.io
```

- 开启Docker

```text
sudo systemctl enable docker
sudo systemctl start docker
```

- 验证是否安装成功

```text
sudo docker run hello-world
```

- 如果出现"Hello from Docker.", 则代表运行成功

- 如果在每次运行docker命令是, 在前面不添加sudo, 可以执行如下命令:

```text
sudo usermod -aG docker $USER
```

- 如果嫌上面安装步骤麻烦, 可以运行如下脚本来安装
    - 不能在生产系统中使用

```text
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh --mirror Aliyun

sudo systemctl enable docker
sudo systemctl start docker

sudo groupadd docker
sudo usermod -aG docker $USER
```

### 2.在Ubuntu上安装

- linux内核版本依赖
    - kernel version >= 3.8
    - 可以使用如下命令查看
    - `uname -a | awk '{split($3, arr, "-"); print arr[1]}'`

- 操作系统依赖, 如下版本都可以

```text
Disco 19.04
Cosmic 18.10
Bionic 18.04 (LTS)
Xenial 16.04 (LTS)
```

- 如果已安装过Docker, 需要移除老版本的Docker

```text
sudo apt-get remove docker docker-engine docker.io containerd runc
```

- 使用Docker repository 来安装

```text
# 更新apt包索引
sudo apt-get update

# 为支持https
sudo apt-get install 
    apt-transport-https 
    ca-certificates 
    curl 
    gnupg-agent 
    software-properties-common

# 添加Docker GPG秘钥
# 国内源
curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
# 或者国外源
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# 添加安装源
# 推荐国内源
sudo add-apt-repository 
    "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu 
    $(lsb_release -cs) 
    stable"
# 或者国外源
# sudo add-apt-repository 
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu 
#   $(lsb_release -cs) 
#   stable"
```

- 安装Docker

```text
# 更新apt包索引
sudo apt-get update

# 安装docker
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

- 开启Docker

```text
sudo systemctl enable docker
sudo systemctl start docker
```

- 验证是否安装成功

```text
sudo docker run hello-world
```

- 如果出现"Hello from Docker.", 则代表运行成功
- 如果在每次运行docker命令是, 在前面不添加sudo, 可以执行如下命令:

```text
sudo usermod -aG docker $USER
```

### 四、使用shell脚本安装Docker

### 1.在Ubuntu和Centos上安装

**install\_docker\_.sh**

```text
#!/bin/bash
#Author: 柠檬班可优
#Date: 2019-06-06
#install docker in ubuntu and centos

function install_docker_in_ubuntu
{
    sudo  apt-get update -y
    # install some tools
    sudo apt-get install 
        apt-transport-https 
        ca-certificates 
        curl 
        gnupg-agent 
        software-properties-common 
        net-tools 
        wget -y

    # install docker
    curl -fsSL get.docker.com -o get-docker.sh
    sh get-docker.sh

    # start docker service
    sudo groupadd docker &> /dev/null
    sudo gpasswd -a "${USER}" docker
    sudo systemctl start docker

    rm -rf get-docker.sh
}

function install_docker_in_centos
{
    # install some tools
    sudo yum install -y git vim gcc glibc-static telnet bridge-utils

    # install docker
    curl -fsSL get.docker.com -o get-docker.sh
    sh get-docker.sh

    # start docker service
    sudo groupadd docker &> /dev/null
    sudo gpasswd -a "${USER}" docker
    sudo systemctl start docker

    rm -rf get-docker.sh

}

SYSTEM_NAME="$(awk -F= '/^NAME/{print $2}' /etc/os-release)"
if [[ "${SYSTEM_NAME,,}" =~ "ubuntu"  ]] ; then
    echo "Your system is ubuntu."
    echo "Installing Docker in ubuntu..."
    install_docker_in_ubuntu
elif [[ "${SYSTEM_NAME,,}" =~ "centos" ]] ; then
    echo "Your system is centos."
    echo "Installing Docker in centos..."
    install_docker_in_centos
else
    echo "This script can only run in ubuntu and centos system."
    exit 1
fi
```

### 2.运行脚本

- `bash install_docker_.sh`

### 五、总结

![](https://pic4.zhimg.com/v2-4a781fa3311cfea3efc2ae6a0067556b_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-e90c0583c2a8a98ce7c74ec9bcaba975.jpg)

- 本文介绍了安装docker的多种方式，相信总有一种适合你的
- 学习热门的Docker容器化技术，安装docker是第一步

> 来源：网络 图片来源于网络，如有侵权，还请联系我删除

文章来源于互联网:[史上最全Docker环境安装指南](https://zhuanlan.zhihu.com/p/82269806)
