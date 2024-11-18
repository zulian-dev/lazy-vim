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

local function notify(msg)
  vim.notify(msg, vim.log.levels.INFO, { title = "LazyVim - Language Loader" })
end

if nvimlang then
  notify("Loading language: " .. nvimlang)
  languages = nvimlang and { require("language." .. nvimlang) }
else
  notify("Loading all languages")
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

-- Carrega uma linguagem específica ou todas, se NVIMLANG não estiver definido
-- local languages = nvimlang and { require("language." .. nvimlang) }
--     or {
--       require("language.markdown"),
--       require("language.golang"),
--       require("language.rust"),
--       require("language.java"),
--       require("language.elixir"),
--       require("language.lua"),
--       require("language.javascript"),
--       require("language.gdscript"),
--       require("language.clojure"),
--       require("language.security"),
--     }
--
-- Função auxiliar para coletar dados de um campo específico em todas as linguagens
local function collect_field(field)
  local result = {}
  for _, lang in ipairs(languages) do
    if lang[field] then
      if type(lang[field]) == "table" then
        vim.list_extend(result, lang[field])
      else
        table.insert(result, lang[field])
      end
    end
  end
  return result
end

-- Função auxiliar para executar funções de configuração de linguagens
local function execute_setup(field, ...)
  for _, lang in ipairs(languages) do
    if lang[field] then
      lang[field](...)
    end
  end
end

local M = {
  plugins = {
    setup = function()
      return collect_field("plugins")
    end,
  },

  lsp = {
    setup = function(lspconfig, capabilities, on_attach)
      execute_setup("lsp", lspconfig, capabilities, on_attach)
    end,
  },

  null_ls = {
    setup = function(null_ls, formatting, diagnostics, completion, code_actions, hover)
      local return_null_ls = {}
      for _, plugin in ipairs(collect_field("null_ls")) do
        vim.list_extend(return_null_ls, plugin(null_ls, formatting, diagnostics, completion, code_actions, hover))
      end
      return return_null_ls
    end,
  },

  options = {
    setup = function()
      execute_setup("options")
    end,
  },

  mason = {
    setup = function()
      return collect_field("mason")
    end,
  },

  asciiart = {
    setup = function()
      if nvimlang then
        return collect_field("asciiart")
      else
        return false
      end
    end,
  },
}

return M
