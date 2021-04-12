return function()
    require('lualine').setup {
        options = {
            theme = 'gruvbox',
            component_separators = {'|', '|'},
            section_separators = {'', ''},
            icons_enabled = true,
        }
    }
end
