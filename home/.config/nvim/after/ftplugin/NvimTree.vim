hi NvimTreeNormal guibg=#1d2021
hi Cursor blend=100

" hide cursor on Nvim Tree
augroup HideCursor
  au!
  au BufWinEnter,WinEnter <buffer> set guicursor=a:block-Cursor/Cursor-blinkon0,
  au BufLeave,WinClosed,WinLeave <buffer> set guicursor&
augroup END
