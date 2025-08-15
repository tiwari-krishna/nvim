local M = {}

M.marks, M.list, M.win, M.buf = {}, {}, nil, nil

local function rebuild_list()
	M.list = {}
	for _, info in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
		table.insert(M.list, info.bufnr)
	end
end

local function filename(bufnr)
	local name = vim.api.nvim_buf_get_name(bufnr)
	return name == "" and "[No Name]" or vim.fn.fnamemodify(name, ":t")
end

local function refresh_lines()
	if not (M.buf and vim.api.nvim_buf_is_valid(M.buf)) then
		return
	end
	local lines = {}
	for _, b in ipairs(M.list) do
		local mark = M.marks[b] and "[x]" or "[ ]"
		table.insert(lines, mark .. " " .. filename(b))
	end
	if #lines == 0 then
		lines = { " <no listed buffers>" }
	end
	vim.bo[M.buf].modifiable = true
	vim.api.nvim_buf_set_lines(M.buf, 0, -1, false, lines)
	vim.bo[M.buf].modifiable = false
end

local function cursor_buf()
	if not (M.win and vim.api.nvim_win_is_valid(M.win)) then
		return nil
	end
	local lnum = vim.api.nvim_win_get_cursor(M.win)[1]
	return M.list[lnum], lnum
end

local function toggle_mark()
	local buf = cursor_buf()
	if not buf then
		return
	end
	M.marks[buf] = not M.marks[buf] or nil
	refresh_lines()
end

local function move_item(delta)
	local _, lnum = cursor_buf()
	if not lnum then
		return
	end
	local new_pos = lnum + delta
	if new_pos < 1 or new_pos > #M.list then
		return
	end
	M.list[lnum], M.list[new_pos] = M.list[new_pos], M.list[lnum]
	refresh_lines()
	vim.api.nvim_win_set_cursor(M.win, { new_pos, 0 })
end

local function marked_in_order()
	local out = {}
	for _, b in ipairs(M.list) do
		if M.marks[b] and vim.api.nvim_buf_is_valid(b) then
			table.insert(out, b)
		end
	end
	return out
end

local function jump_to_mark(idx)
	local target = marked_in_order()[idx]
	if target then
		vim.api.nvim_set_current_buf(target)
	end
end

function M.open()
	rebuild_list()
	M.buf = vim.api.nvim_create_buf(false, true)
	M.win = vim.api.nvim_open_win(M.buf, true, {
		relative = "editor",
		style = "minimal",
		border = "rounded",
		width = math.max(30, math.floor(vim.o.columns * 0.4)),
		height = math.max(8, math.floor(vim.o.lines * 0.5)),
		row = math.floor((vim.o.lines - math.floor(vim.o.lines * 0.5)) / 2),
		col = math.floor((vim.o.columns - math.floor(vim.o.columns * 0.4)) / 2),
	})
	vim.bo[M.buf].bufhidden = "wipe"
	vim.bo[M.buf].filetype = "simple_buffer_marks"
	refresh_lines()

	local function map(lhs, rhs)
		vim.keymap.set("n", lhs, rhs, { buffer = M.buf, nowait = true, silent = true })
	end
	map("q", function()
		if M.win and vim.api.nvim_win_is_valid(M.win) then
			vim.api.nvim_win_close(M.win, true)
		end
	end)
	map("<CR>", toggle_mark)
	map("J", function()
		move_item(1)
	end)
	map("K", function()
		move_item(-1)
	end)
	map("r", function()
		rebuild_list()
		refresh_lines()
	end)
end

function M.setup()
	vim.keymap.set("n", "<leader>m", M.open)
	for i = 1, 9 do
		vim.keymap.set("n", "<leader>" .. i, function()
			jump_to_mark(i)
		end)
	end
end

return M
