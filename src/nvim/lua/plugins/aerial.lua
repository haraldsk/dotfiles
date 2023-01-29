require('aerial').setup({
    layout = {
        width = 40,
        default_direction = "right",
        placement = "edge",
    },
})
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>")