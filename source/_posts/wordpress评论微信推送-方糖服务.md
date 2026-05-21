---
title: "WordPress评论微信推送-方糖服务"
date: 2020-10-08
categories: 
  - "wordpress"
tags: 
  - "网站"
  - "网站建设"
---

有时候不会经常登录博客后台查看消息，但别人有评论怎么办呢？这时候就可以使用推送服务，当有人评论你时，可以微信推送到你的手机，就很方便了，这里介绍一下方糖推送服务

# Server酱

# 是什么

「Server酱」，英文名「ServerChan」，是一款「程序员」和「服务器」之间的通信软件。

说人话？就是从服务器推报警和日志到手机的工具。

开通并使用上它，只需要一分钟：

1. 登入：用GitHub账号[登入网站](http://sc.ftqq.com/?c=github&a=login)，就能获得一个[SCKEY](http://sc.ftqq.com/?c=code)（在「[发送消息](http://sc.ftqq.com/?c=code)」页面）
2. 绑定：点击「[微信推送](http://sc.ftqq.com/?c=wechat&a=bind)」，扫码关注同时即可完成绑定
3. 发消息：往 [http://sc.ftqq.com/SCKEY.send](http://sc.ftqq.com/SCKEY.send) 发GET请求，就可以在微信里收到消息啦

使用起来很方便，只需要登录然后获得一个sckey码就可以了

然后到你的网站后台function.php文件中添加如下代码：

```
function sc_send($comment_id)
{
$text = '主人，博客上有一条新的评论';
$comment = get_comment($comment_id);
$desp = $comment->comment_content;
$key = '你的sckey码';
$postdata = http_build_query(
array(
'text' => $text,
'desp' => $desp
)
);
 
$opts = array('http' =>
array(
'method' => 'POST',
'header' => 'Content-type: application/x-www-form-urlencoded',
'content' => $postdata
)
);
$context = stream_context_create($opts);
return $result = file_get_contents('http://sc.ftqq.com/'.$key.'.send', false, $context);
}
add_action('comment_post', 'sc_send', 19, 2);
```

然后绑定微信就可以了

![](http://www.demon1630.cn/wp-content/uploads/2020/10/1602119536-方糖-1024x312.png)

当由评论时，就可以在微信上收到信息了

![](http://www.demon1630.cn/wp-content/uploads/2020/10/1602119654-方糖2.png)

使用很方便
