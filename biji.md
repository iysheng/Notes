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

## 更新 opensource 之后，出现找不到win7启动项，需要重新更新 grub.cfg 配置文件
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

