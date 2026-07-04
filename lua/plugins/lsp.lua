vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig", "mason-org/mason.nvim" },
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "clangd" },
		},
	},
}
