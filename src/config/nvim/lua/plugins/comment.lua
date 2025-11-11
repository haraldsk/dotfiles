return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" }, -- Load when opening files
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring", -- Smart commenting for embedded languages
  },
  config = function()
    require("Comment").setup({
      -- Add a space between comment and the line
      padding = true,
      -- Whether the cursor should stay at its position
      sticky = true,
      -- Lines to be ignored while (un)comment
      ignore = nil,
      -- LHS of toggle mappings in NORMAL mode
      toggler = {
        line = "gcc", -- Line-comment toggle keymap
        block = "gbc", -- Block-comment toggle keymap
      },
      -- LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        line = "gc", -- Line-comment keymap
        block = "gb", -- Block-comment keymap
      },
      -- LHS of extra mappings
      extra = {
        above = "gcO", -- Add comment on the line above
        below = "gco", -- Add comment on the line below
        eol = "gcA", -- Add comment at the end of line
      },
      -- Enable keybindings
      mappings = {
        basic = true, -- gcc, gbc, gc[count]{motion}, gb[count]{motion}
        extra = true, -- gco, gcO, gcA
      },
      -- Treesitter integration for context-aware commenting
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      post_hook = nil,
    })
  end,
}
