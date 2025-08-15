require("fzf-lua").setup({
    winopts = {
        height = 0.85,
        width = 0.85,
        preview = {
            layout = "flex",
            scrollbar = "float",
        },
    },
    fzf_opts = {
        ["--layout"] = "reverse",
    },
})

local function findRepo ()
    require("fzf-lua").files({ cwd = vim.fn.expand("~/repo/") })
end

local function editNvim ()
    require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
end
vim.keymap.set("n", "<M-f>", "<CMD>FzfLua files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fp", findRepo , { desc = "Find Repo Files" })
vim.keymap.set("n", "<leader>fe", editNvim , { desc = "Find Neovim config Files" })
vim.keymap.set("n", "<M-g>", "<CMD>FzfLua live_grep<CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<M-b>", "<CMD>FzfLua buffers<CR>", { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", "<CMD>FzfLua help_tags<CR>", { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fa", "<CMD>FzfLua builtin<CR>", { desc = "Find Builtin Stuff" })
vim.keymap.set("n", "<leader>fk", "<CMD>FzfLua keymaps<CR>", { desc = "Find keymaps" })
