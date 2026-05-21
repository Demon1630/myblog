---
title: "VIPM（VI Package Manager）无法连接到LabVIEW"
date: 2020-05-14
categories: 
  - "技术"
tags: 
  - "labview"
---

问题详述

我有一个VI程序包文件需要在LabVIEW中安装。当我单击Install按钮时，VIPM会尝试连接LabVIEW并出现等待界面。经过一段时间后出现了以下批处理错误对话框之一。![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kEyY&feoid=00N0Z00000HEWRk&refid=0EM0Z000000WBio)![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kEyY&feoid=00N0Z00000HEWRk&refid=0EM0Z000000WBit)

批处理错误，VIPM无法继续工作。请修正错误后重试。 发生以下严重错误： VIPM无法连接到LabVIEW XX.X. VIPM要求LabVIEW访问作为当前正在处理的执行任务的一部分。

## 解决方案

VIPM使用VI服务器（VI Server）与LabVIEW进行连接。不正确的VI服务器配置会导致超时的发生。若要成功连接，必须以相似的方式配置LabVIEW与VIPM的连接协议。

**首先，在LabVIEW中完成以下步骤以配置与VI服务器的连接。**

1. 单击**工具»选项**以启动“选项”对话框。
2. 从左侧的“类别”部分中选择**VI服务器** 。
3. 勾选“协议”部分的**TCP / IP**复选框。
4. 记住**端口号** 。 3363是默认端口号。您不需要使用默认值，但LabVIEW和VIPM必须被设置为相同的端口号。如果您的计算机中安装了多个LabVIEW版本，则每个版本都会显示不同的端口号。以下示例显示了已完成的**协议**部分设置：

![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kEyY&feoid=00N0Z00000HEWRt&refid=0EM0Z000000WBiy)

5. 单击“计算机访问”部分中的“ **添加”**按钮以添加新计算机。
6. 在机器名称/地址字段中输入localhost ，如下面的对话框中所示(如果localhost不起作用，您也可以尝试临时将\*添加到机器访问列表，允许所有连接。这将表明问题是否是由于VI服务器的访问限制所导致）：

![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kEyY&feoid=00N0Z00000HEWRt&refid=0EM0Z000000WBj8)

**接着，在VIPM中完成以下步骤以配置VI服务器连接。**

1. 单击**工具»选项**以启动“选项”对话框。
2. 单击**LabVIEW**选项卡。
3. 确认**端口号**与先前配置的LabVIEW VI服务器端口号匹配。如果需要，单击编辑图标以更改端口号。
4. 单击“ **验证”**按钮。

有关已完成的LabVIEW配置的示例，请参阅以下对话框：

![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kEyY&feoid=00N0Z00000HEWRt&refid=0EM0Z000000WBjI)

VIPM将重启LabVIEW。当LabVIEW开始备份时，VIPM将建立连接，您将可以进行软件包的安装。

如果上述步骤不起作用，请尝试关闭计算机上的所有防火墙或防病毒软件。此外，在管理员模式下运行VIPM，右键单击开始菜单中的应用程序，程序和文件，然后选择**以管理员身份运行** 。

作为本工具的开发者，[JKI支持](https://support.jki.net/hc/en-us)可以作为您所需其他帮助的信息来源。

## 相关信息

**查找VIPM**

您可以在VIPM中显示多个窗口。在主窗口中，您可以安装各类软件包，而其他窗口则为您提供其他选项。其中一个窗口是LabVIEW工具网络（Tools Network），包含各种可供安装的工具和附件。VIPM的主窗口如下图所示：

![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kEyY&feoid=00N0Z00000HEWRM&refid=0EM0Z000000WBjS)

要显示VIPM主窗口，请在LabVIEW工具网络窗口中单击**Window»Show VI Package Manager** ，如下图所示：

![](https://knowledge.ni.com/servlet/rtaImage?eid=ka00Z000000kEyY&feoid=00N0Z00000HEWRM&refid=0EM0Z000000WBjX)
