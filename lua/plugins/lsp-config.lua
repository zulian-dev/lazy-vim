return {
	{
		"elixir-editors/vim-elixir",
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		ensure_installed = {
			"html",
			"lua_ls",
			"elixirls",
			"gopls",
			"rust_analyzer",
			"clojure_lsp",
		},
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local function on_attach(_, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				-- vim.keymap.set("n", "gK", vim.lsp.buf.hover, bufopts)
				-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				-- vim.keymap.set("n", "gS", vim.lsp.buf.signature_help, bufopts)
				-- vim.keymap.set("n", "rn", vim.lsp.buf.rename, bufopts)
				-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				-- vim.keymap.set("n", "<space>wl", function()
				-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				-- end, bufopts)
				-- vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, bufopts)
				-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "<leader>lr", ":Telescope lsp_references", bufopts)
				vim.keymap.set("n", "<leader>fm", function()
					vim.lsp.buf.format({ async = true })
				end, bufopts)
			end

			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
			})
			lspconfig.html.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "html" },
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "lua" },
			})
			lspconfig.elixirls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = { "/opt/homebrew/bin/elixir-ls" },
				filetypes = { "elixir" },
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "go" },
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "rust" },
			})
			lspconfig.clojure_lsp.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				--filetypes = { "clojure", "clojurescript" },
				cmd = { "/opt/homebrew/bin/clojure-lsp" },
				-- on_attach = function(client, bufnr)
				-- 	vim.keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true })
				-- end,
			})
			-- lspconfig.cljfmt.setup({
			-- capabilities = capabilities,
			-- filetypes = { "clojure", "clojurescript" },
			--})

			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			-- vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})

			-- Editor settings for LSP custom signs
			local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Dialog box for LSP visual setup
			-- vim.diagnostic.config({
			-- 	virtual_text = true,
			-- 	signs = true,
			-- 	underline = true,
			-- 	update_in_insert = false,
			-- 	severity_sort = false,
			-- })

			vim.diagnostic.config({
				-- Show diagnostic message using virtual text.
				virtual_text = false,
				-- Show a sign next to the line with a diagnostic.
				signs = true,
				-- Update diagnostics while editing in insert mode.
				update_in_insert = true,
				-- Use an underline to show a diagnostic location.
				underline = true,
				-- Order diagnostics by severity.
				severity_sort = false,
				-- Show diagnostic messages in floating windows.
				float = {
					border = "rounded",
					source = true,
					-- source = "always",
					-- header = '',
					-- prefix = '',
					-- Credit: https://github.com/jessarcher/dotfiles/blob/master/nvim/lua/user/plugins/lspconfig.lua
					format = function(diagnostic)
						if diagnostic.user_data ~= nil and diagnostic.user_data.lsp.code ~= nil then
							return string.format("%s: %s", diagnostic.user_data.lsp.code, diagnostic.message)
						end
						return diagnostic.message
					end,
				},
			})

			-- to show full diagnostic message on hover line diagnostic
			-- You will likely want to reduce updatetime which affects CursorHold
			-- note: this setting is global and should be set only once
			vim.o.updatetime = 250
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
				callback = function()
					vim.diagnostic.open_float(nil, { focus = false })
				end,
			})
		end,
	},
}
