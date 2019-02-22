let mapleader =" "

call plug#begin('~/.vim/plugged')
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

" copy-paste
vmap xyy :!xclip -f -sel clip <CR>
map xpp :-1r !xclip -o -sel clip<CR>

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

