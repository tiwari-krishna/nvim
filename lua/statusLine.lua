vim.o.laststatus = 2

local function lsp_status()
	local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
	return #clients > 0 and "L++" or "L--"
end

local function max_col()
	local line = vim.api.nvim_get_current_line()
	return #line + 1
end

vim.o.statusline = table.concat({
	"%#StatusLinePath#",
	"  ",
	"%f",
	"%=",
	"%#StatusLinePos#",
	"%m | ",
	"%{v:lua.LSPStatus()}",
	" | %y | ",
	"Ln:%l/%L",
	" | Col:%c/%{v:lua.MaxColInLine()}",
	" | %p%%",
	"  ",
})

_G.LSPStatus = lsp_status
_G.MaxColInLine = max_col

vim.api.nvim_set_hl(0, "StatusLinePath", { fg = "#d7af00", bg = "#2a1b2e" })
vim.api.nvim_set_hl(0, "StatusLinePos", { fg = "#7abfff", bg = "#2a1b2e" })
