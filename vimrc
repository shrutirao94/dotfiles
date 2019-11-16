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
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'gregsexton/matchtag'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'scrooloose/nerdcommenter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme', { 'do': './install.py' }

call plug#end()

set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set encoding=utf-8
" Set backspace to work correctly
set backspace=indent,eol,start

" Set mapleader
let mapleader = " "

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
set foldmethod=manual
set foldmethod=indent
set foldlevel=99

" Set leader key


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
nmap <leader>h :Helptags<CR>


" ============================================================================
" NERDTREE  
" ============================================================================
"
map <C-n> :NERDTreeToggle<CR>

autocmd vimenter * NERDTree
" lose vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ============================================================================
" LATEX  
" ============================================================================
"
autocmd FileType tex nmap <buffer> <S-L> :!latexmk -pdf %<CR>



" ============================================================================
" YOUCOMPLETEME  
" ============================================================================
"
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
