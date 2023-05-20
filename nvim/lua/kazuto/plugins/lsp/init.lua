Servers = {
  "bashls",
  "cssls",
  "docker_compose_language_service",
  "emmet_ls",
  "eslint",
  "html",
  "intelephense",
  "jsonls",
  "lua_ls",
  "tailwindcss",
  "tsserver",
  "yamlls",
  "volar",
}

require("kazuto.plugins.lsp.mason")
require("kazuto.plugins.lsp.lspconfig")
require("kazuto.plugins.lsp.lspsaga")
require("kazuto.plugins.lsp.null-ls")
