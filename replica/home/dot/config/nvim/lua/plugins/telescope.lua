return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            local act = require("telescope.actions")
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<Esc>"] = act.close,

                            ["<C-j>"] = act.move_selection_next,
                            ["<C-k>"] = act.move_selection_previous,
                            ["<C-y>"] = act.preview_scrolling_up,
                            ["<C-e>"] = act.preview_scrolling_down,

                            ["<C-n>"] = act.select_horizontal,
                            ["<C-l>"] = act.select_vertical,
                            ["<C-t>"] = act.select_tab,
                        },
                    },
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
