
-- vim.api.nvim_buf_set_option(0, "foldmethod", "expr")
-- vim.api.nvim_buf_set_option(0, "tabstop", 4)
-- vim.api.nvim_set_keymap("n", "<F4>", ":GodotRunLast<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<F5>", ":GodotRun<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<F6>", ":GodotRunCurrent<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<F7>", ":GodotRunFZF<CR>", { noremap = true })


return {
  -- {
  --   "habamax/vim-godot",
  --   dependencies = { 
  --     'neovim/nvim-lspconfig',
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-buffer',
  --     'hrsh7th/nvim-cmp',
  --   },
  --   ft = { "gd" },
  --   config = function()
  --     vim.g.vim_godot_executable = "/Applications/Godot.app/Contents/MacOS/Godot"
  --   end
  -- },
}