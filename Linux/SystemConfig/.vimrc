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
nmap <C-\>a :Ack <C-R>=expand("<cword>")<CR><CR>

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'ryanoasis/vim-devicons'
"Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'chazy/cscope_maps'
"Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'luochen1990/rainbow'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
call plug#end()

" ===
" === extraconfig
" ===
set background=dark
colorscheme gruvbox

" ===
" === gitgutter
" ===
let g:gitgutter_max_signs = 1500
map <C-g> :GitGutterBufferToggle<CR>
map <C-l> :GitGutterLineHighlightsToggle<CR>

" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_browser = "google-chrome --new-window"

" ===
" === vim-rainbow
" ===
let g:rainbow_active = 1

" ===
" === vim-markdown-preview
" ===
"let vim_markdown_preview_github=1
"let vim_markdown_preview_hotkey='<C-m>'
"let vim_markdown_preview_use_xdg_open=1

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
      \ 'colorscheme': 'seoul256',
      \ }
set noshowmode


