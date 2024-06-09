return {
--  {
--    'codota/tabnine-nvim',
--    build = "./dl_binaries.sh",
--    config = function()
--      require('tabnine').setup({
--        disable_auto_comment = true,
--        accept_keymap = "<Tab>",
--        dismiss_keymap = "<C-]>",
--        debounce_ms = 800,
--        suggestion_color = { gui = "#808080", cterm = 244 },
--        exclude_filetypes = { "TelescopePrompt", "NvimTree" },
--        log_file_path = nil, -- absolute path to Tabnine log file
--      })
--    end
--  },
 {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
}
