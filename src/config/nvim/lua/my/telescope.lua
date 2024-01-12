local status_ok_telescope, telescope = pcall(require, "telescope")
if not status_ok_telescope then
  return
end

telescope.load_extension("ui-select")
telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
telescope.load_extension("cmdline")

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    file_ignore_patterns = { ".git/" },
    layout_config = {
      vertical = { prompt_position = "top", width = 0.5 },
      horizontal = { prompt_position = "top", preview_width = 0.6 },
      -- other layout configuration here
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    buffers = {
      previewer = false,
      sort_lastused = true, -- sort buffers by last used <3
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = "History",
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        -- even more opts
      }),
    },
    cmdline = {
      picker = {
        layout_config = {
          width = 120,
          height = 25,
        },
      },
      mappings = {
        complete = "<Tab>",
        run_selection = "<CR>",
        run_input = "<C-CR>",
      },
    },
  },
})
