-- https://github.com/redhat-developer/yaml-language-server
-- https://www.reddit.com/r/neovim/comments/12kxhkw/neovim_lsp_yamlls_key_ordering_issue/
local opts = {
  settings = {
    yaml = {
      keyOrdering = false,
      schemaStoreEnable = true,
    },
  },
}

return opts
