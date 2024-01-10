local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
  return
end

aerial.setup({
  layout = {
    width = 40,
    default_direction = "right",
    placement = "edge",
  },
})
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>")