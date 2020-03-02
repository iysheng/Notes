### vim 插件
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
	```vim
	snippet vimcomm
	" ===
	" ===${1:title}[备注：表示接入这个代码片段的时候光标会直接跳转到这个地方，显示的提示名字是 title]
	" ===
	endsnippet
	```
	3. snippets 默认对于 C 语言有一个 head 代码片段
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
