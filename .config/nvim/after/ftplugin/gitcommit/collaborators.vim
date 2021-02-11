function collaborators#list()
  let cwd = getcwd()
  return systemlist('git log | grep Author: | sort | uniq | cut -c 9-')
endfunction

let s:collabCache = add(collaborators#list(), 'co-authored-by: ')

function! collaborators#complete(findstart, base)
  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while l:start > 0 && l:line[l:start - 1] =~ '\a'
      let l:start -= 1
    endwhile
    return start
  else
    let matches = []
    for m in s:collabCache
      if empty(matchstr(m, '^' . a:base . '.*'))
        continue
      else
        call add(l:matches, m)
      endif
    endfor
    return { 'words': matches }
endfun

setlocal completefunc=collaborators#complete
