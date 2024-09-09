return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions

		null_ls.setup({
			sources = {
				-- Lua
				formatting.stylua,
				
				-- Git
				code_actions.gitsigns,
				
				-- Elixir	
				diagnostics.credo,
				
				-- diagnostics.eslint.with({
				-- 	condition = function(utils)
				-- 		return utils.root_has_file("package.json")
				-- 	end,
				-- }),
				
				table.unpack(
					require("language").null_ls.setup(null_ls)
				),
			},
		})
		vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
