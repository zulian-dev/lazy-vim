return {
  "zaldih/themery.nvim",
  livePreview = true,
  config = function()
    require('config.theme')
    require("themery").setup({
      themes = require("plugins.themes"),
      themeConfigFile = "~/.config/nvim/lua/config/theme.lua"
    })
  end,
}
