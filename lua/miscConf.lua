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

-- Lsp Installation with Mason
local things = {
	-- LSP Servers
	"lua-language-server",
	"gopls",
	"clangd",
	"typescript-language-server",
	"pyright",
	"rust-analyzer",
	-- Formatters
	"stylua",
	"prettier",
	"black",
}

require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = things,
	auto_update = false,
	run_on_start = false,
})

-- Fzf Lua Configuration
require("fzf-lua").setup({
	winopts = {
		height = 0.85,
		width = 0.85,
		preview = {
			layout = "flex",
			scrollbar = "float",
		},
	},
	fzf_opts = {
		["--layout"] = "reverse",
	},
})

local function findRepo()
	require("fzf-lua").files({ cwd = vim.fn.expand("~/repo/") })
end

local function editNvim()
	require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
end

vim.keymap.set("n", "<M-f>", "<CMD>FzfLua files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fp", findRepo, { desc = "Find Repo Files" })
vim.keymap.set("n", "<leader>fe", editNvim, { desc = "Find Neovim config Files" })
vim.keymap.set("n", "<M-g>", "<CMD>FzfLua live_grep<CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<M-b>", "<CMD>FzfLua buffers<CR>", { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", "<CMD>FzfLua help_tags<CR>", { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fa", "<CMD>FzfLua builtin<CR>", { desc = "Find Builtin Stuff" })
vim.keymap.set("n", "<leader>fk", "<CMD>FzfLua keymaps<CR>", { desc = "Find keymaps" })
