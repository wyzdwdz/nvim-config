vim.g.mapleader = " "
vim.g.maplocalleader = ","

function OpenTerminalBelow()
	vim.cmd("belowright split")
	vim.cmd("terminal")
	-- 获取当前窗口高度并计算三分之一
	local height = math.floor(vim.o.lines / 3)
	vim.cmd("resize " .. height)
end

vim.api.nvim_set_keymap("n", "<leader>ut", "<cmd>lua OpenTerminalBelow()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
