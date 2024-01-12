local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

vim.keymap.set("n", "zR", ufo.openAllFolds)
vim.keymap.set("n", "zM", ufo.closeAllFolds)
vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds)
vim.keymap.set("n", "zm", ufo.closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set("n", "K", function()
  local winid = ufo.peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)
