-- Modern formatting plugin using conform.nvim
-- Replaces none-ls for formatting (can coexist during migration)
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      python = { "ruff_format" },
      -- Add more formatters as you migrate from none-ls:
      -- lua = { "stylua" },
      -- javascript = { "prettier" },
      -- typescript = { "prettier" },
      -- go = { "gofumpt", "goimports_reviser" },
    },
    -- Format on save
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    -- Customize formatters
    formatters = {
      ruff_format = {
        -- You can add extra args here if needed
        -- prepend_args = { "--line-length", "120" },
      },
    },
  },
}
