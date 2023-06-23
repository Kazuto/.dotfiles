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

	"tommcdo/vim-lion",

	"sickill/vim-pasta",

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
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- Beautify tabs
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Show a dashboard when opening vim
	{
		"glepnir/dashboard-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VimEnter",
	},

	-- Add indentation guides even on blank lines
	"lukas-reineke/indent-blankline.nvim",

	-- ====== UTILITY ======

	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",

	-- 'gc' to comment visual regions/lines

	"numToStr/Comment.nvim",
	"AndrewRadev/splitjoin.vim",

	{
		"windwp/nvim-autopairs",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		event = "InsertEnter",
	},

	"RRethy/vim-illuminate",

	-- Quick access to attached files
	{
		"theprimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
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
	},

	-- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	-- Add terminals
	"akinsho/toggleterm.nvim",

	-- ====== LSP =====

	-- Managing / Installing LSP servers
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		build = ":MasonUpdate",
	},

	-- Configuring LSP servers
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"b0o/schemastore.nvim",
		},
	},

	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			--Please make sure you install markdown and markdown_inline parser
			"nvim-treesitter/nvim-treesitter",
		},
		event = "LspAttach",
	},

	"jose-elias-alvarez/typescript.nvim",
	"jose-elias-alvarez/null-ls.nvim",

	-- Autocompletion
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
	},

	"Exafunction/codeium.vim",
}

local opts = {}

require("lazy").setup(plugins, opts)
