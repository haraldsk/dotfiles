local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  on_attach = require("my.mappings.nvim-tree").on_attach,
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
})
