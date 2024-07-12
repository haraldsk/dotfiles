return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle undotree" },
    },
  },
  {
    "stevearc/aerial.nvim",
    keys = {
      { "<leader>a", "<cmd>AerialToggle!<cr>", desc = "Toggle aerial" },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {

      layout = {
        width = 50,
        default_direction = "right",
        placement = "edge",
      },
    },
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = true,
    lazy = false,
    keys = {
      { "<leader>fn", "<cmd>Telescope neoclip<cr>", desc = "Neoclip clipboard" },
    },
    dependencies = {
      -- you'll need at least one of these
      { "nvim-telescope/telescope.nvim" },
      -- {'ibhagwan/fzf-lua'},
    },
  },
}
