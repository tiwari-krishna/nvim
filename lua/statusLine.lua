vim.o.laststatus = 2

local function mode_name()
	local modes = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		c = "COMMAND",
		[""] = "V-BLOCK",
		R = "REPLACE",
		s = "SELECT",
	}
	return modes[vim.api.nvim_get_mode().mode] or "TERMINAL"
end

local function lsp_status()
	local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
	return #clients > 0 and "L++" or "L--"
end

local function max_col()
	local line = vim.api.nvim_get_current_line()
	return #line + 1
end

vim.o.statusline = table.concat({
	"%#StatusLineMode#",
	"  %{v:lua.ModeName()}",
	" %#StatusLineLSP#",
	" | %{v:lua.LSPStatus()}",
	" %#StatusLinePath#",
	" | %f",
	"%=",
	"%#StatusLinePos#",
	"%m | ",
	"%y | ",
	"Ln:%l/%L",
	" | Col:%c/%{v:lua.MaxColInLine()}",
	"| %p%%",
	"  ",
})

_G.ModeName = mode_name
_G.LSPStatus = lsp_status
_G.MaxColInLine = max_col

vim.api.nvim_set_hl(0, "StatusLineMode", { fg = "#0a0a0a", bg = "#0ac4d1", bold = true })
vim.api.nvim_set_hl(0, "StatusLineLSP", { fg = "#00ff5f", bg = "#262626" })
vim.api.nvim_set_hl(0, "StatusLinePath", { fg = "#ffaf00", bg = "#262626" })
vim.api.nvim_set_hl(0, "StatusLinePos", { fg = "#87d7ff", bg = "#262626" })
