-- migrated to none-ls
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://www.youtube.com/watch?v=b7OguLuaYvE&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=17

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Docs on how to configure plugins:
-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.gofumpt,
    formatting.goimports_reviser,
    -- formatting.golines,
    formatting.hclfmt,
    formatting.markdownlint,
    formatting.puppet_lint.with({
      command = "/opt/homebrew/lib/ruby/gems/2.7.0/bin/puppet-lint",
    }),
    formatting.stylua,
    formatting.terraform_fmt,
    -- diagnostics.cfn_lint,
    diagnostics.actionlint,
    diagnostics.golangci_lint,
    diagnostics.terraform_validate,
    diagnostics.tfsec,
    diagnostics.yamllint,
    diagnostics.vale,
    -- diagnostics.flake8
  },
  -- formatting on save for formatters in null-ls
  -- consider this, if not enough: https://github.com/lukas-reineke/lsp-format.nvim
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function()
              return client.name == "null-ls"
            end,
          })
        end,
      })
    end
  end,
})
