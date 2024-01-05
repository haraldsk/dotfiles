-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
local util = require("lspconfig/util")
return {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      -- gofumpt = true, -- using null-ls here
      completeUnimported = true, -- automatically import packages
      usePlaceholders = true, -- placeholders enables placeholders for function parameters or struct fields in completion responses.


      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true
      }
    },
  },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git")
}