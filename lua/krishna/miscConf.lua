-- Oil Configuration
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Mini Stuff
require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.comment").setup()
require("mini.jump").setup({
	silent = true,
	delay = {
		highlight = 50,
		idle_stop = 100,
	},
})
require("mini.surround").setup({
	silent = true,
	search_method = "cover_or_nearest",
})

-- Live Preview
vim.keymap.set("n", "<leader>lp", "<CMD>LivePreview start<CR>", { desc = "Live Preview Start" })
vim.keymap.set("n", "<leader>ls", "<CMD>LivePreview close<CR>", { desc = "Live Preview Close" })

--Undotree
vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle)
