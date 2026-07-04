local parsers = { "javascript", "typescript", "c", "lua", "c_sharp" }

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()
		require("nvim-treesitter").install(parsers)

		vim.api.nvim_create_autocmd("FileType", {
			-- vim filetypes; note c_sharp's filetype is "cs", not "c_sharp"
			pattern = { "help", "javascript", "typescript", "c", "lua", "cs" },
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
