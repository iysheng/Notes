" _ __ ___  __| |_   _(_)_ __ ___  _ __ ___ 
"| '__/ _ \/ _` \ \ / / | '_ ` _ \| '__/ __|
"| | |  __/ (_| |\ V /| | | | | | | | | (__ 
"|_|  \___|\__,_| \_/ |_|_| |_| |_|_|  \___|

" ===
" === vimbasic
" ===
filetype plugin on
set nu
set shiftwidth=4
set tabstop=4
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,utf-16,big5
" highlight tabs and trailing spaces
set listchars=tab:>-,trail:-
set list
" 代码高亮 80 列
set colorcolumn=80
" ===
" === get from fedora31 /etc/vimrc
" ===
set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" ===
" === 快捷键配置
" ===
map <F9> :q!<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :TagbarToggle<CR>
map <S-u> :!cscope -Rb<CR>:cs reset<CR><CR>
noremap <leader>w :w!<CR>
map <C-h> :nohl<CR>
map <S-m> :!make clean && make<CR>
map <S-r> :source $MYVIMRC<CR>
" 替换当前行的所有 ”\t“ 为“    ”
map <S-s> :s/\t/    /g<CR>
" 替换当前文件的所有 ”\t“ 为“    ”
map <leader>s :%s/\t/    /g<CR>
" 删除当前文件所有行结尾多余空格
map <leader>d :%s/ \+$//g<CR>
nmap <C-\>a :Ack <C-R>=expand("<cword>")<CR><CR>

" ===
" === vim-plug check
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

Plug 'valloric/youcompleteme'
Plug 'sjl/gundo.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'majutsushi/tagbar'
Plug 'chazy/cscope_maps'
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'godlygeek/tabular'

Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-fugitive'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

Plug 'mhinz/vim-startify'
" 高亮光标所在的 word
Plug 'dominikduda/vim_current_word'
call plug#end()

" ===
" === current_word plug config
" ===
let g:vim_current_word#highlight_only_in_focused_window = 1
map <F2> :VimCurrentWordToggle<CR>

" ===
" === extraconfig
" ===
" 高亮光标所在的行
set cursorline
" 屏蔽掉方向键盘
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

set background=dark

" ===
" === gruvbox-material
" ===
"if exists('+termguicolors')
"  set termguicolors
"endif
"" 默认配置的是 medium，可选的是 hard 和 soft
"" let g:gruvbox_material_background = 'soft'
"" 为什么开启 italic comment 在 tmux 环境就会高亮注释内容？
"" https://github.com/tmux/tmux/issues/1246
"" let g:gruvbox_material_disable_italic_comment = 1
"let g:gruvbox_material_enable_bold = 1
"let g:gruvbox_material_enable_italic = 1
"" 使能插件 current_word 高亮光标指定的 word
"let g:gruvbox_material_current_word = 'bold'
"" 默认是关闭背景透明
""let g:gruvbox_material_transparent_background = 1
""let g:gruvbox_material_visual = 'reverse'
"colorscheme gruvbox-material

let g:nord_uniform_diff_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_italic = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord
map cg :colorscheme gruvbox<CR>
map cn :colorscheme nord<CR>

" ===
" === gitgutter
" ===
let g:gitgutter_max_signs = 1500
map <C-g> :GitGutterBufferToggle<CR>
map <C-l> :GitGutterLineHighlightsToggle<CR>

" ===
" === vim-rainbow
" ===
let g:rainbow_active = 1

" ===
" === instant markdown
" ===
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
nmap tm :InstantMarkdownPreview<CR>
nmap tn :InstantMarkdownStop<CR>

" ===
" === youcompleteme
" ===
let g:ycm_global_ycm_extra_conf ='~/.vim/plugged/youcompleteme/third_party/ycmd/.ycm_extra_conf.py'

" ===
" === UltiSnips
" ===
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["$HOME.'/.vim/UltiSnips'", "UltiSnips"]

" ===
" === lightline
" ===
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
"set noshowmode

" ===
" === indent_guides
" ===
" 映射切换显示 indent guides
nmap <silent> <Leader>g <Plug>IndentGuidesToggle
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_indent_levels = 10
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
" nord color Frost
" https://www.nordtheme.com/docs/colors-and-palettesh
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#5f5f5f   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#87af5f ctermbg=4
"let g:indent_guides_enable_on_vim_startup = 1

"noremap <leader>] :YcmCompleter GoTo<cr>
" ===
" === gundo
" ===
let g:gundo_prefer_python3=1
let g:gundo_help=0
noremap <leader>u :GundoToggle<cr>

