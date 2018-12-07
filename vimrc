" ============================================================================
" .vimrc - Shruti Rao 
" ============================================================================
"
set nocompatible              " required
filetype off                  " required

" ============================================================================
" Plug Block  
" ============================================================================
"

call plug#begin('~/.vim/plugged')
set shell=/bin/bash

Plug 'nathanaelkane/vim-indent-guides'
Plug 'gregsexton/matchtag'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'scrooloose/nerdcommenter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

call plug#end()

set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

" Set backspace to work correctly
set backspace=indent,eol,start

set t_Co=256
syntax on
set background=dark
colorscheme spacegray 
let g:spacegray_use_italics = 1

set number
set noswapfile
" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-p> :w<CR>:!python %<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Show partial commands
set showcmd

" Visual autocomplete for command line
set wildmenu

" Show matching paranthesis
set showmatch

" Search Settings
" Search as characters are entered
set incsearch
set hlsearch



" ============================================================================
" FZF  
" ============================================================================
"
map ; :Files<CR>



" ============================================================================
" NERDTREE  
" ============================================================================
"
map <C-n> :NERDTreeToggle<CR>

autocmd vimenter * NERDTree
" lose vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
