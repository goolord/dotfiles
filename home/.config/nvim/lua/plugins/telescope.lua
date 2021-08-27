return function()
    local telescope = require('telescope')
    telescope.setup {
        defaults = {
            border = true,
            prompt_title = false,
            results_title = false,
            preview_title = false,
            dynamic_preview_title = true,
            borderchars = {
                results =  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' };
                prompt =  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' };
                preview = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' };
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = false, -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- ["smart_case", "ignore_case", "respect_case"]
            },

            lsp_handlers = {
                code_action = {
                    telescope = require('telescope.themes').get_dropdown({}),
                },
            },
        }
    }
    telescope.load_extension('fzf')
    telescope.load_extension('lsp_handlers')
end

