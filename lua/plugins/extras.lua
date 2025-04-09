return {

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle)
		end,
	},
	{ "numToStr/Comment.nvim" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			vim.keymap.set("n", "<leader>co", "<CMD>ColorizerToggle<CR>")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}
