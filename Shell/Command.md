### shell 使用教程
1. 截取变量的某些字符串 eg:删除变量名的最后一位 CD=${AB:0:-1}，如果AB=abcd 那么CD=abc
2. bash 导出环境变量的方法 export CFLAGS=-static
3. 通过 grub2-mkconfig 更新 grub.cfg 配置文件，自动探测开机启动项，命令见 /etc/default/grub 文件 grub2-mkconfig -o /boot/grub.d/grub.cfg
4. find 命令，匹配多个类型名的文件 find -name "*.c" -o -name "*.S"
5. sed 使用教程
``` bash
sed -i "s/^/a&/g" filenmae :在filename的每一行的行首添加爱字母a
sed -i "s/$/&b/g" filenmae :在filename的每一行的行尾添加爱字母b
sed -i -e "/^#abc/{s/^#//g}" a.c : 修改 a.c 文件,在匹配 ^#abc 的行,删除开头的 # 号
sed -i.bak -e 's|bac|def|g' /tmp/a.txt  # 将 /tmp/a.txt 备份为 /tmp/a.txt.bak 然后修改 /tmp/a.txt 中的 bac 为 def
```
6. 保留
7. 字符串操作符集合
	1. ${varname:-word} 如果 varname 存在并且不为空，返回 varname 的值，否则返回 word 变量的内容
	2. ${varname:=word} 如果 varname 存在并且不为空，返回 varname 的值，否则将 word 赋值给 varname，然后返回 varname 的值
	3. ${varname:?message} 如果 varname 存在并且不为空，返回 varname 的值，否则返回 varname 追加 message 的信息
	4. ${varname:+word} 如果 varname 存在并且不为空，返回 word 的值，否则返回 null
	5. ${varname:offset:length} 如果 varname 存在并且不为空，返回 varname 从 offset 偏移处开始，长度为 length 的内容，varname 的第一个字符的偏移是 0
	5. ${varname:offset} 如果 varname 存在并且不为空，返回 varname 从 offset 偏移处开始到结尾的全部内容
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
12. cut 命令截取内容，-d 选项指定分割符，默认是 tab
``` bash
cut -f arg1 -d arg2 sth # 截取变量 sth 的内容，以 arg2 为分隔符，取第 arg1 列内容
awk -F args '{print $arg1}' sth # 等价上述内容
awk -F '分隔符' '{print $(NF)}' # 以分隔符 'xxx' 打印最后一个单词
```
13. bash 的流控 (return 只能用在函数中， exit 用来退出整个 shell 脚本)
	1. if/else # if 只能测试退出的状态值，可以通过 [ * ]（等价 test） 或者 [[ * ]]（bash v2.05 版本之前不支持） 来配合 if 判断，在表达式前添加 ! 可以取反，[ * ] 和 [[ * ]] 之间可以添加逻辑符号，比如 && 等价 -a，|| 等价 -o
		1. str1 = str2 字符串相等
		2. str1 != str2 字符串不相等
		3. str1 < str2 str1 比 str2 小
		4. str1 > str2 str2 比 str1 小
		5. -n str1 如果 str1 不为 null，并且长度比 0 大
		6. -z str1 如果 str1 为 null，并且长度为 0
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
		25. -f file 如果 file 存在，并且是一个常规的文件
		26. -L file 如果 file 存在并且是一个符号连接
		27. -h file 如果 file 存在，并且是一个符号链接, -L 类似或者叫等价
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
14. 位置变量（比如：$1 $2 等）是只读的，不可以对位置变量赋值，但是可以通过 **shift** 移动位置变量的值
15. 内置命令 getops 可以解析 shell 脚本的参数，如果用户输入了无效的 option， getops 会设置变量值为 ?，同时如果 getops 后跟随的内容没有以 : 开头或者设置环境变量 OPTERR 值为 0，那么还会打印错误信息格式（getops:illegal option -o ），如果一个选项带有参数，那么选项参数会保存到变量 $OPTARG， getops 会保存下一个参数的位置值到 $OPTIND
``` bash
while getopts ":ab:c" opt; do
    case $opt in
    a ) process option -a ;;
    b ) process option -b and $OPTARG is the argument of option b ;;
    c ) process option -c ;;
    \?) echo "usage sth [-a] [-b arg] [-c]"
        exit 1
    esac
done

shift $(($OPTIND - 1))
normal processing of arguments ...
```
16. declare 设置变量有效的选项， - 设置选项开启， + 设置选项关闭（-a 和 -F 选项在 bash v2.0 版本之前不支持）
---
|选项|意义|
|---|---|
|-A|变量是键值对数组，类似字典|
|-g|在函数中创建全局变量，其它位置可以忽略|
|-a|变量是数组|
|-f|只能用于函数名字|
|-F|显示未定义的函数名字|
|-i|变量是整形|
|-r|变量是只读|
|-x|标记这个是变量将通过环境导出|
17. $((...)) 算数表达式，需要在符号包括
---
|选项|意义|
|---|---|
|++|自加|
|--|自减|
|+|加|
|-|减|
|*|乘|
|/|除|
|%|余|
|**|Expomentiation(求幂)|
|<<|左移|
|>>|右移|
|&|位与|
|\||位或|
|~|位反|
|!|逻辑反|
|^|位异或|
|,|顺序计算|
|<|小|
|>|大|
|<=|小等|
|>=|大等|
|==|等|
|!=|不等|
|&&|逻辑与|
|\|\||逻辑或|
|-lt|小|
|-gt|大|
|-le|小等|
|-ge|大等|
|-eq|等|
|-ne|不等|
18. let 直接给数值变量赋值
``` bash
let intvar=expression
```
19. 算数 for 循环（bash v2.04 版本之前不支持）
``` bash
for (( initialisation; ending condition; update))
do
    dosth
done
```
20. 数组
``` bash
names[2]=alice
names[0]=hater
names[1]=duchess

names=([2]=alice [0]=hatter [1]=duchess)

names=(hatter duchess alice)

# 引用一个数组的元素的语法，如果没有指定 index i 那么默认引用 ${array[0]}
${array[i]}

# @ 和 * 符号是特殊符号，区别在于 @ 以空格为分隔符 * 以 IFS 变量的第一个字符为分隔符
# 如果将数组作为函数参数传递，使用 ${array[*]} 可以正常解析，使用 ${array[@]} 解析异常
# 传递时候，还需要添加双引号 "${array[*]}"
${array[@]} # 引用所有赋值的变量的值
${!array[@]} # 引用所有赋值的变量的索引
${#array[@]} # 引用所有已赋值的变量的个数
unset array[100] # 删除 array 数组第 101 个元素的赋值
```
21. IO 重定向
---
|符号|函数|
|---|---|
|\||管道|
|> file|重定向标准输出到 file|
|< file|重定向标准输入到 file|
|>> file|追加重定向标准输出到 file|
|>| file|强制重定向标准输出到 file，即使设置了 noclobber|
|<> file|使用 file 作为标准输出和标准输出|
|n<> file|使用 file 作为文件描述符 n 的标准输出和标准输出|
|n > file|重定向文件描述符 n 到 file|
|n < file|文件 file 作为文件描述符号 n 的源|
|n >&|复制标准输出到文件描述符 n|
|n <&|从文件描述符 n 复制标准输入|
|&> file|**重定向标准输出和错误输出到 file**|
|>& file|**重定向标准输出和错误输出到 file**|
|<&-|关闭标准输入|
|>&-|关闭标准输出|
22. **here-document** # 用来替换标准输入，label 这一段内容临时替换为上一个命令的标准输入，语法
``` bash
<< label1
...
label1

# label2 前添加 - 符号，表示会删除开头的 TABs 符号
<< -label2
...
label2

# 用法示意
cat >> a.txt << red
hello world

red
# 就会生成 a.txt 文件，文件中包含 hello world 和一个空行

sed -f - a.txt > b.txt << replace
1,1s/^/&RED/g
replace
# 将 a.txt 的第一行行首添加 RED,然后另存为 b.txt
# -f - 表示紧跟的标准输入作为命令参数
```
23. 文件描述符
``` bash
tee logfile # tee 将标准输入复制到标准输出保存到 loggile
```
24. printf 和 echo 类似，但是具有更强大的格式化打印
``` bash
printf format-string [arguments]
```
	1. format-string 可以包含三个可选的选项 %flags width.precision format-specifier
---
|flags|描述|
|---|---|
||右对齐|
|-|左对齐|
|+|添加数值的正负|

|format-specifier|描述|
|---|---|
|%b|解析 echo -e 格式 \n 等这类特殊符号的风格|
25. read 函数，从终端读取值保存到变量, **IFS 变量一般是 空格、TAB、换行**，如果忽略所有变量，整个输入的一行会保存到变量 *REPLY*
``` bash
read var1 var2
```
|选项|描述|
|---|---|
|-a|定义的是数组|
|-d|定义分割符|
|-n|声明多少个字符|
|-p|读取之前会打印一段 -p 追加的提示符|
|-r|保留 \ 开头的转义字符|
|-t|允许等待指定的时间（单位 s）完成输入|
26. command blocks # 使用 { 命令 } 符号将命令包括起来，构成一个 command block，表示这里包括起来的命令具有同样的标准输入、输出、错误输出
27. 命令行处理（shell 查找的顺序：函数 function、内置命令 build-in command、可执行文件 executable file）
28. 如果不确认使用单引号还是双引号，建议使用单引号，除非明确需要参数、命令或者是算数替换
---
|表达式|值|
|---|---|
|$person|hatter|
|"$person"|hatter|
|'$person'|$person|
|\$person|$person|
|"$person"|hatter|
|"'$person'"|'hatter'|
|~red|/home/red|
|"~red"|~red|
|'~red'|~red|
29. shell 搜索顺序是 functions、build-ins、scripts 和 executables，build-ins 又可以分为 3 类：command、builtin、enable
enable 的一些选项，可以开启和禁止内置的 builtin，这些选项在 bash v2.0 之前无效
|选项|描述|
---
|-a|显示所有的 builtin，不管是否使能|
|-d|删除所有使用 -f 添加的 builtin|
|-f filename|从 filename 文件加载一个新的 builtin|
|-n|禁用 built-in 或者显示所有禁用的 built-in|
|-p|和 -a 类似显示所有的 builtin|
|-s|限制输出到 POSIX 专门的 builtin|
30. function 函数定义方法
``` bash
function funcname
{

}

funcname ()
{

}
# 调用函数，直接 funcname 就可以，不用加 ()
```
31. eval 命令，eval 会将变量的内容作为命令执行
``` bash
something="ls"
eval $something # 执行 ls 命令

# eval 实现将变量名的值作为新的变量的名字，获取新变量名名字的值
person="ali"
obj="person"
A=$(eval echo '$'"$obj")
echo $A # 打印的是 ali

# 还有更加简单的语法，新版本的 bash 含有该 builtin
A=${!obj} # A 的值也是 ali
```
32. 进程处理
	1. job number 是 shell 赋值的
	2. process ID 是 系统赋值的
	3. job control
		1. **fg** # 将一个后台 job 拉到前台，这样可以让这个 job 控制你的终端或者窗口，因此可以接收你的输入，如果只有一个后台 job，可以直接 fd 命令不加参数，如果有很多后台 jobs，那么可以通过 fg %job_id 、fg %job_name、fg pid，指定拉回哪一个后台进程到前台；jobs 命令可以列出所有的后台 jobs，jobs -l 还可以列出来 pid，jobs -p 只会列出来 pid，jobs -r 只会列出来那些正在运行的 jobs，-s 只会列出来那些已经停止的 jobs，jobs -x jobsid，可以打印出来 jobsid 对应 job 的 pid
		2. Ctrl+Z 可以将一个 job 暂停、中止， fg 可以将这个 job 拉回前台
		3. Ctrl+C 可以将一个 job 终止，这种情况下就不可以使用 fg 将这个 job 拉回前台
33. 信号， **stty** 命令可以修改控制键值发送不同的命令
``` bash
stty signame char # signame 是信号名字，char 是键值（^ 表示 Ctrl 键）
stty intr ^X # 修改 ctrl-X 发送 INT 信号
```
---
|键值|信号名|信号值|
|---|---|---|
|Ctrl+C|INT interrupt|2|
|Ctrl+Z|TSTP terminal stop|20|
|Ctrl+\|QUIT stronger version of ctrl-C，当 ctrl-C 无效时，使用 ctrl-\|3|
34. **kill** 命令， kill 可以发送信号给任何进程，默认情况下，kill 发送的是 TERM（"terminate"，信号值是 15）信号，kill -l 可以查看所有信号名和信号值对应关系，接收到 SIGKILL 信号后，操作系统应该立即无条件终止这个进程，否则的话接收到 SIGKILL 信号的进程就会到一个奇怪的状态
``` bash
kill -signame pid/jobid
```
35. **trap** 命令捕捉信号做指定的动作
``` bash
trap cmd sig1 sig2 ...
trap "" sig1 # 忽略指定的信号
```
36. **$$** 是当前 shell 的 PID，使用**$$**可以很好的作为临时变量文件到名字，不容易冲突，**$!** 包含了最近执行的后台 job 的 PID
37. **wait** 等待指定所有的后台进程结束
``` bash
echo "adad" &
ls /tmp
wait # 等待所有后台进程执行完，才会继续执行
```
38. 进程可以分为三类 CPU-intensive：CPU 密集型、I/O-intensive：I/O 密集型、interactive 交互行
39. **subshells**
	1. 从 parents 继承的
		- 当前目录
		- 环境变量
		- 标准输入、输出、错误输出和其他的打开的文件描述符
		- 忽略的信号
	2. 没有从 parents 继承的
		- shell 变量，除了环境变量和那些定义在 .bashrc 这类环境文件的变量
		- 没有被忽略的信号，比如说 parents shell 特殊处理的信号
	3. 将一段 shell 代码，用括号扩起来，就可以让这段代码在 subshell 执行
``` bash
( sleep 10 ; echo "sth";ls /tmp) | less # sub shell
{ sleep 10 ; echo "sth";ls /tmp} | less # function block
```
40. 命名管道（有名管道）是一个临时的文件，就像一个有名字的管道，格式：关于一个程序的输入 <(list) ， 关于一个程序的输出 >(list)
``` bash
$ cmp <(prog1) <(prog2)
输出：/dev/fd/63 /dev/fd/62 differ: byte 46, line 1 # 可以看出有名管道，临时文件 /dev/fd/63 和 /dev/fd/63
```
41. grep，awk 匹配与、或、非
	* -E 表示擴展匹配規則
	``` bash
	# 或
	grep -E "pattern1|pattern2" FILE
	grep -e "pattern1" -e "pattern2" FILE
	awk '/PATTERN1|PATTERN2/' FILE
	
	# 与，指定顺序
	grep -E 'PATTERN1.*PATTERN2' FILE
	awk '/PATTERN1.*PATTERN2/' FILE
	# 与，不指定顺序
	grep -E 'PATTERN1.*PATTERN2|PATTERN2.*PATTERN1' FILE
	grep 'PATTERN1' FILE | grep 'PATTERN2'
	awk '/PATTERN1/ && /PATTERN2/ {print $0}' FILE
	
	# 非
	grep -v 'PATTERN1' FILE
	awk '!/PATTERN1/' FILE
	```
	* -H 将匹配的文件名也打印出来
	* grep "\\\" 匹配的是 \ 符号
42. 批量替换 txt 文件名的空格为下划线
``` bash
find $1 -name "* *.txt" -type f -print0 | \
  while read -d $'\0' f; do 
 	mv -v "$f" "${f// /_}";
done
```
43. 使用内置 getops 解析传递的参数
``` bash
while getops "a:b:c" opt;do # : 表示这个 a 选项支持选项参数
    case $opt in 
        a) process a with $OPTARG;; # OPTARG 表示对应选项追加的选项参数
        b) process b with $OPTARG;;
        c) process c;;
        ?) process something no exist in paramtlist;;
    esac
done
shift $(($OPTIND-1)) # OPTIND 表示下一个待解析参数的索引下表，从 1 开始
```
44. rename 批量修改文件后缀名字
``` bash
rename .a .b *.a # 将所有 .a 后缀文件的名字修改为 .b
rename '-' '_' * # 將所有的 - 符號修改爲 _
```
45. echo 命令颜色显示格式
``` bash
# 实际测试这个格式好像无效果
echo -e "\033[字符背景颜色;文字颜色;格式m字符串\033[0m"
echo -e "\033[文字颜色m字符串\033[0m"
```
|文字颜色|颜色码|
|---|---|
|黑色|30|
|红色|31|
|绿色|32|
|黄色|33|
|蓝色|34|
|紫色|35|
|天蓝色|36|
|白色|37|

---
|背景色|颜色码|
|---|---|
|黑色|40|
|红色|41|
|绿色|42|
|黄色|43|
|蓝色|44|
|紫色|45|
|天蓝色|46|
|白色|47|

---
|显示方式|方式码字|
|---|---|
|终端默认设置|0|
|高亮显示|1|
|下划线|4|
|闪烁|5|
|反白显示|7|
|隐藏|8|
46. grep
	* -a 选项，可以强制将匹配到的内容打印出来，不管是不是 text 文本
	* -H 选项，强制打印文件名称，如果传递的参数本来就是多个文件，那么这个参数可以不加
	* -o 选项,只打印匹配的内容
	* -h 选项,不打印文件名
47. shell 脚本的参数释义
	* $0 当前脚本的文件名
	* $n 传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2。
	* $# 传递给脚本或函数的参数个数。作用领域在最外层
	* $* 传递给脚本或函数的所有参数。
	* $@ 传递给脚本或函数的所有参数。
	* $* 和 $@ 的区别
	* $? 上个命令的退出状态，或函数的返回值。
	* $$ 当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID。
48. set -e # 表示後續 shell 語句任意一條出錯就會退出腳本執行
49. awk
	* ``awk '!a[$0]++'`` 可以去除重复值,真牛！！！, $0 表示整行， $1 表示第一列,依次类推
		``` text 解析过程
		<1>："!" 即非。
        <2>：a[$0]，以$0为数据下标，建立数组a
        <3>：a[$0]++，即给数组a赋值，a[$0]+=1
        当$0的内容首次出现时，a[$0]将为空（相当于0）
        此时将先求!a[$0]的值（也是整个式子的值，即为非空 true ,将影响后续动作，执行默认的print)
        然后对a[$0]进行+1，a[$0] 加1后为1，当下次出现时a[$0]即不为空，表达式结果为非真 false，即不打印
		```
	* awk -v ABC=123 '{print ABC}' # 通过添加 -v 选项可以传递参数到 awk 中，并且引用这个变量的时候不需要在之前添加 $ 符号
	* awk '{print 'ABC'}' # 或者通过 '' 符号
	* awk '{printf("%x,%s", 10, "abc")}' # 支持 printf 函数格式化打印，可以打印出来 16 进制以及字符串等格式
50. ``ls -l`` 以 - 开头的是硬连接,以 l 开头的是软连接
``` bash
▸ ls -l
.rw-r--r--. red red 0 B Wed Mar  8 10:04:43 2023  abc 源文件
.rw-r--r--. red red 0 B Wed Mar  8 10:04:43 2023  abc_hard 硬连接
lrwxrwxrwx. red red 3 B Wed Mar  8 10:04:52 2023  abc_soft ⇒ abc 软连接
```
51. cat -n # 可以打印出来文件的行号
52. source 命令的同义词是 . 如果你的脚本中有一些持久化的设置（即脚本退出时仍然希望它有效，那么使用 source 命令或者它的同义词命令 .），举例子，如果有一个脚本 a.sh
``` bash
#!/bin/sh

export ABC=1
```
如果使用命令 ``./a.sh``， 那么执行完后再当前 shell 也不会有这个变量 ABC，但是如果你使用 ``source a.sh`` 或者 ``. a.sh``，那么执行完后，当前 shell 就会有 ABC 这个变量了。
