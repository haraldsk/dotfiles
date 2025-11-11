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
        -- Python tools
        "pyright", -- LSP (already in mason servers, but good to ensure)
        "ruff", -- formatter and linter

        -- Add more tools as you migrate from none-ls:
        -- "stylua", -- Lua formatter
        -- "prettier", -- JS/TS/JSON/etc formatter
        -- "golangci-lint", -- Go linter
        -- "yamllint", -- YAML linter
        -- "tflint", -- Terraform linter
      },
      auto_update = false,
      run_on_start = true,
      start_delay = 3000, -- 3 second delay
      debounce_hours = 24, -- at least 24 hours between attempts
    })
  end,
}
