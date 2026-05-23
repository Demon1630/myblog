---
title: 在ESXI 虚拟机上安装群晖 7.0 (DSM7.0.1)教程
date: 2023-09-11
categories:
- wordpress
tags:
- nas
- 群晖
- 路由器
- 软件
---
## 一、安装步骤：先下载启动文件及系统文件

下载DS918的系统文件及引导文件

[https://pan.gxnas.com:1443/%E9%BB%91%E7%BE%A4%E6%99%96/DS918+/DS918\_7.2-64570%EF%BC%88%E5%BC%95%E5%AF%BC%E6%96%87%E4%BB%B6%EF%BC%89.img](https://pan.gxnas.com:1443/%E9%BB%91%E7%BE%A4%E6%99%96/DS918+/DS918_7.2-64570%EF%BC%88%E5%BC%95%E5%AF%BC%E6%96%87%E4%BB%B6%EF%BC%89.img)

[https://pan.gxnas.com:1443/%E9%BB%91%E7%BE%A4%E6%99%96/DS918+/DS918\_7.2-64570%EF%BC%88%E7%B3%BB%E7%BB%9F%E5%AE%89%E8%A3%85%E5%8C%85%EF%BC%89.pat](https://pan.gxnas.com:1443/%E9%BB%91%E7%BE%A4%E6%99%96/DS918+/DS918_7.2-64570%EF%BC%88%E7%B3%BB%E7%BB%9F%E5%AE%89%E8%A3%85%E5%8C%85%EF%BC%89.pat)

将文件改名，尽量不要包含中文及特殊符号

![](https://pic4.zhimg.com/v2-b9cc18af37c7fb4475ed4744cc22766f_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-205fd48bd46f302e675479e931fb9228.jpg)

## 二、使用DisckGenius分区工具，打开虚拟文件

单击菜单上的“硬盘”—“打开虚拟硬盘文件”，选择我们下载好的img文件 ： 打开虚拟文件 DS918\_7\_42218.img

![](https://pic4.zhimg.com/v2-1816a4fb1eb8066ffdc102aa78220d3b_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-145b829480f11a0f11ea6e2db17995b7.jpg)

## 三、导出Grub.cfg文件

展开左边的 grub文件夹，在右边找到grub.cfg文件，鼠标右键，弹出的菜单中选择“复制到指定的文件夹”

![](https://pic2.zhimg.com/v2-a7a92d34e15a1940a61f79ee8546975d_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-3e1f3723ac5024ff8a2fb166e707ae45.jpg)

## 四、用编辑器修改grub.cfg文件

_**如果没有下面这些需求，不进行修改也可以，直接采用默认的就行。**_

使用UltraEdit 或其它文本编辑器打开grub.cfg文件进行修改

![](https://pic1.zhimg.com/v2-1c4f31e03cdce6ffd21d8435559360ac_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-6f3b58de51e45cea2c72188d84e9bf00.jpg)

1、netif\_num=1：网口数量，默认为1，如需两个网口改成netif\_num=2

2、mac1=001132123456：如有2个网口在后面再添加 mac2=第2个网口mac地址（与第1个要不同） 如有真实的，填真实的洗白码mac值

3、sn=2021PDN123456：默认的序列号，如有真实洗白码，则改之，我用的是默认的

4、esxi虚拟机安装，VID和PID可不改

## 五、如grub.cfg 有修改，则更新文件到当前分区

![](https://pic3.zhimg.com/v2-995e33442fc122173e403b43bf64d1c2_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-967181e1e6e971278f84de6be738fefa.jpg)

## 六、安装StarWind V2V Image Converter.exe 工具并运行它

特别注意: 原img文件及将来生成的目标Vmdk文件 两者的目录最好是纯英文，不要有中文，否则有可能会出错

![](https://pic4.zhimg.com/v2-d7c09704c0d2073e1b04a07e27a213bf_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-560a954fc6a3ac9afe66501d767cff65.jpg)

选择Local File (本地文件）

选择刚才改好的img文件。这里一定要注意，要先关闭前面的分区软件DiskGenius, 否则选择文件后会出错，因为DiskGenius还占用了img文件。

![](https://pic3.zhimg.com/v2-e927b15f5471f156db4e0e613d2b88de_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-62fe6d4410a645e7afb404e9866ea32d.jpg)

**关闭分区助手再打开，就正常了**

![](https://pic2.zhimg.com/v2-71e522e5758c6b040789685b8a38f549_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-87f95302100437f8c669a43e9b134d57.jpg)

目标选择 Local File, 下一步，选择VMDK。 当然也可选择Remote 虚拟机，直接过去

![](https://pic2.zhimg.com/v2-01f2f47fe38f4f98809e70634df0828d_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-a006956e79829b340b741449832d6a84.jpg)

再选择esxi Server image

![](https://pic4.zhimg.com/v2-3824ab56a7e8a63273dd76382741a9ab_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-13990de33cd73b5a9408efec0eb71fad.jpg)

![](https://pic2.zhimg.com/v2-8d12974b5364a96a0d14624ed6524a29_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-40f101dbe356f566d03605f820da4176.jpg)

目标名，可点...改成无中文字的纯英文名较好

![](https://pic4.zhimg.com/v2-54141be20dec44fb1be17cd4a081474f_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-6f0eb249409fc0151cf2b137f4f1b497.jpg)

转换成功

![](https://pic1.zhimg.com/v2-0743ca1cc990b7099ee25bafa220d6ac_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-7b442d688f7f23398c573c433e7f8dcd.jpg)

按Finish结束

可看到目标文件夹会生成2个vmdk文件，其中一个带 -flat

![](https://pic2.zhimg.com/v2-004a8aee13a7cc048a2fb7b7b5c77165_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-9acdc8ca93e3546dd7510611f12735c4.jpg)

## 七、在esxi虚拟机数据存储创建一个dsm7目录，把这2个文件上载上去

![](https://pic2.zhimg.com/v2-2c8031eea69858e95886d68624cdce39_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-2f70c9b353765a8b6c9249b541829f6f.jpg)

## 八、在esxi创建新的虚拟机

客户机操作系统 选择linux ,4.x或更高版本的Linux(64位）

![](https://pic3.zhimg.com/v2-d536ddd4e0392efdea76244a3cc58a5e_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-4691f24014c4c399d879094fbe362c8f.jpg)

设置如下

![](https://pic1.zhimg.com/v2-a1e9c1431c467b1e8e0f9356a6b5ffdc_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-a33347097ef279a726e868f7d5dc4de0.jpg)

最终配置如下

![](https://pic4.zhimg.com/v2-c73b38d55f8faa4ae76e3aa6ea1a3b77_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-b0c958c0a4d981c795a42c76a6392ecc.jpg)

## 九、对虚拟机进行编辑，添加现有硬盘

完成后再打开此虚拟机进行编辑

![](https://pic3.zhimg.com/v2-49fca48bf51af6cd97aaee40876a700e_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-907f341ed3d0059e36965b565c979cf4.jpg)

添加现有硬盘，选择我们上传2个vmdk文件的路径

![](https://pic1.zhimg.com/v2-cd2aa2ef6418ba2075ad10352fe9f83c_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-684967d66363ac19b4b909a030b9a800.jpg)

删除创建虚拟机时默认分配的硬盘，最终保存后的设置如下

![](https://pic3.zhimg.com/v2-30fe1d376f914343c292291a06df209a_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-90fbbd0eb2d4a84c5c0bc0f171f12811.jpg)
在虚拟机选项，引导选项，点开三角形；[![](https://wp.gxnas.com/wp-content/uploads/2021/09/1632379458-44.jpg)](https://wp.gxnas.com/wp-content/uploads/2021/09/1632379458-44.jpg)

 

 

找到“是否为此虚拟机启用UEFI安全引导”这行； [![](https://wp.gxnas.com/wp-content/uploads/2021/09/1632379459-45.jpg)](https://wp.gxnas.com/wp-content/uploads/2021/09/1632379459-45.jpg)

 

 

把默认的打勾去掉，保存；[![](https://wp.gxnas.com/wp-content/uploads/2021/09/1632379460-46.jpg)](https://wp.gxnas.com/wp-content/uploads/2021/09/1632379460-46.jpg)

 

 

点下图所示位置的三角形，启动虚拟机；[![](https://wp.gxnas.com/wp-content/uploads/2021/09/1632379461-47.jpg)](https://wp.gxnas.com/wp-content/uploads/2021/09/1632379461-47.jpg)

 

## 十、在虚拟机内启动黑群晖

现在就可启动虚拟机了。启动时选择 第2项 SATA Verbose

![](https://pic2.zhimg.com/v2-8c2f7575a973abea71184bb507da3571_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-dd2d57ec90005576293b81f6741b3fe0.jpg)

启动正常，说明群晖启动是正常的。

我进行这步出现错误：提示以下错误

disk hd0 msdos1 not found

sata boot support on this platform is experimental

原来是sata 的顺序弄错了，将启动盘设置 为sata 0:0 数据盘设置为 sata 0:1 或 0:2 如果UEFI不行，就设置为传统BIOS启动就可以了 (我的光驱占用 SATA (0:1))

![](https://pic2.zhimg.com/v2-c0c351dd3c208f512546a3f2d1988175_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-cd27f35379f76cd94ed8df08e0c63ac9.jpg)

## 十一、用群晖助手 7.0 搜索就可找到刚装好的DSM7

![](https://pic3.zhimg.com/v2-6d58bf4476eff0667e58f7998f527356_b.png)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-351f49e8979155c070fc745da4257009.png)

我在某些环境安装助手找不到新安装的设备，要在路由器中找到新发现的设备，直接找到它的IP，直接连接，连接一次之后，再用群晖助手，就可找到了。一般名称为：

| Synology DiskStation |  |
| --- | --- |

![](https://pic3.zhimg.com/v2-085bb15af367f9bd174d7c0461eea3fe_b.png)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-ff15cb91172351d5759f9cc3fc57ffd2.png)

如出现未在 DS3615 DS918+ 中检测到硬盘的错误

![](https://pic4.zhimg.com/v2-3b2dd65c4e57bc09749d07be5fb17c8f_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-84bf214be78a79767671ad9931301b24.jpg)

![](https://pic2.zhimg.com/v2-1adfc31563ecf607ee882cee5be2bdad_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-5be9fa9ff97fa663579b47e41fc53f20.jpg)

则需要在前面将grub.cfg中的参数修改：

虚拟机里找不到硬盘，（原来的值是 SataPortMap=1），把它改成 SataPortMap=4 就可以了

## 十二、双击进行系统安装

![](https://pic4.zhimg.com/v2-2d80cb83c3d12565983debeb93635c8f_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-282b40189991591528b75040adad4c67.jpg)

选择前面下载好的PAT系统文件

![](https://pic2.zhimg.com/v2-b79e50c76549de714629569cfc623d35_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-0a566c6cf4cc6d24fcf108a67b385339.jpg)

会删除硬盘之前的数据

![](https://pic4.zhimg.com/v2-6d77feb88e3dd573aeedb98f687a13d7_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-73cbdc5dffefa1a289292a2161b06041.jpg)

![](https://pic1.zhimg.com/v2-62b058788983598c5261e25c693a5104_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-34747cf9d54179f1c73bb0d739026a31.jpg)

![](https://pic1.zhimg.com/v2-5bfc44d6df6e5124c4b4433270202e68_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-365f10bdd14282b6dd8416a28ae8d42c.jpg)

## 十三、登录群晖7.0

![](https://pic4.zhimg.com/v2-9eef137a7cbee58ab163279db3527067_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-4323bdbeb6316d9dfa895b52ab512754.jpg)

为避免更新导致不能使用，最好手动安装更新包

我是半洗白，选择跳过创建 sysnology 账号

![](https://pic2.zhimg.com/v2-2c42e46505ae3835435d2107dd48d179_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-d2f76bbd07245606cd6eebf85af4f2f6.jpg)

## 十四、创建存储池和存储空间

![](https://pic3.zhimg.com/v2-e1822b3e914da19dfe460f76e10c393e_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-b97a94727b2eb0bde5ce79bb25daff2b.jpg)

![](https://pic3.zhimg.com/v2-0fb3fe64475d484af9aadbb2dd1dba0a_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-8700d9eaa547b0813acf46184ad9bf81.jpg)

![](https://pic3.zhimg.com/v2-b4954c947fc4a1b494a1768be9fe7cc2_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-104085236700611108b9a9c0727bc27d.jpg)

![](https://pic1.zhimg.com/v2-83179e4b0109e87a450629ab97132be8_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-d1df2aac899176bb3bdce96ea0d9d30f.jpg)

![](https://pic1.zhimg.com/v2-ee93ef913aa33858bb6c74452434447c_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-96f8690e945fcb6d5a05e98dc2c4a7a9.jpg)

为节约时间，我跳过了硬盘检查，待空闲时一定要做一次

![](https://pic2.zhimg.com/v2-5a49d0851b32b58eb533acbb17dc5fd1_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-6ee66f16caef35684ac71ddd43037bb3.jpg)

![](https://pic4.zhimg.com/v2-13723ea214a1ff067099afb0c397798b_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-c62679d21302491366a309445df8710b.jpg)

![](https://pic3.zhimg.com/v2-db16d03b46091eb6ee383a6bcce02f86_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-4e656188c1cb6916972284bdd464a10e.jpg)

![](https://pic4.zhimg.com/v2-b409aa9f9c80e093d34e8222f1989007_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-6f48c1df4393a3e05a84b7d86bc6d631.jpg)

然后就是等待了。

等待处理完成就可使用了。

终于可以愉快地享用DSM 7.0了

![](https://pic2.zhimg.com/v2-fc72d28b5841c98ed2ef77e52f387ad9_b.jpg)

![](http://www.demon1630.cn/wp-content/uploads/2023/09/frc-fbde0dac52de71ea03f692c5fe4246b3.jpg)

文章来源：

https://zhuanlan.zhihu.com/p/458525825

https://wp.gxnas.com/11089.html
