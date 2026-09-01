return {
  {
    "polarmutex/git-worktree.nvim",
    config = function()
      require("telescope").load_extension("git_worktree")
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>fgw",
        "<cmd>Telescope git_worktree<cr>",
        desc = "Open Git worktree",
      },
    },
  },
}
