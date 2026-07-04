return {
	"tpope/vim-fugitive",
	cmd = { "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Gclog", "Gblame" },
	keys = {
		{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
		{ "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff" },
		{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
	},
}
