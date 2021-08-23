return function()
    require"toggleterm".setup {
      size = 80,
      open_mapping = [[<Leader>tt]],
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
      insert_mappings = false,
      direction = 'vertical',
    }
end
