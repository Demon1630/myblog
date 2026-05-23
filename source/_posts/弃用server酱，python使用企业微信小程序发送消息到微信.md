---
title: 弃用server酱，python使用企业微信小程序发送消息到微信中
date: 2021-06-14
categories:
- 推荐软件
tags:
- python
- telegram
- 企业微信
- 视频
---
由于微信网页端口关闭了，现在基本上不能直接利用python调用微信来发送消息通知了，虽然有server酱，使用也很广泛，但随着server酱改版。。。

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614184220.png)

然后就没然后了。。。。。 ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614184346.png)

免费的只支持5条消息。。。。诶，慢慢都是要盈利的了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614184944.png)

 

基本上是强制会员了。。。。

不想冲会员，最简单的方法是使用telegram，配置简单，而且使用很方便，但由于国内，所以必须得时刻fq才能收到消息，而且平时使用最多的也是微信，因此通过微信来推送信息还是很有必要的

看了一下server酱最新版本，它也是调用企业微信接口来实现发送信息的，虽然还可以配置其他如钉钉等接口，不过我们主要还是想在微信里接收通知

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614185217.png)

由于企业微信本身就比较方便调用接口，所以继续使用server酱来调用就显得多此一举了（主要是现在必须要会员，否则只能发送5条信息。。。）

所以这里介绍一下python直接使用企业微信接口发送消息

首先得要注册有企业微信，个人也可以注册的，企业随便创建一个就可以

然后登入企业微信管理后台

创建一个应用，然后获取应用ID( `agentid` )，应用Secret( `secret` )，具体创建方法可以参考server酱中的描述：[https://sct.ftqq.com/forward](https://sct.ftqq.com/forward)，就不多介绍了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614185632.png)

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614190059.png)

获取企业ID，在我的企业中可以看到

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614190550.png)

开始编写python程序

```
import requests
from  fake_useragent import UserAgent

def send_wechat(title,text,detal_url):

    get_acs_token_url = 'https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=你的企业ID&corpsecret=应用的Secret'

    access = requests.get(url=get_acs_token_url)
    access_token = eval(access.text)['access_token']

    url = f'https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token={access_token}'
    print(url)

    headers = {
        'User-Agent': UserAgent().random
    }

    key = {
        "touser": "@all",
        # "toparty": "PartyID1|PartyID2",
        # "totag": "TagID1 | TagID2",
        "msgtype": "textcard",
        "agentid": 应用ID,
        "textcard": {
            "title": title,
            "description": text,
            "url": detal_url,
            "btntxt": "更多"
        },
        "safe": 0,
        "enable_id_trans": 0,
        "enable_duplicate_check": 0,
        "duplicate_check_interval": 1800
    }

    res = requests.post(url=url,headers=headers,json=key)
    # print(res.status_code)
    # print(res.text)

```

修改的地方主要是这三个地方，修改为自己的就行：

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614192614.png)

主要包含两部分，前面是获取接口调用中需要用到的access\_token，后面是调用接口然后发送信息

具体可以参考：[获取access\_token](https://work.weixin.qq.com/api/doc/10013#%E7%AC%AC%E4%B8%89%E6%AD%A5%EF%BC%9A%E8%8E%B7%E5%8F%96access_token)

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614191053.png)

调用接口 ：[发送消息](https://work.weixin.qq.com/api/doc/90000/90135/90236#%E6%96%87%E6%9C%AC%E6%B6%88%E6%81%AF)

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614191251.png)

我这边发送的是文本卡片信息，其他如文本、图片、视频等信息可以自己参考修改

注意：在使用post发送信息的时候可能会出现报错

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614191505.png)

无法正常发送信息，查看返回码说错误的msgtype，这主要是由于 post发送过去的头部是“application/json”，是json格式的，所以在python 的request中，不能使用data,data的数据只能是字典，列表或者元组。 而json= 发送的是json的数据，所以这里需要使用json

即代码中使用的json=key，不能使用data=key

此时就可以正常使用企业微信发送消息，然后在微信中也可以收到提醒了

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210614191924.png)

而且没有次数限制。。。。
