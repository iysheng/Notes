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
