local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

ufo.setup({
  open_fold_hl_timeout = 150,
  close_fold_kinds = { "imports" },
  -- provider_selector = 'lsp',
  preview = {
    win_config = {
      border = { "", "─", "", "", "", "─", "", "" },
      winhighlight = "Normal:Folded",
      winblend = 0,
    },
  },
})
