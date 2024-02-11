return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            ensure_installed = {
                "bash",
                "haskell",
                "javascript",
                "kotlin",
                "lua",
                "python",
                "vim",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
