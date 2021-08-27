return function()
    require('modules.lsp.langserver')()
    require('modules.lsp.diagnostic')()

    -- lightbulb
    vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    vim.fn.sign_define('LightBulbSign', { text = "", texthl = "Type", linehl="", numhl="" })

    -- rust
    vim.cmd [[autocmd FileType rust lua require('rust-tools').setup({})]]
end
