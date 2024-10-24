local elixir = {}

elixir.name = "elixir"
elixir.filetypes = { "elixir" }
elixir.fileExts = { "ex", "exs" }

--------------------------------------------------------------------------------
-- Plugins ---------------------------------------------------------------------
--------------------------------------------------------------------------------

elixir.plugins = {}

-- elixir.plugins = {
--   {
-- 		"elixir-lsp/elixir-ls",
-- 		build = "asdf install && mix deps.get && mix compile && mix elixir_ls.release2 -o dist",
-- 	}
-- }

--------------------------------------------------------------------------------
-- Mason -----------------------------------------------------------------------
--------------------------------------------------------------------------------

elixir.mason = {
	"elixir-ls",
	"credo",
	-- "nextls",
}

--------------------------------------------------------------------------------
-- LSP -------------------------------------------------------------------------
--------------------------------------------------------------------------------

elixir.lsp = function(lspconfig, capabilities, on_attach)
	lspconfig.elixirls.setup({
		cmd = { vim.fn.expand("$MASON/bin/elixir-ls") },
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = elixir.filetypes,
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
elixir.null_ls = function(null_ls, formatting, diagnostics, completion, hover)
	return {
		diagnostics.credo.with({
			filetypes = elixir.filetypes,
			method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
			command = "mix",
			args = {
				"credo",
				"suggest",
				"--strict",
				"--format",
				"json",
				"--read-from-stdin",
				"$filename",
			},
			extra_args = { "--ignore", "todo" },
		}),
	}
end

return elixir
