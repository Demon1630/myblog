---
title: "python爬取小说实践"
date: 2019-11-12
categories: 
  - "wordpress"
tags: 
  - "网站"
---

python爬虫大家估计都不陌生，这次也是为了练习爬虫所写，主要是简单的爬取某网站的小说并下载下来，具体代码如下

```
import requests
from bs4 import BeautifulSoup
import re

import smtplib
from email.mime.text import MIMEText
from email.header import Header
 
import time
from datetime import datetime 
import chardet 

#定义头部信息 
user_agent='Mozilla/4.0(compatible;MSIE 5.5;Windows NT)'
headers={'User-Agent':user_agent}

url='http://seputu.com/'

r=requests.get(url,headers=headers)
#print(r.text)

soup = BeautifulSoup(r.text,'html.parser',from_encoding='utf-8')

for mulu in soup.find_all(class_='mulu'):
    h2 = mulu.find('h2')
    if h2!=None:
       h2_title=h2.string
       for a in mulu.find(class_='box').find_all('a'):
           href=a.get('href')
           box_title=a.text  #get('title')
           print(href,box_title)
```
