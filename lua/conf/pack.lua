local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  -- Theming
  {'Mofiqul/vscode.nvim'},
  {'kyazdani42/nvim-web-devicons'},
  {'nvim-lualine/lualine.nvim'},
  {'akinsho/bufferline.nvim'},

  -- File explorer
  {'kyazdani42/nvim-tree.lua'},

  -- Fuzzy finder
  {'nvim-telescope/telescope.nvim', branch = '0.1.x'},
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},

  -- Git
  {'lewis6991/gitsigns.nvim'},

  -- Code manipulation
  {'nvim-treesitter/nvim-treesitter'},
  {'nvim-treesitter/nvim-treesitter-textobjects'},
  {'numToStr/Comment.nvim'},
  {'tpope/vim-surround'},
  {'wellle/targets.vim'},
  {'tpope/vim-repeat'},

   -- cmp plugins
  {'hrsh7th/nvim-cmp'}, -- The completion plugin
  {'hrsh7th/cmp-buffer'}, -- buffer completions
  {'hrsh7th/cmp-path'}, -- path completions
  {'hrsh7th/cmp-cmdline'}, -- cmdline completions
  {'saadparwaiz1/cmp_luasnip'}, -- snippet completion
  {'hrsh7th/cmp-nvim-lsp'},

    -- snippets
    {'L3MON4D3/LuaSnip'}, --snippet engine
    {'rafamadriz/friendly-snippets'}, -- a bunch of snippets to use

  -- LSP
  {'neovim/nvim-lspconfig'}, -- enable LSP
  {'williamboman/mason.nvim'}, -- simple to use language server installer
  {'williamboman/mason-lspconfig.nvim'}, -- simple to use language server installer
  {'jose-elias-alvarez/null-ls.nvim'}, -- LSP diagnostics and code actions

  -- For {} & ()
  {'windwp/nvim-autopairs'},

  --Asthetics
  {'goolord/alpha-nvim'},

  -- Utilities
  {'moll/vim-bbye'},
  {'nvim-lua/plenary.nvim'},
	{'akinsho/toggleterm.nvim'},
	{'folke/which-key.nvim', config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end	},
})


