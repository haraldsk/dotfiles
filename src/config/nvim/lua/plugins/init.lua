return {
  "christoomey/vim-tmux-navigator", -- jumping between vim and tmux
  "tpope/vim-dispatch", -- async dispatch into tmux panes, etc.
  "itspriddle/vim-marked", -- Marked plugin
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "famiu/bufdelete.nvim", -- Implements BDelete and BWipe for proper buffer deletion

  "tmux-plugins/vim-tmux", -- plugin for tmux.conf

  -- dap
  "mfussenegger/nvim-dap",
  "leoluz/nvim-dap-go", -- delve integration
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },

  -- Completions
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  -- {"petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim"}, -- github plugin dependencies gh auth and GITHUB_API_TOKEN
  -- hrsh7th/cmp-copilot -- github copilot interation
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },

  -- Snippets
  { "L3MON4D3/LuaSnip" }, --snippet engine
  { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua", -- optional
    },
    config = true,
  },

  -- folding
  { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },

  -- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        indent = { char = "" },
      })
    end,
  },

  --- Todo
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- key mappings
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to  the default settings
        -- refer to the configuration section below
      })
    end,
  },
  "tummetott/unimpaired.nvim",

  -- ("RRethy/vim-illuminate") -- highlighting other s of the word under the cursor
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "kyazdani42/nvim-web-devicons" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "jonarrien/telescope-cmdline.nvim" },
    },
  },

  -- notification widget
  { "j-hui/fidget.nvim" },

  -- custom bufferline plugin
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  -- custom statusline plugin
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- after = "nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    -- after = "nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  -- git integrations
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",

  -- lsp -- load order important {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },

  -- { "williamboman/mason.nvim" },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  --  -- auto install formatters and linters with Mason, using the configuration
  --  -- in none-ls as the source of trouth, similar to mason-lspconfig for LSP
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = nil,
        automatic_installation = true,
      })
    end,
  },

  "nvimtools/none-ls.nvim", -- formatting and linting

  {
    "plasticboy/vim-markdown",
    dependencies = {
      { "godlygeek/tabular" },
    },
  },

  "akinsho/toggleterm.nvim",

  -- allow esacping with quickly typing jk and jj
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },

  "github/copilot.vim",

  {
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
  },
}
