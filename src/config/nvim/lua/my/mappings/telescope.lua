local status_ok_builtin, builtin = pcall(require, "telescope.builtin")
if not status_ok_builtin then
  return
end

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set(
  "n",
  "<leader>fF",
  [[<cmd>lua require("telescope.builtin").find_files({ no_ignore = true, prompt_title = "All Files" })<CR>]],
  { desc = "Find all files" }
) -- luacheck: no max line length
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Vim help tags" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Vim marks" })
vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Vim registers" })

vim.keymap.set("n", "<leader>fgb", builtin.git_branches, { desc = "Git branch" })
vim.keymap.set("n", "<leader>fgc", builtin.git_commits, { desc = "Git commit" })
vim.keymap.set("n", "<leader>fgs", builtin.git_status, { desc = "Git status" })

vim.keymap.set("n", "<leader>flr", builtin.lsp_references, { desc = "LSP references" })
vim.keymap.set("n", "<leader>flci", builtin.lsp_incoming_calls, { desc = "LSP incoming calls" })
vim.keymap.set("n", "<leader>flco", builtin.lsp_outgoing_calls, { desc = "LSP outgoing calls" })
vim.keymap.set(
  "n",
  "<leader>flm",
  "<cmd>Telescope lsp_document_symbols symbols=function,method symbol_width=30<CR>",
  { desc = "LSP document symbols functions and methods" }
)
vim.keymap.set("n", "<leader>flsd", builtin.lsp_document_symbols, { desc = "LSP document symbols" })
vim.keymap.set("n", "<leader>flsw", builtin.lsp_workspace_symbols, { desc = "LSP workspace symbols" })
--vim.keymap.set("n", "<leader>fldd", builtin.diagnostics, { desc = "LSP document diagnostics", bufnr=0 })
vim.keymap.set("n", "<leader>flx", builtin.diagnostics, { desc = "LSP workspace diagnostics" })
vim.keymap.set("n", "<leader>fli", builtin.lsp_implementations, { desc = "LSP implementations" })
vim.keymap.set("n", "<leader>fld", builtin.lsp_definitions, { desc = "LSP defintions" })
vim.keymap.set("n", "<leader>flt", builtin.lsp_type_definitions, { desc = "LSP type defintions" })

vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Todo list " })

vim.api.nvim_set_keymap("n", "<leader><leader>", ":silent Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })
