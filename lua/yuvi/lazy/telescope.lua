return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')

        local function custom_buffers()
            require('telescope.builtin').buffers({
                sort_lastused = true,
                ignore_current_buffer = true,
                attach_mappings = function(prompt_bufnr, map)
                    map('i', '<c-x>', function(bufnr)
                        local selection = require('telescope.actions.state').get_selected_entry(bufnr)
                        require('telescope.actions').delete_buffer(prompt_bufnr, selection.bufnr)
                    end)
                    return true
                end,
                filter = function(bufnr)
                    local bufname = vim.api.nvim_buf_get_name(bufnr)
                    local buftype = vim.bo[bufnr].buftype
                    return buftype ~= 'nofile' and not bufname:match('^netrw')
                end,
            })
        end

        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<C-Tab>', custom_buffers, {})
        vim.keymap.set('n', '<C-g>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ff', function()
            builtin.grep_string({ search = vim.fn.input('Grep > ') })
        end)
        require('telescope').setup({
            defaults = require('telescope.themes').get_dropdown {
                theme = "dropdown",
                mappings = {
                    i = { -- insert mode mappings
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                    n = { -- normal mode mappings
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },
            },
        })
    end,
}
