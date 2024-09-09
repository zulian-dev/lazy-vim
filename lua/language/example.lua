local exampleLang = {}



--------------------------------------------------------------------------------
-- Plugins ---------------------------------------------------------------------
--------------------------------------------------------------------------------

-- exampleLang.plugins = {
--   {
--     "exampleGit/examplePlugin",
--     ft = { "exampleLang" },
--     config = function()
--       exampleSetup()
--     end,
--   },
-- }



--------------------------------------------------------------------------------
-- LSP -------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- exampleLang.lsp = function(lspconfig, capabilities, on_attach)
--   lspconfig.exampleLangLsp.setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     filetypes = { "exampleLang" },
--   })
-- end



--------------------------------------------------------------------------------
-- Null LS ---------------------------------------------------------------------
--------------------------------------------------------------------------------

-- exampleLang.null_ls = function(null_ls)
--   return {
--     null_ls.builtins.formatting.exampleLangFormatter,
--     null_ls.builtins.diagnostics.exampleLangLint,
--     null_ls.builtins.code_actions.exampleLangCodeActions,
--   }
-- end



--------------------------------------------------------------------------------
-- Options ---------------------------------------------------------------------
--------------------------------------------------------------------------------

-- markdown.options = function()
--   vim.api.nvim_create_autocmd("FileType", {
--     pattern = {"exampleLang"},
--     callback = function()
--       vim.cmd([[ set exampleLang=exampleLang ]])
--     end
--   })
-- end



return exampleLang
