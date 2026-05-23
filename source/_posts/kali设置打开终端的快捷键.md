---
title: kali设置打开终端的快捷键
date: 2021-01-09
categories:
- kali-linux
tags:
- kali-linux
---
kali中没有设置像ubuntu中一样ctrl+alt+t这样打开终端的快捷键。 因此都需要单击打开终端，很麻烦。 但是我们可以自行设置打开终端的快捷键。

# 设置打开终端的快捷键

1. 打开设置，找到keyboard选项。
2. 拉到最下面点击`+`号，新增快捷键。
3. 在新出现的窗口中： `命令`：是按下这个快捷键后启动的命令，这里命令应该填exo-open --launch TerminalEmulator 之后设置你自己的快捷键
4. 然后就可以使用快捷键打开终端了

现在最新版的kali linux已经自带打开终端的快捷键了，是ctrl+alt+t，可以找到上面的命令然后修改为自己想要的快捷键方式
