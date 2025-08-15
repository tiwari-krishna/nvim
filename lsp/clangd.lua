local blink = require("blink.cmp")

return {
	cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed", "--header-insertion=never" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"Makefile",
		".git",
	},
	settings = {},
	capabilities = vim.tbl_deep_extend(
		"force",
		{},
		vim.lsp.protocol.make_client_capabilities(),
		blink.get_lsp_capabilities(),
		{
			workspace = {
				fileOperations = {
					didRename = true,
					willRename = true,
				},
			},
		}
	),
}
