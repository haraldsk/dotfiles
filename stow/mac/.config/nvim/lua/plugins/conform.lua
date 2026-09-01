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
      -- Python
      python = { "ruff_format" },

      -- Lua
      lua = { "stylua" },

      -- JavaScript/TypeScript/Web
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },

      -- Markdown
      markdown = { "markdownlint" },

      -- Go
      go = { "gofumpt", "goimports_reviser" },

      -- Terraform/HCL (using terraform_fmt for both)
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },
      hcl = { "terraform_fmt" },
    },

    -- Format on save
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },

    -- Customize formatters
    formatters = {
      prettier = {
        prepend_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      },
    },
  },
}
