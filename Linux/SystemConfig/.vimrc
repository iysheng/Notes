" _ __ ___  __| |_   _(_)_ __ ___  _ __ ___ 
"| '__/ _ \/ _` \ \ / / | '_ ` _ \| '__/ __|
"| | |  __/ (_| |\ V /| | | | | | | | | (__ 
"|_|  \___|\__,_| \_/ |_|_| |_| |_|_|  \___|

" ===
" === vimbasic
" ===
filetype plugin on
set nu
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,utf-16,big5
" highlight tabs and trailing spaces
set listchars=tab:>-,trail:-
set list
" 代码高亮 80 列
set colorcolumn=80

" ===
" === 快捷键配置
" ===
map <F9> :q!<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :TlistToggle<CR>
map <C-u> :!cscope -Rb<CR>:cs reset<CR><CR>
map <C-b> :w!<CR>
map <C-h> :nohl<CR>
map <S-m> :!make clean && make<CR>
map <S-r> :source $MYVIMRC<CR>
nmap <C-\>a :Ack <C-R>=expand("<cword>")<CR><CR>

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.7' }

Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

Plug 'valloric/youcompleteme'
Plug 'ryanoasis/vim-devicons'

Plug 'vim-scripts/taglist.vim'
Plug 'chazy/cscope_maps'
Plug 'luochen1990/rainbow'

Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'godlygeek/tabular'

Plug 'airblade/vim-gitgutter'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

" ===
" === extraconfig
" ===
set background=dark
colorscheme gruvbox
"let g:nord_cursor_line_number_background = 1
"let g:nord_uniform_diff_background = 1
"let g:nord_uniform_status_lines = 1
"let g:nord_italic_comments = 1
"let g:nord_underline = 1
"colorscheme nord
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
" === taglist
" ===
let Tlist_Use_SingleClick = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1

" ===
" === UltiSnips
" ===
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
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

