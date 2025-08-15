local M = {}

M.colors = {
	bg = "#1e1e1e",
	fg = "#d0d7ff",
	cursor_bg = "#2a2f3e",
	cursor_fg = "#e0def4",

	black = "#15161E",
	red = "#f7768e",
	green = "#9ece6a",
	yellow = "#e0af68",
	blue = "#7aa2f7",
	magenta = "#bb9af7",
	cyan = "#7dcfff",
	white = "#a9b1d6",

	bright_black = "#565f7e",
	bright_red = "#ff869a",
	bright_green = "#b8eb7f",
	bright_yellow = "#ffd28a",
	bright_blue = "#8bb7ff",
	bright_magenta = "#d1b9ff",
	bright_cyan = "#9be7ff",
	bright_white = "#d1d9ff",
}

function M.setup()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "dark"
	vim.g.colors_name = "my_Colorscheme"

	local c = M.colors

	-- Basic UI
	vim.api.nvim_set_hl(0, "Normal", { fg = c.fg, bg = c.bg })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1d2e" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.bright_blue, bold = true })
	vim.api.nvim_set_hl(0, "Cursor", { fg = c.bg, bg = c.fg, reverse = true })
	vim.api.nvim_set_hl(0, "CursorIM", { fg = c.bg, bg = c.fg, reverse = true })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#414868" })

	-- Syntax groups
	vim.api.nvim_set_hl(0, "Comment", { fg = "#7a87b8", italic = false })
	vim.api.nvim_set_hl(0, "Constant", { fg = c.bright_cyan })
	vim.api.nvim_set_hl(0, "String", { fg = c.bright_green })
	vim.api.nvim_set_hl(0, "Character", { fg = c.bright_green })
	vim.api.nvim_set_hl(0, "Number", { fg = c.bright_yellow })
	vim.api.nvim_set_hl(0, "Boolean", { fg = c.bright_yellow })
	vim.api.nvim_set_hl(0, "Float", { fg = c.bright_yellow })

	vim.api.nvim_set_hl(0, "Identifier", { fg = c.bright_red })
	vim.api.nvim_set_hl(0, "Function", { fg = c.bright_blue })
	vim.api.nvim_set_hl(0, "Statement", { fg = c.bright_magenta, bold = true })
	vim.api.nvim_set_hl(0, "Conditional", { fg = c.bright_magenta, bold = true })
	vim.api.nvim_set_hl(0, "Repeat", { fg = c.bright_magenta, bold = true })

	vim.api.nvim_set_hl(0, "Operator", { fg = c.fg })
	vim.api.nvim_set_hl(0, "Keyword", { fg = c.bright_magenta })

	vim.api.nvim_set_hl(0, "PreProc", { fg = c.bright_yellow })
	vim.api.nvim_set_hl(0, "Type", { fg = c.bright_cyan })
	vim.api.nvim_set_hl(0, "StorageClass", { fg = c.bright_cyan })
	vim.api.nvim_set_hl(0, "Structure", { fg = c.bright_cyan })
	vim.api.nvim_set_hl(0, "Typedef", { fg = c.bright_cyan })

	vim.api.nvim_set_hl(0, "Special", { fg = c.bright_yellow })
	vim.api.nvim_set_hl(0, "Underlined", { fg = c.bright_blue, underline = true })
	vim.api.nvim_set_hl(0, "Ignore", { fg = "#555555" })
	vim.api.nvim_set_hl(0, "Error", { fg = "#ff0000", bg = c.bg, bold = true })
	vim.api.nvim_set_hl(0, "Todo", { fg = c.bright_magenta, bg = "#282c34", bold = true })

	vim.api.nvim_set_hl(0, "NormalFloat", { fg = c.fg, bg = c.bg })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = c.bright_blue })

	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1a423e" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1a1b26" })

	vim.api.nvim_set_hl(0, "Pmenu", { fg = c.fg, bg = "#202433" })
	vim.api.nvim_set_hl(0, "PmenuSel", { fg = c.bg, bg = "#d7af00" })
	vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#303849" })
	vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#566e99" })

	-- Editor UI
	vim.api.nvim_set_hl(0, "VertSplit", { fg = "#262a42" })
	vim.api.nvim_set_hl(0, "Visual", { bg = "#3b4261" })
	vim.api.nvim_set_hl(0, "Search", { bg = "#e0af68", fg = "#1a1b26", bold = true })
	vim.api.nvim_set_hl(0, "IncSearch", { bg = "#bb9af7", fg = "#1a1b26", bold = true })
	vim.api.nvim_set_hl(0, "MatchParen", { bg = "#7aa2f7", fg = "#1a1b26", bold = true })
	vim.api.nvim_set_hl(0, "Folded", { fg = "#566e99", bg = "#1a1b26", italic = true })

	-- Message highlights
	vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "#f7768e", bold = true })
	vim.api.nvim_set_hl(0, "WarningMsg", { fg = "#e0af68", bold = true })
	vim.api.nvim_set_hl(0, "MoreMsg", { fg = "#7aa2f7" })
	vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#bb9af7", bold = true })

	-- LSP diagnostics
	vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#f7768e" })
	vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#e0af68" })
	vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#7aa2f7" })
	vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#565f89" })

	-- LSP references
	vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#3b4261" })
	vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#3b4261" })
	vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#3b4261" })

	-- Terminal cursor
	vim.api.nvim_set_hl(0, "TermCursor", { fg = "#1a1b26", bg = "#c0caf5" })
	vim.api.nvim_set_hl(0, "TermCursorNC", { fg = "#1a1b26", bg = "#7aa2f7" })
	vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#7aa2f7" })
	vim.api.nvim_set_hl(0, "@string", { fg = "#e0af68" })
	vim.api.nvim_set_hl(0, "@string.escape", { fg = "#bb9af7" })
	vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#7aa2f7" })

	-- Comments
	vim.api.nvim_set_hl(0, "@comment", { fg = "#7a87b8", italic = true })

	-- Keywords and control flow
	vim.api.nvim_set_hl(0, "@keyword", { fg = "#bb9af7", bold = true })
	vim.api.nvim_set_hl(0, "@conditional", { fg = "#bb9af7", bold = true })
	vim.api.nvim_set_hl(0, "@repeat", { fg = "#bb9af7", bold = true })
	vim.api.nvim_set_hl(0, "@operator", { fg = "#d0d7ff" })

	-- Functions and methods
	vim.api.nvim_set_hl(0, "@function", { fg = "#7aa2f7" })
	vim.api.nvim_set_hl(0, "@function.call", { fg = "#7aa2f7" })
	vim.api.nvim_set_hl(0, "@method", { fg = "#7aa2f7" })

	-- Variables and identifiers
	vim.api.nvim_set_hl(0, "@variable", { fg = "#d0d7ff" })
	vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#bb9af7" })

	-- Types, classes, and structures
	vim.api.nvim_set_hl(0, "@type", { fg = "#7dcfff" })
	vim.api.nvim_set_hl(0, "@class", { fg = "#7dcfff", bold = true })
	vim.api.nvim_set_hl(0, "@struct", { fg = "#7dcfff" })

	-- Constants and numbers
	vim.api.nvim_set_hl(0, "@constant", { fg = "#9be7ff" })
	vim.api.nvim_set_hl(0, "@number", { fg = "#ffd28a" })

	-- Boolean values
	vim.api.nvim_set_hl(0, "@boolean", { fg = "#ffd28a" })

	-- Builtin types and namespaces
	vim.api.nvim_set_hl(0, "@namespace", { fg = "#bb9af7" })

	-- Tags and labels
	vim.api.nvim_set_hl(0, "@tag", { fg = "#bb9af7" })
	vim.api.nvim_set_hl(0, "@label", { fg = "#7aa2f7" })

	-- Exceptions and errors
	vim.api.nvim_set_hl(0, "@exception", { fg = "#f7768e", bold = true })

	-- Attributes and annotations
	vim.api.nvim_set_hl(0, "@attribute", { fg = "#bb9af7" })

	-- Embedded languages
	vim.api.nvim_set_hl(0, "@embedded", { fg = "#9be7ff" })

	-- TODO comments
	vim.api.nvim_set_hl(0, "@todo", { fg = "#bb9af7", bold = true })
end

return M
