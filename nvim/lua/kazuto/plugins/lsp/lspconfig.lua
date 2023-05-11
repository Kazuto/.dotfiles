local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
  return
end

local on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { noremap = true, silent = true, buffer = bufnr, desc = desc })
  end

  nmap("gf", "")

  nmap("gf", "<cmd>Lspsaga lsp_finder<CR>", "Show definition, references")
  nmap("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", "[G]o [D]eclaration")
  nmap("gd", "<cmd>Lspsaga peek_definition<CR>", "[G] [d]efinition")
  nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "[G]o [I]mplementation")
  nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", "[C]ode [A]ctions")
  nmap("<leader>rn", "<cmd>Lspsaga rename<CR>", "[R]ename")
  nmap("<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", "[D]iagnostics for line")
  nmap("<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", "[D]iagnostics for cursor")
  nmap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous diagnostic in buffer")
  nmap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next diagnostic in buffer")
  nmap("K", "<cmd>Lspsaga hover_doc<CR>", "Documentation cursor")
  nmap("<leader>o", "<cmd>LSoutlineToggle<CR>", "[O]utline right hand side")

  if client.name == "tsserver" then
    nmap("<leader>rf", ":TypescriptRenameFile<CR>", "[R]ename [File] Typescript")
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local config = {
  virtual_text = true,
  update_on_insert = true,
  underline = true
}

vim.diagnostic.config(config)

local server = {
  "cssls",
  "docker_compose_language_service",
  "emmet_ls",
  "eslint",
  "html",
  "intelephense",
  "jsonls",
  "tailwindcss",
  "yamlls",
  "volar",
}

for _, value in ipairs(server) do  
  lspconfig[value].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- configure typescript server with plugin
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

lspconfig["bashls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})
