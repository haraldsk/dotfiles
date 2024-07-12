return {
  {
    "lunarvim/darkplus.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme darkplus]])
    end,
  },
  { "lunarvim/Onedarker.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
}
