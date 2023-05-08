local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- ====== CONFIGLESS ======

  -- Show changes to a file
  'mbbill/undotree',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',

  -- ====== APPEARANCE ======

  -- Vim Theme
  { 'catppuccin/nvim',        as = 'catppuccin' },

  -- Tree view
  'nvim-tree/nvim-web-devicons',
  'nvim-tree/nvim-tree.lua',

  -- Statusline
  'nvim-lualine/lualine.nvim',

  -- Beautify tabs
  'romgrk/barbar.nvim',

  -- Show a dashboard when opening vim
  { 'glepnir/dashboard-nvim', event = 'VimEnter' },


  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',

  -- ====== UTILITY ======

  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',

  -- 'gc' to comment visual regions/lines
  'numToStr/Comment.nvim',

  -- Quick access to attached files
  'theprimeagen/harpoon',

  -- Show definitions etc.
  'preservim/tagbar', -- required ctags

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope.nvim',            version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- Add terminals
  'NvChad/nvterm',

  -- ====== LSP ======

  -- Autocompletion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',

  -- Snipptes
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',

  -- Managing / Installing LSP servers
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- Configuring LSP servers
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  { 'glepnir/lspsaga.nvim', branch = "main" },
  'jose-elias-alvarez/typescript.nvim',
  'onsails/lspkind.nvim'
}

local opts = {}

require('lazy').setup(plugins, opts)
