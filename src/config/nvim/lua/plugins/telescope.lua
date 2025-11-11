return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "jonarrien/telescope-cmdline.nvim",
  },
  cmd = "Telescope",
  keys = {
    -- File pickers
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files",
    },
    {
      "<C-p>",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fF",
      function()
        require("telescope.builtin").find_files({ no_ignore = true, prompt_title = "All Files" })
      end,
      desc = "Find all files",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live grep",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Vim help tags",
    },
    {
      "<leader>fm",
      function()
        require("telescope.builtin").marks()
      end,
      desc = "Vim marks",
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").registers()
      end,
      desc = "Vim registers",
    },

    -- Git pickers
    {
      "<leader>fgb",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "Git branch",
    },
    {
      "<leader>fgc",
      function()
        require("telescope.builtin").git_commits()
      end,
      desc = "Git commit",
    },
    {
      "<leader>fgs",
      function()
        require("telescope.builtin").git_status()
      end,
      desc = "Git status",
    },
    {
      "<leader>fgf",
      function()
        require("telescope.builtin").git_files()
      end,
      desc = "Git files",
    },

    -- LSP pickers
    {
      "<leader>flr",
      function()
        require("telescope.builtin").lsp_references()
      end,
      desc = "LSP references",
    },
    {
      "<leader>flci",
      function()
        require("telescope.builtin").lsp_incoming_calls()
      end,
      desc = "LSP incoming calls",
    },
    {
      "<leader>flco",
      function()
        require("telescope.builtin").lsp_outgoing_calls()
      end,
      desc = "LSP outgoing calls",
    },
    {
      "<leader>flm",
      "<cmd>Telescope lsp_document_symbols symbols=function,method symbol_width=30<CR>",
      desc = "LSP document symbols functions and methods",
    },
    {
      "<leader>flsd",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      desc = "LSP document symbols",
    },
    {
      "<leader>flsw",
      function()
        require("telescope.builtin").lsp_workspace_symbols()
      end,
      desc = "LSP workspace symbols",
    },
    {
      "<leader>flx",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "LSP workspace diagnostics",
    },
    {
      "<leader>fli",
      function()
        require("telescope.builtin").lsp_implementations()
      end,
      desc = "LSP implementations",
    },
    {
      "<leader>fld",
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      desc = "LSP defintions",
    },
    {
      "<leader>flt",
      function()
        require("telescope.builtin").lsp_type_definitions()
      end,
      desc = "LSP type defintions",
    },

    -- Other pickers
    {
      "<leader>ft",
      "<cmd>TodoTelescope<CR>",
      desc = "Todo list",
    },
    {
      "<leader><leader>",
      ":silent Telescope cmdline<CR>",
      desc = "Cmdline",
    },
  },
  config = function()
    local telescope = require("telescope")

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

    -- Load extensions
    telescope.load_extension("ui-select")
    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("cmdline")
  end,
}
