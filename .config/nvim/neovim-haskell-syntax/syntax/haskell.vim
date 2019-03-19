call jobstart(['neovim-haskell-syntax'], {'rpc': v:true})

let b:current_syntax = "haskell"

syn match haskellIdentifier "[_a-z][a-zA-z0-9_']*" contained
syn match haskellIdentifierDef "^\k\+\ze.*\%(\n\s.*\|\n\)*[[:punct:]]\@<!=[[:punct:]]\@!"
syn match haskellTypeSig "^\s*\(where\s\+\|let\s\+\|default\s\+\)\?[_a-z][a-zA-Z0-9_']*#\?\(,\s*[_a-z][a-zA-Z0-9_']*#\?\)*\_s\+::\_s"

highlight def link haskellIdentifier Identifier
highlight def link haskellIdentifierDef Identifier
highlight def link haskellTypeSig Identifier
