-- local status_ok, undotree = pcall(require, "undotree")
-- if not status_ok then
--   return
-- end

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)