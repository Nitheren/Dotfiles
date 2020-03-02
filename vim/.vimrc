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
call plug#end()

" basics
set wrap
set number relativenumber
syntax on
filetype plugin indent on
set backspace=eol,indent,start
set modelines=0
set nomodeline
set showmode
set hidden
set ignorecase
set incsearch
set laststatus=2
set modelines=5
set nocompatible
set nofoldenable
set nohlsearch
set nostartofline
set pastetoggle=<C-p>
set ruler
set scrolloff=10
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set spellfile=~/.vimspell.add
set spelllang=en_us
set tabstop=4
set timeoutlen=0
set wildmode=longest,list,full

" copy-paste
vmap <F5> :!xclip -f -sel clip <CR>
map <F6> :-1r !xclip -o -sel clip<CR>

" file type detection
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff

" spell check:
map <F7> :setlocal spell! spelllang=en_gb<CR>

" lightline
"set laststatus=2
"set noshowmode
"if !has('gui_running')
"		set t_Co=256
"endif

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

" don't pollute directories with swap files, keep them in one place
silent !mkdir -p ~/.vim/{backup,swp}/
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" highlight stray spaces and tabs when out of insert mode
"au BufWinEnter * match ExtraWhitespace /\s\+$/
"au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"au InsertLeave * match ExtraWhitespace /\s\+$/
" performance hack
if version >= 702
	au BufWinLeave * call clearmatches()
endif

" make buffer windows easier to navigate
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
