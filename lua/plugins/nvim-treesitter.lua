return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"lua",
			"toml",
			"rust",
			"toml",
			"nix",
			"javascript",
			"typescript",
			"tsx",
			"css",
			"html",
			"markdown",
			"markdown_inline",
			"c",
			"cpp",
			"cmake",
			"go",
		},
		highlight = { enable = true },
	},
	branch = "master",
	-- config = function()
	-- 	local nvim_treesitter = require("nvim-treesitter")
	-- 	nvim_treesitter.setup()
	--
	-- 	local ensure_installed = { "lua", "toml" }
	-- 	local pattern = {}
	--
	-- 	for _, parser in pairs(ensure_installed) do
	-- 		local has_parser, _ = pcall(vim.treesitter.language.inspect, parser)
	--
	-- 		if not has_parser then
	-- 			nvim_treesitter.install(parser)
	-- 		else
	-- 			pattern = vim.tbl_extend("keep", pattern, vim.treesitter.language.get_filetypes(parser))
	-- 		end
	-- 	end
	--
	-- 	vim.api.nvim_create_autocmd("FileType", {
	-- 		pattern = pattern,
	-- 		callback = function()
	-- 			vim.treesitter.start()
	-- 		end,
	-- 	})
	--
	-- 	vim.api.nvim_exec_autocmds("FileType", {})
	-- end,
}
