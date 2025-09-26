return {
	"mason-org/mason.nvim",
	event = "VeryLazy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
	},
	opts = {},
	config = function(_, opts)
		require("mason").setup(opts)
		local registry = require("mason-registry")

		local function setup(name, enable_formatter, config)
			local success, package = pcall(registry.get_package, name)
			if success and not package:is_installed() then
				package:install()
			end

			local nvim_lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]

			config.capabilities = require("blink.cmp").get_lsp_capabilities()

			if not enable_formatter then
				config.on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end
			end

			vim.lsp.config(nvim_lsp, config)
			vim.cmd.LspStart(nvim_lsp)
		end

		local servers = {
			{
				"lua-language-server",
				false,
				{
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
			},
			{ "pyright", false, {} },
			{ "html-lsp", false, {} },
			{
				"css-lsp",
				false,
				{
					settings = {
						css = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
						scss = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
						less = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
					},
				},
			},
			{ "typescript-language-server", false, {} },
			{ "emmet-ls", false, {} },
			{ "taplo", true, {} },
			{ "marksman", false, {} },
			{ "clangd", false, {} },
		}

		if vim.loop.os_uname().sysname == "Linux" or vim.loop.os_uname().sysname == "Darwin" then
			table.insert(servers, { "nil", false, {} })
		end

		for _, server_config in ipairs(servers) do
			local server = server_config[1]
			local enable_formatter = server_config[2]
			local config = server_config[3]

			setup(server, enable_formatter, config)
		end

		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = true,
		})

		vim.api.nvim_exec_autocmds("User", { pattern = "MasonLoaded" })
	end,
}
