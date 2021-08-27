return function()
    local telescope = require('telescope')
    telescope.load_extension('fzy_native')
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
        }
    }
end
