local elixir = {}



--------------------------------------------------------------------------------
-- Plugins ---------------------------------------------------------------------
--------------------------------------------------------------------------------

elixir.plugins = {
  {
		"elixir-lsp/elixir-ls",
		build = "asdf install && mix deps.get && mix compile && mix elixir_ls.release2 -o dist",
	}
}



--------------------------------------------------------------------------------
-- LSP -------------------------------------------------------------------------
--------------------------------------------------------------------------------

elixir.lsp = function(lspconfig, capabilities, on_attach)
  lspconfig.elixirls.setup({
    cmd = { vim.fn.expand("$MASON/bin/elixir-ls") },
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "elixir" },
  })
  -- 	lspconfig.nextls.setup({
  -- 		capabilities = capabilities,
  -- 		on_attach = on_attach,
  -- 		cmd = { "~/.cache/elixir-tools/nextls/bin/nextls" },
  -- 		filetypes = { "elixir" },
  -- 	})
end



--------------------------------------------------------------------------------
-- Null LS ---------------------------------------------------------------------
--------------------------------------------------------------------------------

elixir.null_ls = function(null_ls)
  return {
    null_ls.builtins.diagnostics.credo,
  }
end



--------------------------------------------------------------------------------
-- Options ---------------------------------------------------------------------
--------------------------------------------------------------------------------

-- elixir.options = function()
--   --
-- end



return elixir