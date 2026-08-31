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
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" random behavior stuff
set clipboard=unnamedplus
set mouse=
set hidden
set splitright
set splitbelow
set title

" window management
let mapleader = " "

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>c :close<CR>
nnoremap <leader>t :terminal ++curwin<CR>
nnoremap <leader>r <C-w>r
nnoremap <leader>R <C-w>R

nnoremap <leader>z :tab sp<CR>
nnoremap <leader>j :tabprevious<CR>
nnoremap <leader>k :tabnext<CR>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

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
command! S execute 'cd ' . resolve('/proc/'.job_info(term_getjob(bufnr('%')))['process'].'/cwd')
nnoremap mmj :m +1<CR>
nnoremap mmk :m -2<CR>

" coc settings taken from https://cocnvim.com/install
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-pyright', 'coc-rust-analyzer', 'coc-go', 'coc-clangd']

set nobackup
set nowritebackup
set updatetime=300

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
