local javascript = {}
-- Install script 
-- https://github.com/hrsh7th/vscode-langservers-extracted
-- npm i -g vscode-langservers-extracted



local javascript_filetypes = { 
  "js",
  "javascript", 
  "javascriptreact", 
  "javascript.jsx", 
  "typescript", 
  "typescriptreact", 
  "typescript.tsx", 
  "vue", 
  "svelte", 
  "astro"
}

local typescript_filetypes = { 
  "typescript", 
  "typescriptreact", 
  "typescript.tsx", 
}


--------------------------------------------------------------------------------
-- Plugins ---------------------------------------------------------------------
--------------------------------------------------------------------------------

javascript.plugins = { 
  {
    "ap/vim-css-color"
  },
}



--------------------------------------------------------------------------------
-- Mason -----------------------------------------------------------------------
--------------------------------------------------------------------------------

javascript.mason = {
  -- "eslint_d",
  -- "eslint_lsp",
  "eslint-lsp",
  "prettier",
  "tsserver",
  "typescript-language-server",
  "html",
  "emmet-language-server",
}



--------------------------------------------------------------------------------
-- LSP -------------------------------------------------------------------------
--------------------------------------------------------------------------------

javascript.lsp = function(lspconfig, capabilities, on_attach)
  
  -- from:  `npm i -g vscode-langservers-extracted`
  lspconfig.eslint.setup({
    filetypes = javascript_filetypes,
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "vscode-eslint-language-server", "--stdio" },
  })
  
  lspconfig.emmet_language_server.setup({
    filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
    -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
    -- **Note:** only the options listed in the table are supported.
    init_options = {}
  })
  
  lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    -- filetypes = typescript_filetypes,
    filetypes = javascript_filetypes,
  })
  
  lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html" },
  })
  
  -- lspconfig.eslint_d.setup({
  --   capabilities = capabilities,
  --   on_attach = on_attach,
  --   filetypes = { "js" },
  -- })
end



--------------------------------------------------------------------------------
-- Null LS ---------------------------------------------------------------------
--------------------------------------------------------------------------------

javascript.null_ls = function(null_ls)
  local dynamic_command_function = function(params)
    return command_resolver.from_yarn_pnp(params)
      or command_resolver.from_node_modules(params)
      or vim.fn.executable(params.command) == 1 and params.command
  end
  
  return {
    -- null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.diagnostics.eslint_d,
    -- null_ls.builtins.diagnostics.eslint.with({
    --   condition = function(utils)
    --     return utils.root_has_file("package.json")
    --   end,
    -- }),
    -- null_ls.builtins.diagnostics.eslint.with({
    --   dynamic_command = dynamic_command_function,
    -- }),
    -- null_ls.builtins.formatting.eslint,
    -- null_ls.builtins.code_actions.eslint,
    -- null_ls.builtins.diagnostics.eslint,
  }
  
  
end



--------------------------------------------------------------------------------
-- Options ---------------------------------------------------------------------
--------------------------------------------------------------------------------

javascript.options = function()
  -- local lspconfig = require "lspconfig"

  -- -- Eslint auto fix command
  -- if lspconfig.eslint then
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     pattern = { "*.tsx", "*.ts", "*.jsx", "*.js", "*.vue", "*.svelte", "*.astro" },
  --     command = "silent! EslintFixAll",
  --     group = vim.api.nvim_create_augroup("MyAutocmdsForEslintAutoFix", {}),
  --   })
  -- end
end

return javascript

