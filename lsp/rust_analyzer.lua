local blink = require("blink.cmp")

return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = {
		"Cargo.toml",
		"rust-project.json",
		".git",
	},
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
				loadOutDirsFromCheck = true,
				runBuildScripts = true,
			},
			checkOnSave = {
				command = "clippy",
			},
			diagnostics = {
				enable = true,
				disabled = { "unresolved-proc-macro" }, -- common false positive
				experimental = {
					enable = true,
				},
			},
			inlayHints = {
				bindingModeHints = { enable = true },
				chainingHints = { enable = true },
				closingBraceHints = {
					enable = true,
					minLines = 25,
				},
				closureReturnTypeHints = { enable = "always" },
				lifetimeElisionHints = {
					enable = "always",
					useParameterNames = true,
				},
				reborrowHints = { enable = "always" },
				typeHints = { enable = true },
			},
		},
	},
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
