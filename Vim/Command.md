	## vim 命令
1. :1,$ s/abc/&def/gc 备注：& 符号会替换为 abc，执行该命令，会将 abc 变为 abcdef
2. :e 重新加载当前打开的文件
3. 无需到命令行，gU转换为大写 gu转换为小写
4. 1gU 从光标所在行往下 1 行全部转换为大写
5. gu0：从光标所在位置到改行的行首全部转换为小写，gU0：从光标所在位置到行首全部转换为大写
6. gu$：从光标所在位置到该行的行尾部全部转换为小写：gU$：从光标所在位置到行尾全部转换为大写
7. gUG：从光标所在位置到文章的最后一个字符全部转换为大写
8. gu1G：从光标所在位置到文章的第一个字符全部转换为小写
9. guw、gue、gUw、gUe，光标后面的单词会进行大小写转换，gu5w、gu5w、gU5w、gU5e，转换光标后的 5 个单词
10. gul、gul、gUl、gUl，光标后面的字母会进行大小写转换，gu5l、gu5l、gU5l、gU5l，转换光标后的 5 个字母
11. :命令行 source % 刷新配置
12. 无需到命令行，添加书签 ma：添加 a 书签 mb：添加 b 书签、、、、mz：添加 z 书签，跳转到 a 书签 'a 跳转到 a 书签这一行的行首； \`a 跳转到 a 书签的位置
13. 命令行： marks 查看所有书签
14. v 到 visual 模式，通过 hjkl 选择任意字符串， y 复制、 d 删除、^ 跳转到当前行首、$ 跳转到当前行尾
15. ctrl+v 块模式，通过 hjkl 选中字符块，同样 d 删除、y 复制；shift+i 块模式下到命令行
16. f + 一个字母，跳转到当前行第一个出现该字母的地方
17. 命令行下 :e 表示重新打开当前文件；:e + 文件名，打开对应文件
18. 输入 unicode 字符方法：**输入模式、ctrl-V、u + 4个 hex 进制的数据**，其中 u 是可变的，具体描述
---
|符号|描述|
|---|---|
|a|3 个 10 进制字符（0-255）|
|o|3 个 8 进制字符（0-255）|
|x|2 个 16 进制字符（00-ff）|
|u|4 个 16 进制字符（0000-ffff）|
|U|8 个 16 进制字符（00000000-ffffffff）|
19. help [command] 命令的帮助文档
20. vim unicode 相关的命令 digraphs
21. ctrl+] 是 vim 内置的跳转到 tag 的快捷键， ctrl + t 是内置的向后跳转， ctrl + o 是内置的向前跳转
22. vim 查看启动时间
``` bash
vim --startuptime start.log # 查看 vim 启动时间的细节信息
```
23. vim 匹配空行，然后删除： \s 表示空字符
``` vim
:g/^\s*$/d
```
24. ctrl+w n 新建一个 window， ctrl+w x 交换两个窗口的位置(前提两个窗口的大小要相等)，ctrl+w r 也可以实现交换两个窗口的位置(顺时针转动窗口)，ctrl+w R(逆时针转动窗口) ctrl+w c 关闭这个窗口
25. :copen 打开一个 quickfix window
26. vimdiff 可以方便的对比两个文件的差异以及修改： vim a.c b.c
	1. do 或者 :diffget 以对方的修改为准，覆盖自己的修改
	2. dp 或者 :diffput 以自己的修改为准，覆盖对方的修改
	3. [c 向后跳转到下一个不一样的地方，]c 向前跳转到下一个不一样的地方
	4. :%diffget 全部以对方窗口文件内容为标准覆盖自己修改
	5. :%diffput 全部以自己窗口文件为标准覆盖对方
	6. vimdiff 支持多个文件的比较，这时候使用 diffput 和 diffget 命令，需要指定 buffer 信息
	7. **vimdiff 作为 git 的 mergetool** ，配置
	``` bash
	git config --global merge.tool vimdiff
	git mergetool # 执行冲突合并，相关的细节[可以参看] Linux/Command.md 文件
	```
27. vim s 替换命令
	1. s/pattern/replace/[iIe] # 其中 i 表示忽略大小写， I 表示要匹配大小写 e：没有匹配到时候，也不要显示错误信息 如果格式是 :%s/pattern/replace/g # 表示的替换全文文件
	2. 对于带有 / 的匹配可以通过转移 / 符号，或者 s+pattern+replace+ 格式
	3. 12;/pattern1/ s/pattern2/replace/g # 从第 12 行开始，一直到第一个匹配有 pattern1 的行停止，替换这些行的 pattern 位 replace
	4. 如果在 replace 部分需要使用表达式,那么需要在 replace 之前添加 \=
	5. 如果在 pattern 部分有用表达式进行匹配捕获,那么可以用 submatch() 函数指代前面捕获的内容, submatch(1) 表示匹配的第一个文本, submatch(2) 表示匹配的第二个 ... ,特别地 submatch(0) 表示匹配的整个文本
	6. 一般地 submatch() 匹配的返回值是字符串型,需要使用函数 str2float() 转换为实数
28. 可以使用 arglist 跨文件处理
``` vim
:argadd 定义文件列表到 arglist
:argdo 定义执行的操作
:args 查看 arglist 的文件列表

eg:
arg *.c " 添加当前目录所有的 .c 文件
argdo %s/led.h/led_base.h/ge | update " 使用 led_base.h 替换 led.h 并保存

:bufdo 直接对当前 buffer 的所有文件执行动作
```
29. :update 命令和 :write 命令类似，但是 :update 只会 buffer 被修改的文件
30. macro 宏使用方法
``` vim
1. q + 寄存器值 " 声明要定义的宏保存在哪里
2. 执行一些动作 " 记录到对应的寄存器
3. q " 标记宏定义的动作执行完成 （建议，宏的需后可以添加一个 j，表示跳转到下一行，这样当多次执行时候，可以自动切换到下一行）
4. @ + 寄存器值 " 执行宏
```
31. vim 基本的正则表达式（可以通过 :help ordinary-atom 查看详细信息）
---
|符号|表示意义|
|---|---|
|.|**除了行结束符号之外的任意字符**|
|^|行开始|
|$|行结束|
|\_|任意字符|
|\<|word 开始|
|\>|word 结束|
32. 匹配任意字符（可以通过 :help character-classes），可以通过符号[]，创建字符集合， ^ 符号是取反
---
|符号|表示意义|
|---|---|
|\s|空格，包含 table|
|\d|一个数字|
|\w|文字字符|
|\l|一个小写字母|
|\u|一个大写字母|
|\a|一个字母|
|\D|所有非数字的内容|
|\L|所有非小写字母|
|\U|所有非大写字母|
|\A|所有非字母|
|\\\_x|备注：为了兼容 markdown 显示一个反斜杠和一个下划线，写了三个"\" ，实际是一个反斜杠；当前行首次出现 x(x 是 s d w 等这些替换) 转移字符的位置|
33. 交替和分组
---
|符号|表示意义|
|---|---|
|\||交替|
|\( \)|分组|
``` vim
" 分组的使用
:s/\(cat\) hunting \(mice\)/\2 hunting \1/
" 例子所示， \2 指代的是 mice  \1 指代的是 cat
```
34. Quantifiers or multis （量词或倍数：每一个单一的字符后跟量词或者倍数，可以通过 :help multi 查看更详细信息）
---
|符号|表示意义|
|---|---|
|\*|0 或者更多，贪婪|
|\+|1 或者更多，贪婪|
|\{-}|1 或者更多，非贪婪|
|\? or \=|0 或者 1 ，贪婪|
|\{n,m}|n 到 m 个 ，贪婪|
|\{-n,m}|n 到 m 个 ，非贪婪|
``` vim
s/adc\w*/def/gc # 匹配以 abc 开头的一个 world，使用了转移字符加量词/倍数的表达
```
35. magic（默认模式，大部分的转移字符都需要 \ 转义，除了 . 或者 \*）、no magic（所有的转义字符都要添加 \）、very magic（所有的非数字、字母和下划线之外的转义字符都不需要 \） 三种模式
``` vim
" default magic
:s/\(cat\) hunting \(mice\)/\2 hunting \1
:s/\m\(cat\) hunting \(mice\)/\2 hunting \1
" very magic
:s/\v(cat) hunting (mice)/\2 hunting \1
" magic
:g/^\s*$/d
" no magic
:g/\M^\s*$/d
```
36. ctrl-r + ctrl-w ，可以在 command line 模式， :输入光标所在的 word
37. 删除或者赋值的时候可以声明，将删除或者赋值的内容保存到指定的寄存器，执行动作前，线选择寄存器，这些动作要在 normal 模式执行
``` vim
"bdw  将删除的 word 保存到寄存器 b
"byy  将复制的一行内容保存到寄存器 b
```
38. buffers 命令查看当前所有 buffers 的信息， buffer 命令切换对应的 buffer
``` vim
:buffers	查看当前 buffers 的信息，命令可以简写
:buffer 参数 （参数可以是： buffer 编号、关键字等），切换编辑对应的 buffer， buffer 命令可以简写为 b
```
39. vim 脚本定义变量类型
---
|类型|描述|
|---|---|
|g|全局的|
|w|vim 定义的全局的|
|l|局部的|
|b|当前 buffer 的|
|w|当前 window 的|
|t|当前 tab 的|
|s|local to a :source'd vim script|
|a|**函数参数**|
40. 可以修改寄存器的值，前加 @ 符号
``` vim
" 修改寄存器 a 的值
let @a = 'just for fun'
```
41. 可以访问 vim 的选项，前加 & 符号
``` vim
" 修改选项
let &ignorecase = 1
```
42. vim 脚本是可以使用一般的 + - * / 数字运算符号的 并且字符串拼接可以直接使用 . 符号
43. echom 打印的内容，可以通过 messages 命令查看打印记录
44. vim 的逻辑运算
---
|符号|描述|
|---|---|
|&&|逻辑与|
|\|\||逻辑或|
|!|逻辑非|
|==|比较两个字符串，根据 vim 配置，是否比较大小写|
|==?|比较两个字符串，不比较大小写|
|==#|比较两个字符串，比较大小写|
|=~|检查是否可以匹配右侧的表达式，根据 vim 配置，是否比较大小写|
|=~?|检查是否可以匹配右侧的表达式，不比较大小写|
|=~#|检查是否可以匹配右侧的表达式，比较大小写|
|!~|检查是否可以匹配右侧的表达式，根据 vim 配置，是否比较大小写|
|!~?|检查是否可以匹配右侧的表达式，不比较大小写|
|!~#|检查是否可以匹配右侧的表达式，比较大小写|
45. vim 支持列表 list 和字典 dictionary
``` vim
" list
let animals = {'cat', 'dog', 'pig'}
" dictionary
let animal_names = {
    \ 'cat': 'Miss Cat',
    \ 'dog': 'Mr dog'
\}
```
46. 函数定义
``` vim
" 函数定义示例
" ! 符号的作用时，当有多个同名函数定义存在时，不抛出错误
function! AnDi(name)
    echo a:name . ' say hello to you'
    "return a:name . 'say hello to you'
endfunction
" Hello
function! Hello(name, ...) " ... 表示可选参数
    echo a:name . ' say hello world to you' . a:1 . a:000[1]
    "return a:name . 'say hello to you'
endfunction
" 针对可选参数, a:1 表示可选参数的第一个, 并且会将可选参数保存到 
" a:000 这个 list
 " 调用函数的方法
call AnDi("Red")

" 定义快捷键调用自定义的函数
map ad :call AnDi("Red")<CR>
```
47. execute 命令支持解析并且执行一段字符串作为 vim 命令
``` vim
" 执行 echo 命令打印提示信息
execute 'echo "fly bird"'
" 不提示打印信息 fly bird
silent execute 'echo "fly bird"'
```
48. expand 函数扩展文件相关的函数
---
|参数|描述|
|---|---|
|:p|扩展整个路径|
|:h|head(last path component removed)|
|:t|tail(last path component only)|
|:e|文件扩展名|
``` vim
" eg
echom "file extension is " . expand("%:e") " vim
echom "file full path is " . expand("%:p") " /tmp/a.vim
echom "file head is " . expand("%:h") " /tmp
echom "file tail is " . expand("%:t") " a.vim
```
49. 编译 vim 的时候，开启 --with-x 可以使能 xterm_clipboard 剪切板，特别的 clipboard 有两大类:
	1. * 寄存器是系统 primary 剪切板（Mac、windows 默认的剪切板，以及在 Linux 终端，选择内容保存的剪切板），鼠标中心按键会选择这个剪切板的内容粘贴；
	2. + 寄存器是只在 Linux 使用，实现类似 ctrl-c 和 ctrl-v 的复制粘贴效果，鼠标右键，选择粘贴选择的是这个剪切板；
50. 使用 marks 命令，查看定义的书签
51. 可以在 /root 目录创建 .vim 和 .vimrc 的软链接，这样既可以节省空间，又可以同步更新 vim 的配置
52. 删除匹配内容的行
```
:g/pattern/d
```
53. 高亮现实匹配的单词，将光标移到需要搜索的单词
	1. shift + "*" :向下查找并高亮显示单词
	2. shift + "#" :向上查找并高亮显示单词
	3. 'g' + 'd':高亮显示光标所属单词，'n' 查找
54. \r 在 vim 命令行表示回车换行 ; \n 在 vim 命令行替换的时候进行匹配
55. 对数据的增加和减少
	1. ctrl + a 增加计数，如果在列选择模式下，使用 g 然后 ctrl + a，选中的一列会自动加 1
	2. ctrl + x 减少计数
56. ** vsplit 和 split ** 如果不加任何参数，那么默认会将当前正在打开的文件复制一份分屏
57. vim 从源码安装的配置命令
``` bash
./configure --with-features=huge --enable-cscope=yes --enable-cscope=yes  --enable-python3interp=yes --with-python3-config-dir=/usr/lib64/python3.9/config-3.9-x86_64-linux-gnu
```
58. 相对跳转基本的格式是 num+[j/k 好像可以省略]
59. . 重复上一次的命令执行
60. 命令行模式
	``` bash
	<< # 减少缩进 4 个空格
	>> # 增加缩进加 4 个空格
	```
61. 可视模式
	``` bash
	< # 减少缩进 4 个空格
	> # 增加缩进加 4 个空格
	```
62. 软链接的一般操作
	* ln -s target link_name # 创建一个指向 target 的名字为 linkname 的软链接
	* rm link_name # 删除名字为 link_name 的软链接，切记 linkname 后不要加 / 符号，加了的话会删除软链接目录的内容
63. 编辑寄存器
	* 编辑寄存器保存的宏内容(以寄存器 a 为例子)
		1.  "ap 将寄存器的内容复制出来
		2. .... 编辑寄存器的内容
		3. "ayy 将寄存器的内容写回到寄存器
64. 命令行模式的一些命令,有关编码格式
	1. :echo &fileencoding # 打印当前文件的编码格式.引用系统变量前添加 & 符号
	2. :set fileencoding=utf8 # 修改当前文件的编码格式
65. 变量的不同命名空间,根据不同附加的前缀决定
---
|符号前缀|意义|
|---|---|
|b:|当前缓冲区|
|w:|当前窗口|
|t:|当前标签页|
|g:|全局|
|l:|局部函数|
|s:|局部 :source 的 vim 脚本|
|a:|函数参数,只限在函数内使用|
|v:|vim 预定义的全局变量|
66. 一次分屏开启多个 window
	* -o 水平分割打开多个 window
	* -O 垂直分割打开多个 window
	* CTRL-W r/R/x 分别可以旋转 window ,以及交换 window
67. 修改 tabline 的颜色, vim 修改颜色使用 :highlight 命令,可以根据不同的分组设备不同部件的颜色,有关 statueline 涉及到的有三处:
``` vim
TabLineSel - is the current (so to say) active tab label.
TabLine - are the labels which are not currently active.
TabLineFill - is the remaining of the tabline where there is no labels (background).

" 针对支持 termguicolors 的终端,使用的是 guibg 还有 guifg 色彩配置
" eg:
:highlight TabLineSel guibg=#A6CC70 guifg=#707A8C ctrembg=10 ctermfg=8
```
68. 用户定义的函数开头字母必须要大写来区别内置的函数
69. `let` 定义变量
70. 
