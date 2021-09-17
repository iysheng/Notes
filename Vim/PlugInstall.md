## [vim 插件](#plug)

插件的[目录结构](https://github.com/wsdjeg/vim-plugin-dev-guide):
- plugin : 这个是 plugin 的核心目录, 是在 vim 启动时将被载入的脚本
- autoload : 这里面存储的是在对应插件有需要的时候自动加载的脚本,具体的还需要了解 vim 的 autoload system, 自动加载目录是我们保存插件大部分功能的地方
	- 在该目录都可以认为是脚本库,调用的时候有特殊的语法,比如在 autoload 存在 hello.vim 脚本,里面有一个 Hey() 函数,通过 call hello#Hey() 就可以调用到这个函数
	- 并且 autoload 目录可以进行嵌套, 比如 autoload 下存在一个子目录 welcome, welcome 中有脚本文件 hello.vim ,这时候调用的语句就变成了 call welcome#hello#Hey()
	- 特别要注意的是定义的时候也要加上 # 符号定义函数原型, # 之前要加上脚本的名字
		``` vim
		function! hello#Hey()
		endfunction
		```
	- 脚本库并不是 autoload 唯一的功能,还有一个功能是实现调用时加载,但是 plugin 目录下的内容是 vim 启动的时候就会加载

## [常见插件](#sets)

1. itchyny/lightline.vim
	1. 为了实现 light-line 的色彩效果，需要 export TERM=xterm-256color [这个步骤及其重要，特别如果想要在 tmux 正常显示 gruvbox 的效果]
2. plasticboy/vim-markdown
	```vim
	zr: reduces fold level throughout the buffer
	zR: opens all folds
	zm: increases fold level throughout the buffer
	zM: folds everything all the way
	za: open a fold your cursor is on
	zA: open a fold your cursor is on recursively
	zc: close a fold your cursor is on
	zC: close a fold your cursor is on recursively
	```
3. scrooloose/nerdtree 和 xuyuanp/nerdtree-git-plugin
	1. 分屏打开一个新的文件,在左侧树状图中，输入i 横向分屏打开，输入s 纵向分屏打开
4. amileszs/ack.vim 类似与 grep 的搜索，需要安装 ack
5. suan/vim-instant-markdown
	1. 需要设置一下火狐浏览器的配置 about:config and set dom.allow_scripts_to_close_windows to true，这样的话可以在 md 文件关闭的时候，直接退出对应的网页
	2. 因为需要通过 npm 安装 ，需要提前修改一下阿里的源，
	```bash
	npm config set registry https://registry.npm.taobao.org --global
	npm config set disturl https://npm.taobao.org/dist --global
	```
6. chazy/cscope_maps
	1. 默认的快捷键配置，crt + \ 然后再输入各种搜索的关键字 eg:s 表示搜索符号，搜索函数名的
	定义的时候，建议首先使用 -g 如果搜不到的时候，可以使用 -s 搜索
	2. crtl+[ 跳转到定义的地方
	3. crtl+] 跳转到引用该符号的地方
	4. crt+t 向上一级的窗口跳转
7. honza/vim-snippets SirVer/ultisnips
	1. 代码片段插件
	2. 基本代码片段语法
	* ``extends`` 可以组合指定的文件类型的代码片段,比如 cpp.snippets 开头就有 ``extends c``
	* ``priority`` 关键字设置当前文件类型的代码片段的优先级, 默认的优先级都是 0,数值越大优先级越高
	* ``snippet`` 开头的一行内容标记一个代码片段的开始, ``endsnippet`` 开头的一行的内容标记代码片段的结束.代码片段开始的格式一般为:
		```vim
		snippet trigger_word ["description" [options]] 中括号的内容表示可有可无,如果 trigger_word 不止一个单词,中间存在空格,必须要用 \" 双引号包括起来,或者用 ! 符号包括起来,如果触发的单词有 \" 符号,那么需要用 !"单词"! 格式
		```
    	```vim
    	snippet vimcomm
    	" ===
    	" ===${1:title}[备注：表示接入这个代码片段的时候光标会直接跳转到这个地方，显示的提示名字是 title]
    	" ===
    	endsnippet
    	```
    * ``` { $ \ `` 这些符号都有特殊的含义,如果需要插入这些符号,那么需要在开头添加 \ 符号进行转以
	* snip 支持插入 shell/vim/python 语句
		1. python 语句,之前需要加入 !p,同时会创建一个 ``snip`` 的 python 对象
	3. snippets 默认对于 C 语言有一个 head 代码片段，具体可以参看文件~/.vim/plugged/vim-snippets/UltiSnips/c.snippets
	4. 变量 UltiSnipsSnippetDirectories 可以修改 snipper 默认的搜索路径，默认的会搜索所有 runtimepath 路径的子目录，这个 snippets 的搜索路径可以指定**绝对路径**，关键字 ***snippets*** 是保留的。
	```vim
    let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/vim-snippets/UltiSnips/']
	```
	5. snip 支持对片段的展开和片段变量的跳转
	```vim
	" 设置 ctrl-e 展开代码片段，因为和 YCM tab 冲突
    let g:UltiSnipsExpandTrigger="<c-e>"
	" 设置向前跳转到下一个变量
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
	" 设置向后跳转到上一个变量
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
	```
	6. UltiSnipsEdit 编辑当前后缀的文件代码片段
8. dominikduda/vim_current_word # 高亮光标所在的 word
9. 'gruvbox-material/vim', {'as': 'gruvbox-material'} # gruvxbox 改进配色
10. 'majutsushi/tagbar' # 可以替换 taglist 查看 tag 的插件， 命令 TagbarToggle 切换是否显示 tag 列表
11. 自己手动编译新版本的 vim，这时候可能会出现 [Backspace 按键删除失效的问题](https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode)，需要追加如下内容到 vimrc 配置文件，新版本的 vim 一般不会读取 /etc/vimrc 配置文件导致的，还有一种方法，直接复制 /etc/vimrc 到新版本 vim 会读取配置文件的地方 i.e 一般是 /usr/local/share/vim/vimrc
``` vimrc
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
```
12. 'Valloric/YouCompleteMe' # 自动补全引擎， ctrl + <sapce> 手动触发补全引擎
13. 'tpope/vim-fugitive' # vim 和 git 的包装器插件
	1. Gblame：检查某一个文件的每一行是哪次提交的
14. 'vim-syntastic/syntastic' # 语法检测的引擎
15. 'ycm-core/YouCompleteMe' # youcomplete 代码补全插件
	1. 出现问题时，调试命令 **YcmDebugInfo** ，可以提示看哪个 log 分析问题
	2. 如果启动提示无法加载 python
	```
	unavailable: unable to load Python
	```
	可以在命令行使用命令 :py pass 调试是否可以正常运行 python 或者 :py3 pass 调试是否可以正常在 vim 加载 python3，然后根据提示的错误修复无法加载 python 的问题
16. 'mattn/emmet-vim' 提高 html&css 编辑效率的插件
	1. 默认的触发开始按键是 ctrl-y ，可以修改变量 g:user_emmet_leader_key 的值来改变这个触发开始按键
	2. 翻转注释按键是 ctrl-y/
	3. 扩展一个 word 为 tag 组 ctrl-y;
	4. 更新一个 tag， ctrl-yu 可以在命令行底部提示输入内容，输入内容要以  开头
	5. 快速创建列表
	``` vim
	test1
	test2
	test3
	最好是通过 visual select 的方式选择所有的 line 然后再
	<c-y>,
	在底部的 tag 栏键入 ul>li* 回车
	<ul>
	    <li>test1</li>
	    <li>test2</li>
	    <li>test3</li>
	</ul>
	如果在 tag 栏键入的是 tag 的名字，那么显示的效果是
	<tagname>
		test1
		test2
		test3
	</tagname>
	```
	6. 选择一整个 element 的所有内容，包括 open tag 和 close tag （如果存在的话） c-yd
	7. 选择下一个 element 的所有内容，c-yD
	8. 跳转到下一个需要编辑的地方， c-yn
	9. 跳转到上一个需要编辑的地方， c-yN
	10. 获取一个 image 的大小并且，填充到 width 和 height 属性，前提一定要有一个 src 属性这个值指定好图片的路径。 c-yi
	11. ~~合并行，首先 J 选择多个行，然后 c-ym 合并这些行~~
	12. 删除一个 tag 对,c-yk
	13. 自动解析 url 地址填充到 a 这个 link element c-ya
	14. 自动解析 url 地址填充到 a 这个 link element c-yA，这个的内容更加详细
	15. html5 扩展为一个模板 c-y,
17. 'prettier/vim-prettier' 格式化文件的插件，需要提前安装 yarn ， fedora 上执行 dnf install yarnpkg
18. 'bagrat/vim-buffet' tab 样式美化插件
- buffers 是文件在内存中的存储表示, buffer 有三种状态: 
	- active-buffer: 这种状态的 buffer 会显示在 window 上
	- hidden-buffer: 这种状态的 buffer 不会显示在 window 上
	- inactive-buffer: 这种状态的 buffer 不会显示,并且不会包含什么内容
	- :bdelete 关闭所有关联该 buffer 的 window
	- :bp 切换显示前一个 buffer 的内容到当前 window
	- :bn 切换显示后一个 buffer 的内容到当前 window
	- :bd# 删除第一个备用的缓冲区
	- :buffers 显示所有的 buffers
	- :ls 显示所有的 buffers
		- # 表示备用缓冲区
		- % 指示当前 window 的 buffer
		- a 指示激活的 buffer, 当前 buffer 被加载并且可视
		- h 指示隐藏的 buffer, 被加载了,但是没有显示
		- = 指示只读的 buffer
		- + 指示被修改过的 buffer
		- x 指示出现读取错误的 buffer
		- - 指示该 buffer 的 modifiable 属性为 off
	- :ls! 可以额外显示更多特殊的 buffers
		- u 表示 unlisted buffer
	- :buflisted({expr}) 如果指定的编号的 buffer 存在并且 listed (设置了 'buflisted' option), 返回 TRUE
	- unlisted-buffer 表示没有在 buffer list 列表中,不是一般用来编辑的 normal edit, 比如用来显示帮助文档,记忆一个文件名称或者标记.
	- bufname() 返回指定 buffer 的 name 信息, name 信息在 `:ls` 命令可以查看
	- buffer 的 index
		- % 当前 buffer
		- # 候补区的 buffer
		- 0 当前 buffer
	- fnamemodify({fname}, {mods}) 根据 mods 修改 fname
	- filename-modifiers 文件名修饰符
		- :p 获取 full path
		- :h 获取文件名的 head, 会删除末尾的分割符
		- :p:h 用来获取当前文件的路径信息
		- :t 获取 buffer name 的文件名
	- sbuffer N : 分割 window, 加载编号为 N 的 buffer 内容,缺省 N 时,加载当前文件
	- bufexist('name') " 如果指定名称为 name 的 buffer 存在,那么返回 1
	- winnr('name') " 根据指定的 buffer 的名字.获取对应的 window 编号, 如果不存在返回 -1
	- bufnr('name') " 获取名字为 name 的 buffer 编号, 如果 name 为 '$' 获取最后一个 buffer 的编号
	- :h buffer-list 查看所有 buffer 的命令
- windows 是 buffer 的可视化, 你可以为 1 个 buffer 创建多个 window, 也可以为多个 buffer 创建多个 window
	- :new 新创建一个 window
- tabs 是 windows 的集合, 多个 tab 组成了 tab pages 的概念,有关 tab 的命令, A tab is only designed to give you a different layout of windows.(tab page 仅仅是提供了 windows 的不同 layout 的视角)
	- :tabnew 创建新的 tab
	- :tabc 关闭当前 tab, 当仅剩当前一个 tab 的时候,是无法关闭的
	- :tabo 关闭其他的 tabs
	- :tabn 跳转到下一个 tab page
	- :tabp 跳转到上一个 tab page
	- :tabfir 跳转到第一个 tab
	- :tabl 跳转到最后一个 tab
	- :tabs 列出当前所有的 tab pages
	- 通过设置 tabline 选项可以修改 tab 的 GUI 显示,当启用 GUI 显示的时候(set termguicolors) 需要设置 guitablabel 选项
	- 对应的 showtabline 选项只会在有多个 tab page 的时候显示
- 涉及到的函数
	- tabpagenr() 当前 table page 的 number , tabpagenr('$') 获取的是最后一个 table page 的 number, 根据这个 number 可以切换到对应的 tab page, 使用命令 `:tab <pagenumer>`, tab page 的 number 从 1 开始编
	- tabpagewinnr() 缺省参数时当前 table page 的 window 的编号,否则对应编号的 table page 的 window number,特别地 tabpagewinnr('$') 返回当前 tab page 的 windows 的数量, 如果 tab page 的编号无效的话,返回 0
	- tabpagebuflist() 返回当前 tab page 关联的所有 windows 的所有 buffer 的编号 list. 缺省的参数表示当前的 tab page,否则表示的是指定编号的 tab page, 特别地当 tab page 参数为 '$' 时,返回所有 tab page 的 buffers 的编号到一个 list
19. 自定义函数
	- % 表示当前编辑的文件
20. Number 变量可以是 10 进制, 8 进制和 16 进制
	- :echo 123 " 10 进制
	- :echo 023 -> 19 " 8 进制, 0 是 8 进制的开头
	- :echo 0x10 " 16 进制
21. string 类型也有一些区别
	- "abc\ndef" \n 这些特殊的符号可以正常转以
	- 'abc\ndef' \n 不会被认为是特殊的符号
	- " 开头在 vim 脚本语言中是注释语句
22. Funcref 是函数的引用, 这个变量的首字母也要大写
``` vim
function! Hello()
endfunction
let abc=function('Hello')
call abc()
```
23. `runtimepath` 变量类似 linux 的 `PATH` 环境变量
	- set runtimepath+=full path " 直接添加指定的路径到系统变量 runtimepath
	- system("字符串命令") 执行 shell 命令
24. `execute` 命令执行命令
	- execute "normal! I" . "red"  # 执行 normal 模式的命令 I, 进入到插入模式,然后输入 red, 其中 normoal 后的 ! 表示对后面命令采用 unmapped 的意义
	-
35. line() 函数返回指定内容在文件的行号
	- line('.') 当前光标所在行
	- line('$') 文件的最后一行
	- line('a') 标记为 a 的 mark 所在的行
	- getline(number) " 获取第 number 行的内容并返回, 文件的行号是从 1 开始的
36. `tabline` 选项控制 tabline 的显示效果,
	- 每一个 status line 的条目都由 `%-0{minwid}.{maxwid}{item}` 结构组成,除了 item 之外,其他的都是可选项,一个单独的 % 符号应该表示为 %%, 最大可以定义 80 个条目, 如果以 %! 开头,那么会以后面的结果作为 option 的值
	- %#HighLightName#ABC 以指定的配置高亮 ABC ,前面的可以认为是格式化的内容
37. 判断符号
	- ==# 识别大小写的判断
	- ==? 不识别大小写的判断
	- =~# 正则匹配 , 识别大小写
	- =~ 正则匹配,使用系统设置的 ignorecase 的值
38. vim 的数据类型和对应的编号, `:help type`
```
Number:     0  v:t_number
String:     1  v:t_string
Funcref:    2  v:t_func
List:       3  v:t_list
Dictionary: 4  v:t_dict
Float:      5  v:t_float
Boolean:    6  v:t_bool (v:false and v:true)
None:       7  v:t_none (v:null and v:none)
Job:        8  v:t_job
Channel:    9  v:t_channel
Blob:      10  v:t_blob
```
39. vim 的模式匹配 `usr_27.txt` 
- Ignoring case
	- 默认情况下, vim 是大小写敏感的
	- set noignorecase 关闭识别大小写
	- set ignorecase smartcase 智能识别,当检测的是小写字母时,可以认为是忽略大小写,检测的包含有大写字母时会匹配大小写
	- 如果想匹配大小写那么需要添加 \C 的前缀
	- 如果想忽略大小写那么需要添加 \c 的前缀
- Wrapping around the file end
	- set nowrapscan 取消环绕
- Offsets
	- /pattern/数字偏移量 移动到匹配
	- /pattern/e 移动到匹配的最后一个字符
	- /pattern/e-1 移动到匹配的倒数第二个字符
	- /pattern/b 移动到匹配的第一个字符
	- /pattern/b+1 移动到匹配的第二个字符
	- ?pattern?b+1 后向查找,移动到匹配的第二个字符
- Matching multiple times
	- /a* 表示匹配任意数量的 a
	- /\(ab\)* 表示匹配任意数量的 ab
	- /a\+ 匹配一个及以上数量的 item
	- /ab\= 匹配一个可选的 b,即 ab 或者 a
	- /ab\{n,m} 匹配 n 到 m 个 b
	- /ab\{-n,m} 匹配 n 到 m 个 b,最少匹配
	- /a.\{-}b 在 a 到 b 之间最少匹配
	- /a.*b 在 a 到 b 之间最多匹配,贪婪匹配
- Alternatives 备用, 可替换的
	- or 操作符对应的是 "\|"
- Character ranges 符号范围
	- 如果匹配 a b c 可以使用 /a\|b\|c, 如果匹配 a - z 可以使用 /[a-z], 认为这个 list 都是孤立的字符
	- \e 表示 <Esc>  \t 表示 <Tab>  \r 表示 <CR>  \b 表示 <BS>
- Complemented range 避免匹配专门的字符,在匹配的开头使用 ^ 符号排除掉要匹配的内容
