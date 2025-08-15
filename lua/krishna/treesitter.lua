require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"javascript",
		"go",
		"rust",
		"python",
		"typescript",
		"cpp",
		"lua",
		"markdown",
		"markdown_inline",
	},
	sync_install = false,
	auto_install = true,
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<Enter>",
			node_incremental = "<Enter>",
			scope_incremental = "\\",
			node_decremental = "<Backspace>",
		},
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- auto-jump forward to textobj

			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})
