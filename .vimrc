let mapleader =" "

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'kovetskiy/sxhkd-vim'
call plug#end()

" basics
set wrap
set number relativenumber
syntax on
filetype plugin indent on
set cursorline
set tabstop=2
set backspace=eol,indent,start
set modelines=0
set nomodeline

" copy-paste
vmap <F5> :!xclip -f -sel clip <CR>
map <F6> :-1r !xclip -o -sel clip<CR>

" file type detection
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff

" spell check: 
map <F7> :setlocal spell! spelllang=en_gb<CR>

" lightline
set laststatus=2
set noshowmode
if !has('gui_running')
		set t_Co=256
endif

" compiler
map <leader>c :w! \| !compiler <c-r>%<CR><CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set linebreak<CR>

" groff
autocmd Filetype groff, inoremap ,t .TL <enter>
autocmd Filetype groff, inoremap ,a .AU <enter>
autocmd Filetype groff, inoremap ,h .NH <enter>
autocmd Filetype groff, inoremap ,hh .SH <enter>
autocmd Filetype groff, inoremap ,p .PP <enter>
autocmd FileType groff, inoremap ,bb .IP \[bu]<enter>
" Nerd tree
"map <leader>n :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
"b:NERDTree.isTabTree()) | q | endif

