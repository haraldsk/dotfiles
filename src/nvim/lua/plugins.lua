-- todo

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

local packer_bootstrap = ensure_packer()

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
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
      require("plugins.lspconfig")
    end
  })

  use({
    "williamboman/mason-lspconfig.nvim",
    requires = {
      "williamboman/mason.nvim"
    },
    config = function()
      require("plugins.lspconfig")
    end
  })

  use({
    "williamboman/mason.nvim",
    config = require("mason").setup()
  })

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

  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)