" ============================================================================
" .vimrc - Shruti Rao
" ============================================================================

set nocompatible              " required
filetype off                  " required


" ============================================================================
" Plug Block
" ============================================================================

call plug#begin('~/.vim/plugged')
set shell=/bin/bash
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'gregsexton/matchtag'
Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'scrooloose/nerdcommenter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'KabbAmine/zeavim.vim'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


" ============================================================================
" UI Settings
" ============================================================================

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
let mapleader = "\<Space>"
let localmapleader = "\\"

set t_Co=256
syntax on
set background=dark
colorscheme onedark
let g:onedark_terminal_italics = 1

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END

" Allow new buffers to resize automatically
autocmd VimResized * wincmd =

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
set listchars=tab:›\ ,trail:⋅

" Show partial commands
set showcmd

" Visual autocomplete for command line
set wildmenu

" Show matching paranthesis
set showmatch


" ============================================================================
" Navigation
" ============================================================================

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-p> :w<CR>:!python %<CR>


" ============================================================================
" Folding
" ============================================================================

set foldmethod=manual
set foldmethod=indent
set foldlevel=99
nnoremap <s-tab> za
set foldlevelstart=1

" ============================================================================
" Search
" ============================================================================

" Search as characters are entered
set incsearch
set hlsearch


" ============================================================================
" FZF
" ============================================================================

map ; :Files<CR>
nmap <leader>h :Helptags<CR>


" ============================================================================
" NERDTREE
" ============================================================================
map <C-n> :NERDTreeToggle<CR>

autocmd vimenter * NERDTree
" lose vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ============================================================================
" LATEX
" ============================================================================


let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:vimtex_view_method = 'skim'
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_fold_enabled=0
let g:vimtex_indent_available=0
let g:vimtex_syntax_enabled=0


" ============================================================================
" YOUCOMPLETEME
" ============================================================================

let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

se mouse+=a


" ============================================================================
" AIRLINE
" ============================================================================

"Smarter tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'
