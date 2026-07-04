return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	lazy = false,
	opts = {
		variant = "auto", -- auto, main, moon, or dawn
		styles = {
			transparency = true,
		},
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd.colorscheme("rose-pine")
	end,
}
