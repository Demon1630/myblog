---
title: "python使用telegram机器人发送消息进行推送"
date: 2021-05-23
categories: 
  - "python"
tags: 
  - "python"
  - "telegram"
  - "网站"
---

telegram是一款国外的即时通讯软件，类似于微信，但功能更加强大

官方网站：[https://telegram.org/](https://telegram.org/)

如果打不开，应该是需要代理。。。

# 创建机器人

首先需要添加 [@BotFather](https://telegram.me/BotFather)。

发送 `/start` 根据提示继续操作。

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210523111254.png)

此时创建完成了机器人，获取到了后面要用到的token

# 创建频道

需要再创建一个频道，把机器人添加进去

注意： 机器人必须设置为频道管理员，否则无法发送消息

频道必须设置为公开

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210523111604.png)

# 使用 python-telegram-bot 库

```
安装python库：
pip install python-telegram-bot --upgrade
```

调用

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210523111741.png)

chat\_id ：@频道名

token就是前面获取到的机器人token

![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210523111855.png)

此时就可以正常调用了

## 发送带标题网址链接

```
bot.send_message(
    chat_id=chat_id,
    text="<a href="https://lijianxun.top/">简讯的个人博客</a>",
    parse_mode=telegram.ParseMode.HTML
)
```

Python

ParseMode 支持 html 和 markdown 两种格式。

html 标签支持加粗 `<b></b>`，斜体 `<i></i>` 等。

## 发送图片

```
bot.send_photo(
    chat_id=chat_id,
    photo="https://i.loli.net/2019/09/19/PcQst46mwUaMEgV.png",
    caption="非必填的图片描述"
)
```

## 发送多张图片

完整代码

```
import telegram 
from telegram import InputMediaPhoto 
photo_list = [ "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
"https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png", 
"https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png", 
"https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png", 
"https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png", 
"https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png" ] 
result = [InputMediaPhoto(media=p, caption="知乎钓鱼贴") for p in photo_list] 
bot.send_media_group( chat_id=chat_id, media=result )
```

传相册的时候 `media` 需要 `InputMediaPhoto` 类型。
