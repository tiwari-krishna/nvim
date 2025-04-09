return {
	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		},
		config = function()
			-- LSP Keybinds
			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, silent = true }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				-- vim.keymap.set("v", "<leader>ca", vim.lsp.buf.range_code_action, opts)
			end

			-- Setup LSP servers via mason-lspconfig
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "ts_ls", "pyright", "rust_analyzer" }, -- Add your LSPs here
			})

			-- Configure individual LSPs
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			lspconfig.clangd.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.ts_ls.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
		end,
	},

	-- Snippets Engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets", -- Pre-made snippets
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- Buffer completions
			"hrsh7th/cmp-path", -- Path completions
			"saadparwaiz1/cmp_luasnip", -- Snippet completions
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim-lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	-- Mason (LSP/DAP/Linter installer)
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
}
