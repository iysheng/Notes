### 琐碎笔记

1. 好看的编程字体 Cascadia Code 和 Fira code，我已经通过 nerd-font 给 [Cascadia 打了字符补丁的字体](https://github.com/iysheng/Notes/blob/master/Linux/Misc/Cascadia%20Code%20Nerd%20Font%20Plus%20Font%20Awesome%20Plus%20Font%20Awesome%20Extension%20Plus%20Octicons%20Plus%20Font%20Logos%20(Font%20Linux).ttf)上传到 github 了
2. fedora23 xfce 支持 mp3播放 audacious 很重要的一个插件：audacious-plugins-freeworld-mp3
3. rootfs 知识要点
	1. 根文件系统要有 /init 否则会报不是根文件系统的错误
	2. busybox 的源码中有 rcS 等配置文件的示例
4. 在 YYfish Board 调试 2018.09 Uboot
	1. 添加了deug的串口打印，直接写寄存器，修改设备树
	2. 初始化SDRAM，修改设备树
	3. 修改MPU相关的设置，修改arch/arm/mach-stm32/soc.c 修改MPU的区域大小为32M，否则重定向到SDRAM的高地址之后，因为没有执行权限，系统就会崩掉
5. ubifs 使用方法
	1. 创建 ubifs 镜像文件 {一般命令：mkfs.ubifs -x none -m 2KiB -e 124KiB -c 64 -o abc.img -d abc，关键的参数 -x:制定压缩算法 -m 执行最小的 io 大小，nand flash 一般是 page 大小；-e 制定逻辑擦除块大小，逻辑擦除块大小一般是物理擦出块大小 - 2 * pagesize；-c 制定擦除块的个数，这个很关键，这个值要小于为 ubifs 划分的 nand 分区的擦除块的个数，比如，我为 ubifs nand 分区预留了 10MB，擦除块一共有 80 个，这里只填写了 64 个，也就是预留了 16 个 2MB 的空间；-d：制定的文件系统的根目录}
	2. 创建可以烧写到 flash 的镜像文件 {一般命令：ubinize -o abc.raw -m 2048 -p 128KiB -O 2048 abc.ini -v 关键参数 -o：制定生成的文件名字 -m 指定最小的 io，一般是 pagesize；-p 指定物理擦除块大小，这个值就是 nand flash 实际的物理擦除块大小；-O 参考网上的是 pagesize，这个后续还需要和 mkfs.ubifs 的一起分析下；abc.ini 表示产生镜像的配置文件，-v：打印提示信息；abc.ini 文件示例
	```
	[rootfs-volume]
	mode=ubi
	image=abc.img
	vol_size=8MiB/* 备注这个大小要和 mkfs.ubifs 的匹配 */
	vol_id=1
	vol_type=dynamic
	vol_name=arm_boot
	vol_alignment=1
	vol_flags=autoresize
	```
6. 交叉编译工具链那些事情
	1. 交叉编译工具链 --print-sysroot：工具链认为的根目录
	2. 交叉编译工具链 --print-search-dirs：工具链会搜索的目录，包括库文件、可执行文件等等，也就是说工具链会从这些目录中搜索库或者可执行文件
7. 安裝中文输入法：
	1. 安装 fcitx 必要打软件包，参考 arch 的 wiki
	```
	sudo dnf install fcitx fcitx-im fcitx-configtool fcitx-** 拼音相关的软件包
	```
	2. 配置环境变量，修改文件 ~/.bashrc 添加内容
	```
	GTK_IM_MODULE=fcitx
	QT_IM_MODULE=fcitx
	XMODIFIERS=@im=fcitx
	```
	3. 配置完成后，注销系统重新登录就可以
	4. Ctrl+Shift+F 可以切换中文简体、繁体的切换
	5. [好看的皮肤 Fcitx5-Material-Color](https://github.com/hosxy/Fcitx5-Material-Color.git)
8. fzf 模糊搜索开源工具
9. ranger 终端的文件管理器，[ranger](https://github.com/ranger/ranger/wiki/Official-User-Guide) 使用 4 個主要的配置文件
	* 全局的 commands.py ， 包含了各種功能實現
	* 全局的 rc.conf ，設置各種配置，以及完成 key 到功能函數的綁定
	* rifle.conf 決定了使用哪個程序打開對應的文件
	* scope.sh shell 腳本產生一些文件預覽的效果
10. ImageMagick 终端的图片查看器，指令： display + 文件名，w3m 也可以在终端打开图片
11. tcping 可以 ping 任意地址的任意端口的工具
12. forgit ：A utility tool powered by fzf for using git interactively
13. 模拟器终端tilda，下拉式的
14. linux 通过安装 samba-vfs-glusterfs 可以很方便的通过 xfce 官方的文件管理软件 Thunar 打开远端 samba 共享的目录，格式： smb://192.168.0.5【备注：远端的 ip 地址】
15. dwm 窗口管理器
	1. 需要安装 xorg 相关的环境（还有一个 xinit），由于在 Fedora Server 默认启动的窗口管理器是 xdm，man xdm 的过程，实现登录自动到 dwm 的方法是在 home 目录下创建一个 .xsession 脚本，在该脚本中通过 `exec dwm` 启动 dwm 窗口管理器，并且在该脚本执行 `fctix &` 输入法程序
	2. 安装字体 wqy-*** 中文字体， Cascadia Code 字体，安装符号字体
	3. 中文输入法安装配置比较麻烦，关键在于确认 fctix 要在后台执行，已经通过命令
	imsettings-list 和 imsettings-switch 列出和选择 fctix 输入法
	4. feh 是一个设置电脑桌面的工具
	5. dwm 默认的一些基本操作
		1. Alt + 数字，在不同的 tags 切换
		2. Alt + Shift + 数字，将对应的串口移动到指定编号的 tag 上
		3. Alt + Table 在最近的两个 tags 切换
		4. Alt + i 和 Alt + d 分别是增加以及减少 master 区域窗口的个数
		5. Alt + b 显示或者隐藏顶层的 tag、title 和 status 栏
		6. Alt + shift + space 全屏当前的窗口
	6. dwm 的一些补丁
		1. hide_vacant_tags：隐藏没有窗口的补丁
		2. scratchpad：画板补丁，默认是 Alt + \` 快捷键打开和关闭临时画板
		3. vanitygaps：同一个 tag 的窗口之间预留空隙
		4. autostart：自动启动 ~/.dwm/autostart_blocking.sh 和 ~/.dwm/autostart.sh 的补丁，一般会将状态栏显示脚本放在对应的上述两个脚本，以及桌面背景设置
		5. alpha ：背景透明，需要依赖渲染器件：比如：compton，这个工具需要提前在后台执行才可以保证正常的半透明效果， st 的透明补丁类似的
16. st 工具配置
	1. alpha：半透明化补丁，需要依赖渲染器件
	2. alphaFocusHighlight：基于半透明化补丁，可以突出显示正在选中的窗口
	3. ime：补丁，修复 st 下不能正常切换输入法的补丁，默认官方已经添加了该补丁
	4. scrollback：支持在 st 下实现界面回滚的补丁
17. openocd
	1. -s 选项，指定配置文件的搜索路径， -f 选项指定配置文件
	2. flash probe bank_id 探测flash
	3. flash list 列出flash
	4. flash erase_address addr length 擦除flash
	5. flash info bank_id 列出 bank_id 的flash信息
	6. flash write_bank bank_id filename offset 将文件写入到flash的指定地址
	7. flash write_image [erase] filename offset 将文件写入到flash的指定地址,可以选择写入之前先擦除flash
	8. mdw address [count] 显示address地址的内存，长度count
	9. mw[w,b] address value [count] 修改address内存数据，长度count
	10. 擦写 flash 之前一般需要 halt 住 cpu
18. tmux 一款终端分平软件 (三个基本概念：session、window、panel)
	1. [tpm](https://github.com/tmux-plugins/tpm)：tmux 的插件管理器
	2. nord 色彩配置，建议关闭 powerline 的箭头型符号
	```bash
	# 安装 nord 色彩配置
	set -g @plugin 'arcticicestudio/nord-tmux'
	# 建议关闭 powerline 的箭头型符号，除非已经安装了 powerline 字体
	set -g @nord_tmux_no_patched_font "1"
	```
	3. MODKEY + w # 显示当前所有 session 的所有 window
	4. MODKEY + l # 跳转到最近访问的上一个 windows (l:last)
	5. MODKEY + 空格 # 更换排版
	6. MODKEY + s # 显示所有的 sessions
	7. MODKEY + , # 修改 window 的名字
	8. MODKEY + $ # 修改 session 的名字
	9. MODKEY + ? # 查看支持的所有命令
	10. MODKEY + ; # 在最近的两个 pane 之间切换
	11. MODKEY + d # 退出当前会话，保持会话在后台
	12. MODKEY + ' # 跳转到指定编号的 window
	13. MODKEY + z # 隐藏当前 window 的其他 panel
	14. MODKEY + . # 移動當前的 window 位置
	15. MODKEY + { # 交換當前 window 中的 pane 和上一個 pane
	16. MODKEY + } # 交換當前 window 中的 pane 和下一個 pane
19. autoconf configure 配置源码编译时，可以直接在 configure 前赋值 CFLAGS 、 LDFLAGS 等变量
``` bash
CLFAGS="-I /lib64" ./configure ....
```
20. 下载 github 某个用户的头像，可以直接 iysheng 的 uid 是 20969054，[查询 github 用户 uid 的网站](https://caius.github.io/github_id/)
``` bash
wget https://avatars.githubusercontent.com/<username>
wget https://avatars.githubusercontent.com/iysheng # 下载 iysheng 的头像
```
21. gnome 带有一个全屏幕的快捷键，可以去控制中心配置这个快捷键
22. 64 位 Fedora 编译 vim 遇到的问题
	1. tgetent()... configure: error: NOT FOUND! 方法：LDFLAGS="$LDFLAGS -fPIC"，[这样可以 configure 配置通过，但是还是无法编译通过！！！](https://github.com/vim/vim/issues/1081)
	2. Unknown type name ‘off64_t’ 方法：CLFAGS="-Doff64_t=__off64_t"
23. Linux 的控制终端由控制码、一个环境变量和一组共称为 terminfo 数据库的特殊文件实现。Linux 将每种终端类型的 terminfo 数据作为一个单独的文件存储在 terminfo 数据库目录。常见的位置是 /usr/share/terminfo/ ；terminfo 的数据格式是二进制的需要使用 infocmp 命令查看

---
### zephyr 学习笔记
##### Porting to new board Cubieble1
|Board    |SOC    |SOC series|SOC Family|CPU core |Architecture|
|---------|-------|----------|----------|---------|------------|
|Cubiebl1 |ATB1109|ATB110X   |ATB       |Cortex-M0|ARM         |
#### 板级的配置文件放在目录 boards/arm/cubieble1
1. 可见的配置文件（默认的配置文件，以 .config 文件配置板级）放在 **boards/ARCHITECTURE/BOARD/BOARD_defconfig**
2. 不可见的配置文件(这个配置文件一般通过板级的宏控制，而不能在 menuconfig 配置) **boards/ARCHITECTURE/BOARD/Kconfig.defconfig**

#### Kconfig Extension 不同 source 的差别描述 
|Title|描述|
|---|---|
|source | 绝对路径，如果不存在对应目录的话就会出问题|
|osource| 绝对路径，如果不存在也不会报错，类似于 -include 或者 sinclue |
|rsource| 和 source 对比，差别是相对路径|


#### 工程配置流程
1. zephyr-env.sh 导出环境变量 ZEPHYR_BASE

#### Cortex-M0	
1. ARMv6-M 指令集
2. CPUID 0x410CC200	
3. The processor fully implements the Wait For Interrupt ( WFI ), Wait For Event ( WFE ) and
the Send Event ( SEV ) instructions.
4. Thread mode(这种模式下可能会使用 main stack，也可能使用processor stack,CONTROL.nPRIV
决定线程模式是特权的（该bit==0）还是非特权的（该bit==1），复位就在线程模式，中断退出就会到线程模式)
Is entered on Reset, and can be entered as a result of an exception return.
Handler mode(这种模式下只会使用 main stack，这种模式类似于特权模式，中断处理在这个模式)
Is entered as a result of an exception. The processor must be in Handler mode
to issue an exception return.
5. SPSEL, bit[1] Defines the stack to be used:
0 Use SP_main as the current stack（MSP）
1 In Thread mode, use SP_process as the current stack.（PSP）
In Handler mode, this value is reserved

#### 设备树 yaml 语法

具体关于设备树的细节参看 cmake/dts.cmake
scripts/dts/extract_dts_includes.py 创建设备树的头文件
这个脚本会将 dts 文件（dts文件，如果没有显式定义变量 DTS_SOURCE，那么默认是 ${BOARD_DIR}/${BOARD}.dts）导出为
zephyr/include/generated/generated_dts_board_unfixed.h
备注：导出的过程强依赖 dts/bingds/ 目录下的 *.yaml 类型文件

#### CDN 的全称是 Content Delivery Network，即内容分发网络。

CDN是构建在网络之上的内容分发网络，依靠部署在各地的边缘服务器，通过中心平台的负载均衡、内容分发、调度等功能模块，使用户就近获取所需内容，降低网络拥塞，提高用户访问响应速度和命中率。CDN的关键技术主要有内容存储和分发技术。——百度百科
放在Github的资源在国内加载速度比较慢，因此需要使用CDN加速来优化网站打开速度，jsDelivr + Github便是免费且好用的CDN，非常适合博客网站使用。[cdn](https://blog.csdn.net/qq_36759224/article/details/86936453)

#### Makefile
1. gcc 通过 -D 选项传递宏字符串时候，需要添加转义字符 \"字符串内容\"
2. Makefile 的条件判断
``` Makefile
# arg1 和 arg2 之间不要随便添加空格
# 判断两个参数是否相等
ifeq (arg1,arg2) ifneq(arg1,arg2)
else
endif

# 判断 arg 是否定义
ifdef arg 或者 ifndef arg
else
endif
```
3. Makefile 执行 shell 程序
``` Makefile
$(shell echo "Hello World")
```
4. IRC [Beginner’s guide to IRC](https://fedoramagazine.org/beginners-guide-irc/)
    1. account 是账户，这个是持久的
    2. nickname 是昵称，被账户所有
    3. identify 意味着登陆你的账户
    4. NickServ 是一个 freenode 的服务，像一个用户那样
    5. [注册昵称的过程1](https://freenode.net/kb/answer/registration)
    6. [注册昵称的过程2](https://www.wikihow.com/Register-a-Nickname-on-Freenode)
5. 安装 dhcp 服务，支持客户端测试 dhcp 获取 IP
    1. 配置 /etc/dhcp/dhcpd.conf 文件，如下示例：
    ```
    # dhcpd.conf
    #
    # Sample configuration file for ISC dhcpd
    #
    
    # option definitions common to all supported networks...
    option domain-name "redWork.com";
    option domain-name-servers 8.8.8.8;
    
    default-lease-time 600;
    max-lease-time 7200;
    
    subnet 192.168.100.0 netmask 255.255.255.0 {
      range dynamic-bootp 192.168.100.99 192.168.100.210;
      option routers 192.168.100.200;
    }
    ```
    2. systemctl enable dhcpd
    3. systemctl start dhcpd
6. 内核的 spi 驱动框架
	1. 关键的几个结构体抽象：
		1. struct spi_master：spi 控制器本身的抽象；
		2. struct spi_device：spi 设备，如果没有外接 spi 设备时，那么就可以认为是 spi 控制器的代理，会通过对应的 spi_driver 即 driver/spi/spidev.c 这个源码注册的 name 是 "spidev" 的驱动完成 probe，就会注册对应的 spi 的字符设备，通过这个字符设备可以直接和 spi 控制器通信，具体的是通过 ioctl 完成数据的收发；
		3. struct spi_driver：spi 设备的驱动，通过函数 spi_register 来注册这个驱动到 spi 总线
	2. spi 控制器初始化的一般流程：
		1. 定义 platform_device 设备，包含控制器对应的 mem、irq、dma 等类型的资源；
		2. 注册对应的 platform_driver 驱动，在 probe 函数中会首先申请 spi_master 的内存空间，然后注册，在函数 spi_register_master 注册这个 master 的时候，通过 scan_boardinfo 函数会遍历设备定义的 spi_board_info 实例（这个表的注册依靠函数 spi_register_board_info），展开为 spi_device 实例，这个实例会关联到这个 master，在后续 driver probe 的时候，可以通过 master 找到对应的读写 spi 的方法，（挂在 spi_bus 上），然后注册到内核；
		3. 在后续注册 spi_driver 的时候，可以通过名称或者 id 匹配申然后执行对应的 probe，真正执行 spi 发送和接受功能的时候需要依靠 spi_master 的 transfer 成员函数；
	3. 通过函数 spi_write_then_read 读写时，要注意写寄存器时，有些设备需要额外设置寄存器地址的高 bit 为 1 ；类似 I2C 总线一样，高 bit 表示读写？？？
	4. 如果只写不读的时候可以使用 spi_write 函数
7. linux APP 程序 bool 运算的头文件是 #include <stdbool.h>
8. linux driver 程序，不支持浮点出发运算时，可以使用 do_div 函数，使用长整形执行除法运算，曲线方法
9. linux kernel 编译 doc 文档，eg：**make htmldocs**，编译出的文档在目录 Documentation/DocBook
``` bash
$ make help | grep "doc"
Linux kernel internal documentation in different formats:
 htmldocs        - HTML
 pdfdocs         - PDF
 psdocs          - Postscript
 xmldocs         - XML DocBook
 mandocs         - man pages
 installmandocs  - install man pages generated by mandocs
 cleandocs       - clean all generated DocBook files
```
10. sqlite
	1. 通过给某一个整形的键值添加 **INTEGER PRIMARY KEY** 或者 **ROWID**，就等价将这个值作为 [rowid](https://www.sqlite.org/autoinc.html#summary)，这个值在数据表中需要是唯一的，并且当没有明确给这个值赋值时，会自动加 1。
11. scons 构建工具，SCons 使用 SConscript 和 SConstruct 文件来组织源码结构，通常来说一个项目只有一 SConstruct，但是会有多个 SConscript。一般情况下，每个存放有源代码的子目录下都会放置一个 SConscript。
	1. scons --target=makefile # 构建 Makefile 的编译文件
	2. SConscript 文件可以控制源码文件的加入，并且可以指定文件的 Group。
	3. scons 的环境分为：
		1. 外部环境，执行 scons 的 shell 环境（针对 Linux）
		2. 构造环境，一个 SConscript 文件创建的唯一的一个对象！！！，外部环境可以使用 os.environ 获取。一个构造环境实际上是一个拥有方法的对象。如果你想直接访问构造变量的字典，你可以使用Dictionary方法： 
		``` python
		env=Environment(FOO='foo', BAR='bar')
		dict=env.Dictionary()
		for key in ['OBJSUFFIX', 'LIBSUFFIX', 'PROGSUFFIX']:
		print ("key=%s, value=%s"  %  (key,dict[key]))
		```
12. C 语言的一些头文件
	1. uint8_t 对应的头文件 <stdint.h>
13. 在链接库编译时，库文件的位置会影响到是否正常链接成功，库文件的位置必须放在**源文件或者 obj 文件后**
	1. arm-none-eabi-gcc -ldemo $(objs) -o $@ /* 这个不可以正常连接 libdemo.a *\/
	2. arm-none-eabi-gcc $(objs) -ldemo -o $@ /* 这个可以正常连接 libdemo.a */
	3. gcc 的一些編譯選項參數
		* –start-group archives --end-group 正常情况，链接的时候库文件只会按它们出现在命令行的顺序搜索一遍，如果包里有未定义的引用标号，而且该包还被放在命令行的后面,这样链接器就无法解决该标号的引用问题。通过给包分组，这些包可以被循环搜索直到所有的引用都可以解决为止。使用该选项将降低性能。只有在无法避免多个包之间互相引用的情况下才使用。
		* --whole-archive 表示將後續的文件的符號都鏈接進來，而不管是否使用到，與之相反的是 --no-whole-archive 鏈接參數
		* -M 生成目标的依赖到 .d 文件, 不会忽略系统路径的头文件
		* -MMD/-MM 生成目标的依赖到 .d 文件, 忽略系统路径的头文件
		* -MF 将目标的依赖重定向到指定文件名的文件中
		* -Xlinker option  傳遞參數到鏈接器, 可以使用它来提供GCC无法识别的特定于系统的链接器选项,特別地，如果傳遞的參數是多個，那麼需要通過 -Xlinker 發送多次。在使用 GNU 鏈接器的時候，常見的是 ``option=value`` 的方式
		* [--specs=nosys.specs](https://launchpadlibrarian.net/170926122/readme.txt) 表示使用 newlib-nano.特别地， GNU 工具链释放出来的时候会带有两个预先基于 newlib 编译出的 c 库，其中一个对应的是标准的 newlib,另一个是 newlib-nano。文件名分别是 libc.a -> libc_nano.a; libg.a -> libg_nano.a
14. ar 打包为 .a 静态库的命令参数
	1. gcc $(src) -c $(objs) # gcc 编译为 obj 文件
	2. ar -r libdemo.a $(objs) # 将所有的 obj 文件连接为静态库
15. RT-thread 在 Linux 環境使用 pkgs 命令，首次啓動 scons --meunconfig 會自動安裝 env 命令，source ~/.env/env.sh 命令可以導出 pkgs 命令，同時還導出了 env 命令。選中 online 的包後可以使用 pkgs --update 命令下載選中的 online 的軟件包。
	1. pkgs --upgrade 用來更新 env 功能腳本本身和軟件包列表
	2. pkgs --update 用來更新軟件包本身
16. Rust 包管理 cargo
	* 更换 cargo 的源，创建文件 ```~/.cargo/config```
	``` bash
	[source.crates-io]
	registry = "https://github.com/rust-lang/crates.io-index"
	replace-with = 'hub'
	#[source.ustc]
	#registry = "https://mirrors.ustc.edu.cn/crates.io-index"
	[source.hub]
	registry = "https://hub.fastgit.org/rust-lang/crates.io-index.git"
	```
17. google search ``font name vk.com`` 查找字体
18. fedora samba 网络端口:
    1. smbd TCP 139 和 445
    2. nmbd UDP 137
    3.关闭防火墙或开放服务
    ``` bash
    systemctl stop firewalld
    sudo firewall-cmd --permanent --add-service=samba
    ```
    4.配置selinux
    ``` bash
    setsebool -P samba_enable_home_dirs on
    sudo setsebool -P samba_export_all_rw on
    ```
19. 護眼色的 rgb 值 #CCE8CF RGB(204, 232, 207) 或者 #C7EDCC RGB(199, 237, 204)
20. ld 的 --wrap 選項參數，可以對制定的符號進行包裹，eg: --wrap,malloc ， 如果當前文件中直接調用 malloc 符號但是卻沒有定義該符號，那麼會嘗試執行 __wrap_malloc 函數，如果執行的是 __real_malloc 那麼會嘗試執行 malloc 函數
	* 交叉编译工具链的　crt0 会尝试调用用户自定义的　hardware_init_hook() software_init_hook() 然后再执行　__wrap_main() 函数
21. [gn](http://weharmonyos.com/openharmony/compile/gn/docs/quick_start.html#running-gn) 用来生成 ninja 脚本. [GN 的官方網址](https://gn.googlesource.com/gn/+/main/docs/reference.md)
    * BUILD.gn 一般是整个工程的入口， .gni 文件一般用来作为子模块
    * --root 指定 gn 构建的根目录
    * --dotfile 默认会查找 root 目录下的 .gn 文件，如果需要明确指定该文件，那么使用 --dotfile 参数指定
        * .gn 文件会至少定义 buildconfig 变量，该变量表示的文件会被用来建立 build file 的可执行环境
        * .gn 文件一般也会定义 root 变量，定义 gn 构建的根目录
    * gn args --list 查看有效的參數和他們的默認值
    * gn 文件中的 // 符号表示根目录
    * gn desc <build_dir> <targetname> # 获取指定目标的信息
    * gn 會解析 json 文件，json 文件可以使用 /* 註釋 */ 添加註釋
    * gn 可以使用 import 導入 gni 文件
    * BUILD.gn 文件中的依赖，如果组件名称和目录一致，就可以省略具体的组件名称。eg: dir:target 如果 target 和 dir 目录一样， :target 可以省略
    * 模板(template) 提供了一種添加到 GN 內置目標類型的方法。根本上講，模板是 GN 構建可重用功能的主要方式。模板定義在 .gni(GN import) 文件內， 這中文件可以導入 .gn 目標文件.
    * action() 模板類定義了一個執行腳本的目標，該模板類有一些必要的參數。outputs 和 scripts 腳本.
    * 內置變量 root_build_dir 是 build command 執行的根目錄的絕對路徑
    * 內置變量 root_out_dir 是工具鏈輸出的根目錄的絕對路徑
    * rebase_path(input, new_base=="", current_base=".") # 將 input 表示的內容，可以是 list ,轉換爲以 new_base 爲基礎的路徑描述
        * new_base 缺省時，轉換路徑以系統絕對路徑
        * current_base 缺省時，是相對當前路徑
22. ninja 替换 make 进行构建
    * build.ninja 一般是构建的入口文件，类似 make 的 Makefile
23. ld 连接脚本
    * COMMON 表示的是未初始化的全局变量, 不包含静态全局变量
24. [solus](https://getsol.us/home/) 系统安装安装软件的时候，具体的软件名字不确定的时候，可以通过 google 搜索 ``关键词 arch``
	* eopkg blame 包名称 # 查看包的维护者以及版本信息
	* eopkg list-installed # 列出已经安装的包
25. perl 的包安装工具是 cpan. 直接 ``cpan 包名称`` 就可以安装了. eg: ``cpan Number::Bytes::Human`` 或者 ``cpan Pango`` 等等
