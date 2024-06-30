return {
  -- { "mateusbraga/vim-spell-pt-br" }, -- ~/.local/share/nvim/lazy/vim-spell-pt-br/spell/pt.utf-8.spl
  -- { "preservim/vim-markdown" },
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
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
