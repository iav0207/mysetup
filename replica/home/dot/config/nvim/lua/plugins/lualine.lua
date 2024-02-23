return {
    'nvim-lualine/lualine.nvim',
    requires = {'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        require('lualine').setup({
            -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
            options = { theme = 'gruvbox_dark' }
        })
    end
}
