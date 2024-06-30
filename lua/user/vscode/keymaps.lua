local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ctrl+y to copy to system clipboard
-- keymap("v", "<C-y>", '"+y', opts)

-- ctrl+shift+y to copy the whole file to system clipboard
-- keymap("n", "<C-S-y>", 'gg"+yG', opts)
