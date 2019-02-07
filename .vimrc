let mapleader =" "

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
call plug#end()

" basics
set wrap
set number
syntax on
filetype plugin indent on
set cursorline
set tabstop=2

" spell check: 
map F7 :setlocl spell! spelllang=en_gb<CR> 

" lightline
set laststatus=2
set noshowmode
if !has('gui_running')
		set t_Co=256
endif

" compiler
map <leader>c :w! \| !compiler <c-r>%<CR><CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set linebreak<CR>
