set nu

map <F4> :q!<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :TlistToggle<CR>
map <C-u> :!cscope -Rb<CR>:cs reset<CR><CR>
map <C-b> :w!<CR>
map <C-h> :nohl<CR>
map <S-m> :!sh build.sh<CR>

nmap <C-]>a :Ack <C-R>=expand("<cword>")<CR><CR>	

set background=dark
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'majutsushi/tagbar'
"Plug 'valloric/youcompleteme'
Plug 'mileszs/ack.vim'
Plug 'chazy/cscope_maps'
call plug#end()

colorscheme gruvbox
" taglist config
let Tlist_Use_SingleClick = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1

" light line config
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
set noshowmode
