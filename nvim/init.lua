-- globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opt = vim.opt
local map = vim.keymap.set

-- core
opt.shell = "/bin/zsh"
opt.ttimeout = true
opt.ttimeoutlen = 100
opt.updatetime = 300

-- appearance
opt.number = true
opt.relativenumber = true
opt.showmode = false
opt.signcolumn = "yes"
opt.cursorline = true

-- editing
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.wrap = true
opt.linebreak = true
opt.formatoptions:remove({ "c", "r", "o" })

-- search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- terminal
map("n", "<leader>t", ":terminal<CR>")
map("t", "<Esc>", "<C-\\><C-n>")
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- windows
map("n", "<leader>v", ":vsplit<CR>")
map("n", "<leader>s", ":split<CR>")
map("n", "<leader>r", "<C-w>r")
map("n", "<leader>R", "<C-w>R")

map("n", "<leader>c", 
    function()
        if vim.bo.buftype == "terminal" then
            vim.cmd("bwipeout!")
        else
            local ok, _ = pcall(vim.cmd, "close")
            if not ok then
                vim.api.nvim_echo({{"can't close last window", "WarningMsg"}}, false, {})
            end
        end
    end
)

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- resizing
map("n", "<leader>-", ":resize -3<CR>")
map("n", "<leader>=", ":resize +3<CR>")
map("n", "<leader>,", ":call VerticalResize(-5)<CR>")
map("n", "<leader>.", ":call VerticalResize(+5)<CR>")

vim.cmd([[
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
]]) -- adapted from https://github.com/chaoren/vim-resizewindow

-- tabs
map("n", "<leader>z", ":tab sp<CR>")
map("n", "<leader>j", ":tabprevious<CR>")
map("n", "<leader>k", ":tabnext<CR>")
map("n", "<leader>n", ":tabnew<CR>")
map("n", "<leader>1", "1gt")
map("n", "<leader>2", "2gt")
map("n", "<leader>3", "3gt")
map("n", "<leader>4", "4gt")
map("n", "<leader>5", "5gt")

-- helpers
map("n", "<C-s>", ":update<CR>")
map("n", "<leader>Q", ":qa!<CR>")
map("n", "<leader>/", ":noh<CR>")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "Q", "@@")
map("n", "mmj", ":m +1<CR>")
map("n", "mmk", ":m -2<CR>")

-- misc
opt.clipboard = "unnamedplus"
opt.mouse = ""
opt.splitright = true
opt.splitbelow = true

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
