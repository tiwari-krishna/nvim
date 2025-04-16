return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				--Formatters
				"stylua",
				"prettier",
				"clang-format",
				"black",
				-- linters
				"luacheck",
				"eslint_d",
				"pylint",
				"cpplint",
			},
			auto_update = true,
			run_on_start = true,
			start_delay = 3000,
		},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 1000,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				markdown = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				python = { "black" },
				json = { "prettier" },
				yaml = { "prettier" },
			},
		},
		keys = {
			{
				"<leader>gf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				desc = "Format file",
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				lua = { "luacheck" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				python = { "pylint" },
				c = { "cpplint" },
				cpp = { "cpplint" },
			}

			lint.linters.luacheck.args = {
				"--globals",
				"vim",
			}

			-- Run linter on save
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
