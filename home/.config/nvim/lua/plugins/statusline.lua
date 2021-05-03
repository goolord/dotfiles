return function()
    require('lualine').setup {
        options = {
            theme = 'gruvbox',
            component_separators = {'|', '|'},
            section_separators = {'', ''},
            icons_enabled = true,
        },

        sections = require'lualine.defaults'.sections,
        inactive_sections = require'lualine.defaults'.inactive_sections
    }
end
