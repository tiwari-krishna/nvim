return {
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle)
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			vim.keymap.set("n", "<leader>co", "<CMD>ColorizerToggle<CR>")
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			"ibhagwan/fzf-lua",
		},
		keys = {
			{ "<leader>mp", "<cmd>LivePreview start<CR>", desc = "Live Preview Pick" },
			{ "<leader>lp", "<cmd>LivePreview close<CR>", desc = "Live Preview" },
		},
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		opts = {
			silent = true,
			search_method = "cover_or_nearest",
		},
	},
	{
		"echasnovski/mini.jump",
		version = "*",
		opts = {
			silent = true,
			delay = {
				highlight = 50,
				idle_stop = 100,
			},
		},
	},
	{
		"echasnovski/mini.comment",
		version = "*",
		opts = {},
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		opts = {},
	},
	{
		"echasnovski/mini.ai",
		version = "*",
		opts = {},
	},
	-- {
	-- 	"echasnovski/mini.statusline",
	-- 	version = "*",
	-- 	opts = {},
	-- },
}
