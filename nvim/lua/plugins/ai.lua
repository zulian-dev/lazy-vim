return {
  {
    "codota/tabnine-nvim",
    enabled = false,
    dependencies = {
      "tzachar/cmp-tabnine",
      build = {
        LazyVim.is_win() and "pwsh -noni .\\install.ps1" or "./install.sh",
      },
      dependencies = "hrsh7th/nvim-cmp",
      opts = {
        max_lines = 1000,
        max_num_results = 3,
        sort = true,
      },
      config = function(_, opts)
        require("cmp_tabnine.config"):setup(opts)
      end,
    },
    build = "./dl_binaries.sh",
    config = function()
      require("tabnine").setup({
        disable_auto_comment = true,
        accept_keymap = "<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt", "NvimTree" },
        log_file_path = nil, -- absolute path to Tabnine log file
        ignore_certificate_errors = false,
      })

      -- vim.api.nvim_set_keymap("x", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
      -- vim.api.nvim_set_keymap("i", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
      -- vim.api.nvim_set_keymap("n", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
    end,

    setup_lua_line = function(opts)
      local icon = LazyVim.config.icons.kinds.TabNine
      table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("cmp_tabnine", icon))
      return opts
    end,
  },

  -- tabnine_chat binary not found, did you remember to build it first? `cargo build --release` inside `chat/` directory

  {
    "github/copilot.vim",
    enabled = true,
    -- 'zbirenbaum/copilot.lua',
    config = function()
      vim.api.nvim_set_keymap("i", "<c-p>", "<Plug>(copilot-panel)", { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>cs", "<cmd>Copilot status<CR>", { desc = "Copilot status" })
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
    enabled = false,
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "op read op://Personal/OpenAI/API-KEY",
      })

      local wk = require("which-key")
      wk.add({
        { "c",  group = "ChatGPT" },
        { "cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
        {
          mode = { "n", "v" },
          { "ca", "<cmd>ChatGPTRun add_tests<CR>",                 desc = "Add Tests" },
          { "cd", "<cmd>ChatGPTRun docstring<CR>",                 desc = "Docstring" },
          { "ce", "<cmd>ChatGPTEditWithInstruction<CR>",           desc = "Edit with instruction" },
          { "cf", "<cmd>ChatGPTRun fix_bugs<CR>",                  desc = "Fix Bugs" },
          { "cg", "<cmd>ChatGPTRun grammar_correction<CR>",        desc = "Grammar Correction" },
          { "ck", "<cmd>ChatGPTRun keywords<CR>",                  desc = "Keywords" },
          { "cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
          { "co", "<cmd>ChatGPTRun optimize_code<CR>",             desc = "Optimize Code" },
          { "cr", "<cmd>ChatGPTRun roxygen_edit<CR>",              desc = "Roxygen Edit" },
          { "cs", "<cmd>ChatGPTRun summarize<CR>",                 desc = "Summarize" },
          { "ct", "<cmd>ChatGPTRun translate<CR>",                 desc = "Translate" },
          { "cx", "<cmd>ChatGPTRun explain_code<CR>",              desc = "Explain Code" },
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
