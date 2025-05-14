vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }
local kmp = vim.api.nvim_set_keymap

-- vim.keymap.set("n", "<leader>gb", vim.cmd.Ex)

-- Normal Mode
kmp("n", "<C-h>", "<C-w>h", opts)
kmp("n", "<C-j>", "<C-w>j", opts)
kmp("n", "<C-k>", "<C-w>k", opts)
kmp("n", "<C-l>", "<C-w>l", opts)

kmp("n", "<leader>vh", ":split<CR>", opts)
kmp("n", "<leader>vv", ":vsplit<CR>", opts)
kmp("n", "<C-c>", ":close<CR>", opts)

kmp("n", "<leader>j", ":bnext<CR>", opts)
kmp("n", "<leader>k", ":bprevious<CR>", opts)

kmp("n", "<leader>qq", ":bdelete<CR>", opts)
kmp("n", "<leader>qQ", ":bwipeout<CR>", opts)

kmp("n", "<C-Up>", ":resize +2<CR>", opts)
kmp("n", "<C-Down>", ":resize -2<CR>", opts)
kmp("n", "<C-Left>", ":vertical resize +2<CR>", opts)
kmp("n", "<C-Right>", ":vertical resize -2<CR>", opts)

kmp("n", "<leader>cd", ":cd %:p:h<CR>", opts)

-- compiler command
kmp("n", "<leader>cc", [[:w! | lua vim.cmd('!compiler "%:p"')<CR>]], opts)

--Insert Mode
kmp("i", "<C-b>", "<ESC>^i", opts)
kmp("i", "<C-e>", "<End>", opts)

-- Visual block Mode
kmp("v", "J", ":m '>+1<CR>gv=gv", opts)
kmp("v", "K", ":m '<-2<CR>gv=gv", opts)

--visual character mode copy to system clipboard
kmp("x", "<leader>p", [["_dP]], opts)

kmp("n", "J", "mzJ`z", opts)
kmp("n", "<C-d>", "<C-d>zz", opts)
kmp("n", "<C-u>", "<C-u>zz", opts)

kmp("n", "n", "nzzzv", opts)
kmp("n", "N", "Nzzzv", opts)
kmp("n", "=ap", "ma=ap'a", opts)

vim.keymap.set({ "n", "v" }, "<C-y>", [["+y]])

vim.keymap.set({ "n", "v" }, "<C-p>", [["+p]])

vim.keymap.set("n", "<C-Y>", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

kmp("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
kmp("n", "<leader>xx", "<cmd>!chmod +x %<CR>", opts)

kmp("n", "<leader>z", "<cmd>:wa<CR>", opts)
kmp("n", "<leader>Z", "<cmd>:wqa<CR>", opts)

local function openTmuxWin()
	local cwd = vim.fn.expand("%:p:h")
	if cwd == "" then
		print("No file path found")
		return
	end
	local cmd = string.format("tmux new-window -c %q", cwd)
	vim.fn.system(cmd)
	print("Opened tmux window in: " .. cwd)
end

local function openInBrowser()
	local filepath = vim.fn.expand("%:p")
	if vim.fn.filereadable(filepath) == 0 then
		print("File not found or not readable.")
		return
	end

	local ext = vim.fn.expand("%:e")
	if ext == "html" then
		local escaped_path = vim.fn.shellescape("file://" .. filepath)
		local open_cmd = "$BROWSER " .. escaped_path
		vim.fn.jobstart(open_cmd, { detach = true })
	else
		print("File not supported")
	end
end

vim.keymap.set("n", "<leader>ob", openInBrowser, { desc = "Open in browser" })
vim.keymap.set("n", "<leader>to", openTmuxWin, { desc = "Open new tmux window here" })
