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
3. 修改MPU相关的设置，修改arch/arm/mach-stm32/soc.c 修改MPU的区域大小为32M，否则重定向到SDRAM的高地址之后，因为没有执行权限，系统就会崩掉。
