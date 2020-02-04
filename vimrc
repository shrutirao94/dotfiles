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
Plug 'lervag/vimtex'
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
Plug 'vim-airline/vim-airline'
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

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END

" Dim inactive windows using 'colorcolumn' setting
"if exists('+colorcolumn')
  "function! s:DimInactiveWindows()
    "for i in range(1, tabpagewinnr(tabpagenr(), '$'))
      "let l:range = ""
      "if i != winnr()
        "if &wrap
         "let l:width=256 " max
        "else
         "let l:width=winwidth(i)
        "endif
        "let l:range = join(range(1, l:width), ',')
      "endif
      "call setwinvar(i, '&colorcolumn', l:range)
    "endfor
  "endfunction
  "augroup DimInactiveWindows
    "au!
    "au WinEnter * call s:DimInactiveWindows()
    "au WinEnter * set cursorline
    "au WinLeave * set nocursorline
  "augroup END
"endif

set clipboard=unnamed

set number
set noswapfile
" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

set splitbelow
set splitright

"Show trailing white spaces
set list
set listchars=tab:›\ ,eol:¬,trail:⋅

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
"autocmd FileType tex nmap <buffer> <S-L> :!latexmk -pdf %<CR>
"autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Skim'
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


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

se mouse+=a
