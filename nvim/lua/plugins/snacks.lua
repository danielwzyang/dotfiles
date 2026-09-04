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
        }
    }
}
