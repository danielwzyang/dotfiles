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
nnoremap <leader>c :close<CR>
nnoremap <leader>z :tab sp<CR>
nnoremap <leader>t :terminal ++curwin<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <expr> <C-h> &filetype == 'fzf' ? "\<C-h>" : "\<C-w>h"
tnoremap <expr> <C-j> &filetype == 'fzf' ? "\<C-j>" : "\<C-w>j"
tnoremap <expr> <C-k> &filetype == 'fzf' ? "\<C-k>" : "\<C-w>k"
tnoremap <expr> <C-l> &filetype == 'fzf' ? "\<C-l>" : "\<C-w>l"
tnoremap <expr> <Esc> &filetype == 'fzf' ? "\<Esc>" : "\<C-w>N"
tnoremap <C-w> <C-w>.

" resize windows
nnoremap <leader>- :resize -3<CR>
nnoremap <leader>= :resize +3<CR>
nnoremap <leader>, :call VerticalResize(-5)<CR>
nnoremap <leader>. :call VerticalResize(+5)<CR>

" adapted from https://github.com/chaoren/vim-resizewindow
function! VerticalResize(amount)
    if winnr('$') == 1 | return | endif
    let l:origin = winnr()
    let [l:ww, l:wh] = [&winwidth, &winheight]
    set winwidth=1 winheight=1
    execute 'wincmd l'
    let l:at_right = winnr() == l:origin
    execute l:origin . 'wincmd w'
    let [&winwidth, &winheight] = [l:ww, l:wh]
    execute 'vertical resize ' . printf('%+d', l:at_right ? -a:amount : a:amount)
endfunction

" file operations
nnoremap <C-s> :update<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>Q :qa!<CR>

" fzf
nnoremap <C-n> :Files<CR>
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

