return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true
            }
        })
        vim.keymap.set("n","<leader>e", require("oil").toggle_float , { desc = "Open Oil" })
    end
}
