return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        -- Options: https://github.com/folke/which-key.nvim?tab=readme-ov-file#-setup
        -- Custom mappings: https://github.com/folke/which-key.nvim?tab=readme-ov-file#-setup
    },
    config = function()
        local wk = require("which-key")
        wk.register({
            ["<C-a>"] = "Reset search",
            ["<C-p>"] = "Find files",
            ["[d"] = "Go to prev diagnostic",
            ["]d"] = "Go to next diagnostic",
            gw = "Format the text included in the next motion (gq in Vim)",
        })
        wk.register({
            ["<leader>o"] = "Obsidian",
            ["<leader>c"] = "Code",
            ["<leader>m"] = "Make",
            ["<leader>s"] = "Search",
        })
        wk.register({
            rn = "Rename identifier",
            fg = "File grep",
            cp = "Copy file path to clipboard",
            dv = {
                name = "Diffview",
                o = "Open",
                c = "Close",
                h = "File history",
            },
            ac = "Toggle autocomplete",
            m = {
                name = "Make",
                b = "Build",
                d = {
                    name = "Debug",
                    e = "on example.txt (AoC)",
                    i = "on input.txt (AoC)",
                },
                r = {
                    name = "Run",
                    e = "on example.txt (AoC)",
                    i = "on input.txt (AoC)",
                },
            },
            e = "Open diagnostic float",
            i = "Open diagnostic float",
            qe = "List all diagnostics",
            och = "[Obsidian] Toggle check boxes",
        }, {
            prefix = "<leader>",
            mode = "n",
        })
    end,
}
