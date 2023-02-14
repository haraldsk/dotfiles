local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "NvimTree", "yaml", "gitcommit" },
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "" }, -- list of language that will be disabled
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
        ["ic"] = "@class.inner",
        ["ac"] = "@class.outer",
        ["ia"] = "@parameter.inner",
        ["aa"] = "@parameter.outer",
      },
    },
  },
  context_commentstring = {
    enable = true,
  },
})