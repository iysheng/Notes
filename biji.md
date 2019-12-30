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

## vim 命令
```
:1,$ s/abc/&def/gc 备注：& 符号会替换为 abc，执行该命令，会将 abc 变为 abcdef
:e 重新加载当前打开的文件
无需到命令行，gU转换为大写 gu转换为小写
eg：1gU 从光标所在行往下 1 行全部转换为大写
gu0：从光标所在位置到改行的行首全部转换为小写
gu$：从光标所在位置到该行的行尾部全部转换为小写
gUG：从光标所在位置到文章的最后一个字符全部转换为大写
gu1G：从光标所在位置到文章的第一个字符全部转换为小写
guw、gue、gUw、gUe，光标后面的单词会进行大小写转换
gu5w、gu5w、gU5w、gU5e，转换光标后的 5 个单词
:命令行 source % 刷新配置
无需到命令行
添加书签 ma：添加 a 书签 mb：添加 b 书签、、、、mz：添加 z 书签
跳转到 a 书签 'a 跳转到 a 书签这一行的行首； `a 跳转到 a 书签的位置
命令行： marks 查看所有书签
```

## cscope 快捷键 openSUSE 和 fedora 带有 cscope ，可以直接从仓库安装
```
crtl+[ 跳转到定义的地方
crtl+] 跳转到引用该符号的地方
crt+t 向上一级的窗口跳转
```

## autogen.sh 需要安装的自动化工具
```
sudo dnf install automake autoconf libtool
``` 

## 在配置、编译软件的时候，导出环境变量，要用export命令，不要用set
```
eg:export CFLAGS=-static
```

## fedora23 xfce 支持 mp3播放 audacious 很重要的一个插件如下如下所示
```
audacious-plugins-freeworld-mp3 
```
# 调试 2018.09 Uboot 
1. 添加了deug的串口打印，直接写寄存器，修改设备树
2. 初始化SDRAM，修改设备树 
3. 修改MPU相关的设置，修改arch/arm/mach-stm32/soc.c 修改MPU的区域大小为32M，
 否则重定向到SDRAM的高地址之后，因为没有执行权限，系统就会崩掉。

## gcc 7 编译问题
```
eg: Implicit fallthrough error
export 对应的 CFLAGS=Wno-implicit-fallthrough
```

## openocd
```
-s 选项，指定配置文件的搜索路径
flash probe bank_id 探测flash
flash list 列出flash
flash erase_address addr length 擦除flash
flash info bank_id 列出 bank_id 的flash信息
flash write_bank bank_id filename offset 将文件写入到flash的指定地址
flash write_image [erase] filename offset 将文件写入到flash的指定地址,可以选择写入之前先擦除flash
mdw address [count] 显示address地址的内存，长度count
mw[w,b] address value [count] 修改address内存数据，长度count
```

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

# git status 中文文件名称显示为乱码
## git config --global core.quotepath false
```git
1. git log --oneline /* 每一个 commit 只显示一行 */
2. git log -nx  /* 显示最近的 x 次提交 */
3. git help --web [command] /* 在浏览器查看 git [command] 的 help 信息 */
4. git cat-file -t hash 查看一个hash值表示的类型（比如说是提交、tag、、、）
5. git cat-file -p hash 查看一个hash值的详细信息
6. git config 的配置信息可以参看 .git 目录的 cofig 文件
7. commit 是当前工作区的一个快照，只能包含一个 tree，一个 tree 可以包含多个 tree 和 blob，tree 可以认为是目录类型，blob 是文件类型
8. detached HEAD(分离头指针) git checkout commitid 的时候就会创建出分离头指针，分离头指针就是说 HEAD 直接指向一个 commit，没有关联到一个分支的情况，这时候需要git branch commitid 创建出一个分支，关联这次 checkout；
9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异
10. HEAD^1 或者 HEAD^ 表示 HEAD 的父亲， HEAD^^ 或者 HEAD^1^1 父亲的父亲，HEAD~ HEAD 的父亲，HEAD~2 父亲的父亲
11. git branch -d 分支名；删除分支，如果分支没有被 merge，那么会提示无法删除；git branch -D 分支名，强制删除分支
12. git commit --amend ；修改最近一次提交的注释 message
13. git rebase -i commit_id ；然后就可以修改待修改的 commit 的 message；git rebase 还可以做很多事情；记得保存 parent
14. git diff --cached ；暂存区和 HEAD 的差异
15. git diff ；工作区和 HEAD 的差异
16. git diff -- 文件名；对比工作区某个文件和 HEAD 的差异
17. git diff commit_id0 commit_id1：对比两次 commit_id 的差异
18. git diff commit_id0 commit_id1 -- 文件名；对比指定文件，在 commit_id0 和 commit_id1 这两次提交的差异
19. git reset HEAD；将暂存区的变更撤回工作区，暂存区的内容就和 HEAD 的一样了
20. git reset HEAD -- 文件名； 将暂存区的某个文件的变更撤回工作区
21. git reset --hard commit_id：清除最近的几次提交，将工作区和暂存区强制回退到指定的那次提交
22. git checkout -- 文件名；将工作区某个文件的变更撤销
23. git rm 文件名；删除某一个文件
24. git stash；暂存状态快照到“栈”
25. git stash list；查看当前“栈”的快照
26. git stash apply；从“栈”顶恢复快照，但不删除“栈”的这个快照
27. git stash pop；从“栈”顶恢复快照，但是会删除“栈”的这个快照
28. .gitignore 文件包含了 git 不希望管理跟踪的文件或者文件类型
29. git clone --bare；克隆一个不带工作区的裸仓库
30. git remote add 远端源名称 远端源地址；添加一个远端仓库
31. git push --set-upstream 远端仓库名 本地分支；推送本地分支到远端仓库
32. 哑协议表示不带进度条，智能协议带进度条 file://路径名表示智能协议，单独路径名表示哑协议，ssh https http 这些都是智能协议
33. 修改 ~/.gitconfig 文件，添加 alias 字段，可以添加命令别名
34. 如果是 fork 其他人打仓库，建议添加一个 upstream 的 remote 源，可以同步更新原版的源，通过 git pull upstream/master 或者分为两个步骤：
git fetch upstream; git merger upstream/master
35. 提交 pull request ，需要首先将代码提交到自己 fork 后打仓库，然后在 github 上点击创建 pr，在 github 上点击 New pull request，根据步骤就好
36. git val -l ：查看定义打 git 相关的变量; ~/.gitconfig 文件，用户定义打 git 打配置文件， [core]\n editor = vim 使用 vim 取代 默认打 nano 作为 git 打默认编辑器（提交、rebase 等时候调用的编辑器）
```

## 本地搭建 git 服务器
1. 创建一个 git 用户（为了方便用户提交的时候统一走 git 用户），git 用户的目录权限很重要（权限要正确，否则无法通过阿里云连接）
chmod 755 ~
/* 关于目录 .ssh/ 和文件.ssh/authorized_keys 的权限需要严格按照这个权限，否则无法正常通过密钥文件验证
 * 但是，测试的时候，还是可以通过 systemctl status sshd.service 查看
 */
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
2. 将用户的公钥追加到文件 ~/.ssh/authorized_keys
3. 修改 sshd 的配置文件 /etc/ssh/sshd_config
修改权限 PubkeyAuthentication yes
4. 重启 sshd 服务器
【提示，无法连接时，可以通过命令查看 systemctl status sshd.service 无法连接的原因，一般都是 ssh 服务的原因 】

# tig 的使用说明
## tig 是基于 ncurses-based ，命令行下图形化查看 git 仓库相关信息的工具，今天记录下学习笔记，
1. 查看某次 commit 和这次 commit 提交的代码修改
2. 查看当前暂存和未存的修改（main 视图就可以查看）
3. 增加和剔除暂存的修改（在 main 视图[tig 命令直接的视图]通过 s 按键到 status 视图，再通过 u 快捷键可以增加或者删除
文件到暂存区，返回 main 视图可以通过 q 退回上一个视图，或者直接按键 m）
4. 编辑 commit 并提交（在 status 视图，按键 C ，然后按键 i 编辑提交信息，然后按键 :x 可以提交了）
5. 查看仓库的所有 tag 和分支（按键 r [branch 视图]）
6. 查看某次提交的树形视图（在某次提交或者 tag 处，按键 t 查看）
7. 明确了 tig 的几个视图； main 视图，tree 视图，status 视图，stash 视图[查看所有暂存的提交，按键 c 切换到该视图，该视图一般和 status 视图配合使用]，branch 视图，log 视图[按键 l 切换到该视图]
8. Q 直接退出 tig，q 退出到上一个视图
9. 在查看文件时，要使用 j、k 这些按键

***
# UNIX 环境高级编程学习笔记
## 第 4 章 文件和目录
1. open 函数打开的文件名，要对包含的目录具有可执行权限位，这个位也被成为搜索位。
2. unlink 函数，减少文件的链接记数；rename 函数，重新命名文件或者目录。
3. ls -F 选项[在不同文件类型的文件名后添加指示器]；会在符号链接文件后加一个 @ 符号，在目录文件后加 / 符号。
4. 文件具有 3 个时间【ls -u 文件数据的组后访问时间；ls 文件内容的最后修改时间；ls -c 文件 i 节点的最后更改时间】；要知道文件 i 节点和文件数据内容是分开存放的。
5. ls -lt 默认是按照文件的修改时间排序的，相应的 ls -ltu 是按照文件的访问时间排序， ls -ltc 是按照文件的 i 节点的修改时间排序 

## manjaro
1. yay package manager
2. 安裝中文输入法：
	1. 安装 fcitx 必要打软件包，参考 arch 的 wiki
	```
	sudo pacman -S fcitx fcitx-im fcitx-configtool [因为 fcitx 内置了 pinyin 中文输入发，直接选中激活就可以]
	```
	2. 配置环境变量，修改文件 ~/.pam_enviroment 追加内容
	```
	GTK_IM_MODULE=fcitx
	QT_IM_MODULE=fcitx
	XMODIFIERS=@im=fcitx
	```
	3. 配置完成后，注销系统重新登录就可以
3. 安装图标字体 nerd-font
	1. 下载字体文件
	```
	git clone https://github.com/ryanoasis/nerd-fonts.git
	```
	2. 建议通过打补丁的方式安装，下载的字体文件包含有 font-patcher
	可能还需要安装一个工具 fontforge
	```
	./font-patcher PATH_TO_FONT [PATH_TO_FONT：表示的是字体打源路径]
	```
4. fzf 模糊搜索开源工具
5. ranger 终端的文件管理器
6. ImageMagick 终端的图片查看器，指令： display + 文件名
7. tcping 可以 ping 任意地址的任意端口的工具
8. forgit ：A utility tool powered by fzf for using git interactively

## libevent 代码阅读笔记
1. 数据结构 tailqueue
2. 数据结构 list

## vim 学习笔记
1. v 到 visual 模式，通过 hjkl 选择任意字符串， y 复制、 d 删除、^ 跳转到当前行
   首、$ 跳转到当前行尾
2. ctrl+v 块模式，通过 hjkl 选中字符块，同样 d 删除、y 复制；shift+i 块模式下打
   插入模式
