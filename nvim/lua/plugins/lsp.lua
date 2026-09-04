return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            { "williamboman/mason-lspconfig.nvim", opts = {
                ensure_installed = {
                    "clangd",
                    "rust_analyzer",
                    "pyright",
                    "gopls",
                    "jsonls",
                    "texlab",
                    "marksman"
                }
            }},
        },
        config = function()
            vim.lsp.enable({ 
                "clangd",
                "rust_analyzer",
                "pyright",
                "gopls",
                "jsonls",
                "texlab",
                "marksman"
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local opts = { buffer = args.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                end
            })
        end,
    }
}
