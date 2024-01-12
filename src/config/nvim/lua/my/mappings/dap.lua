require("which-key").register({
  -- dap
  ["<leader>d"] = { name = "+dap" },
  ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle Breakpoint" }, -- create a binding with label
  ["<leader>dus"] = {
    function()
      local widgets = require("dap.ui.widgets")
      local sidebar = widgets.sidebar(widgets.scopes)
      sidebar.open()
    end,
    "Open debugging sidebar",
  },
  ["<leader>dg"] = { name = "+dap-go" },
  ["<leader>dgt"] = {
    function()
      require("dap-go").debug_test()
    end,
    "Run nearest go test",
  },
  ["<leader>dgl"] = {
    function()
      require("dap-go").debug_last()
    end,
    "Run last go test",
  },
})
