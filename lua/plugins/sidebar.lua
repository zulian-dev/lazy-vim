return {
	{
		"sidebar-nvim/sidebar.nvim",
		enabled = false,
		dependencies = { "sidebar-nvim/sections-dap" },
		branch = "dev",
		lazy = false,
		config = function()
			require("sidebar-nvim").setup({
				disable_default_keybindings = 0,
				bindings = nil,
				open = true,
				side = "left",
				initial_width = 35,
				hide_statusline = false,
				update_interval = 1000,
				sections = {
					"files",
					"git",
					require("dap-sidebar-nvim.breakpoints"),
					"symbols",
					"diagnostics",
					-- "files",
					"todos",
				},
				todos = {
					initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
				},
				diagnostics = {
					icon = "",
				},

				section_separator = { "", "-----", "" },
				section_title_separator = { "" },
				containers = {
					attach_shell = "/bin/sh",
					show_all = true,
					interval = 5000,
				},
				-- datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
				-- todos = { ignored_paths = { "~" } },
			})
		end,
	},
}
