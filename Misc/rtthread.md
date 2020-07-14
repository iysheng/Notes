### RT-thread 是一款国产操作系统，本文档用来记录学习 RT-thread 的过程

#### 一、 配置过程
```
1. scons --target=makefile
2. 修改 config.mk 文件，有关交叉编译工具链变量**CROSS_COMPILE**的配置
3. make 编译
4. 因为这个单板没有连接外部晶振，所以需要修改源码配置使用内部晶振作为时钟
5. 使用 openocd 通过 stlink-v2 接口连接硬件，烧录程序
```
