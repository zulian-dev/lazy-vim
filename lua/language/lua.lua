local lualang = {}



--------------------------------------------------------------------------------
-- Mason -----------------------------------------------------------------------
--------------------------------------------------------------------------------

lualang.mason = {
  "stylua",
  "lua_ls",
}



--------------------------------------------------------------------------------
-- LSP -------------------------------------------------------------------------
--------------------------------------------------------------------------------

lualang.lsp = function(lspconfig, capabilities, on_attach)
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "lua" },
  })
end



--------------------------------------------------------------------------------
-- Null LS ---------------------------------------------------------------------
--------------------------------------------------------------------------------

lualang.null_ls = function(null_ls)
  return {
    null_ls.builtins.formatting.stylua,
  }
end



return lualang