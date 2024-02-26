require("autosession").setup({
  msg = nil, -- string: printed when startup is completed
  restore_on_setup = false, -- boolean: If true, automatically restore session on nvim startup
  warn_on_setup = false, -- boolean: If true, warning shown when no `.session.vim` is found
  autosave_on_quit = false, -- boolean: If true, automatically overwrites sessionfile if exists
  save_session_global_dir = vim.g.startify_session_dir or vim.fn.stdpath("data") .. "/session", -- string
  --                        dir path to where global session files should be stored.
  --                        global sessions will show up in startify screen as dirname of the session
  sessionfile_name = ".session.vim", -- string: default name of sessionfile. better be .gitignored
  disable_envvar = "NVIM_DISABLE_AUTOSESSION", -- string: disable this plugin altogether when this envvar is found
})
