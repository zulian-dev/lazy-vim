local css = {}

css.plugins = {
  {"ap/vim-css-color"}
}

css.mason = {
   "tailwindcss",
 }

css.lsp = function(lspconfig, capabilities, on_attach)
  lspconfig.tailwindcss.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html", "elixir", "eelixir", "heex" },

    init_options = {
      userLanguages = {
        elixir = "html-eex",
        eelixir = "html-eex",
        heex = "html-eex",
      },
    },

    --  		settings = {
    --  			tailwindCSS = {
    --  				experimental = {
    --  					classRegex = {
    --  						'class[:]\\s*"([^"]*)"',
    --  					},
    --  				},
    --  			},
    --  		},
  })
end

return css
