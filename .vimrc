" Darren's vimrc

" Pretty visual stuff
syntax enable           " turn syntax color on
set cursorline          " shows pretty line for current line
set number              " show line number
set ruler               " show row,col numbers at bottom
set showcmd             " display whether in insert mode
set showmatch           " highlight matching parenthesis

" Indentation
set tabstop=4           " # of spaces for <TAB> character
set softtabstop=4       " # of spaces for <TAB> when editing
set expandtab           " tabs are spaces
set smartindent         " indents when necessary
filetype indent on      " indents based on file type

" foldfoldfold
set foldenable          " turn folding on
set foldmethod=indent   " fold based on indent
set foldlevelstart=10   " open folds < 10 lines by default
set foldnestmax=10      " max 10 nested folds
" space open/closes folds
nnoremap <space> za

" other cool stuff
set wildmenu            " visual autocomplete for command menu
set autoread            " auto update file if it's been changed outside of vim