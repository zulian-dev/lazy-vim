return {
  { 
    'github/copilot.vim', 
    -- 'zbirenbaum/copilot.lua',
    config = function()
      vim.api.nvim_set_keymap('i', '<c-p>', '<Plug>(copilot-panel)', { noremap = true, silent = true })
      vim.keymap.set('n', '<Leader>cs', '<cmd>Copilot status<CR>', { desc = 'Copilot status' })
    end,  
  },
  
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "canary",
  --   dependencies = {
  --     -- { "zbirenbaum/copilot.lua" }, -- or 
  --     { "github/copilot.vim" }, 
  --     { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  --   },
  --   opts = {
  --     debug = true, -- Enable debugging
  --     -- See Configuration section for rest
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },
  
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
      require("chatgpt").setup({
        api_key_cmd = 'op read op://Personal/OpenAI/API-KEY',  
      })
      
      local wk = require("which-key")
      wk.add({
          { "c", group = "ChatGPT" },
          { "cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
          {
            mode = { "n", "v" },
            { "ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
            { "cd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
            { "ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
            { "cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
            { "cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
            { "ck", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
            { "cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
            { "co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
            { "cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
            { "cs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
            { "ct", "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
            { "cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
          },
        })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    },
  }
}

