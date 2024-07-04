vim.api.nvim_create_user_command(
  'UIClean',
  function(opts)
    local codewindow = require('codewindow')
    -- local lualine = require('lualine')
    
    vim.cmd(":Neotree filesystem close left")
    codewindow.close_minimap()
    -- lualine.hide({
    --   place = {'statusline', 'tabline', 'winbar'}, -- The segment this change applies to.
    --   unhide = false,  -- whether to re-enable lualine again/
    -- })
    
  end,
  { nargs = '?' }
)

return {}
