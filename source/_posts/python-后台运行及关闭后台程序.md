---
title: "python 后台运行及关闭后台程序"
date: 2021-05-23
categories: 
  - "python"
tags: 
  - "python"
  - "缓存"
---

```bash
nohup python3 -u socket_test.py >my_socket.log 2>&1 &
```

![](http://www.demon1630.cn/wp-content/uploads/2021/05/frc-3b425e2c6a315b3a29ae77ac4d4fd7ac.png)

### 开启以后会显示 进程ID 后面可以利用这个ID杀死后台进程  忘记了下面也有办法查询

1\. 最后一个“&”表示后台运行程序 2. “nohup” 表示程序不被挂起 3. “python3”表示执行python代码 4. “-u”表示不启用缓存，实时输出打印信息到日志文件（如果不加-u，则会导致日志文件不会实时刷新代码中的print函数的信息） 5. “socket\_test.py”表示python的源代码文件 6. “my\_socket.log”表示输出的日志文件 7. “>”表示将打印信息重定向到日志文件 8. “2>&1”表示将标准错误输出转变化标准输出，可以将错误信息也输出到日志文件中（0-> stdin, 1->stdout, 2->stderr）

### ps命令

### 功能：查看当前的所有进程

![](http://www.demon1630.cn/wp-content/uploads/2021/05/frc-21f5388cab8456a5200facb28d71c1a3.png)

### 也可以单独查询某个文件开启的进程

```
ps -aux | grep "socket_test.py"    #a:显示所有程序  u:以用户为主的格式来显示   x:显示所有程序，不以终端机来区分
```

![](http://www.demon1630.cn/wp-content/uploads/2021/05/frc-4de4f49fe6667b8cf2ce886ea8210bc8.png)

### Kill命令

### 功能：杀死进程

```
kill 30598
```

![](http://www.demon1630.cn/wp-content/uploads/2021/05/frc-bf3a1b059555402d37d17462be659251.png)

文章来源于互联网:[python 后台运行及关闭后台程序](https://blog.csdn.net/qq_37946291/article/details/105550529)
