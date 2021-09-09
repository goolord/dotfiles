return function ()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = true,
        virtual_text = {spacing = 2, prefix = '❰'},
        underline = true,
        update_in_insert = true
    })
    local sign = vim.fn.sign_define

    sign("LspDiagnosticsSignError"      , {text = "ﰸ ", texthl = "LspDiagnosticsDefaultError"      , linehl = "NONE"})
    sign("LspDiagnosticsSignWarning"    , {text = " ", texthl = "LspDiagnosticsDefaultWarning"    , linehl = "NONE"})
    sign("LspDiagnosticsSignInformation", {text = " ", texthl = "LspDiagnosticsDefaultInformation", linehl = "NONE"})
    sign("LspDiagnosticsSignHint"       , {text = " ", texthl = "LspDiagnosticsDefaultHint"       , linehl = "NONE"})
end
