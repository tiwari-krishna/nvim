require("keymap")
require("settings")
require("theme").setup()
require("statusLine")
require("lspConfig")
require("buffSwitch").setup()

vim.pack.add({
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/brianhuster/live-preview.nvim" },
	{ src = "https://github.com/echasnovski/mini.surround" },
	{ src = "https://github.com/echasnovski/mini.jump" },
	{ src = "https://github.com/echasnovski/mini.comment" },
	{ src = "https://github.com/echasnovski/mini.ai" },
	{ src = "https://github.com/echasnovski/mini.pairs" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
	{ src = "https://github.com/stevearc/conform.nvim" },
	-- { src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

-- Plugin Related Configs
require("miscConf")
require("treesitter")
require("compl")
