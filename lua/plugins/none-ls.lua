return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Spell 
        null_ls.builtins.completion.spell,

        -- Elixir
        null_ls.builtins.diagnostics.credo,

        -- Javascript
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettier,
      },
    })
    vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
  end
}
