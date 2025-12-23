set nocompatible

set ttimeout
set ttimeoutlen=100

set scrolloff=5

if has('reltime')
  set incsearch
endif

set nrformats-=octal

map Q gq
sunmap Q

inoremap <C-U> <C-G>u<C-U>

if 1
  filetype plugin indent on

  augroup vimStartup
    autocmd!
    autocmd BufReadPost *
      \ let line = line("'\"")
      \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
      \      && index(['xxd', 'gitrebase', 'tutor'], &filetype) == -1
      \      && !&diff
      \ |   execute "normal! g`\""
      \ | endif
    autocmd TermResponse * if v:termresponse == "\e[>0;136;0c" | set bg=dark | endif
  augroup END
endif

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  set nolangremap
endif

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'

Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

Plug 'iamcco/markdown-preview.nvim',
      \ { 'do': { -> mkdp#util#install() },
      \   'for': ['markdown', 'vim-plug'] }

call plug#end()

set formatoptions-=c
set formatoptions-=r
set formatoptions-=o

set wrap
set ttyfast
set number
set rnu

set mouse=

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

set incsearch
set hlsearch
set ignorecase
set smartcase
set noshowmode

noremap <C-b> :vert term<CR>
noremap <C-s> :update<CR>
noremap <C-f> :Rg<CR>
noremap <C-n> :Files<CR>

let g:ale_linters = {
    \ 'c': ['clangd'],
    \ 'rust': ['analyzer'],
\ }

let g:ale_completion_enabled = 1
let g:ale_completion_delay = 100
let g:ale_completion_autoimport = 1

set omnifunc=ale#completion#OmniFunc
set completeopt=menuone,noinsert,noselect

" tab nav in completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" completion with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

set termguicolors
syntax on
set background=dark
colorscheme gruvbox

let g:lightline = {
      \ 'colorscheme': 'gruvbox'
      \ }

command MD MarkdownPreview
command MDS MarkdownPreviewStop
