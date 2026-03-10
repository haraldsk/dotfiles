return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  keys = {
    {
      "[c",
      function()
        require("treesitter-context").go_to_context()
      end,
      desc = "Go to context",
      silent = true,
    },
  },
  opts = {
    auto_install = true,
    highlight = {
      enable = true,
      disable = { "NvimTree", "yaml", "gitcommit" },
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = { "" },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        scope_incremental = "<CR>",
        node_incremental = "<TAB>",
        node_decremental = "<S-TAB>",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
          ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
          ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
          ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

          ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
          ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

          ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
          ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

          ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
          ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

          ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
          ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

          ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
          ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

          ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },

          ["agc"] = { query = "@comment.outer", desc = "Select outer part of a comment" },
          ["igc"] = { query = "@comment.inner", desc = "Select inner part of a comment" },

          ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>sa"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>sA"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]]"] = { query = "@function.outer", desc = "Next function start" },
          ["]c"] = { query = "@class.outer", desc = "Next class start" },
          ["]o"] = "@loop.*",
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_next_end = {
          ["]["] = "@function.outer",
          ["]C"] = "@class.outer",
        },
        goto_previous_start = {
          ["[["] = { query = "@function.outer", desc = "Previous function start" },
          ["[c"] = { query = "@class.outer", desc = "Previous class start" },
        },
        goto_previous_end = {
          ["[]"] = "@function.outer",
          ["[C"] = "@class.outer",
        },
        goto_next = {
          ["]d"] = "@conditional.outer",
        },
        goto_previous = {
          ["[d"] = "@conditional.outer",
        },
      },
    },
  },
}
