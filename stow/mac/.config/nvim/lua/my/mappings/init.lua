local status_ok, _ = pcall(require, "which-key")
if not status_ok then
  return
end

require("my.mappings.dap")
require("my.mappings.general")
require("my.mappings.unimpaired")
