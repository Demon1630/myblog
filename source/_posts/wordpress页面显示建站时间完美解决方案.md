---
title: WordPress页面显示建站时间完美解决方案
date: 2019-10-23
categories:
- wordpress
tags:
- wordpress
- 网站
- 网站建设
---
    WordPress在页面上如果想显示一个统计时间的话，可以不需要使用插件，直接在外观>主题编辑器>footer.php文件中，将以下代码放到最前面然后更新文件即可实现，具体代码如下，实现的情况可以参考[主页](https://www.demon1630.cf)下方时间显示情况：

 

```
和老婆在一起：<SPAN id=span_dt_dt style="color: #2F889A;"></SPAN> <SCRIPT language=javascript>function show_date_time(){
window.setTimeout("show_date_time()", 1000);
BirthDay=new Date("10/1/2018 00:00:00");
today=new Date();
timeold=(today.getTime()-BirthDay.getTime());
sectimeold=timeold/1000
secondsold=Math.floor(sectimeold);
msPerDay=24*60*60*1000
e_daysold=timeold/msPerDay
daysold=Math.floor(e_daysold);
e_hrsold=(e_daysold-daysold)*24;
hrsold=Math.floor(e_hrsold);
e_minsold=(e_hrsold-hrsold)*60;
minsold=Math.floor((e_hrsold-hrsold)*60);
seconds=Math.floor((e_minsold-minsold)*60);
span_dt_dt.innerHTML='<font style=color:#C40000>'+daysold+'</font> 天 <font style=color:#C40000>'+hrsold+'</font> 时 <font style=color:#C40000>'+minsold+'</font> 分 <font style=color:#C40000>'+seconds+'</font> 秒';
}
show_date_time();</script>
```

添加代码位置如图所示：

![](http://www.demon1630.cn/wp-content/uploads/2019/10/1571795840-时间显示代码-1024x434.png)
