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
8. pureline 一款 bash PS1 的优化插件
``` bash
git clone https://github.com/chris-marsh/pureline.git
```
9. ${# varnamw} 返回 varname 变量字符串的长度
10. shopt 设置、取消设置 shell 的参数
``` bash
shopt -p 打印 shell 的选项信息
shopt -s 设置 shell 的某一个选项
shopt -u 取消设置 shell 的某一个选项
```
	1. 如果 extglob 选项开启，那么可以使能扩展模式匹配，扩展模式的各种模式通过 | 符号隔开
		1. *(patternlist) 匹配 >= 0 个匹配列表的内容
		2. +(patternlist) 匹配 >= 1 个匹配列表的内容
		3. ?(patternlist) 匹配 0 或者 1 个匹配列表的内容
		4. @(patternlist) 匹配 1 个匹配列表的内容
		5. !(patternlist) 匹配除了指定匹配列表的其他内容
11. $(UNIX command) 将 command 的命令输出作为变量的值赋值给其他变量，和 `UNIX command` （目的是向之前的 shell 兼容，eg: Bourne 和 C shell）类似
12. cut 命令截取内容
``` bash
cut -f arg1 -d arg2 sth # 截取变量 sth 的内容，以 arg2 为分隔符，取第 arg1 列内容
awk -F args '{print $arg1}' sth # 等价上述内容
```
13. bash 的流控 (return 只能用在函数中， exit 用来退出整个 shell 脚本)
	1. if/else # if 只能测试退出的状态值，可以通过 [ * ]（等价 test） 或者 [[ * ]]（bash v2.05 版本之前不支持） 来配合 if 判断，在表达式前添加 ! 可以取反，[ * ] 和 [[ * ]] 之间可以添加逻辑符号，比如 && 等价 -a，|| 等价 -o
		1. str1 = str2 字符串相等
		2. str1 != str2 字符串不相等
		3. str1 < str2 str1 比 str2 小
		4. str1 > str2 str2 比 str1 小
		5. -n str1 str1 不为 null，并且长度比 0 大
		6. -z str1 str1 为 null，并且长度为 0
		7. -a file 如果 file 存在
		8. -d file 如果 file 存在并且是一个目录
		9. -e file 如果 file 存在和 -a 等价
		10. -r file 如果 file 存在并且具有可读权限
		11. -s file 如果 file 存在并且不为空
		12. -w file 如果 file 存在并且具有可写权限
		13. -x file 如果 file 存在并且具有可执行权限或者如果是目录的话，具有搜索权限
		14. -N file 如果 file 从上一次读之后有修改过
		15. -O file 如果 file 的所有人是你
		16. -G file 如果 file 的 Group ID 是你所在的组
		17. file1 -nt file2 如果 file1 比 file2 新（按照修改时间戳）
		18. file1 -ot file2 如果 file1 比 file2 旧（按照修改时间戳）
		19. $a -lt $b 如果 a 比 b 小
		20. $a -le $b 如果 a 比 b 小或者和 b 一样
		21. $a -eq $b 如果 a 和 b 一样
		22. $a -ge $b 如果 a 比 b 大或者一样
		23. $a -gt $b 如果 a 比 b 大
		24. $a -ne $b 如果 a 和 b 不相等
	``` bash
	if condition # 关于 condition 这里，如果是执行一个命令，那么如果命令正常执行，则返回 0, 但是 if 会判断为真！！
	then
	    dosth
	[elif condition then dosth]
	[else dosth]
	fi
	```
	2. for # IFS 变量可以修改 for 指定列表的分割符
	``` bash
	for name [in list]
	do
	    dosth
	    $name
	done
	```
	3. while # condition 和 if 类似
	``` bash
	while condition
	do
	dosth
	done
	```
	4. until # 可以简单认为 until 是 while 的反向，直到成功执行 command 命令才会停止
	``` bash
	until command;
	do
	dosth
	done
	```
	5. case # pattern 可以通过 | 符号分割出来一些匹配列表
	```bash
	case expression
	in
	pattern1
	)
	dosth1;;
	pattern2
	)
	dosth2;;
	...
	esac
	```
	6. select # 仅在 Korn shell 和 bash（1.14 版本之前的不支持 select） 存在，PS3 是 select 的提示符，修改该值可以修改 select 语句的提示符，select 语句会打印出一个菜单列表，等待用户输入一个数字，保存用户输入的数字到内置变量 REPLY，并且保存对应的条目到 select 指定的变量，然后执行语句，循环直到遇到 break、或者 exit，ctrl-D 也可以直接退出 select 循环
	``` bash
	select name [in list]
	do
	    dosth
	    $name
	done
	```
