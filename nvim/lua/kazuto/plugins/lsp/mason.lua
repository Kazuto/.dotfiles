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
  "emmet_ls",
  "html",
  "eslint",
  "yamlls",
  "jsonls",
  "intelephense",
  "vuels",
  "lua_ls",
  "tsserver",
  "volar",
  "docker_compose_language_service",
  "cssls"
}

mason_lspconfig.setup({
  ensure_installed = lspServers
})