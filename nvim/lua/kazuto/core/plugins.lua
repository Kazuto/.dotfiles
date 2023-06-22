local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	"mbbill/undotree",

	{
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-rhubarb",
		},
	},

	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-sleuth",

	{
		"tommcdo/vim-lion",
		config = function()
			require("kazuto.plugins.lion")
		end,
	},

	{
		"sickill/vim-pasta",
		config = function()
			require("kazuto.plugins.pasta")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("kazuto.plugins.gitsigns")
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			require("kazuto.plugins.autopairs")
		end,
		event = "InsertEnter",
	},

	{
		"RRethy/vim-illuminate",
		config = function()
			require("kazuto.plugins.illuminate")
		end,
	},

	-- ====== APPEARANCE ======

	-- Vim Theme
	{
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.cmd("colorscheme catppuccin")
		end,
	},

	-- Tree view
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("kazuto.plugins.nvim-tree")
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("kazuto.plugins.lualine")
		end,
	},

	-- Beautify tabs
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("kazuto.plugins.barbar")
		end,
	},

	-- Show a dashboard when opening vim
	{
		"glepnir/dashboard-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("dashboard")
		end,
		event = "VimEnter",
	},

	-- Add indentation guides even on blank lines
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("kazuto.plugins.indent-blankline")
		end,
	},

	-- ====== UTILITY ======

	-- Useful plugin to show you pending keybinds.
	{
		"folke/which-key.nvim",
		config = function()
			require("kazuto.plugins.which-key")
		end,
	},

	-- 'gc' to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		config = function()
			require("kazuto.plugins.comment")
		end,
	},

	{
		"AndrewRadev/splitjoin.vim",
		config = function()
			require("kazuto.plugins.splitjoin")
		end,
	},

	-- Quick access to attached files
	{
		"theprimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("kazuto.plugins.harpoon")
		end,
	},

	-- Show definitions etc.
	"preservim/tagbar", -- required ctags

	-- tmux & split window navigation
	"christoomey/vim-tmux-navigator",

	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("kazuto.plugins.telescope")
		end,
	},

	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("kazuto.plugins.treesitter")
		end,
	},

	-- Add terminals
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("kazuto.plugins.toggleterm")
		end,
	},

	-- ====== LSP =====

	-- Managing / Installing LSP servers
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("kazuto.plugins.lsp.mason")
		end,
		build = ":MasonUpdate",
	},

	-- Configuring LSP servers
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"b0o/schemastore.nvim",
		},
		config = function()
			require("kazuto.plugins.lsp.lspconfig")
		end,
	},

	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			--Please make sure you install markdown and markdown_inline parser
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("kazuto.plugins.lsp.lspsaga")
		end,
		event = "LspAttach",
	},

	"jose-elias-alvarez/typescript.nvim",

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("kazuto.plugins.lsp.null-ls")
		end,
	},

	-- Autocompletion
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("kazuto.plugins.luasnip")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		config = function()
			require("kazuto.plugins.nvim-cmp")
		end,
	},

	{
		"Exafunction/codeium.vim",
		config = function()
			require("kazuto.plugins.codium")
		end,
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
