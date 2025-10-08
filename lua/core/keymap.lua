vim.g.mapleader = ","
vim.g.maplocalleader = ""

vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
