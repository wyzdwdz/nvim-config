return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({

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
				"c_sharp",
			},

			sync_install = false,

			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true,
			},
		})
	end,
}
