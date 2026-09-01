return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
      { "<C-t>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      on_attach = require("plugins.mappings.nvim-tree").on_attach,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      view = {
        width = {
          min = 30,
          max = 70,
        },
      },
      renderer = {
        root_folder_modifier = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
    },
  },
}
