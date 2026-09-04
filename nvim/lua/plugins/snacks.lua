return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            picker = { 
                enabled = true,
                win = {
                    input = {
                        keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } }
                    }
                }
            },
        },
        keys = {
            { "<C-n>", function() Snacks.picker.files() end },
            { "<C-f>", function() Snacks.picker.grep() end },
            
            { "gd", function() Snacks.picker.lsp_definitions() end },
            { "gr", function() Snacks.picker.lsp_references() end },
            { "gi", function() Snacks.picker.lsp_implementations() end },
            { "gy", function() Snacks.picker.lsp_type_definitions() end },
            { "<leader>rn", function() vim.lsp.buf.rename() end },
        }
    }
}
