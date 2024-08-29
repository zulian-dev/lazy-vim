--  Enable spell check
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"md", "markdown", "txt", "text"},
  callback = function()
    vim.cmd([[ set nospell ]])
    vim.cmd([[ set spelllang=pt ]])
    -- local project_folder = vim.fn.expand("%:p:h") .. "/.pt.utf-8.add"
    print(vim.fn.stdpath("config") .. "/spell/spellfile.utf-8.add")
    vim.opt_local.spellfile = vim.fn.stdpath("config") .. "/spell/spellfile.utf-8.add"
  end
})

return {
  {
    "dense-analysis/ale",
    event = "VeryLazy",
    ft = { "markdown" },
    config = function()
      -- vim.g.ale_fix_on_save = 1
      vim.g.ale_fixers = {
        markdown = { 'pandoc' },
        -- 'dprint' - Pluggable and configurable code formatting platform
        -- 'pandoc' - Fix markdown files with pandoc.
        -- 'prettier' - Apply prettier to a file.
        -- 'remark-lint' - Fix markdown files with remark-lint
        -- 'textlint' - Fix text files with textlint --fix
      }
      
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
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}