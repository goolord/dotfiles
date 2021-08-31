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
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cmp-tabnine"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  ["collaborators.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/collaborators.vim"
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
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2¯\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\21filetype_exclude\1\r\0\0\thelp\rnerdtree\rstartify\fPreview\f__doc__\rpeekaboo\bman\ntrans\bfzf\rmarkdown\blog\rterminal\1\0\3\tchar\b‚ñè\28show_first_indent_level\1#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2‹\1\0\0\4\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\b\0003\2\3\0003\3\4\0:\3\5\0023\3\6\0:\3\a\2:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\15extensions\1\3\0\0\rfugitive\14nvim-tree\foptions\1\0\0\23section_separators\1\3\0\0\5\5\25component_separators\1\3\0\0\6|\6|\1\0\2\18icons_enabled\2\ntheme\fgruvbox\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2;\0\1\3\0\4\0\0064\1\0\0007\1\1\0017\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\20vsnip#anonymous\afn\bvim:\0\2\4\1\3\0\a+\2\0\0007\2\1\0027\2\2\0027\3\0\0016\2\3\2:\2\0\1H\1\2\0\1¿\fdefault\fpresets\tkindÅ\6\1\0\b\0.\0W4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\2\3\0003\3\a\0003\4\5\0001\5\4\0:\5\6\4:\4\b\0033\4\n\0001\5\t\0:\5\v\4:\4\f\0033\4\r\0:\4\14\0033\4\17\0007\5\15\0007\5\16\5>\5\1\2:\5\18\0047\5\15\0007\5\19\5>\5\1\2:\5\20\0047\5\15\0007\5\21\5'\6¸ˇ>\5\2\2:\5\22\0047\5\15\0007\5\21\5'\6\4\0>\5\2\2:\5\23\0047\5\15\0007\5\24\5>\5\1\2:\5\25\0047\5\15\0007\5\26\5>\5\1\2:\5\27\0047\5\15\0007\5\28\0053\6\31\0007\a\29\0007\a\30\a:\a \6>\5\2\2:\5!\0047\5\15\0007\6\15\0007\6\19\6>\6\1\0023\a\"\0>\5\3\2:\5#\0047\5\15\0007\6\15\0007\6\16\6>\6\1\0023\a$\0>\5\3\2:\5%\4:\4\15\0032\4\b\0003\5&\0;\5\1\0043\5'\0;\5\2\0043\5(\0;\5\3\0043\5)\0;\5\4\0043\5*\0;\5\5\0043\5+\0;\5\6\0043\5,\0;\5\a\4:\4-\3>\2\2\0010\0\0ÄG\0\1\0\fsources\1\0\1\tname\18collaborators\1\0\1\tname\nvsnip\1\0\1\tname\tcalc\1\0\1\tname\tpath\1\0\1\tname\ttags\1\0\1\tname\rnvim_lsp\1\0\1\tname\16cmp_tabnine\f<S-Tab>\1\3\0\0\6i\6s\n<Tab>\1\3\0\0\6i\6s\t<CR>\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15completion\1\0\1\15trim_match\1\15formatting\vformat\1\0\0\0\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\flspkind\bcmp\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2•\2\0\0\3\0\n\0\0194\0\0\0%\1\1\0>\0\2\2>\0\1\0014\0\0\0%\1\2\0>\0\2\2>\0\1\0014\0\3\0007\0\4\0%\1\5\0>\0\2\0014\0\3\0007\0\6\0007\0\a\0%\1\b\0003\2\t\0>\0\3\1G\0\1\0\1\0\4\vtexthl\tType\ttext\bÔ†¥\vlinehl\5\nnumhl\5\18LightBulbSign\16sign_define\afnTautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\27modules.lsp.diagnostic\27modules.lsp.langserver\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\1\2˛\1\0\0\3\0\t\1\0144\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0002\2\0\0:\2\4\0014\2\5\0007\2\6\0027\2\a\2\22\2\0\2:\2\b\1>\0\2\1G\0\1\0\tsize\fcolumns\6o\bvim\20shade_filetypes\1\0\a\20shade_terminals\2\17open_mapping\15<Leader>tt\14direction\rvertical\17persist_size\2\20insert_mappings\1\17hide_numbers\2\20start_in_insert\1\nsetup\15toggleterm\frequire\1ÄÄÄˇ\3\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2∫\5\0\0\6\0\28\0K4\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0'\1\1\0:\1\6\0004\0\a\0%\1\b\0>\0\2\0027\0\t\0004\1\0\0007\1\1\0012\2\b\0003\3\v\0\16\4\0\0%\5\f\0>\4\2\2:\4\r\3;\3\1\0023\3\14\0\16\4\0\0%\5\f\0>\4\2\2:\4\r\3;\3\2\0023\3\15\0\16\4\0\0%\5\f\0>\4\2\2:\4\r\3;\3\3\0023\3\16\0\16\4\0\0%\5\17\0>\4\2\2:\4\r\3;\3\4\0023\3\18\0\16\4\0\0%\5\19\0>\4\2\2:\4\r\3;\3\5\0023\3\20\0\16\4\0\0%\5\21\0>\4\2\2:\4\r\3;\3\6\0023\3\22\0\16\4\0\0%\5\23\0>\4\2\2:\4\r\3;\3\a\2:\2\n\0014\1\0\0007\1\1\0013\2\25\0:\2\24\0014\1\0\0007\1\26\1%\2\27\0>\1\2\1G\0\1\0.autocmd FileType NvimTree setlocal nowrap\bcmd\1\0\2\fdefault\bÓòí\fsymlink\bÔíÅ\20nvim_tree_icons\fpreview\1\0\1\bkey\6=\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\1\0\1\bkey\t<cr>\1\0\1\bkey\6o\acb\tedit\1\0\1\bkey\6l\23nvim_tree_bindings\23nvim_tree_callback\21nvim-tree.config\frequire\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\1\4\0\0\t.git\17node_modules\v.cache\21nvim_tree_ignore\6g\bvim\0" },
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
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
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
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-lsp-handlers.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/telescope-lsp-handlers.nvim"
  },
  ["telescope.nvim"] = {
    config = { '\27LJ\1\2¥\5\0\0\v\0%\00044\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0023\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0027\3\n\0003\4\21\0003\5\v\0:\2\f\0053\6\18\0003\a\14\0007\b\r\1:\b\15\a7\b\16\1:\b\17\a:\a\19\6:\6\20\5:\5\22\0043\5\24\0003\6\23\0:\6\25\0053\6 \0003\a\31\0004\b\0\0%\t\26\0>\b\2\0027\b\27\b3\t\28\0:\2\f\t3\n\29\0:\n\30\t>\b\2\2:\b\1\a:\a!\6:\6"\5:\5#\4>\3\2\0017\3$\0%\4\25\0>\3\2\0017\3$\0%\4"\0>\3\2\1G\0\1\0\19load_extension\15extensions\17lsp_handlers\16code_action\1\0\0\1\0\0\18layout_config\1\0\1\nwidth\0037\1\0\0\15get_cursor\21telescope.themes\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\rdefaults\1\0\0\rmappings\6n\1\0\0\6G\19move_to_bottom\agg\1\0\0\16move_to_top\16borderchars\1\0\5\18preview_title\1\18results_title\1\26dynamic_preview_title\2\17prompt_title\1\vborder\2\nsetup\fpreview\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \vprompt\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \fresults\1\0\0\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \22telescope.actions\14telescope\frequire\0' },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\1\0029\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gruvbox8"] = {
    config = { "\27LJ\1\2∫\3\0\0\2\0\15\0,4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0'\1\1\0:\1\6\0004\0\0\0007\0\1\0'\1\1\0:\1\a\0004\0\0\0007\0\1\0'\1\1\0:\1\b\0004\0\0\0007\0\1\0'\1\1\0:\1\t\0004\0\0\0007\0\1\0'\1\0\0:\1\n\0004\0\0\0007\0\1\0'\1\1\0:\1\v\0004\0\0\0007\0\1\0'\1\1\0:\1\f\0004\0\r\0%\1\14\0>\0\2\1G\0\1\0\27modules.colors.gruvbox\frequire\22gruvbox_undercurl\29gruvbox_plugin_hi_groups\20gruvbox_italics\27gruvbox_invert_tabline\25gruvbox_invert_signs\30gruvbox_improved_warnings\29gruvbox_improved_strings\31gruvbox_filetype_hi_groups\tsoft\27gruvbox_contrast_light\17gruvbox_bold\6g\bvim\0" },
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
    config = { "\27LJ\1\2ª\6\0\0\6\0\22\00004\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0003\1\4\0:\1\3\0004\0\0\0007\0\1\0002\1\6\0003\2\6\0002\3\3\0%\4\a\0004\5\0\0007\5\b\0057\5\t\5>\5\1\2$\4\5\4;\4\1\3:\3\n\2;\2\1\0013\2\v\0003\3\f\0:\3\n\2;\2\2\0013\2\r\0003\3\14\0:\3\n\2;\2\3\0013\2\15\0003\3\16\0:\3\n\2;\2\4\0013\2\17\0003\3\18\0:\3\n\2;\2\5\1:\1\5\0004\0\0\0007\0\1\0002\1\3\0003\2\20\0;\2\1\0013\2\21\0;\2\2\1:\1\19\0G\0\1\0\1\0\1\6l$~/Dev/iohk/cardano-ledger-specs\1\0\1\6c\19~/.config/nvim\23startify_bookmarks\1\2\0\0\16   Commands\1\0\1\ttype\rcommands\1\2\0\0\17   Bookmarks\1\0\1\ttype\14bookmarks\1\2\0\0\16   Sessions\1\0\1\ttype\rsessions\1\2\0\0\v   MRU\1\0\1\ttype\nfiles\vheader\vgetcwd\afn\f   MRU \1\0\1\ttype\bdir\19startify_lists\1\a\0\0009                                  __                9     ___     ___    ___   __  __ /\\_\\    ___ ___    9    / _ `\\  / __`\\ / __`\\/\\ \\/\\ \\\\/\\ \\  / __` __`\\  9   /\\ \\/\\ \\/\\  __//\\ \\_\\ \\ \\ \\_/ |\\ \\ \\/\\ \\/\\ \\/\\ \\ 9   \\ \\_\\ \\_\\ \\____\\ \\____/\\ \\___/  \\ \\_\\ \\_\\ \\_\\ \\_\\9    \\/_/\\/_/\\/____/\\/___/  \\/__/    \\/_/\\/_/\\/_/\\/_/\27startify_custom_header\27startify_change_to_dir\6g\bvim\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-toml"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\1\2_\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\3\texpr\2\fnoremap\2\vsilent\2\6i\20nvim_set_keymap\bapi\bvim°\1\1\0\6\0\b\0\n1\0\0\0004\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\5\0%\4\6\0003\5\a\0>\1\5\1G\0\1\0\1\0\2\texpr\2\fnoremap\1Cvsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'\n<C-l>\6i\20nvim_set_keymap\bapi\bvim\0\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  }
}

time([[Defining packer_plugins]], false)
-- Runtimepath customization
time([[Runtimepath customization]], true)
vim.o.runtimepath = vim.o.runtimepath .. ",/home/zach/.local/share/nvim/site/pack/packer/opt/ghcid/plugins/nvim"
time([[Runtimepath customization]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\1\2˛\1\0\0\3\0\t\1\0144\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0002\2\0\0:\2\4\0014\2\5\0007\2\6\0027\2\a\2\22\2\0\2:\2\b\1>\0\2\1G\0\1\0\tsize\fcolumns\6o\bvim\20shade_filetypes\1\0\a\20shade_terminals\2\17open_mapping\15<Leader>tt\14direction\rvertical\17persist_size\2\20insert_mappings\1\17hide_numbers\2\20start_in_insert\1\nsetup\15toggleterm\frequire\1ÄÄÄˇ\3\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring('\27LJ\1\2¥\5\0\0\v\0%\00044\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0023\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0027\3\n\0003\4\21\0003\5\v\0:\2\f\0053\6\18\0003\a\14\0007\b\r\1:\b\15\a7\b\16\1:\b\17\a:\a\19\6:\6\20\5:\5\22\0043\5\24\0003\6\23\0:\6\25\0053\6 \0003\a\31\0004\b\0\0%\t\26\0>\b\2\0027\b\27\b3\t\28\0:\2\f\t3\n\29\0:\n\30\t>\b\2\2:\b\1\a:\a!\6:\6"\5:\5#\4>\3\2\0017\3$\0%\4\25\0>\3\2\0017\3$\0%\4"\0>\3\2\1G\0\1\0\19load_extension\15extensions\17lsp_handlers\16code_action\1\0\0\1\0\0\18layout_config\1\0\1\nwidth\0037\1\0\0\15get_cursor\21telescope.themes\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\rdefaults\1\0\0\rmappings\6n\1\0\0\6G\19move_to_bottom\agg\1\0\0\16move_to_top\16borderchars\1\0\5\18preview_title\1\18results_title\1\26dynamic_preview_title\2\17prompt_title\1\vborder\2\nsetup\fpreview\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \vprompt\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \fresults\1\0\0\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \22telescope.actions\14telescope\frequire\0', "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\1\2ª\6\0\0\6\0\22\00004\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0003\1\4\0:\1\3\0004\0\0\0007\0\1\0002\1\6\0003\2\6\0002\3\3\0%\4\a\0004\5\0\0007\5\b\0057\5\t\5>\5\1\2$\4\5\4;\4\1\3:\3\n\2;\2\1\0013\2\v\0003\3\f\0:\3\n\2;\2\2\0013\2\r\0003\3\14\0:\3\n\2;\2\3\0013\2\15\0003\3\16\0:\3\n\2;\2\4\0013\2\17\0003\3\18\0:\3\n\2;\2\5\1:\1\5\0004\0\0\0007\0\1\0002\1\3\0003\2\20\0;\2\1\0013\2\21\0;\2\2\1:\1\19\0G\0\1\0\1\0\1\6l$~/Dev/iohk/cardano-ledger-specs\1\0\1\6c\19~/.config/nvim\23startify_bookmarks\1\2\0\0\16   Commands\1\0\1\ttype\rcommands\1\2\0\0\17   Bookmarks\1\0\1\ttype\14bookmarks\1\2\0\0\16   Sessions\1\0\1\ttype\rsessions\1\2\0\0\v   MRU\1\0\1\ttype\nfiles\vheader\vgetcwd\afn\f   MRU \1\0\1\ttype\bdir\19startify_lists\1\a\0\0009                                  __                9     ___     ___    ___   __  __ /\\_\\    ___ ___    9    / _ `\\  / __`\\ / __`\\/\\ \\/\\ \\\\/\\ \\  / __` __`\\  9   /\\ \\/\\ \\/\\  __//\\ \\_\\ \\ \\ \\_/ |\\ \\ \\/\\ \\/\\ \\/\\ \\ 9   \\ \\_\\ \\_\\ \\____\\ \\____/\\ \\___/  \\ \\_\\ \\_\\ \\_\\ \\_\\9    \\/_/\\/_/\\/____/\\/___/  \\/__/    \\/_/\\/_/\\/_/\\/_/\27startify_custom_header\27startify_change_to_dir\6g\bvim\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\1\2_\0\2\a\0\5\0\t4\2\0\0007\2\1\0027\2\2\2%\3\3\0\16\4\0\0\16\5\1\0003\6\4\0>\2\5\1G\0\1\0\1\0\3\texpr\2\fnoremap\2\vsilent\2\6i\20nvim_set_keymap\bapi\bvim°\1\1\0\6\0\b\0\n1\0\0\0004\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\5\0%\4\6\0003\5\a\0>\1\5\1G\0\1\0\1\0\2\texpr\2\fnoremap\1Cvsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'\n<C-l>\6i\20nvim_set_keymap\bapi\bvim\0\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2¯\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\21filetype_exclude\1\r\0\0\thelp\rnerdtree\rstartify\fPreview\f__doc__\rpeekaboo\bman\ntrans\bfzf\rmarkdown\blog\rterminal\1\0\3\tchar\b‚ñè\28show_first_indent_level\1#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: vim-gruvbox8
time([[Config for vim-gruvbox8]], true)
try_loadstring("\27LJ\1\2∫\3\0\0\2\0\15\0,4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0'\1\1\0:\1\6\0004\0\0\0007\0\1\0'\1\1\0:\1\a\0004\0\0\0007\0\1\0'\1\1\0:\1\b\0004\0\0\0007\0\1\0'\1\1\0:\1\t\0004\0\0\0007\0\1\0'\1\0\0:\1\n\0004\0\0\0007\0\1\0'\1\1\0:\1\v\0004\0\0\0007\0\1\0'\1\1\0:\1\f\0004\0\r\0%\1\14\0>\0\2\1G\0\1\0\27modules.colors.gruvbox\frequire\22gruvbox_undercurl\29gruvbox_plugin_hi_groups\20gruvbox_italics\27gruvbox_invert_tabline\25gruvbox_invert_signs\30gruvbox_improved_warnings\29gruvbox_improved_strings\31gruvbox_filetype_hi_groups\tsoft\27gruvbox_contrast_light\17gruvbox_bold\6g\bvim\0", "config", "vim-gruvbox8")
time([[Config for vim-gruvbox8]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\1\0029\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2‹\1\0\0\4\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\b\0003\2\3\0003\3\4\0:\3\5\0023\3\6\0:\3\a\2:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\15extensions\1\3\0\0\rfugitive\14nvim-tree\foptions\1\0\0\23section_separators\1\3\0\0\5\5\25component_separators\1\3\0\0\6|\6|\1\0\2\18icons_enabled\2\ntheme\fgruvbox\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2;\0\1\3\0\4\0\0064\1\0\0007\1\1\0017\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\20vsnip#anonymous\afn\bvim:\0\2\4\1\3\0\a+\2\0\0007\2\1\0027\2\2\0027\3\0\0016\2\3\2:\2\0\1H\1\2\0\1¿\fdefault\fpresets\tkindÅ\6\1\0\b\0.\0W4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\2\3\0003\3\a\0003\4\5\0001\5\4\0:\5\6\4:\4\b\0033\4\n\0001\5\t\0:\5\v\4:\4\f\0033\4\r\0:\4\14\0033\4\17\0007\5\15\0007\5\16\5>\5\1\2:\5\18\0047\5\15\0007\5\19\5>\5\1\2:\5\20\0047\5\15\0007\5\21\5'\6¸ˇ>\5\2\2:\5\22\0047\5\15\0007\5\21\5'\6\4\0>\5\2\2:\5\23\0047\5\15\0007\5\24\5>\5\1\2:\5\25\0047\5\15\0007\5\26\5>\5\1\2:\5\27\0047\5\15\0007\5\28\0053\6\31\0007\a\29\0007\a\30\a:\a \6>\5\2\2:\5!\0047\5\15\0007\6\15\0007\6\19\6>\6\1\0023\a\"\0>\5\3\2:\5#\0047\5\15\0007\6\15\0007\6\16\6>\6\1\0023\a$\0>\5\3\2:\5%\4:\4\15\0032\4\b\0003\5&\0;\5\1\0043\5'\0;\5\2\0043\5(\0;\5\3\0043\5)\0;\5\4\0043\5*\0;\5\5\0043\5+\0;\5\6\0043\5,\0;\5\a\4:\4-\3>\2\2\0010\0\0ÄG\0\1\0\fsources\1\0\1\tname\18collaborators\1\0\1\tname\nvsnip\1\0\1\tname\tcalc\1\0\1\tname\tpath\1\0\1\tname\ttags\1\0\1\tname\rnvim_lsp\1\0\1\tname\16cmp_tabnine\f<S-Tab>\1\3\0\0\6i\6s\n<Tab>\1\3\0\0\6i\6s\t<CR>\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15completion\1\0\1\15trim_match\1\15formatting\vformat\1\0\0\0\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\flspkind\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2∫\5\0\0\6\0\28\0K4\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0'\1\1\0:\1\6\0004\0\a\0%\1\b\0>\0\2\0027\0\t\0004\1\0\0007\1\1\0012\2\b\0003\3\v\0\16\4\0\0%\5\f\0>\4\2\2:\4\r\3;\3\1\0023\3\14\0\16\4\0\0%\5\f\0>\4\2\2:\4\r\3;\3\2\0023\3\15\0\16\4\0\0%\5\f\0>\4\2\2:\4\r\3;\3\3\0023\3\16\0\16\4\0\0%\5\17\0>\4\2\2:\4\r\3;\3\4\0023\3\18\0\16\4\0\0%\5\19\0>\4\2\2:\4\r\3;\3\5\0023\3\20\0\16\4\0\0%\5\21\0>\4\2\2:\4\r\3;\3\6\0023\3\22\0\16\4\0\0%\5\23\0>\4\2\2:\4\r\3;\3\a\2:\2\n\0014\1\0\0007\1\1\0013\2\25\0:\2\24\0014\1\0\0007\1\26\1%\2\27\0>\1\2\1G\0\1\0.autocmd FileType NvimTree setlocal nowrap\bcmd\1\0\2\fdefault\bÓòí\fsymlink\bÔíÅ\20nvim_tree_icons\fpreview\1\0\1\bkey\6=\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\1\0\1\bkey\t<cr>\1\0\1\bkey\6o\acb\tedit\1\0\1\bkey\6l\23nvim_tree_bindings\23nvim_tree_callback\21nvim-tree.config\frequire\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\1\4\0\0\t.git\17node_modules\v.cache\21nvim_tree_ignore\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ghcid lua require("packer.load")({'ghcid'}, { cmd = "Ghcid", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Rg lua require("packer.load")({'vim-ripgrep'}, { cmd = "Rg", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GhcidKill lua require("packer.load")({'ghcid'}, { cmd = "GhcidKill", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType gitcommit ++once lua require("packer.load")({'collaborators.vim'}, { ft = "gitcommit" }, _G.packer_plugins)]]
vim.cmd [[au FileType coq ++once lua require("packer.load")({'Coqtail'}, { ft = "coq" }, _G.packer_plugins)]]
vim.cmd [[au FileType haskell ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "haskell" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "lua" }, _G.packer_plugins)]]
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
