local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		code_actions.eslint,
		code_actions.shellcheck,

		diagnostics.actionlint,
		diagnostics.codespell,
		diagnostics.dotenv_linter,
		diagnostics.editorconfig_checker,
		diagnostics.eslint,
		diagnostics.phpstan,
		diagnostics.shellcheck,

		formatting.beautysh,
		formatting.fixjson,
		formatting.eslint,
		formatting.lua_format,
		formatting.pint,
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.stylua,
	},
})
