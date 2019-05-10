" Darren's vimrc

" 0 random ================================================================ {{{
" we're using vim, not vi!
set nocompatible

" ========================================================================= }}}
" 1 Pretty UI stuff ======================================================= {{{

" turn syntax color on
syntax enable
" shows pretty line for current line
set cursorline
" show line number
set number
" show row,col numbers at bottom
set ruler
" display whether in insert mode
set showcmd
" highlight matching parenthesis
set showmatch
" always show tab label
set showtabline=2

" ========================================================================= }}}
" 2 Indentation =========================================================== {{{

" # of spaces for <TAB> character
set tabstop=2
" # of spaces for <TAB> when editing
set softtabstop=2
" tabs are spaces
set expandtab
" copy indentation from previous line
set autoindent

" Automatically set tabs for different files
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

" Filetype indentation ====================================================

" Enable filetype detection
filetype on
" indents based on file type
filetype indent on
" Enable filetype-specific plugins
filetype plugin on

" ========================================================================= }}}
" 3 foldfoldfold ========================================================== {{{

" fold based on indent
" set foldmethod=indent
" turn folding on 
set foldenable
" open folds < 10 lines by default
set foldlevelstart=10
" max 10 nested fields
set foldnestmax=10
" space open/closes folds
nnoremap <space> za

" ========================================================================= }}}
" 4 other cool stuff ====================================================== {{{

" visual autocomplete for command menu
set wildmenu
" auto update file if it's been changed outside of vim
set autoread
" enable using the mouse for stuff
set mouse=a
" use backspace normally in insert mode
set backspace=indent,eol,start

" ========================================================================= }}}
" 5 search ================================================================ {{{

" ignore case when searching
set ignorecase
" highlight all matching phrases
set hlsearch
" show partial matches for a search phrase
set incsearch

" ========================================================================= }}}
" 6 color scheme ========================================================== {{{

" something something make colors work
if (has("termguicolors"))
  set termguicolors
endif
" use oceanic next theme (make sure we have vim colors!)
colorscheme OceanicNext
" ========================================================================= }}}
