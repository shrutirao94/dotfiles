set nocompatible              " required
filetype off                  " required


" Vundle config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tomasr/molokai'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'powerline/powerline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ivanov/vim-ipython'

call vundle#end()            " required
filetype plugin indent on    " required


syntax on
set background=dark
colorscheme hemisu


set nu

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

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

set encoding=utf-8


au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
