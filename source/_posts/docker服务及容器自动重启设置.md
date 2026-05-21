---
title: "docker服务及容器自动重启设置"
date: 2021-03-24
categories: 
  - "wordpress"
tags: 
  - "docker"
---

1.docker自动启动设置：

systemctl enable docker.service

2、docker容器自动启动设置

在运行docker容器时可以加如下参数来保证每次docker服务重启后容器也自动重启：

docker run --restart=always

如果已经启动了则可以使用如下命令： docker ps -a 查看所有的docker服务，记住container id

docker update --restart=always CONTAINER ID
