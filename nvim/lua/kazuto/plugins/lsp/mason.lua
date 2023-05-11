local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

mason.setup()

local lspServers = {
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

mason_lspconfig.setup({
  ensure_installed = lspServers
})
