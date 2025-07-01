return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      -- Because we use cmp-copilot, we disable the default Copilot suggestions
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end,
}
