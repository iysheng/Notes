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


#### 三、 一些组件包的学习
1. [FlashDB](https://github.com/armink/FlashDB)
	* FlashDB 是新一代的超轻量化的嵌入式数据库，目标在为嵌入式设备提供一种数据存储解决方案。和传统的数据库不同的地方是， FlashDB 结合了 flash 等媒介的特点开发。并且尽量保证很低的资源开销。
	* FlashDB 提供了两种数据库模式：
		* Key-value 数据库： 这是一种非关系型的数据库，数据就是以一种 KV 对保存，Key 通常是唯一的标志符， KVDB 具有简单的操作，以及很强的可扩展性
			1. 设备的参数保存
			2. 用户的配置信息
			3. 很小的文件管理
		* Time Series 数据库：TSDB 是将数据按照时间序列进行保存，TSDB 的数据具有一个时间戳，一大段的数据以及很高的可插入以及查询特性， Time Series log(TSL) 是 TSDB 存储的每一条信息的简称
			1. 动态保存产生的结构体数据
			2. 记录操作日志

2. [EasyLogger](https://github.com/armink/EasyLogger.git)
	* EasyLogger 是一款超轻量级、高性能的 C/C++ 日志库，相比 log4c、zlog 这些知名的日志库， EasyLogger 功能更加简单，提供给用户的接口更少。
	* 输出级别参考安卓，级别最高是 0(Assert)，最低是5(Verbose)
		* 0 (A) 断言
		* 1 (E) 错误
		* 2 (W) 警告
		* 3 (I) 信息
		* 4 (D) 调试
		* 5 (V) 详细
