local security = {}

-- TODO: Add this config on each language
local enable_snyk_languages = {
  "go",
  "java",
  "javascript",
  "elixir",
}

local enable_solar_languages = {
  -- "php",
  -- "python",
  "html",
  "go",
  "javascript",
  "java",
  "json",
}

--------------------------------------------------------------------------------
-- Plugins ---------------------------------------------------------------------
--------------------------------------------------------------------------------

security.plugins = {
  {
    "schrieveslaach/sonarlint.nvim",
    url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    lazy = true,
    dependencies = {
      "mfussenegger/nvim-jdtls",
    },
    ft = enable_solar_languages,
  },
}

--------------------------------------------------------------------------------
-- Mason -----------------------------------------------------------------------
--------------------------------------------------------------------------------

security.mason = {
  "snyk_ls",
  -- "sonarlint-language-server",
}

--------------------------------------------------------------------------------
-- LSP -------------------------------------------------------------------------
--------------------------------------------------------------------------------

security.lsp = function(lspconfig, capabilities, on_attach)
  -- lspconfig.snyk_ls.setup({
  -- 	capabilities = capabilities,
  -- 	on_attach = on_attach,
  --	filetypes = enable_snyk_languages,
  -- })

  -- local sonarlintAnalisers = {}

  -- if sonarlintAnalisers["java"] then
  --   table.insert(
  --     sonarlintAnalisers,
  --     vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar")
  --   )
  -- end

  require("sonarlint").setup({
    server = {
      cmd = {
        "sonarlint-language-server",
        -- Ensure that sonarlint-language-server uses stdio channel
        "-stdio",
        "-analyzers",
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonargo.jar"),
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarhtml.jar"),
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarxml.jar"),
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonariac.jar"), -- docker, k8s, terraform

        -- ls ~/.local/share/nvim/mason/share/sonarlint-analyzers/
        -- sonarcfamily.jar@
        -- sonarhtml.jar@
        -- sonarjava.jar@
        -- sonarjs.jar@
        -- sonarphp.jar@
        -- sonartext.jar@
        -- sonargo.jar@
        -- sonariac.jar@
        -- sonarjavasymbolicexecution.jar@
        -- sonarlintomnisharp.jar@
        -- sonarpython.jar@
        -- sonarxml.jar@
      },
    },
    filetypes = enable_solar_languages,
  })
end

return security
