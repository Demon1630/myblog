---
title: "Python爬虫库的安装"
date: 2020-04-29
categories: 
  - "wordpress"
---

        首先，安装**request爬虫库**:

            作用 : 相当于浏览器 客户端发送请求

            安装：pip install requests

![](https://www.demon1630.cf/wp-content/uploads/2020/04/frc-f42d2ff10d5db79beb0801d6588d47cd.png)

requests安装

        res=requests.get('http://www.baidu.com')      **向百度发送一个请求**

        res.status\_code                                             **返回请求的状态码**

        200                                                                **请求成功**

        res.text                                                          **网页的源代码**

![](https://www.demon1630.cf/wp-content/uploads/2020/04/frc-f0bd22630b56317e74a1e0fdf8d790c2.png)

requests代码

其次，安装**beautifulsoup4爬虫库**

    作用 : 网页分析器

    安装 : pip install beautifulsoup4

  

![](https://www.demon1630.cf/wp-content/uploads/2020/04/frc-a9cf4c022117d77330e12c2792de8849.png)

beautifulsoup4安装

        from bs4 import BeautifulSoup                      **引入库**

        res=BeautifulSoup('

HelloWorld','html.parser')    **这个后面会仔细讲的**

        res.title                                                          **获取标题**

        res.title.text                                                    **获取标题内容**

![](https://www.demon1630.cf/wp-content/uploads/2020/04/frc-c4ed86cbd261b05bd5692c42ded5b0d1.png)

beautifulsoup4代码

    再次,安装**pyquery库**

        作用 ：和beautifulsoup4差不多 不过和jquery差不多

        安装 : pip install pyquery

![](https://www.demon1630.cf/wp-content/uploads/2020/04/frc-4b563411ac1d552d6e420b112b2a531e.png)

pyquery安装

    from pyquery import PyQuery as pq                 **引入pyquery**

    res=pq('ttt')

    res('html')                                                         **取到html标签**

    res('html').text()                                                 **取到html标签里面的值**

![](https://www.demon1630.cf/wp-content/uploads/2020/04/frc-9e7ed7012910932ce026bb7adf430788.png)

pyquery代码

        最后，安装**pymongo库**

        作用 : python对mongodb数据库的操作

        安装 :  pip install pymongo

![](https://www.demon1630.cf/wp-content/uploads/2020/04/frc-a14a645a1839b9d2bfa0a5a70a0fc72d.png)

pymongo安装

        import pymongo

        res=pymongo.MongoClient('localhost')             **链接本机数据库**

         db=res\['local'\]                                                   **请求local数据库 要是没有的话 就重新创建**

        db\['student'\].insert({'name':'lisi','age':25})          **插入数据**

        db\['student'\].find\_one({'name':'lisi'})                  **查找数据**

![](https://www.demon1630.cf/wp-content/uploads/2020/04/frc-49889a5beae41de3200a4d3410130294.png)

pymongo代码
