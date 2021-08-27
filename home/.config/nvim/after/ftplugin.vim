autocmd FileType lua setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType elm setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType tex setlocal conceallevel=0

" hide cursor on Nvim Tree
augroup HideCursor
  au!
  au BufWinEnter,WinEnter,FileType NvimTree set guicursor=a:block-Cursor/Cursor-blinkon0,
  au BufLeave,WinClosed,WinLeave,FileType NvimTree set guicursor&
augroup END

augroup NvimTree
  au!
  au FileType NvimTree hi NvimTreeNormal guibg=#1d2021
  au FileType NvimTree hi Cursor blend=100
augroup END
