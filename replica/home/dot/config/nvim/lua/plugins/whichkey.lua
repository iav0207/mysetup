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
            ["<C-l>"] = "Reset search",
            ["<C-p>"] = "Find files",
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
        }, {
            prefix = "<leader>",
            mode = "n",
        })
    end,
}
