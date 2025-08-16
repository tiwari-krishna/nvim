require("blink.cmp").setup({
	keymap = {
		preset = "default",
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
	-- snippets = { preset = "luasnip" },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 50 },
		ghost_text = { enabled = true },
	},
	sources = {
		default = { "lsp", "path", "buffer", "snippets" },
	},
	fuzzy = { implementation = "prefer_rust" },
})
