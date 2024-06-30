return {
  "dense-analysis/ale",
  config = function()
    vim.g.ale_fix_on_save = 1
    vim.g.ale_fixers = {
      -- javascript = {'prettier', 'eslint'},
      -- javascriptreact = {'prettier', 'eslint'},
      -- typescript = {'prettier', 'eslint'},
      -- typescriptreact = {'prettier', 'eslint'},
      -- json = {'prettier'},
      -- c = {'clang-format'},
      -- cpp = {'clang-format'},
      -- rust  = {'rustfmt'},
      -- go = {'gofmt'},
      -- python = {'isort', 'black', 'autopep8'},
      -- tex = {'latexindent'},
      markdown = { 'pandoc' }
    }

    -- vim.g.ale_linters = {
    -- markdown = { 'markdownlint' }
    -- }

    vim.api.nvim_set_keymap('n', '<Leader>p', ':ALEFix<CR>', {})
  end
}
