return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.install({
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
			"c_sharp",
			"qmljs",
		})

		local ts_group = vim.api.nvim_create_augroup("GlobalTreesitter", { clear = true })

		vim.api.nvim_create_autocmd("FileType", {
			group = ts_group,
			callback = function(args)
				local ok = pcall(vim.treesitter.start, args.buf)

				if ok then
					vim.opt_local.foldmethod = "expr"
					vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.opt_local.foldenable = false
				end
			end,
		})
	end,
}
