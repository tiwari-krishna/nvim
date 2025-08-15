local api = vim.api

local M = {}

-- Get all listed buffers
function M.get_all_buffers()
	local buffers = vim.tbl_filter(function(buf)
		return api.nvim_buf_is_loaded(buf.bufnr) and buf.listed
	end, vim.fn.getbufinfo({ buflisted = 1 }))

	return buffers
end

-- Show floating window with buffers list (readonly)
function M.show_floating()
	local buffers = M.get_all_buffers()
	M._buffers = buffers

	local lines = {}
	for i, buf in ipairs(buffers) do
		local name = buf.name ~= "" and vim.fn.fnamemodify(buf.name, ":t") or "[No Name]"
		table.insert(lines, string.format("%d: %s", i, name))
	end

	local width = 40
	local height = math.min(#lines, 15)

	local buf = api.nvim_create_buf(false, true)
	api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	api.nvim_buf_set_option(buf, "modifiable", false)
	api.nvim_buf_set_option(buf, "buflisted", false)

	local win_opts = {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
	}

	local win = api.nvim_open_win(buf, true, win_opts)

	M._buf = buf
	M._win = win

	-- Close floating window on pressing 'q'
	api.nvim_buf_set_keymap(buf, "n", "q", "<Cmd>close<CR>", { nowait = true, noremap = true, silent = true })

	-- Focus the floating window automatically
	api.nvim_set_current_win(win)
end

-- Jump to buffer at position 'pos'
function M.goto_buffer(pos)
	local buffers = M._buffers or M.get_all_buffers()
	local target_buf = buffers[pos]

	if not target_buf then
		vim.notify("No buffer at position " .. pos, vim.log.levels.WARN)
		return
	end

	api.nvim_set_current_buf(target_buf.bufnr)
end

-- Setup keymaps:
-- <leader>m: show floating buffer list
-- <leader>1..9: jump to buffer
function M.setup_keymaps()
	vim.keymap.set(
		"n",
		"<leader>m",
		M.show_floating,
		{ desc = "Show buffer list popup", noremap = true, silent = true }
	)

	for i = 1, 9 do
		vim.keymap.set("n", "<leader>" .. i, function()
			M.goto_buffer(i)
		end, { desc = "Go to buffer " .. i, noremap = true, silent = true })
	end
end

return M
