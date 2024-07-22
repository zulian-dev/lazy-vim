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
    ft = { "markdown" },
    config = function()
      vim.g.ale_fix_on_save = 1
      vim.g.ale_fixers = {
        markdown = { 'pandoc' }
      }
      vim.api.nvim_set_keymap('n', '<Leader>p', ':ALEFix<CR>', {})
    end
  },{
    "junegunn/vim-emoji",
    ft = { "markdown" },
    config = function()
      vim.cmd("set completefunc=emoji#complete")
    end,
  },{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
  