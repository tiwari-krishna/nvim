vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = { noremap = true, silent = true}

local kmp = vim.api.nvim_set_keymap

-- Normal Mode
kmp("n", "<C-h>", "<C-w>h", opts)
kmp("n", "<C-j>", "<C-w>j", opts)
kmp("n", "<C-k>", "<C-w>k", opts)
kmp("n", "<C-l>", "<C-w>l", opts)

kmp("n", "<C-Up>", ":resize +2<CR>", opts)
kmp("n", "<C-Down>", ":resize -2<CR>", opts)
kmp("n", "<C-Left>", ":vertical resize +2<CR>", opts)
kmp("n", "<C-Right>", ":vertical resize -2<CR>", opts)

kmp("n", "<leader>j", ":bnext<CR>", opts)
kmp("n", "<leader>k", ":bprevious<CR>", opts)

kmp("n", "<leader>qq", ":bdelete<CR>", opts)
kmp("n", "<leader>qQ", ":bwipeout<CR>", opts)

kmp("n", "<C-s>", ":split<CR>", opts)
kmp("n", "<C-d>", ":vsplit<CR>", opts)

kmp("n", "<C-z><S-z>", ":q!<CR>", opts)
kmp("n", "<C-z>z", ":wq!<CR>", opts)

-- Compile C files and convert latex and markdown to pdfs
kmp('n', '<leader>c', [[:w! | lua vim.cmd('!compiler "%:p"')<CR>]], opts)

vim.keymap.set('n', '<leader>l', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>t', ':tabnew<CR>')
--vim.keymap.set('n', '<leader>j', ':tabnext<CR>')
--vim.keymap.set('n', '<leader>k', ':tabprevious<CR>')
vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>')


local builtin = require('telescope.builtin')
local find_files = function()
  builtin.find_files {
    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
    previewer = false
  }
end

vim.keymap.set('n', '<leader>ff', find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Visual Mode
kmp('v', '<', '<gv', opts)
kmp('v', '>', '>gv', opts)

kmp("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
kmp("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)
kmp("v", "p", '"_dP', opts)

--Visual Block
kmp("x", "J", ":m '>+1<CR>gv=gv", opts)
kmp("x", "K", ":m '<-2<CR>gv=gv", opts)
