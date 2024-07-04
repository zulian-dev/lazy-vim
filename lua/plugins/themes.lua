local catppuccin_setup = function()
  require("catppuccin").setup()
end

local tokyonight_setup = function()
  require("tokyonight").setup()
end

return {

  -- Catppuccin
  { "catppuccin/nvim",                  name = "Catppuccin - Frappe",                  colorscheme = "catppuccin-frappe",         config = catppuccin_setup },
  { "catppuccin/nvim",                  name = "Catppuccin - Macchiato",               colorscheme = "catppuccin-macchiato",      config = catppuccin_setup },
  { "catppuccin/nvim",                  name = "Catppuccin - Mocha",                   colorscheme = "catppuccin-mocha",          config = catppuccin_setup },

  -- Onedarkpro
  { "olimorris/onedarkpro.nvim",        name = "OnedarkPro",                           colorscheme = "onedark" },
  { "olimorris/onedarkpro.nvim",        name = "OnedarkPro - Vivid",                   colorscheme = "onedark_vivid" },
  { "olimorris/onedarkpro.nvim",        name = "OnedarkPro - Dark",                    colorscheme = "onedark_dark" },

  -- Nightfox
  { "EdenEast/nightfox.nvim",           name = "Nightfox - Nightfox",                  colorscheme = "nightfox" },
  { "EdenEast/nightfox.nvim",           name = "Nightfox - Carbonfox",                 colorscheme = "carbonfox" },
  { "EdenEast/nightfox.nvim",           name = "Nightfox - Duskfox",                   colorscheme = "duskfox" },
  { "EdenEast/nightfox.nvim",           name = "Nightfox - Nordfox",                   colorscheme = "nordfox" },
  { "EdenEast/nightfox.nvim",           name = "Nightfox - Terafox",                   colorscheme = "terafox" },

  -- Rose Pine
  { "rose-pine/neovim",                 name = "Rose Pine - Main",                     colorscheme = "rose-pine-main" },
  { "rose-pine/neovim",                 name = "Rose Pine - Moon",                     colorscheme = "rose-pine-moon" },


  -- Night-owl
  { "oxfist/night-owl.nvim",            name = "Night owl",                            colorscheme = "night-owl" },

  -- Midnight
  { "dasupradyumna/midnight.nvim",      name = "Midnight",                             colorscheme = "midnight" },

  -- Palenightfall
  { "JoosepAlviste/palenightfall.nvim", name = "Palenightfall",                        colorscheme = "palenightfall" },

  -- Nightfly
  { "bluz71/vim-nightfly-colors",       name = "Nightfly",                             colorscheme = "nightfly" },

  -- Dracula
  { "dracula/vim",                      name = "Dracula vim",                          colorscheme = "dracula" },

  -- Nordc
  { "AlexvZyl/nordic.nvim",             name = "Nordic",                               colorscheme = "nordic" },

  -- Rigel
  { "Rigellute/rigel",                  name = "Rigel",                                colorscheme = "rigel" },


  -- Snazzy
  { "connorholyday/vim-snazzy",         name = "Snazzy",                               colorscheme = "snazzy" },

  -- hardhacker
  { "hardhackerlabs/theme-vim",         name = "Hardhacker",                           colorscheme = "hardhacker" },

  -- TokyoDark
  { "tiagovla/tokyodark.nvim",          name = "Tokyo Dark",                           colorscheme = "tokyodark" },

  -- tokyonight
  { "folke/tokyonight.nvim",            name = "Tokyonight - Night",                   colorscheme = "tokyonight-night",          config = tokyonight_setup },
  { "folke/tokyonight.nvim",            name = "Tokyonight - Storm",                   colorscheme = "tokyonight-storm",          config = tokyonight_setup },
  { "folke/tokyonight.nvim",            name = "Tokyonight - Moon",                    colorscheme = "tokyonight-moon",           config = tokyonight_setup },

  -- Kanagawa
  { "rebelot/kanagawa.nvim",            name = "Kanagawa - Wave",                      colorscheme = "kanagawa-wave" },
  { "rebelot/kanagawa.nvim",            name = "Kanagawa - Dragon",                    colorscheme = "kanagawa-dragon" },

  -- monokai
  { "crusoexia/vim-monokai",            name = "Monokai",                              colorscheme = "monokai" },

  -- monokai pro
  { "loctvl842/monokai-pro.nvim",       name = "Monokai - Pro",                        colorscheme = "monokai-pro" },
  { "loctvl842/monokai-pro.nvim",       name = "Monokai - Classic",                    colorscheme = "monokai-pro-classic" },
  { "loctvl842/monokai-pro.nvim",       name = "Monokai - Default",                    colorscheme = "monokai-pro-default" },
  { "loctvl842/monokai-pro.nvim",       name = "Monokai - Machine",                    colorscheme = "monokai-pro-machine" },
  { "loctvl842/monokai-pro.nvim",       name = "Monokai - Octagon",                    colorscheme = "monokai-pro-octagon" },
  { "loctvl842/monokai-pro.nvim",       name = "Monokai - Ristretto",                  colorscheme = "monokai-pro-ristretto" },
  { "loctvl842/monokai-pro.nvim",       name = "Monokai - Spectrum",                   colorscheme = "monokai-pro-spectrum" },

  -- iceberg
  { "cocopon/iceberg.vim",              name = "Iceberg",                              colorscheme = "iceberg" },

  -- gruvbox
  { "morhetz/gruvbox",                  name = "Gruvbox dark",                         colorscheme = "gruvbox" },

  -- shades_of_purple
  { "Rigellute/shades-of-purple.vim",   name = "Shades of purple",                     colorscheme = "shades_of_purple" },

  --Synthwave84
  { "artanikin/vim-synthwave84",        name = "Synthwave84",                          colorscheme = "synthwave84" },

  -- my test
  { "zulian-dev/theme-sedona.vim",      name = "Sedona",                               colorscheme = "sedona" },

  -- Oxocarbon
  { "nyoom-engineering/oxocarbon.nvim", name = "Oxocarbon",                            colorscheme = "oxocarbon" },

  -- SpaceDuck
  { "pineapplegiant/spaceduck",         name = "Spaceduck",                            colorscheme = "spaceduck" },

  -- Github
  { "projekt0n/github-nvim-theme",      name = "Github - dark",                        colorscheme = "github_dark" },
  { "projekt0n/github-nvim-theme",      name = "Github - dark colorblind",             colorscheme = "github_dark_colorblind" },
  { "projekt0n/github-nvim-theme",      name = "Github - dark default",                colorscheme = "github_dark_default" },
  { "projekt0n/github-nvim-theme",      name = "Github - dark dimmed",                 colorscheme = "github_dark_dimmed" },
  { "projekt0n/github-nvim-theme",      name = "Github - dark high contrast",          colorscheme = "github_dark_high_contrast" },
  { "projekt0n/github-nvim-theme",      name = "Github - dark tritanopia",             colorscheme = "github_dark_tritanopia" },
  { "projekt0n/github-nvim-theme",      name = "Github - dimmed",                      colorscheme = "github_dimmed" },

  -- Melange
  { "savq/melange-nvim",                name = "Melange",                              colorscheme = "melange" },

  -- Cyberdream
  { "scottmckendry/cyberdream.nvim",    name = "Cyberdream",                           colorscheme = "cyberdream" },

  -- Bluloco
  { 'uloco/bluloco.nvim',               name = "Bluloco",                              colorscheme = "bluloco",                   dependencies = { 'rktjmp/lush.nvim' } },
  { 'uloco/bluloco.nvim',               name = "Bluloco - Dark",                       colorscheme = "bluloco-dark",              dependencies = { 'rktjmp/lush.nvim' } },

  -- Biscuit
  { "Biscuit-Theme/nvim",               name = "Biscuit",                              colorscheme = "biscuit" },


  ------------------------

  { "catppuccin/nvim",                  name = "(LIGHT) Catppuccin - Latte",           colorscheme = "catppuccin-latte",          config = catppuccin_setup },
  { "olimorris/onedarkpro.nvim",        name = "(LIGHT) OnedarkPro - Onelight",        colorscheme = "onelight" },
  { "EdenEast/nightfox.nvim",           name = "(LIGHT) Nightfox Dawnfox",             colorscheme = "dawnfox" },
  { "EdenEast/nightfox.nvim",           name = "(LIGHT) Nightfox Dayfox",              colorscheme = "dayfox" },
  { "rose-pine/neovim",                 name = "(LIGHT) Rose Pine",                    colorscheme = "rose-pine" },
  { "rose-pine/neovim",                 name = "(LIGHT) Rose Pine Dawn",               colorscheme = "rose-pine-dawn" },
  { "folke/tokyonight.nvim",            name = "(LIGHT) Tokyonight day",               colorscheme = "tokyonight-day",            config = tokyonight_setup },
  { "rebelot/kanagawa.nvim",            name = "(LIGHT) Kanagawa Lotus",               colorscheme = "kanagawa-lotus" },
  { "projekt0n/github-nvim-theme",      name = "(LIGHT) Github - Light",               colorscheme = "github_light" },
  { "projekt0n/github-nvim-theme",      name = "(LIGHT) Github - Light Colorblind",    colorscheme = "github_light_colorblind" },
  { "projekt0n/github-nvim-theme",      name = "(LIGHT) Github - Light Default",       colorscheme = "github_light_default" },
  { "projekt0n/github-nvim-theme",      name = "(LIGHT) Github - Light High contrast", colorscheme = "github_light_high_contrast" },
  { "projekt0n/github-nvim-theme",      name = "(LIGHT) Github - Light Tritanopia",    colorscheme = "github_light_tritanopia" },
  { 'uloco/bluloco.nvim',               name = "(LIGHT) Bluloco - Light",              colorscheme = "bluloco-light",             dependencies = { 'rktjmp/lush.nvim' } },

}
