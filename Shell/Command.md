### shell 使用教程
1. 截取变量的某些字符串 eg:删除变量名的最后一位 CD=${AB:0:-1}，如果AB=abcd 那么CD=abc
2. bash 导出环境变量的方法 export CFLAGS=-static
3. 通过 grub2-mkconfig 更新 grub.cfg 配置文件，自动探测开机启动项，命令见 /etc/default/grub 文件 grub2-mkconfig -o /boot/grub.d/grub.cfg
4. find 命令，匹配多个类型名的文件 find -name "*.c" -o -name "*.S"
5. sed 使用教程
``` bash
sed -i "s/^/a&/g" filenmae :在filename的每一行的行首添加爱字母a
sed -i "s/$/&b/g" filenmae :在filename的每一行的行尾添加爱字母b
```
6. tmux 使用教程
	1. ctrl-b 空格：更换排版

