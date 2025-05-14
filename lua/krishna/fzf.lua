return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	cmd = "FzfLua",
	keys = {
		{ "<M-f>", "<cmd>FzfLua files<CR>", desc = "Find Files" },
		{
			"<leader>fp",
			function()
				require("fzf-lua").files({ cwd = vim.fn.expand("~/repo/") })
			end,
			desc = "Find Repo/Project Files",
		},
		{
			"<leader>fe",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find NeoVim Config Files",
		},

		{ "<M-g>", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
		{ "<M-b>", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
		{ "<leader>fh", "<cmd>FzfLua help_tags<CR>", desc = "Help Tags" },
		{ "<leader>fa", "<cmd>FzfLua builtin<CR>", desc = "Help Tags" },
		{ "<leader>fk", "<cmd>FzfLua keymaps<CR>", desc = "Help Tags" },
	},
	config = function()
		require("fzf-lua").setup({
			-- your custom setup here
			winopts = {
				height = 0.85,
				width = 0.85,
				preview = {
					layout = "flex", -- "vertical" | "horizontal" | "flex"
					scrollbar = "float",
				},
			},
			fzf_opts = {
				["--layout"] = "reverse",
			},
		})
		-- Change directory to projects
		-- local fzf = require("fzf-lua")
		--
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>cp",
		-- 	function()
		-- 		local repo_path = vim.fn.expand("~/repo")
		-- 		local handle = io.popen("find " .. repo_path .. " -mindepth 1 -maxdepth 1 -type d")
		-- 		if not handle then
		-- 			return
		-- 		end
		--
		-- 		local result = {}
		-- 		for line in handle:lines() do
		-- 			table.insert(result, line)
		-- 		end
		-- 		handle:close()
		--
		-- 		fzf.fzf_exec(result, {
		-- 			prompt = "Repo dirs> ",
		-- 			actions = {
		-- 				["default"] = function(selected)
		-- 					local dir = selected[1]
		-- 					vim.cmd("cd " .. vim.fn.fnameescape(dir))
		-- 					print("Changed directory to: " .. dir)
		-- 				end,
		-- 			},
		-- 		})
		-- 	end,
		-- 	-- goToProjDir(),
		-- 	{ desc = "FZF cd into ~/repo dir" }
		-- )
	end,
}
