local setup, lsp = pcall(require, "lsp-zero")
if not setup then
  return
end

lsp.preset({})

lsp.ensure_installed({
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
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
