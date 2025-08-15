local blink = require("blink.cmp")

return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
		hint = {
			enable = true,
			setType = false,
			paramType = true,
			paramName = "Disable",
			semicolon = "Disable",
			arrayIndex = "Disable",
		},
		capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			blink.get_lsp_capabilities(),
			{
				fileOperations = {
					didRename = true,
					willRename = true,
				},
			}
		),
	},
}
