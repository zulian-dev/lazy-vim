return {
	"zaldih/themery.nvim",
	lazyLoad = true,
	config = function()
		require("themery").setup({
			livePreview = true,
			themes = require("plugins.themes"),
		})
	end,
}
