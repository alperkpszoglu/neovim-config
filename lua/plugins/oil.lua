return {
	"stevearc/oil.nvim",
	lazy = false,
	priority = 1000,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
	},
	opts = {},
}
