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

" Use interactive shell when execuing shell commands
set shellcmdflag=-i\ -c

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
  tnoremap <C-\><C-\> <C-\><C-n>
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

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish silent! unmap <buffer> q
augroup END

" =============== LSP config ==============

" auto start coq (needs to be before require)
let g:coq_settings = { 'auto_start': v:true }

lua << EOF
local nvim_lsp = require('lspconfig')

local coq = require("coq")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'solargraph', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup(
    coq.lsp_ensure_capabilities(
      {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
      }
    )
  )
end
EOF

" ==== coq

let g:coq_settings = { 'display.icons.mode': 'none' }

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

let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" test.vim
let test#strategy = "neovim"
let test#neovim#term_position = "25"
let test#ruby#rails#executable = 'test_launcher'
" TODO: this is broken rn bc some pakage.jsons include the dir
let test#javascript#mocha#executable = 'npm run test --'
nmap <Leader>t :TestNearest<cr>
nmap <Leader>T :TestFile<cr>
nmap <Leader>r :TestLast<cr>
