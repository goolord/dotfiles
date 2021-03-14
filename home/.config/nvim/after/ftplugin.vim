autocmd FileType lua setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType elm setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType tex setlocal conceallevel=0
autocmd FileType toggleterm setlocal nonu

" hide cursor on Nvim Tree
augroup HideCursor
  au!
  au BufLeave,WinLeave,FileType NvimTree set guicursor&
  au BufEnter,WinEnter,FileType NvimTree set guicursor=a:block-Cursor/Cursor-blinkon0,
augroup END

au FileType NvimTree hi Cursor blend=100
