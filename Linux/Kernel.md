### 内核学习

#### 内核支持使用 make 生成 cscope.files 文件
``make ARCH=arm64 COMPILED_SOURCE=1 cscope``

#### 内核支持版本
1. #include <linux/version.h>
#define DRIVER_VERSION			KERNEL_VERSION(0X01, 0X02, 0X02)
2. DRIVER_VERSION >> 16, DRIVER_VERSION >> 8 & 0XFF, DRIVER_VERSION & 0XFF

#### <<圈圈教你玩 USB>> 笔记

USB 学习网站：http://linux-usb.sourceforge.net

#### USB driver skeleton
![usb_core](assets/USB_core.png)

#### 关键概念
* USB 是 master-slave 通讯模型.
* USB system softwares 由两个关键部分组成: HCD(host controller driver) 和 USBD(USB driver)
* USB 通讯中两个关键的 interconnects(互连流) 是 endpoint 和 pipe
* USB 驱动概述
	* UHCI(universal host control interface): 用到全速和低速, 常用到PC
	* OHCI(open host control interface): 硬件比 UHCI 智能，所以 HCD（host controller driver）更简单
	* EHCI(enhanced host control interface): 支持高速 USB2.0

#### USB gadget
* USB composite device: USB 复合设备，指的是一个配置（配置描述符）下包含有不止一个功能（这里对应的是接口描述符）的设备。

##### USB urbs (USB Request Blocks)

``` C
static struct usb_driver skel_driver = {
    .name        = "skeleton",
    .probe       = skel_probe,
    .disconnect  = skel_disconnect,
    .fops        = &skel_fops,
    .minor       = USB_SKEL_MINOR_BASE,
    .id_table    = skel_table,
};

/* USB  DEVICE 总线信息  */
struct usb_device
{

};

/* USB BUS 总线信息  */
struct usb_bus
{

};
```
使用宏 MODULE_DEVICE_TABLE 创建的表来实现热插拔

#### USB Host
当前有 device 连接到 USB 总线上, host 会分配给这个 device 一个唯一的 device address.
device 上的每一个 endpoint 都有一个设备分配的唯一 ID. 这个 ID 称为 endpoint number.
#### USB Device

#### USB OTG(On-the-Go)

#### USB Subsystems

#### 内核调试
内核调试参数 ``initcall_debug`` 查看内核启动过程的函数调用详细信息
动态打印内核调试
    1. 内核放开 CONFIG_DYNAMIC_DEBUG
    2. 通过 ``echo 'file drivers/i2c/busses/i2c-imx.c +p' > /sys/kernel/debug/dynamic_debug/control`` 放开指定文件的打印
    3. echo 8 > /proc/sys/kernel/printk 降低打印级别，可以打印出来更多的内容

#### PWM 设备
``` dts
&pwm1 = {
    pinctrl-0 = <&pwm0m0_pins>;
    status = "okay";
}
```

在 ``/sys/class/pwm/`` 目录下就会生成一些 pwmchipx 的目录，可以在这里调节 pwm 的周期，占空比，使能等选项单位是 ns,对了要首先导出对应的通道哦

#### backlight 设备
内核支持 backlight 调光设备,比如节点
``` dts
backlight {
    compatible = "pwm-backlight";
    pwms = <&pwm4 0 1000000 0>;

    brightness-levels = <0 4 8 16 32 64 128 255>;
    default-brightness-level = <50>;
};
```
这样就会在 ``/sys/class/backlight/`` 目录下生成 backlight 节点目录,通过调节这个节点目录的 brightness 就可以调亮度了
