vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })

local M = {
  incremental_selection = {
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    },
  },
  textobjects = {
    select = {
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
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      goto_next_start = {
        ["]]"] = { query = "@function.outer", desc = "Next function start" },
        ["]c"] = { query = "@class.outer", desc = "Next class start" },
        --
        -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
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
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        ["]d"] = "@conditional.outer",
      },
      goto_previous = {
        ["[d"] = "@conditional.outer",
      },
    },
  },
}

return M
