local opt = vim.opt

--opt.guicursor = ""

opt.showcmd = true
opt.laststatus = 2
opt.autowrite = true
opt.cursorline = true
opt.autoread = true
opt.smarttab = true
opt.smartindent = true
opt.title = true
--opt.clipboard = 'unnamedplus'
opt.mouse = 'a'
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.nu = true
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
opt.wrap = false

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true
opt.scrolloff = 8
opt.updatetime = 50

opt.colorcolumn = "120"

opt.undodir = os.getenv("HOME") .. "/.cache/undodir"

vim.cmd([[autocmd FileType * set formatoptions-=ro]])

--local wk = require("which-key")
--wk.register(mappings, opts)
