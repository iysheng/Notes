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
7. 字符串操作符集合
	1. ${varname:-word} 如果 varname 存在并且不为空，返回 varname 的值，否则返回 word 变量的内容
	2. ${varname:=word} 如果 varname 存在并且不为空，返回 varname 的值，否则将 word 赋值给 varname，然后返回 varname 的值
	3. ${varname:?message} 如果 varname 存在并且不为空，返回 varname 的值，否则返回 varname 追加 message 的信息
	4. ${varname:+word} 如果 varname 存在并且不为空，返回 word 的值，否则返回 null
	5. ${varname:offset:length} 如果 varname 存在并且不为空，返回 varname 从 offset 偏移处开始，长度为 length 的内容，varname 的第一个字符的偏移是 0
	6. ${varible#pattern} 如果 varible 存在并且变量开头匹配到了 pattern，删除匹配到最短的内容，然后返回其余部分，pattern 可以是表达式
	7. ${varible##pattern} 如果 varible 存在并且变量开头匹配到了 pattern，删除匹配到最长的内容，然后返回其余部分，pattern 可以是表达式
	8. ${varible%pattern} 如果 varible 存在并且变量尾部匹配到了 pattern，删除匹配到最短的内容，然后返回其余部分，pattern 可以是表达式
	9. ${varible%%pattern} 如果 varible 存在并且变量尾部匹配到了 pattern，删除匹配到最长的内容，然后返回其余部分，pattern 可以是表达式
	10. ${varible/pattern/string} 如果 varible 存在并且匹配到了 pattern，使用 string 替换匹配到第一个最长的内容，pattern 可以是表达式，如果 pattern 带有 # 符号，那么必须是在 varible 的开始处，如果带有 %，那么匹配的是 varible 的结尾处
	11. ${varible//pattern/string} 如果 varible 存在并且匹配到了 pattern，使用 string 替换匹配到的所有的内容，然后返回 varible，pattern 可以是表达式
