" core
set nocompatible
filetype plugin indent on
syntax on
set shell=/bin/zsh

" performance
set ttyfast
set ttimeout
set ttimeoutlen=100

" plugins
call plug#begin()
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'dense-analysis/ale'
    Plug 'rust-lang/rust.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'itchyny/lightline.vim'
    Plug 'morhetz/gruvbox'
call plug#end()

" appearance
set background=dark
colorscheme gruvbox
set number
set relativenumber
set noshowmode
set cursorline
set signcolumn=yes

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \     'left': [
    \         [ 'mode', 'paste' ],
    \         [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \     ]
    \ },
    \ 'component_function': {
    \     'gitbranch': 'FugitiveHead'
    \ },
    \ }

" editing
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set wrap
set linebreak
set formatoptions-=cro

" search
set hlsearch
set ignorecase
set smartcase

" code completion
set completeopt=menuone,noinsert,noselect
set omnifunc=ale#completion#OmniFunc

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" ale stuff
let g:ale_completion_enabled = 1
let g:ale_completion_delay = 100
let g:ale_completion_autoimport = 1

let g:ale_linters = {
    \ 'c': ['clangd'],
    \ 'rust': ['rust-analyzer'],
    \ }

let g:ale_c_clang_options = '-std=c11 -Wall -Wextra -Wpedantic -O0 -g'

nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)

" random behavior stuff
set clipboard=unnamedplus
set mouse=
set hidden
set splitright
set splitbelow

" window management
let mapleader = " "

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>q :close<CR>
nnoremap <leader>z :tab sp<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l

nnoremap <leader>< :vertical resize -5<CR>
nnoremap <leader>> :vertical resize +5<CR>
nnoremap <leader>- :resize -3<CR>
nnoremap <leader>+ :resize +3<CR>

nnoremap <leader>t :terminal ++curwin<CR>

" file operations
nnoremap <C-s> :update<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>Q :qa!<CR>

" fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>

" utils
nnoremap <leader>/ :nohlsearch<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap Q @@

" language specific stuff
autocmd BufRead,BufNewFile *.asm set filetype=nasm
let g:nasm_is64bit = 1
let g:ale_asm_nasm_options = '-f elf64'
let g:java_ignore_javadoc = 1

