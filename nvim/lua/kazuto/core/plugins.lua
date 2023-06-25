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
	--[[
	  =================
		BASE DEPENDENCIES
		=================
	--]]

	"nvim-tree/nvim-web-devicons",
	"nvim-lua/plenary.nvim",
	"lewis6991/gitsigns.nvim",
	"hrsh7th/nvim-cmp",

	--[[
		=================
		APPEARANCE
		=================
	--]]

	{
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.cmd("colorscheme catppuccin")
		end,
	},

	"nvim-tree/nvim-tree.lua",  -- Tree File View
	"nvim-lualine/lualine.nvim", -- Nvim Status Line

	"romgrk/barbar.nvim",       -- Beautify tabs

	{ "glepnir/dashboard-nvim", event = "VimEnter" },

	"lukas-reineke/indent-blankline.nvim", -- Add indentation guides

	--[[
		=================
		UTILITY
		=================
	--]]

	"mbbill/undotree", -- Show changes to a file

	{
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-rhubarb",
		},
	},

	"tpope/vim-repeat",  -- Allow plugins to hook into repeat (.)
	"tpope/vim-surround", -- Replace surrounding quotes or tags
	"tpope/vim-sleuth",  -- Automatically detect indentation

	"tommcdo/vim-lion",  -- Align text by characters

	"sickill/vim-pasta",

	"folke/which-key.nvim",                            -- Useful plugin to show you pending keybinds.

	"numToStr/Comment.nvim",                           -- 'gc' to comment visual regions/lines

	"AndrewRadev/splitjoin.vim",                       -- Split or join lines of code

	"mg979/vim-visual-multi",                          -- Multi-Cursor selection

	{ "windwp/nvim-autopairs",  event = "InsertEnter" }, -- Add closing brackets, parentheses, quotes

	"RRethy/vim-illuminate",                           -- Code occurrence highlighting

	"theprimeagen/harpoon",                            -- Quick access to attached files

	"preservim/tagbar",                                -- Show definitions etc. !required ctags!

	"christoomey/vim-tmux-navigator",                  -- tmux & split window navigation

	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
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

	--[[
		=================
		LSP
		=================
	--]]

	-- Managing / Installing LSP servers
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"b0o/schemastore.nvim",                          -- Collection of schemas
			{ "j-hui/fidget.nvim",       tag = "legacy", opts = {} }, -- Useful status updates
			"folke/neodev.nvim",                             -- Additional lua configuration, makes nvim stuff amazing!
		},
	},

	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
		event = "LspAttach",
	},

	"jose-elias-alvarez/null-ls.nvim",

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			"rafamadriz/friendly-snippets",
		},
	},

	"Exafunction/codeium.vim",
}

local opts = {}

require("lazy").setup(plugins, opts)
