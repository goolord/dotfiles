" syn match hsFunctionDef '.*' contains=hsVarSym nextgroup=hsTypeDef skipwhite
" syn match hsTypeDef "::\_s*.*\(\n*\s\+.*\)*"
" syn match hsFunction ".*" contains=sFunctionDef,hsTypeDef nextgroup=hsVarSym

hi def link ConId Type
hi! link Operator GruvboxBlue
" hi! link hsFunction Function
