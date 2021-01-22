### RT-thread 是一款国产操作系统，本文档用来记录学习 RT-thread 的过程

#### 一、 配置过程
```
1. scons --target=makefile
2. 修改 config.mk 文件，有关交叉编译工具链变量**CROSS_COMPILE**的配置
3. make 编译
4. 因为这个单板没有连接外部晶振，所以需要修改源码配置使用内部晶振作为时钟
5. 使用 openocd 通过 stlink-v2 接口连接硬件，烧录程序
```

#### 二、 組件包相關內容
1. RT-thread 操作系統在 Linux 的 pkgs 命令，需要使用 **source ~/.env/env.sh** 導出，然後就可以使用 pkgs 命令了， pkgs 算是一個 python 函數
2. 軟件包 pkgs 命令相關的內容
    2.1 pkgs --update 下載、更新選中的軟件包，還可以刪除沒有選中的軟件包
    2.2 pkgs --upgrade 更新軟件包列表信息
