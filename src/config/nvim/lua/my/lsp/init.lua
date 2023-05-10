local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "my.lsp.mason"
require("my.lsp.handlers").setup()
require "my.lsp.null-ls"