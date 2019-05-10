" Darren's vimrc

set nocompatible        " we're using vim, not vi!

" Pretty UI stuff
syntax enable           " turn syntax color on
set cursorline          " shows pretty line for current line
set number              " show line number
set ruler               " show row,col numbers at bottom
set showcmd             " display whether in insert mode
set showmatch           " highlight matching parenthesis

" Indentation
set tabstop=2           " # of spaces for <TAB> character
set softtabstop=2       " # of spaces for <TAB> when editing
set expandtab           " tabs are spaces
set autoindent          " copy indentation from previous line

" Automatically set tabs for different files
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

" Filetype indentation
filetype on             " Enable filetype detection
filetype indent on      " indents based on file type
filetype plugin on      " Enable filetype-specific plugins

" foldfoldfold
set foldenable          " turn folding on set foldmethod=indent   " fold based on indent
set foldlevelstart=10   " open folds < 10 lines by default
set foldnestmax=10      " max 10 nested folds
" space open/closes folds
nnoremap <space> za

" other cool stuff
set wildmenu            " visual autocomplete for command menu
set autoread            " auto update file if it's been changed outside of vim
set mouse=a             " enable using the mouse for stuff
" use backspace normally in insert mode
set backspace=indent,eol,start

" search
set ignorecase          " ignore case when searching
set hlsearch            " highlight all matching phrases
set incsearch           " show partial matches for a search phrase

" color scheme
set background=light
let g:solarized_termcolors=256
colorscheme solarized
