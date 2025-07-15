return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"tiwari-krishna/retroWire-nvim",
		config = function()
			require("retroWire")
		end,
	},
}
