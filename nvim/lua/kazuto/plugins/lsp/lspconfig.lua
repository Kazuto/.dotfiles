local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local opts = {}
local handlers = require("kazuto.plugins.lsp.handlers")
local servers = require('kazuto.plugins.lsp.servers')

for _, server in ipairs(servers) do
	opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}

	server = vim.split(server, "@")[1]

	local status, settings = pcall(require, "kazuto.plugins.lsp.settings." .. server)
	if status then
		opts = vim.tbl_deep_extend("force", settings, opts)
	end

	lspconfig[server].setup(opts)
end

-- local typescript_status, typescript = pcall(require, "typescript")
-- if not typescript_status then
-- 	return
-- end

-- configure typescript server with plugin
-- typescript.setup({
-- 	server = {
-- 		on_attach = handlers.on_attach,
-- 		capabilities = handlers.capabilities,
-- 	},
-- })
