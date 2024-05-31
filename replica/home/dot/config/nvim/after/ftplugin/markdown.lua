local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr, }

-- en/em dashes
vim.keymap.set('i', '--<space>', '–<space>', opts)
vim.keymap.set('i', '---<space>', '—<space>', opts)

-- text width
vim.opt_local.textwidth = 80

vim.opt_local.syntax = 'markdown'

