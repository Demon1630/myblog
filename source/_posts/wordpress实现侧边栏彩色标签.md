---
title: "wordpress实现侧边栏彩色标签"
date: 2020-10-08
categories: 
  - "技术"
  - "wordpress"
tags: 
  - "网站建设"
---

在侧边栏添加小工具里面有标签工具栏，可以把你使用过的标签显示出来，方便读者查看，默认的标签是黑白色的，之前看到有的人博客里标签是彩色的，那如何设置呢？这里就把彩色标签设置方法讲一下

## 首先先看看效果：

![](http://www.demon1630.cn/wp-content/uploads/2020/10/1602161479-彩色标签栏1.png)

可以随机显示标签的颜色

只要在function.php文件中添加如下代码即可：

## 代码

```
/* 彩色静态标签云 Color Tag Cloud 
/* -------------------------------- */
function colorCloud($text) {
  $text = preg_replace_callback('|<a (.+?)>|i', 'colorCloudCallback', $text);
  $text=preg_replace('/<a /','<a ',$text);
  return $text;
}
function colorCloudCallback($matches) {
  $text = $matches[1];
//这里定义我们背景色的范围，如果不想设置背景色的输出范围我们可以使用
//$color = dechex(rand(0,16777215));从所有颜色中随机出一个
  $a = array('8D7EEA','F99FB2','AEE05B','E8D368','F75D78','55DCAB','F75DB1','ABABAF','7EA8EA');
  $co = array_rand($a,2);
  $color = $a[$co[0]];
//随机颜色代码结束，下面开始吧颜色赋值给每个标签生成背景色
  $pattern = '/style=(\'|\")(.*)(\'|\")/i';
  $text = preg_replace($pattern, "style=\"background:#{$color};\"", $text);
  return "<a $text>";
}
//把php代码挂载到wp_tag_cloud钩子上
add_filter('wp_tag_cloud', 'colorCloud', 1);
```
