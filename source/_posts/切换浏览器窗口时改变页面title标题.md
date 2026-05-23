---
title: 切换浏览器窗口时改变页面title标题
date: 2021-01-13
categories:
- wordpress
tags:
- 网站建设
---
之前看到别人博客上，在切换到其他窗口时，浏览器的页面title就发生了改变，感觉很有趣，这里介绍一下

首先，正常情况下显示是这样： ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113195755.png)

之后当切换到其他窗口后： ![](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20210113195946.png)

可以看到title已经发生了改变

上代码：

```
var title;  // 用于临时存放原来的title内容
    window.onblur = function(){
      // onblur时先存下原来的title,再更改title内容
      title = document.title;
      document.title = " 你莫走！ヾ(≧▽≦*)o";
    };
    window.onfocus = function () {
      // onfocus时原来的title不为空才替换回去
      // 防止页面还没加载完成且onblur时title=undefined的情况
      if(title) { 
        document.title = title;
      }
    }
```

将上面代码添加到主题js文件中即可
