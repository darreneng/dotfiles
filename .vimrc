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
" 7 Ocaml ================================================================= {{{

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

" ========================================================================= }}}
