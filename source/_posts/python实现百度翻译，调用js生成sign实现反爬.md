---
title: python实现百度翻译，调用js生成sign实现反爬
date: 2021-05-17
categories:
- python
- 技术
tags:
- python
- 反爬虫
- 翻译
---
项目地址：[百度翻译](https://github.com/Demon1630/python-practice/blob/main/%E7%99%BE%E5%BA%A6%E7%BF%BB%E8%AF%91-js%E8%B0%83%E8%AF%95.py)

主要通过分析百度翻译页面，查看其sign生成函数，将其调用到pyton中，从而实现反爬

需要先下载乐易助手进行js调试，下载地址：[https://strivefysfxyh.lanzoui.com/ixZ0bp79nba](https://strivefysfxyh.lanzoui.com/ixZ0bp79nba)

我们进入一个百度翻译的网址

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210517090728.png)

输入一段话，然后点击翻译，右键点击检查，进入浏览器开发者模式，就可以看到浏览器发送的内容，我们点击network，然后刷新一下页面，找到v2transapi?from=zh&to=en 这个文件，从右边headers中可以看到发送的headers，发送内容等信息，我们翻译不同的内容去查看其发送内容可以发现，每次form data中不同就是query对应的翻译内容，和sign，其中sign是由MD5计算出来的，其与我们输入的翻译内容query相关，百度翻译会采用sign来进行验证，从而实现反爬虫。这里我们就需要对sign进行解密

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210517092721.png)

我们点击sources，查看网页文件，找到index\_e36080d.js的js文件，此时显示的内容非常乱，点击下方的格式化符号进行格式化

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210517092952.png)

按住ctrl + F搜索sign ，找到sign：f（n）,这里就是js文件中生成sign的地方，下面我们还可以看到生成token的地方，我们在sign这一行左边数字处点击一下，打上断点

然后我们再次点击页面中的翻译按钮

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210517093417.png)

我们可以看到，此时翻译内容已经传入，暂停到了sign函数处，我们点击右边的步进

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210517093601.png)

之后我们就会进入sign的生成函数中，我们把整个function e（r）函数复制下来

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210517121449.png)

加载代码，然后我们选择function e(val)函数，在下面方框中单引号中我们随便输入一个翻译单词，点击系统运行，可以看到出现错误，原因是里面的 i未定义，我们回到浏览器中的js代码中去找

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210517121726.png)

可以看到，在中国e函数下面，有定义一个i变量，这个i变量主要是给前面提示错误中的u进行赋值，我们把这句话也复制到乐易编程助手中，但在后面我们在浏览器中步进js代码时可以发现，i始终被赋值成 i = 320305.131321201

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210517160133.png)

添加完变量i之后，我们再点击系统运行

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210517160332.png)

可以看到还报错缺少对象，我们到浏览器中定位到这个参数

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210517160638.png)

它显示的是 p = S\[b\]未定义，但当你步进的时候，实际是p=n（p ,F）未定义，鼠标悬停在n上，可以找到这个函数对应的位置，就在 e函数上面，把这个函数也复制到乐易助手中来 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210517160711.png)此时我们再加载代码，然后运行一下

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210517161112.png)

可以看到已经计算出结果了，这个结果就是对应的sign参数，所以在浏览器js代码中，我们只要复制下来n函数和e函数，然后添加一个i = 320305.131321201的初始定义，就可以完成sign的计算

将这些代码复制到python中，由于python中调用js函数需要用到第三方库PyExecJS，所以需要先安装这个库，然后调用，完成sign计算后就是对应的requests.post函数的编写，前面我们在headers中也看到了对应的form data，把它复制下来做相应的修改就可以了，完整的python代码可以到开头的GitHub中查看
