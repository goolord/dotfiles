function! DefxOpen()
  if defx#is_directory()
    return defx#do_action('open_tree', 'toggle')
  else
    return defx#do_action('drop')
  endif
endfunction

command! DefxHelp call fzf#vim#maps("n", {'options': '--query=defx\ '})

setlocal statusline =\ help:\ <Leader>h
set norelativenumber
set nonu
set cursorline
nnoremap <silent><buffer> <Leader>h :DefxHelp<CR>
" Define mappings
nnoremap <silent><buffer><expr> c defx#do_action('copy')
nnoremap <silent><buffer><expr> m defx#do_action('move')
nnoremap <silent><buffer><expr> p defx#do_action('paste')
nnoremap <silent><buffer><expr> l DefxOpen()
nnoremap <silent><buffer><expr> <2-LeftMouse> DefxOpen()
nnoremap <silent><buffer><expr> L defx#do_action('open')
nnoremap <silent><buffer><expr> P defx#do_action('preview')
nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
nnoremap <silent><buffer><expr> N defx#do_action('new_file')
nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
nnoremap <silent><buffer><expr> dd defx#do_action('remove')
nnoremap <silent><buffer><expr> r defx#do_action('rename')
nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
nnoremap <silent><buffer><expr> q defx#do_action('quit')
nnoremap <silent><buffer><expr> <CR> defx#do_action('toggle_select') . 'j'
nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
