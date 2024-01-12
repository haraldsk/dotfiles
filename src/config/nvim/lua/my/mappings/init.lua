local status_ok, _ = pcall(require, "which-key")
if not status_ok then
  return
end

require("my.mappings.dap")
require("my.mappings.general")
require("my.mappings.nvim-tree")
require("my.mappings.telescope")
require("my.mappings.todo-comments")
require("my.mappings.treesitter")
require("my.mappings.trouble")
require("my.mappings.ufo")
require("my.mappings.undotree")
require("my.mappings.unimpaired")
