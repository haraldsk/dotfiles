-- Modern linting plugin using nvim-lint
-- Replaces none-ls for diagnostics/linting (can coexist during migration)
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Configure linters by filetype
    lint.linters_by_ft = {
      python = { "ruff" },
      -- Add more linters as you migrate from none-ls:
      -- go = { "golangci_lint" },
      -- yaml = { "yamllint" },
      -- terraform = { "tflint" },
    }

    -- Create autocommand to trigger linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Manual lint command
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
