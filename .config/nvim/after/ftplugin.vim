autocmd FileType lua setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType elm setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType tex setlocal conceallevel=0
autocmd FileType toggleterm setlocal nonu

let nocomplete = ['clap_input']
autocmd BufEnter * if index(nocomplete, &ft) < 0 | lua require'completion'.on_attach()

" hide cursor on Nvim Tree
augroup HideCursor
  au!
  au BufLeave,WinLeave,FileType NvimTree set guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
  au BufEnter,WinEnter,FileType NvimTree set guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
augroup END

au FileType NvimTree hi Cursor blend=100

