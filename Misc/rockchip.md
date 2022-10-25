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
    * SPL/TPL 本身就是 U-Boot 自身提供的一个功能，只是在 rkdevelop 分支没有用到
    * TPL 主要负责初始化 DDR，SPL 主要负责引导 trust/U-Boot 两个模块，rkdevelop 仅支持 rockchip 的 miniloader
    * next-dev 支持两种启动方式，SPL/TPL 和 rockchip miniloader

4. 分区支持
    * next-dev 支持 GPT 分区和 rk parameter 分区
    * next-dev 支持 RK 独立分区的固件启动方式，称之为 boot rockchip
    * next-dev 支持 FIT 格式打包的固件，rkdevelop 不支持
    * next-dev 支持 fat, ext2/4 文件系统

#### Kernel


#### misc

1. unpack.sh 解包的脚本，可以将 update.img 解包为多个 img （比如：uboot.img、boot.img 等）
2. 3568 使用的 next-dev 版本的 uboot (v2017.09)
