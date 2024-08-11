return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Elixir
				null_ls.builtins.diagnostics.credo,

				-- Go
				-- null_ls.builtins.formatting.gofmt,
				null_ls.builtins.diagnostics.staticcheck,

				-- Java
				-- null_ls.builtins.diagnostics.jdtls,

				-- null_ls.builtins.diagnostics.eslint.with({
				-- 	condition = function(utils)
				-- 		return utils.root_has_file("package.json")
				-- 	end,
				-- }),
			},
		})
		vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
