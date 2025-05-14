return {
	{
		"L3MON4D3/LuaSnip", -- Snippet engine
		version = "v2.*",
		dependencies = {
			"rafamadriz/friendly-snippets", -- Snippet source
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = {
				preset = "enter",
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
			},
			signature = { enabled = true }, --Function TypeParameter

			appearance = {
				highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
				kind_icons = {
					Text = "Txt",
					Method = "Method",
					Function = "Func",
					Constructor = "Constructor",
					Field = "Field",
					Variable = "Variable",
					Property = "Property",
					Class = "Class",
					Interface = "Interface",
					Struct = "Struct",
					Module = "Module",
					Unit = "Unit",
					Value = "Value",
					Enum = "Enum",
					EnumMember = "EnumMember",
					Keyword = "Keyword",
					Constant = "Const",
					Snippet = "Snip",
					Color = "Color",
					File = "File",
					Reference = "Reference",
					Folder = "Folder",
					Event = "Event",
					Operator = "Operator",
					TypeParameter = "TypeParameter",
				},
			},
			snippets = { preset = "luasnip" },
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 50 },
				ghost_text = { enabled = true },
			},
			sources = {
				default = { "lsp", "path", "buffer", "snippets" },
			},
			fuzzy = { implementation = "prefer_rust" },
		},
		opts_extend = { "sources.default" },
	},
}
