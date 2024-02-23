local opt = vim.opt

--opt.backspace = '1'
opt.showcmd = true
opt.laststatus = 2
opt.autowrite = true
opt.cursorline = true
opt.autoread = true
opt.smarttab = true
opt.smartindent = true
opt.title = true
opt.clipboard = 'unnamedplus'
opt.mouse = 'a'
opt.swapfile = false
opt.number = true
opt.rnu = true
opt.enc = 'utf-8'
opt.ignorecase = true
opt.smartcase = true
opt.breakindent = true
opt.cmdheight = 1
opt.splitright = true
opt.splitbelow = true
opt.undofile = true
opt.conceallevel = 0
opt.completeopt = { "menuone", "noselect" }
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.wrap = true

opt.tabstop = 2
opt.shiftwidth = 1
opt.shiftround = true
opt.expandtab = true

vim.cmd([[autocmd FileType * set formatoptions-=ro]])

local wk = require("which-key")
wk.register(mappings, opts)
