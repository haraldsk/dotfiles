local telescope = require("telescope")
local builtin = require('telescope.builtin')
require("telescope").load_extension("ui-select")
require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")

require('telescope').setup{
  defaults = {
    sorting_strategy = "ascending",
    file_ignore_patterns = { ".git/" },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    buffers = {
      previewer = false,
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
      require("telescope.themes").get_dropdown {
          -- even more opts
      }
    }
  }
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set("n", "<leader>FF", [[<cmd>lua require("telescope.builtin").find_files({ no_ignore = true, prompt_title = "All Files" })<CR>]]) -- luacheck: no max line length
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>h", [[<cmd>lua require("telescope.builtin").oldfiles()<CR>]])
vim.keymap.set("n", "<leader>s", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>]])
