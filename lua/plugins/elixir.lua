return {
	{
		"elixir-lsp/elixir-ls",
		build = "asdf install && mix deps.get && mix compile && mix elixir_ls.release2 -o dist",
	},
}
