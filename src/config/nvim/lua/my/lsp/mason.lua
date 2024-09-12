local servers = {
  "ansiblels",
  "bashls",
  "clangd",
  "dockerls",
  "docker_compose_language_service",
  "gopls",
  "gradle_ls",
  "helm_ls",
  "jdtls",
  "jsonls",
  "kotlin_language_server",
  "lemminx", -- xml
  "lua_ls",
  "marksman",
  "neocmake", -- requires cargo installer
  "puppet",
  -- "salt_ls",  -- breaks on  yaml package
  "spectral", -- openapi
  "terraformls",
  "ts_ls",
  "yamlls",
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("my.lsp.handlers").on_attach,
    capabilities = require("my.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "my.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
