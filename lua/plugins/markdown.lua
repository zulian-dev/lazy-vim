--  Enable spell check
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"md", "markdown", "txt", "text"},
  callback = function()
    vim.cmd([[ set nospell ]])
    vim.cmd([[ set spelllang=pt_br ]])
    -- local project_folder = vim.fn.expand("%:p:h") .. "/.pt.utf-8.add"
    print(vim.fn.stdpath("config") .. "/spell/spellfile.utf-8.add")
    vim.opt_local.spellfile = vim.fn.stdpath("config") .. "/spell/spellfile.utf-8.add"
  end
})

return {
  {"mateusbraga/vim-spell-pt-br"},
  {
    "dense-analysis/ale",
    event = "VeryLazy",
    ft = { "markdown" },
    config = function()
      -- vim.g.ale_fix_on_save = 1
      vim.g.ale_fixers = {
        markdown = { 'pandoc' },
      }
      vim.g.ale_linters_explicit = 1
      
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', '<Leader>p', ':ALEFix<CR>', bufopts)
      -- vim.keymap.set('n', '<Leader>pa', ':ALECodeAction<CR>', bufopts)
      -- vim.keymap.set('n', '<Leader>l', ':ALELint<CR>', bufopts)
    end
  },
  {
    "junegunn/vim-emoji",
    ft = { "markdown" },
    config = function()
      vim.cmd("set completefunc=emoji#complete")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        markdown = { 
          RGB      = true;         -- #RGB hex codes
          RRGGBB   = true;         -- #RRGGBB hex codes
          names    = false;         -- "Name" codes like Blue
          RRGGBBAA = false;        -- #RRGGBBAA hex codes
          rgb_fn   = false;        -- CSS rgb() and rgba() functions
          hsl_fn   = false;        -- CSS hsl() and hsla() functions
          css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes: foreground, background
          mode     = 'background'; -- Set the display mode.        
        };
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}