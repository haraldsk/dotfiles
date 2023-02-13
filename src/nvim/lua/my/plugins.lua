local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
--
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'fatih/vim-go'
  use 'tmux-plugins/vim-tmux' -- plugin for tmux.conf
  use 'christoomey/vim-tmux-navigator' -- jumping between vim and tmux
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround' -- change surrounding chars
  use 'tpope/vim-dispatch' -- async dispatch into tmux panes, etc.
  use 'towolf/vim-helm'
  use 'gpanders/editorconfig.nvim' -- will be integrated into nvim in 0.9
  use 'itspriddle/vim-marked' -- Marked plugin

  -- colorschemes
  use 'lunarvim/darkplus.nvim'
  use 'lunarvim/Onedarker.nvim'
  use 'folke/tokyonight.nvim'

  use { "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.cmp")
    end,
  } -- The completion plugin
  use { "hrsh7th/cmp-buffer", } -- buffer completions
  use { "hrsh7th/cmp-path", } -- path completions
  -- use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"}) -- github plugin requires gh auth and GITHUB_API_TOKEN
  -- hrsh7th/cmp-copilot -- github copilot interation
	use { "saadparwaiz1/cmp_luasnip", } -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp", }
	use { "hrsh7th/cmp-nvim-lua", }

	-- Snippets
  use { "L3MON4D3/LuaSnip", } --snippet engine
  use { "rafamadriz/friendly-snippets", } -- a bunch of snippets to use

  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {
      {'nvim-lua/plenary.nvim'},
      { "kyazdani42/nvim-web-devicons" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("plugins.telescope")
    end,
  })

  use({
    'stevearc/aerial.nvim',
    config = function()
      require("plugins.aerial")
    end,
  })
  use({
     'akinsho/bufferline.nvim',
      tag = "v3.*",
      requires = 'nvim-tree/nvim-web-devicons',
    config = function ()
      require("bufferline").setup()
    end
  })

  use({
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("plugins.treesitter")
    end,
  })
  use({
      'lewis6991/gitsigns.nvim',
      config = function()
        require("plugins.gitsigns")
      end
  })

  -- lsp -- load order important {
  use({ "neovim/nvim-lspconfig",
    requires = { "williamboman/mason-lspconfig.nvim" },
  })

  use({ "williamboman/mason-lspconfig.nvim",
    requires = { "williamboman/mason.nvim" },
  })

  use({ "williamboman/mason.nvim",
      config = require("mason").setup()
  })
  -- }

  use({
    "ctrlpvim/ctrlp.vim",
    config = function()
      require("plugins.ctrlp")
    end,
  })
  use({
    "plasticboy/vim-markdown",
    requires = {
      { "godlygeek/tabular" },
    },
    config = function()
      require("plugins.markdown")
    end,
  })
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function ()
      require"nvim-tree".setup()
    end
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)