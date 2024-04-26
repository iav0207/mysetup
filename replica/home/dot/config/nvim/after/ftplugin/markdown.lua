local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr, }

-- en/em dashes
vim.keymap.set('i', '--<space>', '–<space>', opts)
vim.keymap.set('i', '---<space>', '—<space>', opts)

