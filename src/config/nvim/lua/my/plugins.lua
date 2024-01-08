local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data")
    .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])
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

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("christoomey/vim-tmux-navigator") -- jumping between vim and tmux
  use("tpope/vim-commentary") -- easy commening
  use("tpope/vim-dispatch") -- async dispatch into tmux panes, etc.
  -- use 'gpanders/editorconfig.nvim' -- will be integrated into nvim in 0.9
  use("itspriddle/vim-marked") -- Marked plugin
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use("famiu/bufdelete.nvim") -- Implements BDelete and BWipe for proper buffer deletion

  -- syntax plugins
  use("mfussenegger/nvim-ansible") -- enables use of filetype yaml.ansible
  use("fatih/vim-go")
  use("towolf/vim-helm")
  use("tmux-plugins/vim-tmux") -- plugin for tmux.conf

  -- dap
  use("mfussenegger/nvim-dap")
  use("leoluz/nvim-dap-go") -- delve integration

  -- colorschemes
  use("lunarvim/darkplus.nvim")
  use("lunarvim/Onedarker.nvim")
  use("folke/tokyonight.nvim")

  -- Completions
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.completion")
    end,
  }) -- The completion plugin
  use({ "hrsh7th/cmp-buffer" }) -- buffer completions
  use({ "hrsh7th/cmp-path" }) -- path completions
  -- use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"}) -- github plugin requires gh auth and GITHUB_API_TOKEN
  -- hrsh7th/cmp-copilot -- github copilot interation
  use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-nvim-lua" })
  use({ "hrsh7th/cmp-nvim-lsp-signature-help" })

  -- Snippets
  use({ "L3MON4D3/LuaSnip" }) --snippet engine
  use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

  use({
    "AckslD/nvim-neoclip.lua",
    requires = {
      -- you'll need at least one of these
      { "nvim-telescope/telescope.nvim" },
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require("neoclip").setup()
    end,
  })

  -- folding
  use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

  -- indent-blankline
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        indent = { char = "" },
      })
    end,
  })

  --- Todo
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  })

  -- key mappings
  use({
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })
  use({
    "tummetott/unimpaired.nvim",
    config = function()
      require("unimpaired").setup({
        -- add any options here or leave empty
      })
    end,
  })

  use("RRethy/vim-illuminate") -- highlighting other uses of the word under the cursor
  use({
    "nvim-telescope/telescope.nvim",
    -- tag = '0.1.1',
    requires = {
      { "nvim-lua/plenary.nvim" },
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
    "stevearc/aerial.nvim",
    config = function()
      require("plugins.aerial")
    end,
  })

  use({
    "akinsho/bufferline.nvim",
    -- tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons",
  })

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  })

  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  use({
    "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  -- git integrations
  use("tpope/vim-fugitive")
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.gitsigns")
    end,
  })

  -- lsp -- load order important {
  use({
    "neovim/nvim-lspconfig",
    requires = { "williamboman/mason-lspconfig.nvim" },
  })

  use("lvimuser/lsp-inlayhints.nvim")

  use({
    "williamboman/mason-lspconfig.nvim",
    requires = { "williamboman/mason.nvim" },
  })

  use({ "williamboman/mason.nvim", config = require("mason").setup() })

  -- auto install formatters and linters with Mason, using the configuration
  -- in none-ls as the source of trouth, similar to mason-lspconfig for LSP
  use({
    "jay-babu/mason-null-ls.nvim",
    requires = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = require("mason-null-ls").setup({
      ensure_installed = nil,
      automatic_installation = true,
    }),
  })

  use("nvimtools/none-ls.nvim") -- formatting and linting
  -- }

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
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  })

  use({
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  })

  use("mbbill/undotree")

  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        --         Old text                    Command         New text
        -- -------------------------------------------------------------
        --    surr*ound_words             ysiw)           (surround_words)
        --    *make strings               ys$"            "make strings"
        --    [delete ar*ound me!]        ds]             delete around me!
        --    remove <b>HTML t*ags</b>    dst             remove HTML tags
        --    'change quot*es'            cs'"            "change quotes"
        --    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
        --    delete(functi*on calls)     dsf             function calls
      })
    end,
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)