local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap comma as leader key
keymap("", " ", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- NvimTree
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-t>", ":NvimTreeToggle<CR>", opts)

-- Copy & Paste
keymap("n", "<C-c>", '"*y', opts) -- yank to * register

-- Resize with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)



-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Center the line while moving with C-u / C-d
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)

-- Move text up and down
keymap("n", "<M-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<M-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)

-- Insert --
--

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
--

local wk = require("which-key")

wk.register({
  -- dap
  ["<leader>d"] = { name = "+dap", },
  ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle Breakpoint" }, -- create a binding with label
  ["<leader>dus"] = { function ()
      local widgets = require('dap.ui.widgets');
      local sidebar = widgets.sidebar(widgets.scopes);
      sidebar.open();
      end,
      "Open debugging sidebar"
  },
  ["<leader>dg"] = { name = "+dap-go", },
  ["<leader>dgt"] = {
    function ()
      require('dap-go').debug_test()
    end,
    "Run nearest go test"
  },
  ["<leader>dgl"] = {
    function ()
      require('dap-go').debug_last()
    end,
    "Run last go test"
  },
})
