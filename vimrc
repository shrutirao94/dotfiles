set nocompatible              " required
filetype off                  " required


" Vundle config
" Initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
set shell=/bin/bash

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'klen/python-mode'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'gregsexton/matchtag'
Plugin 'flazz/vim-colorschemes'
Plugin 'mru.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()

filetype plugin indent on    " required


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

" Show the line the cursor is on
set cursorline 

" Visual autocomplete for command line
set wildmenu

" Show matching paranthesis
set showmatch

" Search Settings
" Search as characters are entered
set incsearch
set hlsearch

