" Darren's vimrc

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

" # of spaces for <TAB> character
set tabstop=2
" # of spaces for <TAB> when editing
set softtabstop=2
" tabs are spaces
set expandtab
" # of spaces when indenting with >
set shiftwidth=2
" prefer using shiftwidth for tabs
set smarttab
" copy indentation from previous line
set autoindent

" show whitespace characters
set list

" Automatically set tabs for different files
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

" Enable filetype + plugin detection
filetype plugin indent on

" visual autocomplete for command menu
set wildmenu

" auto update file if it's been changed outside of vim
set autoread

" auto write contents of file on some editor operations
set autowriteall

" enable using the mouse for stuff
set mouse=a

" use backspace normally in insert mode
set backspace=indent,eol,start

" open new split panes to the bottom and right. feels way more natural
set splitbelow
set splitright

" how often vim writes the swap file in ms. also controls vim-gitgutter
set updatetime=500

" Leader
let mapleader = " "

" Remap Y to yank from the cursor to the end of line instead
nnoremap Y y$

" use `ALT+{h,j,k,l}` to navigate windows from any mode
tnoremap <M-h> <C-\><C-N><C-w>h
tnoremap <M-j> <C-\><C-N><C-w>j
tnoremap <M-k> <C-\><C-N><C-w>k
tnoremap <M-l> <C-\><C-N><C-w>l
inoremap <M-h> <C-\><C-N><C-w>h
inoremap <M-j> <C-\><C-N><C-w>j
inoremap <M-k> <C-\><C-N><C-w>k
inoremap <M-l> <C-\><C-N><C-w>l
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

if has('nvim')
  " Enter insert mode when entering a terimal
  autocmd BufWinEnter,WinEnter term://* startinsert
  " Go back to normal mode when leaving a terminal window
  autocmd BufLeave term://* stopinsert
endif

" Enable fzf.vim plugin. Only works when fzf is installed via homebrew
set rtp+=/usr/local/opt/fzf

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <C-p> :Files<cr>
" Fuzzy find buffers (FZF)
nnoremap <Leader>b :Buffers<cr>
" Kinda like tselect but uses FZF instead of more-prompt
nnoremap <Leader>] :execute "Tags" expand('<cword>')<cr>

" ignore case when searching unless search includes uppercase characters
set ignorecase
set smartcase
" highlight all matching phrases
set hlsearch
" show partial matches for a search phrase
set incsearch

" Use Ctrl + N to clear the highlighting of :set hlsearch
nnoremap <C-N> :nohlsearch<cr>

" Use keybindings to for global search - depends on vim-agriculture
nmap <Leader>/ <Plug>RgRawSearch
vmap <Leader>* <Plug>RgRawVisualSelection
nmap <Leader>* <Plug>RgRawWordUnderCursor

" replace netrw with dirvish
nnoremap <Leader>e :Dirvish %<cr>
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

" =============== yay COLORS ==============

" something something make colors work
if (has("termguicolors"))
  set termguicolors
endif

" Themes below

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext

" Range 233 (darkest) - 237 (lightest), Default 237
let g:seoul256_background = 235
" colorscheme seoul256

packadd! dracula
colorscheme dracula

" test.vim
let test#strategy = "neovim"
let test#ruby#rails#executable = 'test_launcher'
nmap <Leader>t :TestNearest<cr>
nmap <Leader>r :TestLast<cr>


" =============== OCaml =============== 

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line

" ## added by OPAM user-setup for vim / ocp-indent ## 3a2a706855c802dd7c01191a8f5a54c2 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/darren/.opam/system/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
