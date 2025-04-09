return {
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')

            local find_files = function()
                builtin.find_files {
                    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
                    previewer = false
                }
            end
            vim.keymap.set('n', '<M-f>', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<M-g>', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<M-b>', builtin.buffers, { desc = 'Telescope buffers' })
            --vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            --vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find git files' })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
