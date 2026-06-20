vim.g.mapleader = ","
vim.g.maplocalleader = ""

vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })

vim.keymap.set("n", "j", function()
	if vim.fn.line(".") == vim.fn.line("$") then
		return "<C-e>"
	else
		return "j"
	end
end, { expr = true, replace_keycodes = true, desc = "Scroll view on 'j' at EOF" })
