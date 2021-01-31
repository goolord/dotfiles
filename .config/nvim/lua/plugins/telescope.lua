local actions = require('telescope.actions')
local telescope = require('telescope')
local previewers = require('telescope.previewers')

telescope.setup {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
    },
    defaults = {
        set_env = {['COLORTERM'] = 'truecolor'}, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
    }
}
