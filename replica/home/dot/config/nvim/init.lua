vim.cmd("source ~/.vimrc")

-- Lazy setup

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Color scheme

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Telescope

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Treesitter

require("nvim-treesitter.configs").setup({
    ensure_installed = {"lua", "kotlin", "javascript", "haskell", "vim"},
    highlight = { enable = true },
    indent = { enable = true },
})

-- NeoTree

vim.keymap.set('n', '<C-n>', ':Neotree<CR>')


