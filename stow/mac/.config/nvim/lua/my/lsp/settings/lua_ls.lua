return {
  settings = {

    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      hint = {
        enable = true,
        setType = true,
      },
      hover = {
        enable = true,
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}
