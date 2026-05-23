---
title: windows下能ping通某个网页但是无法打开问题
date: 2020-07-02
categories:
- 技术
tags:
- windows
- 网络
---
有时候无法打开某个网页，但是使用cmd去ping却可以ping通，这时可以尝试在cmd中运行：netsh winsock reset，然后重启电脑
