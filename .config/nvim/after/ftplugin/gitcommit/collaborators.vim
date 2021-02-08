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
    priority = 100;
    dup = false;
    menu = '[Collab]';
  }
end

function collaboratorSource.determine(_, context)
  return compe.helper.determine(context)
end

function collaboratorSource.complete(self, args)
  if string.find(vim.fn.getline('.'), 'author') then
    args.callback({ items = collabCache; })
  else
    args.callback({ items = { 'co-authored-by: ' }; })
  end
end

compe.register_source('collaborators', collaboratorSource)
END
