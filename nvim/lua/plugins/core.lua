return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function() vim.cmd("colorscheme gruvbox") end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { options = { theme = "gruvbox" } },
    },
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim", opts = {} },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            require("nvim-treesitter").setup()

            require("nvim-treesitter").install({
                "c", "cpp", "go", "rust", "python", "lua", "vim", "vimdoc", "bash"
            })
        end
    },
}
