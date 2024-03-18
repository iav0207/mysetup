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
        })
        wk.register({
            rn = "Rename identifier",
            fg = "File grep",
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
            q = "List all diagnostics",
            och = "[Obsidian] Toggle check boxes",
        }, {
            prefix = "<leader>",
            mode = "n",
        })
    end,
}
