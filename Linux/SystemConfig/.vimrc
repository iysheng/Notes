" _ __ ___  __| |_   _(_)_ __ ___  _ __ ___ 
"| '__/ _ \/ _` \ \ / / | '_ ` _ \| '__/ __|
"| | |  __/ (_| |\ V /| | | | | | | | | (__ 
"|_|  \___|\__,_| \_/ |_|_| |_| |_|_|  \___|

" ===
" === vimbasic
" ===
filetype plugin on
" 抑制 cscope 的打印信息
set nocscopeverbose
set rnu
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
set cursorline
" ===
" === get from fedora31 /etc/vimrc
" ===
set nocompatible    " Use Vim defaults (much better!)
set bs=indent,eol,start        " allow backspacing over everything in insert mode
"set ai            " always set autoindenting on
"set backup        " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
            " than 50 lines of registers
set history=50        " keep 50 lines of command line history
set ruler        " show the cursor position all the time

function! CloseWindow()
    if winnr() != -1
       let abufname=bufname()
           let abufnum=bufnr(abufname)
           if abufnum != -1
               bd
           endif
    endif
endfunction

" ===
" === 快捷键配置
" ===
map <silent> <leader>f :!astyle --style=bsd %<CR> " format current file
map <F9> :silent call CloseWindow()<CR> " Close the window
map <leader>q :q!<CR> " Quit the window
map <F5> :NERDTreeToggle<CR>
map <F6> :TagbarToggle<CR>
" 新创建一个 tab 页面
map <F7> :tabnew<CR>

if empty(glob('./cscope.files'))
    map <C-u> :e<CR>
else
    map <C-u> :!cscope -Rb<CR>:cs reset<CR><CR>
endif

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
" 当前行添加 "    "
map <leader>t :s/^/    &/g<CR>
map <leader>h :s/^/extern &/g<CR>:s/$/&;/g<CR>
nmap <C-\>a :Ack <C-R>=expand("<cword>")<CR><CR>
nmap <leader>s :split<CR>
nmap <leader>v :vsplit<CR>
" C++ 源文件定义 C 语言的函数声明
nmap <leader>c :s/^/extern "C" &/g<CR>
" tabprevious
nmap gr :tabprevious<CR>
" comment python code
nmap cpy :s/^/#&/<CR>

" ===
" === vim-plug check
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Note: Make sure the function is defined before `vim-buffet` is loaded.
function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=3 ctermfg=1 guibg=#73d0ff guifg=#1a1f29 
  hi! BuffetActiveBuffer cterm=NONE ctermbg=10 ctermfg=2 guibg=#2b2c34 guifg=#87d96c
  hi! BuffetBuffer cterm=NONE ctermbg=10 ctermfg=8 guibg=#2b2c34 guifg=#CBCCC6
  hi! BuffetTab cterm=NONE ctermbg=10 ctermfg=8 guibg=#2b2c34 guifg=#f28779
  hi! BuffetTrunc cterm=NONE ctermbg=10 ctermfg=8 guibg=#2b2c34 guifg=#707A8C
endfunction

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'joshdick/onedark.vim'
Plug 'jnurmine/Zenburn'
Plug 'ajmwagar/vim-deus'
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/everforest'
Plug 'cocopon/iceberg.vim'

Plug 'sheerun/vim-polyglot'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

Plug 'valloric/youcompleteme'
Plug 'sjl/gundo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'andymass/vim-matchup'

Plug 'majutsushi/tagbar'
Plug 'chazy/cscope_maps'
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'mattn/emmet-vim'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'godlygeek/tabular'

Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
"Plug 'tpope/vim-fugitive'

" 代码片段的模板仓库
Plug 'honza/vim-snippets'
" 代码片段引擎
Plug 'SirVer/ultisnips'

Plug 'mhinz/vim-startify'
" 高亮光标所在的 word
Plug 'dominikduda/vim_current_word'
"Plug 'Luxed/ayu-vim'
" new tab style
Plug 'bagrat/vim-buffet'
Plug 'godlygeek/tabular'
Plug 'bash-lsp/bash-language-server'
Plug 'azabiong/vim-highlighter'
Plug 'easymotion/vim-easymotion'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

" ===
" === nerd commenter
" ===
let g:NERDSpaceDelims = 1

" ===
" === match up
" ===
let g:loaded_matchit = 1

" ===
" === current_word plug config
" ===
let g:vim_current_word#highlight_only_in_focused_window = 1
map <F2> :VimCurrentWordToggle<CR>

" ===
" === extraconfig
" ===
" 高亮光标所在的行
" set cursorline
" 屏蔽掉方向键盘
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" 隐藏光标所在的行的下划线
function! HideCursorLine()
    hi CursorLineNr cterm=NONE
    hi CursorLine cterm=NONE
endfunction

autocmd Colorscheme *  call HideCursorLine()

" ===
" === gruvbox-material
" ===
"if exists('+termguicolors')
"  set termguicolors
"endif
" set background=dark
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

"
"let g:nord_uniform_diff_background = 1
"let g:nord_uniform_status_lines = 1
"let g:nord_underline = 1
"let g:nord_italic = 1
"let g:nord_italic_comments = 1
"let g:nord_cursor_line_number_background = 2
"colorscheme nord
"

" ===
" === deus colorscheme
" ===
if exists('+termguicolors')
  set termguicolors
  if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif
set background=dark
let g:everforest_ui_contrast = 'soft'
let g:everforest_enable_italic = 0
let g:everforest_disable_italic_comment = 1
colorscheme everforest
"let g:lightline.colorscheme = 'everforest'

" ===
" ===onedark
" ===
"if exists('+termguicolors')
"  set termguicolors
"  if &term =~# '^screen'
"    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"  endif
"endif
"let g:onedark_terminal_italics = 1
"colorscheme onedark

" ===
" === ayu colorscheme
" ===
" function! Colorayu(mode)
"     if a:mode == "light"
"         set background=light
"         colorscheme ayu
"     elseif a:mode == "dark"
"         set background=dark
"         let g:ayucolor="mirage"
"     endif
"     let g:ayucolor="mirage"
" endfunction
" set termguicolors       " enable true colors support
" call Colorayu("dark")
" set cursorline
" let g:ayu_italic_comment = 1 " defaults to 0.
" let g:ayu_sign_contrast = 1 " defaults to 0. If set to 1, SignColumn and FoldColumn will have a higher contrast instead of using the Normal background
" colorscheme ayu


map cg :colorscheme gruvbox<CR>
map cn :colorscheme nord<CR>
map cz :colorscheme zenburn<CR>
map cal :call Colorayu("light")<CR>
map cad :call Colorayu("dark")<CR>

" ===
" === vim-buffet 配置
" ===
let g:buffet_always_show_tabline = 0
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
let g:buffet_show_index = 1
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

" ===
" === gitgutter
" ===
let g:gitgutter_max_signs = 2500
map <C-g> :GitGutterBufferToggle<CR>
map <C-l> :GitGutterLineHighlightsToggle<CR>

" ===
" === vim-rainbow
" ===
let g:rainbow_active = 1

" ===
" === markdown-preview
" ===
let g:mkdp_open_to_the_world = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_port = '9090'
let g:mkdp_filetypes = ['markdown']

nmap tm :MarkdownPreview<cr>
nmap tn :MarkdownPreviewStop<cr>
nmap <C-p> :MarkdownPreviewToggle<cr>

" ===
" === youcompleteme
" ===
let g:ycm_global_ycm_extra_conf ='~/.vim/plugged/youcompleteme/third_party/ycmd/.ycm_extra_conf.py'
" 即使在注释段落，也允许代码补全
let g:ycm_complete_in_comments = 1
let g:ycm_disable_for_files_larger_than_kb = 4096
"let g:ycm_path_to_python_interpreter = /bin/python3
"let g:ycm_server_python_interpreter = python3
" 默认鼠标停止一段时间就会弹出函数原型等有关内容,取消这个功能
"let g:ycm_auto_hover = 'CursorHold'
let g:ycm_auto_hover = ''
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_language_server =
            \ [
            \   {
            \       'name': 'bash',
            \       'cmdline': [ 'bash-language-server', 'start' ],
            \       'filetypes': [ 'sh' ],
            \   }
            \ ]
nn <leader>jd :YcmCompleter GoToDefinition<cr>
nn <leader>jr :YcmCompleter GoToReferences<cr>
nn <leader>jc :YcmCompleter GoToDeclaration<cr>
nn <leader>jf :YcmCompleter GoTo<cr>

" ===
" === UltiSnips
" ===
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
" 使用'honza/vim-snippets' 默认的代码片段目录，已经同步该仓库到
" https://gitee.com/iysheng/vim-snippets.git
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/vim-snippets/UltiSnips/']

" ===
" === lightline
" ===
set laststatus=2
let g:lightline = {
      \ 'enable': { 'tabline': 0 } ,
      \ 'colorscheme': 'everforest',
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
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#87af5f   ctermbg=4
"let g:indent_guides_enable_on_vim_startup = 1

"noremap <leader>] :YcmCompleter GoTo<cr>
" ===
" === gundo
" ===
let g:gundo_prefer_python3=1
let g:gundo_help=0
noremap <leader>u :GundoToggle<cr>

" 代码高亮 80 列
hi ColorColumn guibg=DarkCyan

"
" vim-highlight
"
" Unicode
" set encoding=utf-8

" default key mappings
let HiSet   = '<leader><CR>'
let HiErase = '<leader><BS>'
let HiClear = '<leader><C-L>'
let HiFind  = '<leader><Tab>'
let HiSetSL = 't<CR>'

" jump key mappings
nn <CR>  <Cmd>Hi><CR>
nn g<CR> <Cmd>Hi<<CR>
nn gl    <Cmd>Hi}<CR>
nn gh    <Cmd>Hi{<CR>
nn gj    <Cmd>Hi]<CR>
nn gk    <Cmd>Hi[<CR>

" find key mappings
nn -        <Cmd>Hi/next<CR>
nn _        <Cmd>Hi/previous<CR>
nn f<Left>  <Cmd>Hi/older<CR>
nn f<Right> <Cmd>Hi/newer<CR>

" sync mode
" let HiSyncMode = 1

" command abbreviations
ca HL Hi:load
ca HS Hi:save

" directory to store highlight files
" let HiKeywords = '~/.config/keywords'

" additional highlight colors
" hi HiColor21 ctermfg=52  ctermbg=181 guifg=#8f5f5f guibg=#d7cfbf cterm=bold gui=bold
" hi HiColor22 ctermfg=254 ctermbg=246 guifg=#e7efef guibg=#979797 cterm=bold gui=bold
