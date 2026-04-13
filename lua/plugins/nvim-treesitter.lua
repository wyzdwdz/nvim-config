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
		})
	end,
}
