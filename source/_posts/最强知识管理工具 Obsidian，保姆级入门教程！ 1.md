---
title: 最强知识管理工具 Obsidian，保姆级入门教程！
source: https://mp.weixin.qq.com/s/eta2xD_NIIXZH2DqEt0JLQ
author:
published:
created: 2026-05-31
description:
tags:
  - clippings
  - bosidian
---
前面有提到搭建个人知识库[[我是怎么搭建个人知识库的：Obsidian + GitHub]]

随着AI时代的发展，用户对知识管理工具的需求越来越强烈。

有了知识管理工具，你就拥有了一个海量记忆的外接大脑，能够随时存储和检索你的个性化信息。

如今市面上推出了各种各样的知识管理工具，究竟哪一家最强呢？目前公认最强大的工具当属 Obsidian 。

![01.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174303747.png)


今天，小灰就为大家介绍一下 Obsidian 的基本概念、安装方法、插件种类、同步技巧、图床功能等等。文章较长，建议大家先收藏，不迷路。

一、Obsidian 到底是什么？

一句话说清楚，Obsidian 是一款本地优先的 Markdown 笔记软件。

它和普通文档工具最大的区别，不是界面，而在于你可以将笔记长期保存在本地，并通过链接把内容相互关联起来。

如果你只是偶尔写一篇文章，Typora 就已经能满足需求了。

但如果你想把资料、灵感、草稿、项目记录慢慢积累成自己的知识库，Obsidian 更合适。

## 二、安装与初始设置

## 1\. 下载安装并创建 Vault

官网是 `https://obsidian.md` 。
![02.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174334102.png)

安装完成后，首次启动会让你创建一个 Vault。

你可以把 Vault 理解成一个专门放笔记的文件夹，比如：

```
我的知识库/
├── 读书笔记.md
├── AI写作.md
├── 项目复盘.md
└── 素材/
```

这一步很重要，因为 Obsidian 的笔记本质上就是普通文件。你以后做同步、备份、迁移、导出，都是基于这个文件夹来做。

如果官网或插件下载比较慢，我把安装包和需要用到的插件放在了网盘里，大家可以自取：

https://pan.quark.cn/s/bde04f0a8c18

2\. 先认识这几个区域

第一次打开后，先认这几个地方：

- • 左侧，文件列表和搜索
- • 中间，编辑区
- • 右侧，反向链接和大纲
- • 左下角，设置入口
![03.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174348488.png)


3\. 先打开几个常用核心功能

进入“设置 → 核心插件”，建议优先打开这些：

| 功能 | 作用 |
| --- | --- |
| 搜索 | 全文搜索，找笔记最快 |
| 快速切换 | 用 `Ctrl + O` 快速跳转到任意笔记 |
| 反向链接 | 查看哪些笔记提到了当前这篇 |
| 大纲 | 快速浏览长文结构 |
| 模板 | 固定格式的笔记可以一键套用 |
| 关系图谱 | 用知识图谱方式查看笔记关系 |
| 命令面板 | 用 `Ctrl + Shift + P` 找几乎所有命令 |
| 斜杠命令 | 启用后，在编辑器中输入斜杠可以快速触发命令 |
| 发布 | 一键发布到小红书、微信公众号等平台 |

![04.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174402697.png)


## 三、怎么安装插件？

这几乎是每个新手最关心的问题。

Obsidian 的插件分两类：

- • 核心插件，官方自带，打开就能用
- • 社区插件，第三方开发，需要你自己安装

安装社区插件的步骤很简单：

1. 1\. 打开“设置”
2. 2\. 进入“第三方插件”
3. 3\. 先关闭安全模式
![05.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174423211.png)


1. 4\. 点击“浏览”
2. 5\. 搜索插件名
3. 6\. 点击“安装”
![06.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174432415.png)


第一次装插件，最容易犯的错就是一下装太多。

对小白来说，前期先配 3 个 Obsidian 插件就够了：

| 插件                | 作用                              |
| ----------------- | ------------------------------- |
| Editing Toolbar   | 给编辑器加一排常用按钮，不想手敲 Markdown 的人很适合 |
| Image auto upload | 自动图片上传                          |
| Nutstore Sync     | 坚果云同步插件                         |

考虑到很多小伙伴网络的问题，大家只需把网盘里面的插件解压到Obsidian的插件文件夹，然后刷新即可。

1\. 打开插件文件夹：

![07.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174443697.png)


2\. 将网盘下载的插件压缩包解压：  
![08.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174537869.png)


3\. 点击刷新，即可加载刚刚解压的插件：  
![09.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174553100.png)


## 四、怎么安装和使用 Web Clipper ？

很多人看到一篇好文章、一个工具页、一个教程页面，第一反应是先收藏到浏览器，结果过几天就再也找不到了。

`Web Clipper` 的作用，就是你在浏览网页时，可以直接把当前页面一键保存到 Obsidian。

你可以先把它理解成： **把网上看到的有用内容，更顺手地收进自己的知识库。**

它比较适合这几种场景：

- • 收藏一篇以后要细读的文章
- • 保存某个工具官网的介绍页
- • 剪藏教程、案例、清单类内容
- • 先收集资料，后面再慢慢整理成自己的笔记

对小白来说， `Web Clipper` 真正有用的地方，不是“收藏网页”这件事本身，而是它帮你少走了一步。

以前你可能是：看到好内容，先加入浏览器收藏夹，过几天再忘记。

现在你可以直接把内容收进 Obsidian，后面再配合搜索、标签、双向链接慢慢整理。

如果你平时经常看教程、刷工具、存案例，那这个功能会非常高频。

这里我们以 `Chrome` 为例，介绍该插件如何使用。

1\. 从网盘下载 `Web Clipper` 插件。

![10.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174606603.png)


2\. 打开 `Chrome` 扩展程序页面，开启开发者模式，直接将压缩包拖拽到扩展程序页面完成安装。

![11.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174618416.png)


3\. 配置和使用

打开设置页面：

![12.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174628631.png)


修改语言为中文，配置保管库：

![13.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174641899.png)


配置模板：

![14.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174654781.png)


4\. 测试效果：

![15.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174705386.png)


## 五、怎么配置图床

这里可以参考之前的[[使用github+picgo搭建图床并使用免费cdn服务进行加速]]
如果你只是自己本地记笔记，图片直接存在 Vault 里就够了。

但如果你要把 Obsidian 里的内容发到公众号、博客、论坛，图床会很重要。

因为很多平台不认你本地电脑上的图片路径，你需要把图片先传到网上，再拿到一个可访问的链接。

对小白来说，最常见也最省心的组合就是 **PicGo + 阿里云** ：PicGo 负责上传，阿里云负责存。

也就是说： **拖一张图进笔记，PicGo 自动上传，返回一个图片链接。**

配置顺序很简单：

1\. 启用 `Image auto upload` 插件：

![16.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174717691.png)


2\. 安装 PicGo 选择你需要的版本进行安装，Windows选exe文件，Mac选dmg文件：  
![17.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174728592.png)


3\. 去阿里云注册，完成实名认证。

4\. 进入阿里云对象存储 OSS，没开通的点击 `立即开通`

![18.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174741046.png)


5\. 快速创建 `Bucket`

![19.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174752691.png)


6\. 开启公共访问权限

![20.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174806631.png)


![21.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174817151.png)


7\. 创建 AccessKey ID、AccessKey Secret

![22.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174827785.png)


8\. 在 PicGo 中选择阿里云图床，填入以上信息

![23.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174838313.png)


9\. 常用配置

![24.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174849430.png)


10\. 复制粘贴一张图片到文档，正常返回链接显示图片就表示成功了

![25.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174904137.png)


如果你暂时还不发文章，图床可以先不折腾。但如果你经常写公众号或博客，这一步早点配好，不然后面搬图片会很麻烦。

## 六、怎样同步笔记 ？

很多人觉得同步功能可以后期再配置，其实不然。

如果多设备间无法同步笔记，使用体验会大打折扣，久而久之你就会转向其他便携工具。

1\. 常见同步方案怎么选

| 方案 | 适合谁 | 特点 |
| --- | --- | --- |
| Obsidian Sync | 想省心、省折腾的人 | 官方方案，体验完整，但要付费 |
| 坚果云 | 大多数中文用户 | 上手门槛低，日常同步够用，比较适合新手 |
| Git + Gitee | 程序员、进阶用户 | 版本记录清楚，适合备份和回滚，但门槛更高 |

如果你问我新手优先选哪个，我还是更建议先用坚果云。

1. 启用 `Nutstore Sync` 插件
![26.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174915423.png)


1. 登录坚果云，绑定账号
![27.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174925476.png)


1. 开始同步
![28.png](https://cdn.jsdelivr.net/gh/Demon1630/picBed/img/20260606174934500.png)


如果你本身就熟悉 Git，那也可以把整个 Vault 放进 Git 仓库，再同步到 Gitee，适合做长期备份和版本回滚。

## 七、怎么搭建 LLM Wiki

很多人一开始把 Obsidian 当成笔记软件，但真正拉开使用差距的，是能否将它打造成专属的个人 AI 知识库。

你可以先简单理解成一句话： **让你记下来的内容，不只是方便自己搜索，以后也能更方便给 AI 调用。**

对小白来说，这一块先不用一开始就深挖。

但有一个前提要先明白： **LLM Wiki 的基础，不是先装多少 AI 工具，而是你手里先得有内容。**

也就是说，前期最重要的不是折腾配置，而是先持续积累笔记、资料、想法和链接。

你只要先把内容慢慢记下来，再尽量写清楚、标题起明白、相关内容连起来，后面不管是做知识整理、AI 问答，还是让 AI 帮你生成内容，都会顺很多。

等你前面这些先跑通了，后面我们再单独讲，怎么把 Obsidian 慢慢搭成一个真正能用的 LLM Wiki。

## 八、给小白的最小建议

如果你今天第一次开始用 Obsidian，不要想着一步到位。

先按这个顺序来就够了：

1. 1\. 安装 Obsidian，建一个 Vault
2. 2\. 打开搜索、反向链接、关系图谱 这些核心功能
3. 3\. 先装 `Editing Toolbar` 、 `Web Clipper` 、 `Image auto upload` 、 `Nutstore Sync` 这几个最常用的插件
4. 4\. 学会用 `Web Clipper` 把网上有用内容收进知识库
5. 5\. 如果你经常发文章，再去配 `PicGo + 阿里云`
6. 6\. 尽早把同步跑通，新手优先用坚果云
7. 7\. 平时把笔记按主题写清楚，尽量加上 `[[双向链接]]`
8. 8\. 慢慢整理出专题页，让知识库能被 AI 更好理解和调用

文章来源于：https://mp.weixin.qq.com/s/eta2xD_NIIXZH2DqEt0JLQ
