autocmd BufRead,BufNewFile ~/Dev/smurf/* let g:ghcid_command = "./tools/ghcid.sh --no-height-limit --reverse-errors --clear"
autocmd FileType ghcid call GhcidWinOpts()

set syntax=txt
execute 'windo wincmd L'
execute 'vertical resize 90 <CR>'
