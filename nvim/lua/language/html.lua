local html = {}
-- Install script
-- https://github.com/hrsh7th/vscode-langservers-extracted
-- npm i -g vscode-langservers-extracted
local html_filetypes = {
  "html",
  "heex",
  "php",
  "elixir", "eelixir", "heex"
}


--------------------------------------------------------------------------------
-- Mason -----------------------------------------------------------------------
--------------------------------------------------------------------------------

html.mason = {
  "html",
}

--------------------------------------------------------------------------------
-- LSP -------------------------------------------------------------------------
--------------------------------------------------------------------------------

html.lsp = function(lspconfig, capabilities, on_attach)
  lspconfig.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = html_filetypes,
  })
  -- lspconfig.emmet_language_server.setup({
  -- 	filetypes = {
  -- 		"css",
  -- 		"eruby",
  -- 		"html",
  -- 		"javascript",
  -- 		"javascriptreact",
  -- 		"less",
  -- 		"sass",
  -- 		"scss",
  -- 		"pug",
  -- 		"typescriptreact",
  -- 	},
  -- 	-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- 	-- **Note:** only the options listed in the table are supported.
  -- 	init_options = {},
  -- })

  lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = html_filetypes,
  })
end

return html
