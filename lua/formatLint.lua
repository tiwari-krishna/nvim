---------------------------------
------- Formatter (Coform) -------
require("conform").setup({
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 1000,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		markdown = { "prettier" },
		-- c = { "clang-format" },
		-- cpp = { "clang-format" },
		python = { "black" },
		json = { "prettier" },
		yaml = { "prettier" },
	},
})

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Code Format" })

------------ Linter ----------
-- local lint = require("lint")
--
-- lint.linters_by_ft = {
-- 	lua = { "luacheck" },
-- 	javascript = { "eslint_d" },
-- 	typescript = { "eslint_d" },
-- 	python = { "pylint" },
-- 	-- c = { "cpplint" },
-- 	-- cpp = { "cpplint" },
-- }
--
-- lint.linters.pylint = {
-- 	cmd = "pylint",
-- 	args = function()
-- 		return {
-- 			"--disable=C0114,C0115,C0116,C0301",
-- 			"--output-format=text",
-- 			vim.api.nvim_buf_get_name(0),
-- 		}
-- 	end,
-- 	stream = "stdout",
-- 	parser = require("lint.parser").from_errorformat("%f:%l:%c: %t%*[^:]: %m"),
-- }
--
-- lint.linters.luacheck.args = {
-- 	"--globals",
-- 	"vim",
-- }
--
-- lint.linters.eslint_d = {
-- 	cmd = "eslint_d",
-- 	stdin = true,
-- 	args = {
-- 		"--stdin",
-- 		"--stdin-filename",
-- 		"%filepath",
-- 		"--config-dir",
-- 		os.getenv("HOME") .. "/.config/eslintd", -- Explicit path
-- 	},
-- 	stream = "stdout",
-- 	ignore_exitcode = true,
-- 	parser = require("lint.parser").from_errorformat("%f:%l:%c: %m"),
-- }
--
-- -- lint.linters.cpplint = {
-- -- 	cmd = "cpplint",
-- -- 	args = function()
-- -- 		return {
-- -- 			"--filter=-legal/copyright,-whitespace/line_length",
-- -- 			"--quiet",
-- -- 			"--",
-- -- 			vim.api.nvim_buf_get_name(0),
-- -- 		}
-- -- 	end,
-- -- 	stream = "stderr",
-- -- 	parser = require("lint.parser").from_errorformat("%f:%l: %m"),
-- -- }
-- --
-- -- Run linter on save
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	callback = function()
-- 		lint.try_lint()
-- 	end,
-- })
