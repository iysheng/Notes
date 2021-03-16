### Riscv 架构学习


#### 编译工具链
1. 下载源码
``` bash
▸git clone --filter=blob:none --no-checkout https://hub.fastgit.org/riscv/riscv-gcc.git # 下载关键的 default 分支相关的文件
▸git checkout master # 切换到 master 分支
▸git submodule # 确认下所需的 submodules 软件包是否已经下载完成
 57dfc2c4d51e770ed3f617e5d1456d1e2bacf3f0 qemu (v4.0.0-1854-g57dfc2c4d5)
 2cb5c79dad39dd438fb0f7372ac04cf5aa2a7db7 riscv-binutils (heads/riscv-binutils-2.35)
 4ea498a8e1fafeb568530d84db1880066478c86b riscv-dejagnu (heads/riscv-dejagnu-1.6)
+4e3d3e40726e1b68bf52fa205c68495124ea60b8 riscv-gcc (heads/master)
 63a44e5923c859e99d3a8799fa8132b49a135241 riscv-gdb (remotes/origin/fsf-gdb-10.1-with-sim)
 7395b0964db9cc4dd544926414960e9a16842180 riscv-glibc (heads/riscv-glibc-2.29)
 415fdd4279b85eeec9d54775ce13c5c412451e08 riscv-newlib (newlib-4.1.0)
```
2. 配置编译
``` bash
▸./configure --prefix=工具链条路径 --enable-multilib（同时支持 32 bit 和 64 bit，否则默认只支持 64 bit）
▸make -j
```
3. 运行测试
``` bash
▸ make
cc applications/main.c
/opt/riscv_tools/bin/../libexec/gcc/riscv64-unknown-elf/10.0.1/cc1: error while loading shared libraries: libmpfr.so.4: cannot open shared object file:
 No such file or directory
make: *** [/home/yangyongsheng/just4github/riscv_codes/ab32vg1-ab-prougen/rt-thread/tools/rtthread.mk:100: /home/yangyongsheng/just4github/riscv_codes/
ab32vg1-ab-prougen/build/bsp/applications/main.o] Error 1
（原因是因为在编译工具链的服务器上使用的是 libmpfr.so.4，笔记上使用的是 libmpfr.so.6，将服务器对应版本的 libmpfr.so.4 复制到笔记上就可以正常运行了,如果是因为电脑上没有安装对应的库文件，那么安装对应的的库文件）
▸ sudo dnf install mpfr-devel （如果是缺少该库，安装 mpfr 库文件， 针对 fedora）
```
