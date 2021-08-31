return function()
    vim.g.dashboard_default_executive = 'telescope'

    vim.g.dashboard_custom_header = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }

    vim.g.dashboard_custom_section = {
        a = { description = { '  New file                              e      ' }, command = 'DashboardNewFile' },
        b = { description = { '  Open last session                     SPC s l' }, command = 'SessionLoad' },
        c = { description = { '  Recently opened files                 SPC f h' }, command = 'DashboardFindHistory' },
        d = { description = { '  Frecency/MRU                          SPC f r' }, command = 'Telescope frecency' },
        e = { description = { '  Find file                             SPC f f' }, command = 'DashboardFindFile' },
        f = { description = { '  Find word                             SPC f g' }, command = 'DashboardFindWord' },
        g = { description = { '  Jump to bookmarks                     SPC f m' }, command = 'DashboardJumpMarks' }
    }
end
