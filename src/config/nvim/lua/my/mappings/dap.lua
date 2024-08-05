require("which-key").add({
  -- dap
  { "<leader>d", group = "dap" },
  { "<leader>db", "<cmd> DapToggleBreakpoint <CR>", desc = "Toggle Breakpoint" },
  {
    "<leader>dus",
    function()
      local widgets = require("dap.ui.widgets")
      local sidebar = widgets.sidebar(widgets.scopes)
      sidebar.open()
    end,
    desc = "Open debugging sidebar",
  },
  { "<leader>dg", group = "dap-go" },
  {
    "<leader>dgt",
    function()
      require("dap-go").debug_test()
    end,
    desc = "Run nearest go test",
  },
  {
    "<leader>dgl",
    function()
      require("dap-go").debug_last()
    end,
    desc = "Run last go test",
  },
})
