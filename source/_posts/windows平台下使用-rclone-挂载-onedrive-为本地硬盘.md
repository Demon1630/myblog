---
title: "Windows平台下使用 Rclone 挂载 OneDrive 为本地硬盘"
date: 2020-05-30
categories: 
  - "wordpress"
---

## **Windows平台下使用 Rclone 挂载 OneDrive 为本地硬盘**

Rclone (rsync for cloud storage) 是一个命令行程序,用于同步文件和目录，支持常见的 Amazon Drive 、Google Drive 、OneDrive 、Dropbox 等云存储。本文将演示在 Windows 平台下将 OneDrive 挂载为本地硬盘，并使用跨平台的 Rclone GUI 连接到云盘。

### **1、rclone下载地址**

首先下载适用于 Windows 的 rclone

官网下载：

[Rclone downloads​rclone.org](https://link.zhihu.com/?target=https%3A//rclone.org/downloads/)

  
GitHub下载：

[rclone/rclone​github.com![图标](https://pic1.zhimg.com/v2-e599c51cc6f849b4e388c7ecd933407c_ipico.jpg)](https://link.zhihu.com/?target=https%3A//github.com/ncw/rclone)

在[rclone官网](https://link.zhihu.com/?target=https%3A//rclone.org/downloads/)中，Windows 平台下选择下载 AMD64 - 64 Bit

![](https://pic3.zhimg.com/v2-dba90fa9447c3ce0c59cd628b099f89a_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-22e1b72fe82dfffdc5d221bb0f0a6b58.jpg)

或者在[github](https://link.zhihu.com/?target=https%3A//github.com/rclone/rclone/releases)下载。

![](https://pic3.zhimg.com/v2-6fe076f9b3c1b74e59bafcc454b2457e_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-8c4825f70542066015be7737dda1bdf8.jpg)

下载后解压到一个英文路径中。

![](https://pic2.zhimg.com/v2-2c598f613124fd234541d5b64bd5cd35_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-04d40757d4b168d70858f84849a08ddd.jpg)

另外在Windows平台使用rclone还需要另一个依赖工具`winfsp`，下载地址：

[http://www.secfs.net/winfsp/download/​www.secfs.net](https://link.zhihu.com/?target=http%3A//www.secfs.net/winfsp/download/)

下载后一路安装即可。

  

![](https://pic1.zhimg.com/v2-185ca574a84e6ddab1639bc10788db20_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-b4dc85f0a6572d13c3f954c5544be9fd.jpg)

  

### **2、为rclone配置环境变量**

1. 在电脑桌面右键点击“此电脑”的“属性”选项
2. 选择“高级系统设置”选项
3. 在系统变量中找到path，添加刚才解压后的路径

  

![](https://pic4.zhimg.com/v2-3f0af66bf0619eaa28ffc968c41548f7_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-29bd9142bc90087e871fb3ad7b8530fb.jpg)

  

### **3、检查rclone是否配置成功**

按`win`+`X`，然后按`A` 打开 `powershell` ，当然也可以去打开 `cmd` ，输入`rclone --version`，如果出现下面的输出则安装成功，否则检查上面步骤的环境变量是否配置正确。

![](https://pic1.zhimg.com/v2-c8592fd9860d57cd2b88c60ecb932f6c_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-023eb5a7237c2e412ca3f1f4abd14eb7.jpg)

### **4、开始配置rclone**

在终端中依次输入以下命令行，请根据我下的步骤进操作。

```cpp
D:AutoRclone>rclone config                    // 第一步在终端输入 rclone config 
Current remotes:
​
Name                 Type
====                 ====
OneDrive             onedrive
​
e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q> n                          //第二步输入n创建新的配置，                                                                  
​
name> OneDrive_local                      //第三步 输入一个英文名称 ，中间也不要有空格
Type of storage to configure.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
 1 / 1Fichier
  "fichier"
 2 / Alias for an existing remote
  "alias"
 3 / Amazon Drive
  "amazon cloud drive"
 4 / Amazon S3 Compliant Storage Provider (AWS, Alibaba, Ceph, Digital Ocean, Dreamhost, IBM COS, Minio, etc)
  "s3"
 5 / Backblaze B2
  "b2"
 6 / Box
  "box"
 7 / Cache a remote
  "cache"
 8 / Citrix Sharefile
  "sharefile"
 9 / Dropbox
  "dropbox"
10 / Encrypt/Decrypt a remote
  "crypt"
11 / FTP Connection
  "ftp"
12 / Google Cloud Storage (this is not Google Drive)
  "google cloud storage"
13 / Google Drive
  "drive"
14 / Google Photos
  "google photos"
15 / Hubic
  "hubic"
16 / In memory object storage system.
  "memory"
17 / JottaCloud
  "jottacloud"
18 / Koofr
  "koofr"
19 / Local Disk
  "local"
20 / Mail.ru Cloud
  "mailru"
21 / Mega
  "mega"
22 / Microsoft Azure Blob Storage
  "azureblob"
23 / Microsoft OneDrive
  "onedrive"
24 / OpenDrive
  "opendrive"
25 / Openstack Swift (Rackspace Cloud Files, Memset Memstore, OVH)
  "swift"
26 / Pcloud
  "pcloud"
27 / Put.io
  "putio"
28 / QingCloud Object Storage
  "qingstor"
29 / SSH/SFTP Connection
  "sftp"
30 / Sugarsync
  "sugarsync"
31 / Transparently chunk/split large files
  "chunker"
32 / Union merges the contents of several remotes
  "union"
33 / Webdav
  "webdav"
34 / Yandex Disk
  "yandex"
35 / http Connection
  "http"
36 / premiumize.me
  "premiumizeme"
 Storage> 23                             //第四步 输入要配置的网盘类型 因为我们要配置Microsoft OneDrive 因此输入23
** See help for onedrive backend at: https://rclone.org/onedrive/ **
​
Microsoft App Client Id
Leave blank normally.
Enter a string value. Press Enter for the default ("").
client_id>                              //第五步 直接回车
Microsoft App Client Secret                                  
Leave blank normally.                                        
Enter a string value. Press Enter for the default ("").      
client_secret>                           //第六步 直接回车                    
Edit advanced config? (y/n)                                  
y) Yes 
n) No (default)                                              
y/n> n                                  //第七步 输入n 不进行高级配置 
Remote config                                                
Use auto config? 
 * Say Y if not sure 
 * Say N if you are working on a remote or headless machine
y) Yes (default) 
n) No                                                        
y/n> y                                  //第八步 输入y 使用自动配置授权
​
//输入y后会打开默认浏览器 登录Microsoft账号后 选择 是 即可
 If your browser doesn't open automatically go to the following link: http://127.0.0.1:53682/auth?state=sUuYaGWtxruA81JiCokJGg
Log in and authorize rclone for access
Waiting for code...
Got code
Choose a number from below, or type in an existing value
 1 / OneDrive Personal or Business
  "onedrive"
 2 / Root Sharepoint site
  "sharepoint"
 3 / Type in driveID
  "driveid"
 4 / Type in SiteID
  "siteid"
 5 / Search a Sharepoint site
  "search"
Your choice>1                            //第九步 输入1 因为现在我配置的是 OneDrive Personal or Business 类型的网盘
​
Found 1 drives, please select the one you want to use:
0: OneDrive (business) id=b!qDQvcsZUTU-8eoYyKmtyyP1Jc0D8urZLlkATnfH1nWdJ1kkbrLsvQZLzVUTpeTrc
Chose drive to use:> 0              //第十步 输入0
Found drive 'root' of type 'business', URL: https://pmjs-my.sharepoint.com/personal/wld_365_w/Documents
Is that okay?
y) Yes (default)
n) No
y/n> y                               //第十一步 输入y
--------------------
[OneDrive_local]
type = onedrive
token = {"access_token":"eyJ0eXAiOiV1QiLCJub25jZSI6ImNRYjl5TDNZWE8yczdQd2N2WTlJRkV1ZXp0QVpZZV83QWpPaHZORTU0OTgiLCJhbGciOiJSUzI1NiIsIng1dCI6IkhsQzBSMTJza3hOWjFXUXdtak9GXzZ0X3RERSIsImtpZCI6IkhsQzBSMTJza3hOWjFXUXdtak9GXzZ0X3RERSJ9yJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC84N2VjYmIxYi0wZTdlLTRlMDctOWFiMC00NWIwOTM1OTFjN2EvIiwiaWF0IjoxNTgxMzAxNLCJuYmYiOjE1ODEzMDE2MzAsImV4cCI6MTU4MTMwNTUzMCwiYWNjdCI6MCwiYWNyIjoiMSIsImFpbyI6IkFTUUyLzhPQUFBQWc2eURUazJNKzZ5YjVLNEJSN2VUR0lHT3EvSXFPT0dSZzlPWitrREoyaTg9IiwiYW1yIjpbInB3ZCJdLCJhcHBfZGlzcGxheW5hbWUiOiJyY2xvbmUiLCJhcHBpZCI6ImIxNTY2NWQ5LWVkYTYtNDA5Mi04NTM5LTBlZWMzNzZhZmQ1OSIsImFwcGlkYWNyIjoiMSIsImZhbWlseV9uYW1lIjoiV2FuZyIsImdpdmVuX25hbWUiOiJYaWFud2iwiaXBhZGRyIjoiMzkuMTI4LjIwMC4iwibmFtZSI6IldhbmdYaWFud2VuIiwib2lkIjoiZWE4ZjNjZDctN2IxYS00YmQ0LWFiNzItYzM4NDg4NTE5NDdhIiwicGxhdGYiOiIzIiwicHVpZCI6IjEwMDMzRkZGQUVGNEE2RTUiLCJzY3A5YWIwLTQ1YjA5MzU5MWM3YSIsInVuaXF1ZV9uYW1lIjoid29ybGRAbXkzNjUudHciLCJ1cG4iOiJ3b3JsZEBteTM2NS50dyIsInV0aSI6Il85MEZWRXBZcTBTYzckFuVDluQUEiLCJ2ZXIiOiIxLjAiLCJ4bXNfc3QiOnsic3ViIjoidXlWWU96UGF5RVBVWXlSbFlEVEl6QjhUZVBkZnNTMkVHcHczNGNDM2JRTSJ9LCJ4bXNfdGNkdCI6MTUzNDQyOTU0NH0.Ki9vor6NtxXJWsdumYddz8agrzVYXRCXVg0paW7XqDTq8i_vht8GK79F0F7xp3BSKzK5Xgxb0GzwPV9dPTb4IiXM0d17P5pQB3wHLMUbVFvRbLXNwSEtSJGKLttvxL8XfT8e51k4kyyH07CtozVBsF6fmMnhftp9ZbcEVrgnFKdwTE5In83G05V7L8wDCMiKrN0KX9iTKzxT9em5QtVhGZRZJDnNS2pJTQNhiWVatjDB4VHojG2C6J1LtU6YOOOAM2uBil2ovLFhQPy0l299ZJTJeyQCLQGJki9kZgAVI42iGP4mzvVPQAJk5Oad_4nPsT87QVH4NBA","token_type":"Bearer","refresh_token":"OAQABAAAAAABeAFzDwllzTYGDLh_qYbH8falkpBpCm5PZqagAkUNWFik3Mz2ZfDPeowwW9q5mlFoHSqyYNG8FayvZxxZEUGQWUaR520MuJ5i_mj9CNs0NahNOJAtvZOBV459VLMKaNiyK9GJIGvdDe4RkaV472hbq_po8K47yC053BLRIbRji9WfsCkSMj8UP792sNJ0Tm9ptfPmy1aP_TePX8dOWaC9qZN2jDIXJDjWjCvfDesNDWXAm9bpBp1oZmObLR85EKB9Vgsz7ccZIbKEa16Aiqb67xsQICG8AzjMli76nJ6o_EBGI3dQvikLg17kAKtdb9gGnCj7P1Rh6V_NW_SeN1A7mR7RXrjTvW0gd3_4tEQ4_vkjxz9L4Ymoh0NIwCE6Pu8cTLow83JJJPmdYM4LFHXYApm5fgC9CVFg4JYhALkTZ0KI9qtO3Qe16OyySjmtcs8rD3GnGtKQewRbMcVgkA0JpOzKRA53VFx1SB3rRc2rxSDcnVTx_Oja_6KuaUxQjhgi1XaH1Kk_c82iniwdj7EdHCbokk8eewYFyn4tBTL0xW8rwmoPDvvUvMVA7Z8Ph0AB66Ih5evroSEHsv072AyDWSwHfrEMueTeEgP5jA1aBSOXE2DDw3PySehFfbYpsh0AV3qPVP9lAHaGizEbFt9rEKl1R1bcMrEhxF9GjnvB5PChRK_abttEV2YWKWrTaEFJBTP40f96kCXZGMaE4RaUoMI7hKW4cLQrHuV5YCZQ_BQRj7r5PoUyelGPdvnW42lB8MvekksdrJAVnlUTTgVKlbpn9AUuOD2LUZ5A8IheWaLkhLXfUqjPg0UxjTLIAA","expiry":"2020-02-10T11:32:10.852646+08:00"}
drive_id = b!qDvcsZUTU8eoYyKmtyyP1Jc0D8urZLlkTnH1nWdJ1kbrLsvQZLzVUTpeTrc
drive_type = business
--------------------
y) Yes this is OK (default)
e) Edit this remote
d) Delete this remote
y/e/d>y                                      //第十二步 输入y
​
```

此时，就会出现刚刚配置好的网盘名称了

![](https://pic1.zhimg.com/v2-422d8ec8d0f2041097092c7b04847554_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-e3e719641655571b5e47d46be8606de2.jpg)

```text
e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q> q                //最后输入q退出配置即可
```

在 `C:Users你的用户名.configrclone`文件夹下就可以看见配置文件 rclone.conf 啦。

![](https://pic1.zhimg.com/v2-4263f860072c3db97a3a96c28fb30aa0_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-40666200fd6fdac24d0a962a2a82beca.jpg)

### **5、挂载OneDrive为本地硬盘**

此时请使用 `git bash` 的终端执行以下命令，因为我使用`cmd` 和 `powershell` 都出现关闭终端后挂载程序退出、本地挂载的OneDrive退出的现象。 如果你的windows没有安装git ， 请[自行安装](https://link.zhihu.com/?target=https%3A//www.baidu.com/s%3Fwd%3Dwindows%2520%25E5%25AE%2589%25E8%25A3%2585git%26ie%3Dutf-8)。若你使用 `cmd` 的话 ，`cmd` 是不能退出的，要保持 `cmd` 不退出本地硬盘才一直挂载着。

在 `git bash` 中输入以下挂载命令：

```text
rclone mount OneDrive_local:/  Q: --cache-dir E:OneDrive --vfs-cache-mode writes &
```

其中：

`OneDrive_loca` 替换为你自己前面设置的名称 。

`Q:` 替换为你想要挂载后硬盘的盘符名称即可，记得不要和本地的C盘、D盘等重复。

`E:OneDrive` 为本地缓存目录，可自行设置 。

出现：`The service rclone has been started` 则说明挂载成功。

然后输入 `exit` 退出终端即可。

![](https://pic1.zhimg.com/v2-51fc3c785cb9cd4fa0db4ef98a9358a8_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-9098a167974f6f5c2c7104144efcbe33.jpg)

然后就可以看见本地多了一个盘，往里面复制文件就是上传，从里面复制文件到其它盘就是下载。

![](https://pic2.zhimg.com/v2-616f72130574859638607737e9ce3349_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-6abf207ff714457378102f6a457ce3b5.jpg)

### **6、设置开机自启动挂载**

创建一个名称为 `startup_rclone.bat` 的文件，里面填写上面的挂载命令：

```text
rclone mount OneDrive_local:/  Q: --cache-dir E:OneDrive --vfs-cache-mode writes &
```

将这个文件放在`C:Users用户名AppDataRoamingMicrosoftWindowsStart MenuProgramsStartup` 中

![](https://pic2.zhimg.com/v2-8489b2b53a47c3d5e8f2b29cea9aee79_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-3b61168623f994eba9d2990bca36f6ec.jpg)

重启计算机后就会自动挂设置的云盘了，当然这样做由于调用的是 `cmd` 因此还是不能关闭运行的 `cmd`。下面介绍一种利用 Rclone GUI 的进行管理的使用方法。

### **7、可视化上传下载 RcloneBrowser**

在 [https://github.com/kapitainsky/RcloneBrowser/releases](https://link.zhihu.com/?target=https%3A//github.com/kapitainsky/RcloneBrowser/releases)中下载 \[RcloneBrowser\]() 。

![](https://pic3.zhimg.com/v2-6fe076f9b3c1b74e59bafcc454b2457e_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-8c4825f70542066015be7737dda1bdf8.jpg)

下载好后进行安装，然后进行配置。配置 `rclone.exe`的路径还有 `rclone.conf` 配置文件的路径。

![](https://pic4.zhimg.com/v2-0bd8c9c2fb5fb968903575b87a3abe53_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-a45158f8ff27e2ea7902e114bc81a87e.jpg)

  

![](https://pic2.zhimg.com/v2-3b51bca468fdfd8a101783f2e4828839_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-71adb899edb8812c5ffa18998b7aba2c.jpg)

  

  

这是我前面解压rclon的路径以及配置文件的路径

  

配置好后就可以看见前面配置的 OneDrive 网盘了 ☁️

![](https://pic1.zhimg.com/v2-6b51c3b8598b94608cdb54118134a434_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-2c66326a2f31e11b240f22ea744b9cff.jpg)

双击打开就可以看见里面的内容了，可以去愉快的上传或者下载了。

![](https://pic1.zhimg.com/v2-50daab62a0e34440cff0d033b0146a88_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-e4805128543fa7cad60c49f4ee1602b2.jpg)

上传的话，选择要上传的文件或文件夹以及云盘的存放路径，再选择 `copy` 模式，点击 `run` 即可。下载与之类似。  

![](https://pic2.zhimg.com/v2-4a98b960c07d374f4a1fceff4aa3cc09_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-d3840f6632a6728db6b0b61e23f0f0a4.jpg)

在 `Jobs`当中还可以查看任务的进度、速度等。

![](https://pic3.zhimg.com/v2-b0c731938b53e359933c8f0226a22cd6_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-94ed9da29071d5e6f4c73045f79f66de.jpg)

另外还可以设置代理，见下图：

![](https://pic2.zhimg.com/v2-751d7f6f4b0c4504859999708f480215_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-0eae06781ed54fa1d86dc42b9087b829.jpg)

这样挂载谷歌云端硬盘就很方便了。

如果你觉得rclone 太麻烦，还可以试试 [RaiDrive](https://link.zhihu.com/?target=http%3A//md.aclickall.com/%2520https%3A//www.raidrive.com/) 挂载，安装后选择相应的网盘登录即可，但我用起来感觉比较卡顿。 不推荐了，2020年3月份收到邮件说挂载 Onedrive 、Google Derive 要收费了，无奈

![](https://pic4.zhimg.com/v2-7baedd36b63d94096bbe64f4f5ffab73_b.jpg)

![](https://www.demon1630.cf/wp-content/uploads/2020/05/frc-a85fcef8363d563e1cbc27833dac41ba.jpg)

参考

> [官方文档](https://link.zhihu.com/?target=https%3A//rclone.org/docs/)  
> [Windows下用rclone挂载OneDrive为本地硬盘](https://link.zhihu.com/?target=http%3A//md.aclickall.com/%255Bhttps%3A//telegra.ph/Windows%25E4%25B8%258B%25E7%2594%25A8rclone%25E6%258C%2582%25E8%25BD%25BDOneDrive%25E4%25B8%25BA%25E6%259C%25AC%25E5%259C%25B0%25E7%25A1%25AC%25E7%259B%2598-01-03%255D%28https%3A//telegra.ph/Windows%25E4%25B8%258B%25E7%2594%25A8rclone%25E6%258C%2582%25E8%25BD%25BDOneDrive%25E4%25B8%25BA%25E6%259C%25AC%25E5%259C%25B0%25E7%25A1%25AC%25E7%259B%2598-01-03%29)  
> [使用软件rclone在Windows操作系统上挂载OneDrive为本地硬盘的操作方法](https://link.zhihu.com/?target=http%3A//piaoyun.cc/1290.html)  
> [Rclone 进阶使用教程 - 常用命令参数详解](https://link.zhihu.com/?target=https%3A//p3terx.com/archives/rclone-advanced-user-manual-common-command-parameters.html)

  

- **本文作者：** 热夏
- **本文首发于：** [热夏的博客](https://link.zhihu.com/?target=https%3A//www.lifeee.top/posts/14654.html)
- **版权声明：** 本博客所有文章除特别声明外，均采用 [BY-NC-SA](https://link.zhihu.com/?target=https%3A//creativecommons.org/licenses/by-nc-sa/4.0/zh-Hans) 许可协议。转载请注明出处！

文章来源于互联网:[Windows平台下使用 Rclone 挂载 OneDrive 为本地硬盘](https://zhuanlan.zhihu.com/p/139200172)
