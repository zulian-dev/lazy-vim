return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"MaximilianLloyd/ascii.nvim",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}
		-- dashboard.section.header.val = {
		-- Zulian.Dev
		-- NeoVim
		--         
		--         █
		--         
		--
		--                                               
		--                                               ██
		--
		--       █████████ ██  ██  ██       █   ████   ████  ██
		--      █████████ ██  ██  ██       ██  █████  ██████ ███
		--     █████████ ██  ██  ██       ██  ██ ███  ████ █████
		--   █████████████  ██  ██       ██  ████████  ████  █████
		--  ██████  ████████████ █████████ ████ ████  ███  ████  ████

		--                       █████████
		--                      █      ██
		--                     ██      ██ ███████████   ███
		--                    ██      ██  ███     ███  ██
		--                   ██      ██ ████████  ███ ██
		--           ██  ████     ██  ███       █████
		--           ██ ████████████  █████████   ██████

		local languageart = require("language").asciiart.setup()

		if languageart then
			dashboard.section.header.val = languageart
		else
			dashboard.section.header.val = require("ascii").get_random_global
		end

		alpha.setup(dashboard.opts)
	end,
}
