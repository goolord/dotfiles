-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/zach/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/zach/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/zach/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/zach/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/zach/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  Coqtail = {
    loaded = false,
    needs_bufread = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/Coqtail"
  },
  ["collaborators.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/collaborators.vim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/compe-tabnine"
  },
  ghcid = {
    commands = { "Ghcid", "GhcidKill" },
    loaded = false,
    needs_bufread = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/ghcid/plugins/nvim"
  },
  ["idris2-vim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/idris2-vim"
  },
  indentLine = {
    config = { "\27LJ\1\2�\1\0\0\2\0\b\0\0174\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0G\0\1\0\1\r\0\0\thelp\rnerdtree\rstartify\fPreview\f__doc__\rpeekaboo\bman\ntrans\bfzf\rmarkdown\blog\rterminal\31indentLine_fileTypeExclude\25indentLine_setColors\22indentLine_faster\b▏\20indentLine_char\6g\bvim\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2�\1\0\0\4\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\b\0003\2\3\0003\3\4\0:\3\5\0023\3\6\0:\3\a\2:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\15extensions\1\3\0\0\rfugitive\14nvim-tree\foptions\1\0\0\23section_separators\1\3\0\0\5\5\25component_separators\1\3\0\0\6|\6|\1\0\2\18icons_enabled\2\ntheme\fgruvbox\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-clap-lsp"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-clap-lsp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    config = { '\27LJ\1\2_\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\3\texpr\2\vsilent\2\fnoremap\2\6i\20nvim_set_keymap\bapi\bvim�\1\0\0\5\0\b\2\0304\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\2\21\0\0\0\b\0\1\0T\1\16�4\1\0\0007\1\1\0017\1\4\1%\2\3\0>\1\2\2\16\2\1\0007\1\5\1\16\3\0\0\16\4\0\0>\1\4\2\16\2\1\0007\1\6\1%\3\a\0>\1\3\2\15\0\1\0T\2\3�)\1\2\0H\1\2\0T\1\2�)\1\1\0H\1\2\0G\0\1\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0�\6\1\0\5\0\31\0.4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\5\0003\3\4\0:\3\6\0023\3\b\0003\4\a\0:\4\t\3:\3\n\0023\3\f\0003\4\v\0:\4\t\3:\3\r\0023\3\15\0003\4\14\0:\4\t\3:\3\16\2:\2\17\1>\0\2\0011\0\18\0001\1\19\0005\1\20\0\16\1\0\0%\2\21\0%\3\22\0>\1\3\1\16\1\0\0%\2\23\0%\3\24\0>\1\3\1\16\1\0\0%\2\25\0%\3\26\0>\1\3\1\16\1\0\0%\2\27\0%\3\28\0>\1\3\1\16\1\0\0%\2\29\0%\3\30\0>\1\3\1G\0\1\0Tpumvisible() ? "<C-p>" : v:lua.Check_backspace() ? "<S-Tab>" : compe#complete()\f<S-Tab>Rpumvisible() ? "<C-n>" : v:lua.Check_backspace() ? "<Tab>" : compe#complete()\n<Tab>\25compe#close("<C-e>")\n<C-e>\26compe#confirm("<CR>")\t<CR>\21compe#complete()\14<C-Space>\20Check_backspace\0\0\vsource\18collaborators\1\0\0\1\2\0\0\14gitcommit\nemoji\1\0\0\1\4\0\0\14gitcommit\ttext\rmarkdown\vbuffer\14filetypes\1\0\0\1\2\0\0\bcoq\rnvim_lsp\1\0\5\ttags\2\tpath\2\rnvim_lua\2\tcalc\2\ftabnine\2\1\0\1\rpriority\3��\6\1\0\t\17autocomplete\2\19source_timeout\3�\1\fenabled\2\ndebug\1\14preselect\venable\21incomplete_delay\3�\3\15min_length\3\1\18throttle_time\3P\18documentation\2\nsetup\ncompe\frequire\0' },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2�\2\0\0\3\0\n\0\0194\0\0\0%\1\1\0>\0\2\2>\0\1\0014\0\0\0%\1\2\0>\0\2\2>\0\1\0014\0\3\0007\0\4\0%\1\5\0>\0\2\0014\0\3\0007\0\6\0007\0\a\0%\1\b\0003\2\t\0>\0\3\1G\0\1\0\1\0\4\vtexthl\tType\ttext\b\vlinehl\5\nnumhl\5\18LightBulbSign\16sign_define\afnTautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\27modules.lsp.diagnostic\27modules.lsp.langserver\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\1\2�\1\0\0\3\0\5\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0002\2\0\0:\2\4\1>\0\2\1G\0\1\0\20shade_filetypes\1\0\a\20shade_terminals\2\17open_mapping\15<Leader>tt\17persist_size\2\20insert_mappings\1\tsize\3P\14direction\rvertical\20start_in_insert\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2�\5\0\0\6\0\28\0K4\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0'\1\1\0:\1\6\0004\0\a\0%\1\b\0>\0\2\0027\0\t\0004\1\0\0007\1\1\0012\2\b\0003\3\v\0\16\4\0\0%\5\f\0>\4\2\2:\4\r\3;\3\1\0023\3\14\0\16\4\0\0%\5\f\0>\4\2\2:\4\r\3;\3\2\0023\3\15\0\16\4\0\0%\5\f\0>\4\2\2:\4\r\3;\3\3\0023\3\16\0\16\4\0\0%\5\17\0>\4\2\2:\4\r\3;\3\4\0023\3\18\0\16\4\0\0%\5\19\0>\4\2\2:\4\r\3;\3\5\0023\3\20\0\16\4\0\0%\5\21\0>\4\2\2:\4\r\3;\3\6\0023\3\22\0\16\4\0\0%\5\23\0>\4\2\2:\4\r\3;\3\a\2:\2\n\0014\1\0\0007\1\1\0013\2\25\0:\2\24\0014\1\0\0007\1\26\1%\2\27\0>\1\2\1G\0\1\0-autocmd FileType LuaTree setlocal nowrap\bcmd\1\0\2\fdefault\b\fsymlink\b\20nvim_tree_icons\fpreview\1\0\1\bkey\6=\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\1\0\1\bkey\t<cr>\1\0\1\bkey\6o\acb\tedit\1\0\1\bkey\6l\23nvim_tree_bindings\23nvim_tree_callback\21nvim-tree.config\frequire\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\1\4\0\0\t.git\17node_modules\v.cache\21nvim_tree_ignore\6g\bvim\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  tabular = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\1\0029\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-clap"] = {
    config = { "\27LJ\1\2�\3\0\0\2\0\15\0!4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0004\0\0\0007\0\1\0)\1\2\0:\1\b\0004\0\0\0007\0\1\0'\1\1\0:\1\t\0004\0\0\0007\0\1\0'\1\1\0:\1\n\0004\0\0\0007\0\1\0003\1\f\0:\1\v\0004\0\0\0007\0\1\0003\1\14\0:\1\r\0G\0\1\0\1\t\0\0\t🌑\t🌒\t🌓\t🌔\t🌕\t🌖\t🌗\t🌘\24clap_spinner_frames\1\0\3\vtexthl\29ClapCurrentSelectionSign\ttext\v\vlinehl\25ClapCurrentSelection clap_current_selection_sign#clap_provider_grep_enable_icon\21clap_enable_icon\28clap_disable_run_rooter\1\0\3\brow\b11%\rrelative\veditor\vheight\b80%\16clap_layout\17gruvbox_dark\15clap_theme\bnil\22clap_popup_border\6g\bvim\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-clap"
  },
  ["vim-clap-gruvbox"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-clap-gruvbox"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gruvbox8"] = {
    config = { "\27LJ\1\2�\3\0\0\2\0\15\0,4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0'\1\1\0:\1\6\0004\0\0\0007\0\1\0'\1\1\0:\1\a\0004\0\0\0007\0\1\0'\1\1\0:\1\b\0004\0\0\0007\0\1\0'\1\1\0:\1\t\0004\0\0\0007\0\1\0'\1\0\0:\1\n\0004\0\0\0007\0\1\0'\1\1\0:\1\v\0004\0\0\0007\0\1\0'\1\1\0:\1\f\0004\0\r\0%\1\14\0>\0\2\1G\0\1\0\27modules.colors.gruvbox\frequire\22gruvbox_undercurl\29gruvbox_plugin_hi_groups\20gruvbox_italics\27gruvbox_invert_tabline\25gruvbox_invert_signs\30gruvbox_improved_warnings\29gruvbox_improved_strings\31gruvbox_filetype_hi_groups\tsoft\27gruvbox_contrast_light\17gruvbox_bold\6g\bvim\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-gruvbox8"
  },
  ["vim-nix"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-nix"
  },
  ["vim-ripgrep"] = {
    commands = { "Rg" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/vim-ripgrep"
  },
  ["vim-startify"] = {
    config = { "\27LJ\1\2�\6\0\0\6\0\22\00004\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0003\1\4\0:\1\3\0004\0\0\0007\0\1\0002\1\6\0003\2\6\0002\3\3\0%\4\a\0004\5\0\0007\5\b\0057\5\t\5>\5\1\2$\4\5\4;\4\1\3:\3\n\2;\2\1\0013\2\v\0003\3\f\0:\3\n\2;\2\2\0013\2\r\0003\3\14\0:\3\n\2;\2\3\0013\2\15\0003\3\16\0:\3\n\2;\2\4\0013\2\17\0003\3\18\0:\3\n\2;\2\5\1:\1\5\0004\0\0\0007\0\1\0002\1\3\0003\2\20\0;\2\1\0013\2\21\0;\2\2\1:\1\19\0G\0\1\0\1\0\1\6l$~/Dev/iohk/cardano-ledger-specs\1\0\1\6c\19~/.config/nvim\23startify_bookmarks\1\2\0\0\16   Commands\1\0\1\ttype\rcommands\1\2\0\0\17   Bookmarks\1\0\1\ttype\14bookmarks\1\2\0\0\16   Sessions\1\0\1\ttype\rsessions\1\2\0\0\v   MRU\1\0\1\ttype\nfiles\vheader\vgetcwd\afn\f   MRU \1\0\1\ttype\bdir\19startify_lists\1\a\0\0009                                  __                9     ___     ___    ___   __  __ /\\_\\    ___ ___    9    / _ `\\  / __`\\ / __`\\/\\ \\/\\ \\\\/\\ \\  / __` __`\\  9   /\\ \\/\\ \\/\\  __//\\ \\_\\ \\ \\ \\_/ |\\ \\ \\/\\ \\/\\ \\/\\ \\ 9   \\ \\_\\ \\_\\ \\____\\ \\____/\\ \\___/  \\ \\_\\ \\_\\ \\_\\ \\_\\9    \\/_/\\/_/\\/____/\\/___/  \\/__/    \\/_/\\/_/\\/_/\\/_/\27startify_custom_header\27startify_change_to_dir\6g\bvim\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-toml"
  }
}

time([[Defining packer_plugins]], false)
-- Runtimepath customization
time([[Runtimepath customization]], true)
vim.o.runtimepath = vim.o.runtimepath .. ",/home/zach/.local/share/nvim/site/pack/packer/opt/ghcid/plugins/nvim"
time([[Runtimepath customization]], false)
-- Config for: vim-clap
time([[Config for vim-clap]], true)
try_loadstring("\27LJ\1\2�\3\0\0\2\0\15\0!4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0004\0\0\0007\0\1\0)\1\2\0:\1\b\0004\0\0\0007\0\1\0'\1\1\0:\1\t\0004\0\0\0007\0\1\0'\1\1\0:\1\n\0004\0\0\0007\0\1\0003\1\f\0:\1\v\0004\0\0\0007\0\1\0003\1\14\0:\1\r\0G\0\1\0\1\t\0\0\t🌑\t🌒\t🌓\t🌔\t🌕\t🌖\t🌗\t🌘\24clap_spinner_frames\1\0\3\vtexthl\29ClapCurrentSelectionSign\ttext\v\vlinehl\25ClapCurrentSelection clap_current_selection_sign#clap_provider_grep_enable_icon\21clap_enable_icon\28clap_disable_run_rooter\1\0\3\brow\b11%\rrelative\veditor\vheight\b80%\16clap_layout\17gruvbox_dark\15clap_theme\bnil\22clap_popup_border\6g\bvim\0", "config", "vim-clap")
time([[Config for vim-clap]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\1\2�\6\0\0\6\0\22\00004\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0003\1\4\0:\1\3\0004\0\0\0007\0\1\0002\1\6\0003\2\6\0002\3\3\0%\4\a\0004\5\0\0007\5\b\0057\5\t\5>\5\1\2$\4\5\4;\4\1\3:\3\n\2;\2\1\0013\2\v\0003\3\f\0:\3\n\2;\2\2\0013\2\r\0003\3\14\0:\3\n\2;\2\3\0013\2\15\0003\3\16\0:\3\n\2;\2\4\0013\2\17\0003\3\18\0:\3\n\2;\2\5\1:\1\5\0004\0\0\0007\0\1\0002\1\3\0003\2\20\0;\2\1\0013\2\21\0;\2\2\1:\1\19\0G\0\1\0\1\0\1\6l$~/Dev/iohk/cardano-ledger-specs\1\0\1\6c\19~/.config/nvim\23startify_bookmarks\1\2\0\0\16   Commands\1\0\1\ttype\rcommands\1\2\0\0\17   Bookmarks\1\0\1\ttype\14bookmarks\1\2\0\0\16   Sessions\1\0\1\ttype\rsessions\1\2\0\0\v   MRU\1\0\1\ttype\nfiles\vheader\vgetcwd\afn\f   MRU \1\0\1\ttype\bdir\19startify_lists\1\a\0\0009                                  __                9     ___     ___    ___   __  __ /\\_\\    ___ ___    9    / _ `\\  / __`\\ / __`\\/\\ \\/\\ \\\\/\\ \\  / __` __`\\  9   /\\ \\/\\ \\/\\  __//\\ \\_\\ \\ \\ \\_/ |\\ \\ \\/\\ \\/\\ \\/\\ \\ 9   \\ \\_\\ \\_\\ \\____\\ \\____/\\ \\___/  \\ \\_\\ \\_\\ \\_\\ \\_\\9    \\/_/\\/_/\\/____/\\/___/  \\/__/    \\/_/\\/_/\\/_/\\/_/\27startify_custom_header\27startify_change_to_dir\6g\bvim\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2�\5\0\0\6\0\28\0K4\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0'\1\1\0:\1\6\0004\0\a\0%\1\b\0>\0\2\0027\0\t\0004\1\0\0007\1\1\0012\2\b\0003\3\v\0\16\4\0\0%\5\f\0>\4\2\2:\4\r\3;\3\1\0023\3\14\0\16\4\0\0%\5\f\0>\4\2\2:\4\r\3;\3\2\0023\3\15\0\16\4\0\0%\5\f\0>\4\2\2:\4\r\3;\3\3\0023\3\16\0\16\4\0\0%\5\17\0>\4\2\2:\4\r\3;\3\4\0023\3\18\0\16\4\0\0%\5\19\0>\4\2\2:\4\r\3;\3\5\0023\3\20\0\16\4\0\0%\5\21\0>\4\2\2:\4\r\3;\3\6\0023\3\22\0\16\4\0\0%\5\23\0>\4\2\2:\4\r\3;\3\a\2:\2\n\0014\1\0\0007\1\1\0013\2\25\0:\2\24\0014\1\0\0007\1\26\1%\2\27\0>\1\2\1G\0\1\0-autocmd FileType LuaTree setlocal nowrap\bcmd\1\0\2\fdefault\b\fsymlink\b\20nvim_tree_icons\fpreview\1\0\1\bkey\6=\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\1\0\1\bkey\t<cr>\1\0\1\bkey\6o\acb\tedit\1\0\1\bkey\6l\23nvim_tree_bindings\23nvim_tree_callback\21nvim-tree.config\frequire\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\1\4\0\0\t.git\17node_modules\v.cache\21nvim_tree_ignore\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: indentLine
time([[Config for indentLine]], true)
try_loadstring("\27LJ\1\2�\1\0\0\2\0\b\0\0174\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0G\0\1\0\1\r\0\0\thelp\rnerdtree\rstartify\fPreview\f__doc__\rpeekaboo\bman\ntrans\bfzf\rmarkdown\blog\rterminal\31indentLine_fileTypeExclude\25indentLine_setColors\22indentLine_faster\b▏\20indentLine_char\6g\bvim\0", "config", "indentLine")
time([[Config for indentLine]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring('\27LJ\1\2_\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\3\texpr\2\vsilent\2\fnoremap\2\6i\20nvim_set_keymap\bapi\bvim�\1\0\0\5\0\b\2\0304\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\2\21\0\0\0\b\0\1\0T\1\16�4\1\0\0007\1\1\0017\1\4\1%\2\3\0>\1\2\2\16\2\1\0007\1\5\1\16\3\0\0\16\4\0\0>\1\4\2\16\2\1\0007\1\6\1%\3\a\0>\1\3\2\15\0\1\0T\2\3�)\1\2\0H\1\2\0T\1\2�)\1\1\0H\1\2\0G\0\1\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0�\6\1\0\5\0\31\0.4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\5\0003\3\4\0:\3\6\0023\3\b\0003\4\a\0:\4\t\3:\3\n\0023\3\f\0003\4\v\0:\4\t\3:\3\r\0023\3\15\0003\4\14\0:\4\t\3:\3\16\2:\2\17\1>\0\2\0011\0\18\0001\1\19\0005\1\20\0\16\1\0\0%\2\21\0%\3\22\0>\1\3\1\16\1\0\0%\2\23\0%\3\24\0>\1\3\1\16\1\0\0%\2\25\0%\3\26\0>\1\3\1\16\1\0\0%\2\27\0%\3\28\0>\1\3\1\16\1\0\0%\2\29\0%\3\30\0>\1\3\1G\0\1\0Tpumvisible() ? "<C-p>" : v:lua.Check_backspace() ? "<S-Tab>" : compe#complete()\f<S-Tab>Rpumvisible() ? "<C-n>" : v:lua.Check_backspace() ? "<Tab>" : compe#complete()\n<Tab>\25compe#close("<C-e>")\n<C-e>\26compe#confirm("<CR>")\t<CR>\21compe#complete()\14<C-Space>\20Check_backspace\0\0\vsource\18collaborators\1\0\0\1\2\0\0\14gitcommit\nemoji\1\0\0\1\4\0\0\14gitcommit\ttext\rmarkdown\vbuffer\14filetypes\1\0\0\1\2\0\0\bcoq\rnvim_lsp\1\0\5\ttags\2\tpath\2\rnvim_lua\2\tcalc\2\ftabnine\2\1\0\1\rpriority\3��\6\1\0\t\17autocomplete\2\19source_timeout\3�\1\fenabled\2\ndebug\1\14preselect\venable\21incomplete_delay\3�\3\15min_length\3\1\18throttle_time\3P\18documentation\2\nsetup\ncompe\frequire\0', "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: vim-gruvbox8
time([[Config for vim-gruvbox8]], true)
try_loadstring("\27LJ\1\2�\3\0\0\2\0\15\0,4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0'\1\1\0:\1\6\0004\0\0\0007\0\1\0'\1\1\0:\1\a\0004\0\0\0007\0\1\0'\1\1\0:\1\b\0004\0\0\0007\0\1\0'\1\1\0:\1\t\0004\0\0\0007\0\1\0'\1\0\0:\1\n\0004\0\0\0007\0\1\0'\1\1\0:\1\v\0004\0\0\0007\0\1\0'\1\1\0:\1\f\0004\0\r\0%\1\14\0>\0\2\1G\0\1\0\27modules.colors.gruvbox\frequire\22gruvbox_undercurl\29gruvbox_plugin_hi_groups\20gruvbox_italics\27gruvbox_invert_tabline\25gruvbox_invert_signs\30gruvbox_improved_warnings\29gruvbox_improved_strings\31gruvbox_filetype_hi_groups\tsoft\27gruvbox_contrast_light\17gruvbox_bold\6g\bvim\0", "config", "vim-gruvbox8")
time([[Config for vim-gruvbox8]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\1\0029\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2�\1\0\0\4\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\b\0003\2\3\0003\3\4\0:\3\5\0023\3\6\0:\3\a\2:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\15extensions\1\3\0\0\rfugitive\14nvim-tree\foptions\1\0\0\23section_separators\1\3\0\0\5\5\25component_separators\1\3\0\0\6|\6|\1\0\2\18icons_enabled\2\ntheme\fgruvbox\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\1\2�\1\0\0\3\0\5\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0002\2\0\0:\2\4\1>\0\2\1G\0\1\0\20shade_filetypes\1\0\a\20shade_terminals\2\17open_mapping\15<Leader>tt\17persist_size\2\20insert_mappings\1\tsize\3P\14direction\rvertical\20start_in_insert\2\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Ghcid lua require("packer.load")({'ghcid'}, { cmd = "Ghcid", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file GhcidKill lua require("packer.load")({'ghcid'}, { cmd = "GhcidKill", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Rg lua require("packer.load")({'vim-ripgrep'}, { cmd = "Rg", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType gitcommit ++once lua require("packer.load")({'collaborators.vim'}, { ft = "gitcommit" }, _G.packer_plugins)]]
vim.cmd [[au FileType haskell ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "haskell" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType coq ++once lua require("packer.load")({'Coqtail'}, { ft = "coq" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/zach/.local/share/nvim/site/pack/packer/opt/Coqtail/ftdetect/coq.vim]], true)
vim.cmd [[source /home/zach/.local/share/nvim/site/pack/packer/opt/Coqtail/ftdetect/coq.vim]]
time([[Sourcing ftdetect script at: /home/zach/.local/share/nvim/site/pack/packer/opt/Coqtail/ftdetect/coq.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end