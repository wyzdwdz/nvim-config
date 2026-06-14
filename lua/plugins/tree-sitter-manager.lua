return {
	"romus204/tree-sitter-manager.nvim",
	dependencies = {},
	config = function()
		require("tree-sitter-manager").setup({
			auto_install = true,
			noauto_install = {
				"c",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},
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
