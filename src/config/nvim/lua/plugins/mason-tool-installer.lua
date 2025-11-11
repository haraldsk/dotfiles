-- Automatically install formatters and linters with Mason
-- Ensures tools used by conform.nvim and nvim-lint are available
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-tool-installer").setup({
      -- List of tools to auto-install
      ensure_installed = {
        -- Python
        "pyright",
        "ruff",

        -- Lua
        "stylua",

        -- JavaScript/TypeScript/Web
        "prettier",

        -- Go
        "gofumpt",
        "goimports-reviser",
        "golangci-lint",

        -- Terraform/HCL
        "terraform-ls",
        "tflint",
        "tfsec",

        -- YAML
        "yamllint",

        -- Markdown/Prose
        "markdownlint",
        "vale",
      },
      auto_update = false,
      run_on_start = true,
      start_delay = 3000, -- 3 second delay
      debounce_hours = 24, -- at least 24 hours between attempts
    })
  end,
}
