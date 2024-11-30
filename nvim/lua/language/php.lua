return {
	mason = { "intelephense", },
	
	lsp = function(lspconfig, capabilities, on_attach)
		lspconfig.intelephense.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = lspconfig.util.root_pattern("composer.json", ".git", "index.php"),
			filetypes = { "php" },
		})
	end
}
