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

	-- Linters
	-- "luacheck",
	-- -- "cpplint",
	-- "eslint_d",
	-- "pylint",
}

require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = things,
	auto_update = false,
	run_on_start = false,
})
