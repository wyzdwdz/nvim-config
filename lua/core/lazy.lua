local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local os_name = vim.loop.os_uname().sysname

local spec = { import = "plugins" }

if os_name == "Windows" or os_name == "Windows_NT" then
	if vim.fn.isdirectory("../plugins/windows") == 1 then
		table.insert(spec, { import = "plugins/windows" })
	end
elseif os_name == "Darwin" then
	if vim.fn.isdirectory("../plugins/macos") == 1 then
		table.insert(spec, { import = "plugins/macos" })
	end
elseif os_name == "Linux" then
	if vim.fn.isdirectory("../plugins/linux") == 1 then
		table.insert(spec, { import = "plugins/linux" })
	end
end

require("lazy").setup({ spec })
