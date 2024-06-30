return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,
        
        -- Elixir
        null_ls.builtins.diagnostics.credo,
      },
    })
    vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
  end
}
