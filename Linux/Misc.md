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
8. fzf 模糊搜索开源工具
9. ranger 终端的文件管理器
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
	1. -s 选项，指定配置文件的搜索路径
	2. flash probe bank_id 探测flash
	3. flash list 列出flash
	4. flash erase_address addr length 擦除flash
	5. flash info bank_id 列出 bank_id 的flash信息
	6. flash write_bank bank_id filename offset 将文件写入到flash的指定地址
	7. flash write_image [erase] filename offset 将文件写入到flash的指定地址,可以选择写入之前先擦除flash
	8. mdw address [count] 显示address地址的内存，长度count
	9. mw[w,b] address value [count] 修改address内存数据，长度count
18. tmux 一款终端分平软件 (三个基本概念：session、window、panel)
	1. [tpm](https://github.com/tmux-plugins/tpm)：tmux 的插件管理器
	2. nord 色彩配置，建议关闭 powerline 的箭头型符号
	```bash
	# 安装 nord 色彩配置
	set -g @plugin 'arcticicestudio/nord-tmux'
	# 建议关闭 powerline 的箭头型符号，除非已经安装了 powerline 字体
	set -g @nord_tmux_no_patched_font "1"
	```
	3. MODKEY + w # 显示当前 session 的所有 window
	4. MODKEY + l # 跳转到最近访问的上一个 windows (l:last)
	5. MODKEY + 空格 # 更换排版
	6. MODKEY + s # 显示所有的 sessions
19. autoconf configure 配置源码编译时，可以直接在 configure 前赋值 CFLAGS 、 LDFLAGS 等变量
``` bash
CLFAGS="-I /lib64" ./configure ....
```
