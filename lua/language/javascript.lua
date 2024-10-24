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
	"astro",
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
		"ap/vim-css-color",
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		settings = {
			-- spawn additional tsserver instance to calculate diagnostics on it
			separate_diagnostic_server = true,
			-- "change"|"insert_leave" determine when the client asks the server about diagnostic
			publish_diagnostic_on = "insert_leave",
			-- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
			-- "remove_unused_imports"|"organize_imports") -- or string "all"
			-- to include all supported code actions
			-- specify commands exposed as code_actions
			expose_as_code_action = {},
			-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
			-- not exists then standard path resolution strategy is applied
			tsserver_path = nil,
			-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
			-- (see 💅 `styled-components` support section)
			tsserver_plugins = {},
			-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
			-- memory limit in megabytes or "auto"(basically no limit)
			tsserver_max_memory = "auto",
			-- described below
			tsserver_format_options = {},
			tsserver_file_preferences = {},
			-- locale of all tsserver messages, supported locales you can find here:
			-- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
			tsserver_locale = "en",
			-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
			complete_function_calls = false,
			include_completions_with_insert_text = true,
			-- CodeLens
			-- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
			-- possible values: ("off"|"all"|"implementations_only"|"references_only")
			code_lens = "off",
			-- by default code lenses are displayed on all referencable values and for some of you it can
			-- be too much this option reduce count of them by removing member references from lenses
			disable_member_code_lens = true,
			-- JSXCloseTag
			-- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
			-- that maybe have a conflict if enable this feature. )
			jsx_close_tag = {
				enable = false,
				filetypes = { "javascriptreact", "typescriptreact" },
			},
		},
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
	"emmet_ls",
	"tailwindcss",
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
		filetypes = {
			"css",
			"eruby",
			"html",
			"javascript",
			"javascriptreact",
			"less",
			"sass",
			"scss",
			"pug",
			"typescriptreact",
		},
		-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
		-- **Note:** only the options listed in the table are supported.
		init_options = {},
	})

	lspconfig.tsserver.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = typescript_filetypes,
		--filetypes = javascript_filetypes,
		cmd = { vim.fn.expand("$MASON/bin/typescript-language-server"), "--stdio" },
	})

	lspconfig.html.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "html", "heex" },
	})

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
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		filetypes = { "html", "css", "elixir", "eelixir", "heex" },
	})
end

--------------------------------------------------------------------------------
-- Null LS ---------------------------------------------------------------------
--------------------------------------------------------------------------------

javascript.null_ls = function(null_ls, formatting, diagnostics, completion, hover)
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
