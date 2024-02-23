return {
    { "tpope/vim-fugitive" },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})
        end,
    },
    {
        "sindrets/diffview.nvim",
        config = function()
            vim.keymap.set("n", "<leader>dvo", ":DiffviewOpen<CR>", {})
            vim.keymap.set("n", "<leader>dvc", ":DiffviewClose<CR>", {})
            vim.keymap.set("n", "<leader>dvh", ":DiffviewFileHistory %<CR>", {})
        end,
    },
}
