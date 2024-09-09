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

return {
	-- { "elixir-editors/vim-elixir" },
	{
		"schrieveslaach/sonarlint.nvim",
		url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
		lazy = true,
		dependencies = {
			"mfussenegger/nvim-jdtls",
		},
		ft = enable_solar_languages,
	},

	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
	
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		ensure_installed = {
			"lua_ls",
			"elixirls",
			"gopls",
			"rust_analyzer",
			"clojure_lsp",

			-- Javascript
			"typescript-language-server",
			"html",

			-- JAVA
			"jdtls",
			"sonarlint-language-server",
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

			local function on_attach(client, bufnr)
				local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
				--if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
						-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead

						--vim.lsp.buf.formatting_sync()
						vim.lsp.buf.format({ async = false })
					end,
				})
				-- end

				-- Enable completion triggered by <c-x><c-o>
				-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "gK", vim.lsp.buf.hover, bufopts)
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
				-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "<leader>lr", ":Telescope lsp_references", bufopts)
				vim.keymap.set("n", "<leader>fm", function()
					vim.lsp.buf.format({ async = true })
				end, bufopts)
			end

			local lspconfig = require("lspconfig")
			
			require("language").lsp.setup(
				lspconfig, 
				capabilities, 
				on_attach
			)
			
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
			-- 	lspconfig.nextls.setup({
			-- 		capabilities = capabilities,
			-- 		on_attach = on_attach,
			-- 		cmd = { "~/.cache/elixir-tools/nextls/bin/nextls" },
			-- 		filetypes = { "elixir" },
			-- 	})
			lspconfig.elixirls.setup({
				cmd = { vim.fn.expand("$MASON/bin/elixir-ls") },
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "elixir" },
			})
			-- lspconfig.elixirls.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	cmd = { "/opt/homebrew/Cellar/elixir-ls/0.21.3/libexec/language_server.sh" },
			-- 	filetypes = { "elixir" },
			-- })
			
			lspconfig.clojure_lsp.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				--filetypes = { "clojure", "clojurescript" },
				cmd = { "/opt/homebrew/bin/clojure-lsp" },
				-- on_attach = function(client, bufnr)
				-- 	vim.keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true })
				-- end,
			})

			lspconfig.snyk_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = enable_snyk_languages,
			})
			
			-- -- markdown
			-- lspconfig.marksman.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { "markdown" },
			-- })
			
			-- markdown
			-- lspconfig.markdownlint.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { "markdown" },
			-- })
			
			-- lspconfig.textlsp.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { "markdown" },
			-- })
			-- [WARN][2024-08-21 19:40:55] ...lsp/handlers.lua:135	"The language server remark_ls triggers a registerCapability handler for workspace/didChangeConfiguration despite dynamicRegistration set to false. Report upstream, this warning is harmless"

			
			
			-- lspconfig.remark_ls.setup({
			-- 	settings = {
			-- 		remark = {
			-- 			requireConfig = false
			-- 		}
			-- 	},
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { "markdown" },
			-- 	-- command = "~/.local/share/nvim/mason/bin/remark-language-server --stdio"
			-- })
			-- lspconfig.prettier.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { "markdown" },
			-- })
			-- lspconfig.markdown_oxide.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { "markdown" },
			-- })
			-- lspconfig["markdown-toc"].setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { "markdown" },
			-- })
			
			-- lspconfig.dprint.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { "markdown" },
			-- })
			
			
			

			-- local snyk_token = os.getenv('SNYK_TOKEN')
			-- if snyk_token and #snyk_token > 0 then
			-- 	lspconfig.snyk_ls.setup {
			-- 		init_options = {
			-- 			integrationName = 'nvim',
			-- 			token = snyk_token,
			-- 			activateSnykCodeQuality = 'true',
			-- 			trustedFolders = {
			-- 				uv.os_homedir() .. '/.config',
			-- 				uv.os_homedir() .. '/.local',
			-- 				uv.os_homedir() .. '/projects',
			-- 				uv.os_homedir() .. '/programming',
			-- 			},
			-- 		}
			-- 	}
			-- end

			
			lspconfig.gdscript.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes =  { "gd" },
			})

			require("sonarlint").setup({
				server = {
					cmd = {
						"sonarlint-language-server",
						-- Ensure that sonarlint-language-server uses stdio channel
						"-stdio",
						"-analyzers",
						-- paths to the analyzers you need, using those for python and java in this example
						-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
						-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonargo.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarhtml.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarxml.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonariac.jar"), -- docker, k8s, terraform
					},
				},
				filetypes = enable_solar_languages,
			})

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
					-- print(vim.diagnostic.get_virtual_text(0))
					vim.diagnostic.open_float(nil, { focus = false })
					-- vim.lsp.buf.hover()
				end,
			})
		end,
	},
}
