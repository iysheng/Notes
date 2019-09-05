# 下载uboot
## git clone git://git.denx.de/u-boot.git u-boot

# 模拟器终端tilda，下拉式的
## 快捷键唤起终端，很炫

# vim markdown插件语法
## site:https://github.com/plasticboy/vim-markdown.git
```
- `zr`: reduces fold level throughout the buffer
- `zR`: opens all folds
- `zm`: increases fold level throughout the buffer
- `zM`: folds everything all the way
- `za`: open a fold your cursor is on
- `zA`: open a fold your cursor is on recursively
- `zc`: close a fold your cursor is on
- `zC`: close a fold your cursor is on recursively
```
# cscope 快捷键
## openSUSE 和 fedora 带有 cscope ，可以直接从仓库安装
```
crtl+[ 跳转到定义的地方
crtl+] 跳转到引用该符号的地方
crt+t 向上一级的窗口跳转
```

# autogen.sh 需要安装的自动化工具
```
sudo dnf install automake autoconf libtool
``` 

# 在配置、编译软件的时候，导出环境变量，要用export命令，不要用set
```
eg:export CFLAGS=-static
```

# fedora23 xfce 支持 mp3播放 audacious 很重要的一个插件如下如下所示
```
audacious-plugins-freeworld-mp3 
```
# 调试 2018.09 Uboot 
1. 添加了deug的串口打印，直接写寄存器，修改设备树
2. 初始化SDRAM，修改设备树 
3. 修改MPU相关的设置，修改arch/arm/mach-stm32/soc.c 修改MPU的区域大小为32M，
 否则重定向到SDRAM的高地址之后，因为没有执行权限，系统就会崩掉。

# gcc 7 编译问题
```
eg: Implicit fallthrough error
export 对应的 CFLAGS=Wno-implicit-fallthrough
```

## openocd
### -s 选项，指定配置文件的搜索路径
### flash probe bank_id 探测flash
### flash list 列出flash
### flash erase_address addr length 擦除flash
### flash info bank_id 列出 bank_id 的flash信息
### flash write_bank bank_id filename offset 将文件写入到flash的指定地址
### flash write_image [erase] filename offset 将文件写入到flash的指定地址,可以选择写入之前先擦除flash
### mdw address [count] 显示address地址的内存，长度count
### mw[w,b] address value [count] 修改address内存数据，长度count
## 更新 opensource 之后，出现找不到win7启动项，需要重新更新  grub.cfg 配置文件
## 命令见 /etc/default/grub 文件
### grub2-mkconfig -o /boot/grub.d/grub.cfg

## 安装常用vim插件
### vim-plugin-NERDtree vim-plugin-powerline
### 设置打开NERDtree的快捷键,vim ~/.vimrc;添加内容 nmap <F5> :NERDTreeToggle<cr> 设置打开NERDTree的快捷键
### 分屏打开一个新的文件,在左侧树状图中，输入i 横向分屏打开，输入s 纵向分屏打开，输入:q关闭当前窗口

## cscope 工具
### vim 插件，默认的快捷键配置，crt + \ 然后再输入各种搜索的关键字 eg:s 表示搜索符号

## find 命令使用教程
### 匹配多个类型名的文件 find -name "*.c" -o -name "*.S"

## tmux 使用教程
### ctrl-b 空格：更换排版 

## sed 使用教程
### sed -i "s/^/a&/g" filenmae :在filename的每一行的行首添加爱字母a
### sed -i "s/$/&b/g" filenmae :在filename的每一行的行尾添加爱字母b

## shell 使用教程
### 截取变量的某些字符串 eg:删除变量名的最后一位 CD=${AB:0:-1} 
### 如果AB=abcd 那么CD=abc

## git 使用笔记
### git reset commitid filenames ：回退某个文件到某次提交
### git reset --hard commitid ：可以撤销在本地还没有 push 的 commit
### git branch -a 查看所有分支
### git branch -r 查看远程分支
### git checkout branchname 切换到某个分支
### git commit --amend  文件名；//修改某次提交的日志信息，还可以追加提交的文件
### git log --stat ；// review the files modify each commit
### git diff commitid ；// review the files modify detiles this commit
### git show commitid ；// 查看某一次提交修改的代码

## rootfs 知识要点
### 根文件系统要有 /init 否则会报不是根文件系统的错误
### busybox 的源码中有 rcS 等配置文件的示例

## 好用的工具
### vim 插件
#### light-line
#### 为了实现 light-line 的色彩效果，需要 export TERM=xterm-256color (这个步骤及其重要，特别如果想要在 tmux 正常显示 gruvbox 的效果)	
### markdown
#### plug 'plasticboy/vim-markdown' (备注：plugin 插件的安装路径)
### command-t
#### 文件查找，需要安装 ruby-devel ，然后按照官方文档的手册执行 ruby extconf.rb ; make 编译出 C extersion ;并且 vim 编译的时候呀支持 ruby
### ack.vim
#### 类似与 grep 的搜索，需要安装 ack


### 字体
#### Fira code

### Linux 学习笔记
#### 使用 bc 命令实现进制之间的转换
#### echo 'ibase=10; obase=16; 25' | bc   结果 19

### ubifs 使用方法
# 创建 ubifs 镜像文件
## 一般命令：mkfs.ubifs -x none -m 2KiB -e 124KiB -c 64 -o abc.img -d abc
## 关键的参数 -x:制定压缩算法 -m 执行最小的 io 大小，nand flash 一般是 page 大小；-e 制定逻辑擦除块大小
## 逻辑擦出块大小一般是物理擦出块大小 - 2 * pagesize；-c 制定擦除块的个数，这个很关键，这个值要小于为 ubifs 
## 划分的 nand 分区的擦除块的个数，比如，我为 ubifs nand 分区预留了 10MB，擦除块一共有 80 个，这里只填写了
## 64 个，也就是预留了 16 个 2MB 的空间；-d：制定的文件系统的根目录
# 创建可以烧写到 flash 的镜像文件
## 一般命令：ubinize -o abc.raw -m 2048 -p 128KiB -O 2048 abc.ini -v
## 关键参数 -o：制定生成的文件名字 -m 指定最小的 io，一般是 pagesize；-p 指定物理擦除块大小，这个值就是 nand flash
## 实际的物理擦除块大小；-O 参考网上的是 pagesize，这个后续还需要和 mkfs.ubifs 的一起分析下；abc.ini 表示产生镜像的
## 配置文件，-v：打印提示信息
## abc.ini 文件示例
##[rootfs-volume]
##mode=ubi
##image=abc.img
##vol_size=8MiB/* 备注这个大小要和 mkfs.ubifs 的匹配 */
##vol_id=1
##vol_type=dynamic
##vol_name=arm_boot
##vol_alignment=1
##vol_flags=autoresize

# 交叉编译工具链那些事情
## 交叉编译工具链 --print-sysroot：工具链认为的根目录
## 交叉编译工具链 --print-search-dirs：工具链会搜索的目录，包括库文件、可执行文件等等，也就是说工具链会从这些目录中搜索库或者可执行文件

# Fedora 添加库和禁止、使能库
## dnf config-manager --add-repo /etc/yum.repos.d/fedora_extras.repo
## /* 禁止、使能库 repository ，这个库名字是在 *.repo 文件定义的 */
## dnf config-manager --set-disabled repository
## dnf config-manager --set-enabled repository

# scp 和 ssh sshpass 命令
## 复制 filename 到 serverip 设备的 dir 目录，键入该命令会提示输入 username 的密码
## scp filename username@serverip:/dir
## 通过 ssh 连接 serverip，用户名是 username
## ssh username@serverip
## 提前将密码放到 -p 选项地方，其他和一般的 scp 命令一样
## sshpass -p "passwdxxx" scp filename username@serverip:/dir
