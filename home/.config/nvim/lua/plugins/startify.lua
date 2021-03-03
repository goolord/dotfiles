return function()
    vim.g.startify_change_to_dir = 0

    vim.g.startify_custom_header = {
        [[                                  __                ]],
        [[     ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }

    vim.g.startify_lists = {
        { type = 'dir'       , header = {'   MRU ' .. vim.fn['getcwd']() }  } ,
        { type = 'files'     , header = {'   MRU'                        }  } ,
        { type = 'sessions'  , header = {'   Sessions'                   }  } ,
        { type = 'bookmarks' , header = {'   Bookmarks'                  }  } ,
        { type = 'commands'  , header = {'   Commands'                   }  } ,
    }

    -- todo cd here but not w/ files
    vim.g.startify_bookmarks = {
        { c = '~/.config/nvim' },
        { s = '~/Dev/smurf' },
    }
end
