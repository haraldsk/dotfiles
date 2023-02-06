vim.g.mapleader = ","

vim.keymap.set("", "<leader>n", ":NvimTreeToggle<CR>")
vim.keymap.set("", "<C-t>", ":NvimTreeFocus<CR>")
vim.keymap.set("", "<C-f>", ":NvimTreeFindFile<CR>")
vim.keymap.set("", "<C-c>", '"*y') -- yank to * register
