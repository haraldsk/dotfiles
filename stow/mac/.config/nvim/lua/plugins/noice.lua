-- Configuration for the 'noice' plugin using Lazy.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true, -- Overrides the function to convert LSP input to markdown lines
          ["vim.lsp.util.stylize_markdown"] = true, -- Overrides the function to stylize markdown text
          ["cmp.entry.get_documentation"] = true, -- Overrides the function to get documentation for completion entries
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          enabled = true, -- enables the Noice popupmenu UI
          ---@type 'nui'|'cmp'
          backend = "nui", -- backend to use to show regular cmdline completions
          ---@type NoicePopupmenuItemKind|false
          -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
          kind_icons = {}, -- set to `false` to disable icons
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
      messages = {
        enabled = true, -- enables the Noice messages UI
        view = "notify", -- view to use for displaying messages
        view_error = "notify", -- view to use for displaying error messages
        view_warn = "notify", -- view to use for displaying warning messages
        view_history = "messages", -- view to use for displaying message history
        view_search = "virtualtext", -- view to use for displaying search results
      },
      notify = {
        enabled = false, -- enables the Noice notify UI
        view = "notify", -- view to use for displaying notifications
      },
      presets = {
        bottom_search = true, -- Enables the bottom search UI
        command_palette = true, -- Enables the command palette UI
        long_message_to_split = true, -- Splits long messages into separate lines
        inc_rename = false, -- Disables incremental renaming
        lsp_doc_border = false, -- Disables borders in LSP documentation UI
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup({
          -- Add your notify configurations here
        })
      end,
    },
  },
}
