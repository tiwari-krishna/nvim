vim.lsp.enable({
	"lua-ls",
	"gopls",
	"clangd",
	"ts_ls",
	"pyright",
	"rust_analyzer",
})

local function on_attach(client, bufnr)
	local opts = { buffer = bufnr, silent = true }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gr", require("fzf-lua").lsp_references, opts)
	vim.keymap.set("n", "gI", require("fzf-lua").lsp_implementations, opts)
	vim.keymap.set("n", "<leader>D", require("fzf-lua").lsp_typedefs, opts)
	vim.keymap.set("n", "<leader>ds", require("fzf-lua").lsp_document_symbols, opts)
	vim.keymap.set("n", "<leader>ws", require("fzf-lua").lsp_live_workspace_symbols, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufnr = args.buf
		on_attach(client, bufnr)
	end,
})

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 4,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
	float = {
		border = "rounded",
		format = function(d)
			return ("%s (%s) [%s]"):format(d.message, d.source, d.code or d.user_data.lsp.code)
		end,
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Path of Mason LSPs
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
local current_path = vim.env.PATH or ""

local path_entries = vim.split(current_path, ":")
local clean_path_entries = {}
local seen = {}

for _, entry in ipairs(path_entries) do
	if entry ~= mason_bin and entry ~= "" and not seen[entry] then
		seen[entry] = true
		table.insert(clean_path_entries, entry)
	end
end

local new_path = mason_bin .. ":" .. table.concat(clean_path_entries, ":")
vim.env.PATH = new_path

if vim.fn.isdirectory(mason_bin) == 0 then
	vim.fn.mkdir(mason_bin, "p")
end
