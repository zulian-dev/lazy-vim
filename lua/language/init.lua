-- alias mdvim="export NVIMLANG='markdown' && /opt/homebrew/bin/nvim && unset NVIMLANG"
-- alias govim="export NVIMLANG='golang' && /opt/homebrew/bin/nvim && unset NVIMLANG"
-- alias rsvim="export NVIMLANG='rust' && /opt/homebrew/bin/nvim && unset NVIMLANG"
-- alias javim="export NVIMLANG='java' && /opt/homebrew/bin/nvim && unset NVIMLANG"
-- alias elvim="export NVIMLANG='elixir' && /opt/homebrew/bin/nvim && unset NVIMLANG"
-- alias luavim="export NVIMLANG='lua' && /opt/homebrew/bin/nvim && unset NVIMLANG"
-- alias jsvim="export NVIMLANG='javascript' && /opt/homebrew/bin/nvim && unset NVIMLANG"
-- alias gdvim="export NVIMLANG='gdscript' && /opt/homebrew/bin/nvim && unset NVIMLANG"
-- alias cljvim="export NVIMLANG='clojure' && /opt/homebrew/bin/nvim && unset NVIMLANG"
-- alias nvim="unset NVIMLANG && /opt/homebrew/bin/nvim"

local nvimlang = os.getenv("NVIMLANG")

local languages = {}

if nvimlang ~= nil then
  print("Loading language: " .. nvimlang)
  languages = { require("language." .. nvimlang) }
else
  print("Loading all languages")
  languages = {
    require("language.markdown"),
    require("language.golang"),
    require("language.rust"),
    require("language.java"),
    require("language.elixir"),
    require("language.lua"),
    require("language.javascript"),
    require("language.gdscript"),
    require("language.clojure"),
    require("language.security"),
  }
end

local all_plugins = {}
local all_lsp = {}
local all_null_ls = {}
local all_options = {}
local all_mason = {}

for _, lang in ipairs(languages) do
  if lang.plugins then
    table.insert(all_plugins, lang.plugins)
  end

  if lang.lsp then
    table.insert(all_lsp, lang.lsp)
  end

  if lang.null_ls then
    table.insert(all_null_ls, lang.null_ls)
  end

  if lang.options then
    table.insert(all_options, lang.options)
  end

  if lang.mason then
    table.insert(all_mason, lang.mason)
  end
end

local plugins = {
  setup = function()
    local return_plugins = {}
    for _, lang in ipairs(all_plugins) do
      for _, plugin_to_install in ipairs(lang) do
        table.insert(return_plugins, plugin_to_install)
      end
    end
    return return_plugins
  end,
}

local lsp = {
  setup = function(lspconfig, capabilities, on_attach)
    for _, lang in ipairs(all_lsp) do
      lang(lspconfig, capabilities, on_attach)
    end
  end,
}

local null_ls = {
  setup = function(null_ls, formatting, diagnostics, completion, hover)
    local return_null_ls = {}
    for _, lang in ipairs(all_null_ls) do
      for _, null_ls_plugin in ipairs(lang(null_ls, formatting, diagnostics, completion, hover)) do
        table.insert(return_null_ls, null_ls_plugin)
      end
    end
    return return_null_ls
  end,
}

local options = {
  setup = function()
    for _, lang in ipairs(all_options) do
      lang()
    end
  end,
}

local mason = {
  setup = function()
    local return_mason = {}
    for _, lang in ipairs(all_mason) do
      for _, mason_plugin in ipairs(lang) do
        table.insert(return_mason, mason_plugin)
      end
    end
    return return_mason
  end,
}

local M = {
  options = options,
  lsp = lsp,
  null_ls = null_ls,
  plugins = plugins,
  mason = mason,
}

return M
