### 瑞芯微平台学习笔记

#### U-boot

1. 在 Uboot 下通过 TFTP 固件更新方法
```
=> tftpflash 0x20000000 uboot.img uboot
=> tftpflash 0x20000000 misc.img misc
=> tftpflash 0x20000000 rootfs.img rootfs
=> tftpflash 0x20000000 boot.img boot
=> tftpflash 0x20000000 recovery.img recovery
=> tftpflash 0x20000000 oem.img oem
=> tftpflash 0x20000000 userdata.img userdata
```

2. DM(Driver Model)框架，主要包括：uclass, driver, device

3. 系统启动流程
``
Maskrom -> pre-loader -> Trust -> U-Boot -> kernel -> App
``
    * pre-loader 复杂加载 Trust 和 U-Boot, pre-loader 不开源，仅提供 bin 文件
    * U-Boot 负责加载 kernel
    * 如果客户有全开源的需求，可以使用 next-dev 分支的 U-Boot，支持 SPL/TPL 作为 preloader 引导系统，可以负责加载 Trust 和 U-Boot
    * SPL(Secondary Program Loader)/TPL(Tiny Program Loader) 本身就是 U-Boot 自身提供的一个功能，只是在 rkdevelop 分支没有用到
    * TPL 主要负责初始化 DDR，SPL 主要负责引导 trust/U-Boot 两个模块，rkdevelop 仅支持 rockchip 的 miniloader
    * next-dev 支持两种启动方式，SPL/TPL 和 rockchip miniloader
    * U-Boot-proper: 就是常说的 U-Boot， 运行在 DDR 中，负责引导 kernel

4. 分区支持
    * next-dev 支持 GPT 分区和 rk parameter 分区
    * next-dev 支持 RK 独立分区的固件启动方式，称之为 boot rockchip
    * next-dev 支持 FIT 格式打包的固件，rkdevelop 不支持
    * next-dev 支持 fat, ext2/4 文件系统

5. HW-ID DTB(Hardware id DTB) 检测硬件的 GPIO 或者 ADC 的数值动态加载不同的 Kernel DTB。
6. Fastboot 是 Android 提供的一种借助 USB 和 U-Boot 交互的方式,一般用来获取设备信息、烧写固件等
7. kernel dtb 的启用需要依赖 OF_LIVE （live device tree,简称 live-dt）, live-dt 的原理是：初始化阶段 U-Boot 扫描整个 DTB，将所有 DTB 节点转换成 struct device_node 节点链表，并且和具体的 device-driver 绑定。以后 device-driver 要访问 DTB 节点时直接访问自己的 device_node 即可，不用访问原有的 DTB。参考 U-Boot 的 doc/driver-model/livetree.txt
    * ofnode 类型 （include/dm/ofnode.h） 是两种 dt 都支持的一种封装格式，使用 live dt 时用 device_node 来访问 dt 节点，使用 fdt 时用 offset 来访问 dt 节点。
    * dev_ 和 ofnode_ 开头的函数支持两种 dt 访问方式
    * of_ 开头的支持 live dt 接口
    * fdtdec_ 和 fdt_ 开头的函数只支持 fdt 的接口

#### Kernel


#### misc

1. unpack.sh 解包的脚本，可以将 update.img 解包为多个 img （比如：uboot.img、boot.img 等）

2. 3568 使用的 next-dev 版本的 uboot (v2017.09)

3. 配置环境变量 **mpp_syslog_perror=1** rockchip mpp 官方的例程才会输出调试打印信息

4. 使用 MPP 进行硬件解码。 MPP 是瑞芯微提供的媒体处理软件平台(Media Process Platform)。该平台对应用软件屏蔽了芯片相关的复杂底层原理，为使用者提供统一的视频媒体处理接口 MPI（Media Process Interface）。
    * MPP 提供的功能包括：视频解码、视频编码和视频处理, MPP 的层次图：
      ![mpp](../figures/mpp.png)
    
      
    
5. 使用 RGA 进行硬件变换
