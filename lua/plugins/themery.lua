return {
  "zaldih/themery.nvim",
  lazyLoad = true,
  config = function()
    require("themery").setup({
      livePreview = true,
      themes = require("plugins.themes"),
      themeConfigFile = "~/.config/nvim/lua/config/theme.lua"
    })
    require('config.theme')
  end,
}
