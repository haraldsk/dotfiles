local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local status_ok_mappings, mappings = pcall(require, "my.mappings.treesitter")
if not status_ok_mappings then
  return
end

configs.setup({
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "NvimTree", "yaml", "gitcommit" },
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "" }, -- list of language that will be disabled
  },
  incremental_selection = {
    enable = true,
    keymaps = mappings.incremental_selection.keymaps,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = mappings.textobjects.select.keymaps,
    },
    swap = {
      enable = true,
      swap_next = mappings.textobjects.swap.swap_next,
      swap_previous = mappings.textobjects.swap.swap_previous,
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = mappings.textobjects.move.goto_next_start,
      goto_next_end = mappings.textobjects.move.goto_next_end,
      goto_previous_start = mappings.textobjects.move.goto_previous_start,
      goto_previous_end = mappings.textobjects.move.goto_previous_end,
      goto_next = mappings.textobjects.move.goto_next,
      goto_previous = mappings.textobjects.move.goto_previous,
    },
  },
  -- context_commentstring = {
  --   enable = true,
  -- },
})
