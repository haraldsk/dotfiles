local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://www.youtube.com/watch?v=b7OguLuaYvE&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=17

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.gofmt.with({ extra_args = { "-s" } }),
    formatting.goimports,
    formatting.hclfmt,
    formatting.markdownlint,
    formatting.markdown_toc,
    formatting.stylua,
    formatting.terraform_fmt,
    -- diagnostics.cfn_lint,
    diagnostics.actionlint,
    diagnostics.shellcheck,
    diagnostics.terraform_validate,
    diagnostics.tfsec,
    diagnostics.yamllint,
    diagnostics.vale,
    -- diagnostics.flake8
  },
})