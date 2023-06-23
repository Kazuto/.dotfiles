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
		-- eslint_d
		code_actions.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js" })
			end,
		}),
		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js" })
			end,
		}),
		formatting.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js" })
			end,
		}),

		code_actions.shellcheck,

		diagnostics.actionlint,
		diagnostics.codespell,
		diagnostics.dotenv_linter,
		diagnostics.editorconfig_checker,
		-- diagnostics.luacheck.with({
		-- 	extra_args = { "--config", vim.fn.stdpath("config") .. "/.luacheckrc" },
		-- }),

		-- diagnostics.phpstan,
		diagnostics.shellcheck,
		diagnostics.trail_space.with({
			disabled_filetypes = { "NvimTree" },
		}),

		formatting.beautysh,
		formatting.jq,
		-- formatting.lua_format,
		formatting.pint,
		formatting.prettierd.with({
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		formatting.stylua,
	},
})
