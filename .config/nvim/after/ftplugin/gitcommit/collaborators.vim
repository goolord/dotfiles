function! collaborators#complete(findstart, base)
  if a:findstart
    let line = getline('.')
    let start = col('.') - 1
    return start
  else
    return { 'words': collaborators#list() }
endfun

function collaborators#list()
  let cwd = getcwd()
  return systemlist('git log | grep Author: | sort | uniq | cut -c 9-')
endfunction

lua << END

local compe = require'compe'
local collaboratorSource = { }

local collabCache = vim.fn['collaborators#list']()

function collaboratorSource.get_metadata(_)
  return {
    priority = 10;
    dup = 0;
    menu = '[Collab]';
  }
end

function collaboratorSource.determine(_, context)
  return compe.helper.determine(context)
end

function collaboratorSource.complete(self, args)
  args.callback({
    items = collabCache;
    incomplete = false;
  })
end

compe.register_source('collaborators', collaboratorSource)
END
