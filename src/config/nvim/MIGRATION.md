# Migration Guide: none-ls to conform.nvim + nvim-lint

This document provides a step-by-step guide for migrating from `none-ls` (formerly `null-ls`) to the modern `conform.nvim` + `nvim-lint` approach.

## Why Migrate?

- **none-ls is archived**: The original maintainer archived the project
- **Better performance**: Dedicated tools are faster and more efficient
- **Active development**: conform.nvim and nvim-lint are actively maintained
- **Focused functionality**: Each tool does one thing well
- **Modern architecture**: Better integration with lazy.nvim

## Current Status

### ✅ Completed (Python)
- Python formatting: `ruff_format` via conform.nvim
- Python linting: `ruff` via nvim-lint
- Python LSP: `pyright` via mason + lspconfig

### 🔄 Still using none-ls (to be migrated)
See `lua/my/lsp/null-ls.lua` for the full list:

**Formatters:**
- prettier (JS/TS/JSON/etc)
- gofumpt, goimports_reviser (Go)
- hclfmt (HCL)
- markdownlint (Markdown)
- puppet_lint (Puppet)
- stylua (Lua) ✨ **Already using conform.nvim format-on-save**
- terraform_fmt (Terraform)

**Linters/Diagnostics:**
- actionlint (GitHub Actions)
- golangci_lint (Go)
- npm_groovy_lint (Groovy)
- terraform_validate, tfsec (Terraform)
- yamllint (YAML)
- vale (Prose)

## Migration Strategy

### Phase 1: Move Formatters to conform.nvim

Edit `lua/plugins/conform.lua` and add formatters one language at a time:

```lua
formatters_by_ft = {
  python = { "ruff_format" }, -- ✅ Done
  lua = { "stylua" },         -- Add this
  javascript = { "prettier" },
  typescript = { "prettier" },
  json = { "prettier" },
  go = { "gofumpt", "goimports_reviser" },
  terraform = { "terraform_fmt" },
  markdown = { "markdownlint" },
  -- etc.
}
```

### Phase 2: Move Linters to nvim-lint

Edit `lua/plugins/nvim-lint.lua` and add linters:

```lua
linters_by_ft = {
  python = { "ruff" },           -- ✅ Done
  go = { "golangci_lint" },      -- Add this
  yaml = { "yamllint" },
  terraform = { "tflint" },
  markdown = { "vale" },
  -- etc.
}
```

### Phase 3: Update mason-tool-installer

Edit `lua/plugins/mason-tool-installer.lua` and add tools:

```lua
ensure_installed = {
  -- Python (✅ Done)
  "pyright",
  "ruff",
  
  -- Add as you migrate:
  "stylua",
  "prettier",
  "golangci-lint",
  "yamllint",
  "tflint",
  -- etc.
}
```

### Phase 4: Remove from none-ls

After confirming each tool works in conform/nvim-lint:

1. Edit `lua/my/lsp/null-ls.lua`
2. Comment out or remove the migrated formatter/linter
3. Test to ensure nothing breaks

### Phase 5: Final Cleanup (when all tools are migrated)

1. **Remove plugins** from `lua/plugins/init.lua`:
   ```lua
   -- Remove these lines:
   {
     "jay-babu/mason-null-ls.nvim",
     dependencies = { ... },
     config = function() ... end,
   },
   "nvimtools/none-ls.nvim",
   ```

2. **Delete file**: `lua/my/lsp/null-ls.lua`

3. **Remove require** from `lua/my/lsp/init.lua`:
   ```lua
   -- Remove this line:
   require("my.lsp.null-ls")
   ```

## Tool Mapping Reference

### Formatters
| Language   | none-ls           | conform.nvim      |
|------------|-------------------|-------------------|
| Python     | black             | ruff_format       |
| Lua        | stylua            | stylua            |
| JS/TS/JSON | prettier          | prettier          |
| Go         | gofumpt           | gofumpt           |
| Go imports | goimports_reviser | goimports_reviser |
| Terraform  | terraform_fmt     | terraform_fmt     |
| Markdown   | markdownlint      | markdownlint      |

### Linters
| Language   | none-ls              | nvim-lint       |
|------------|----------------------|-----------------|
| Python     | flake8               | ruff            |
| Go         | golangci_lint        | golangci_lint   |
| YAML       | yamllint             | yamllint        |
| Terraform  | terraform_validate   | tflint          |
| Terraform  | tfsec                | tfsec           |
| Actions    | actionlint           | actionlint      |
| Groovy     | npm_groovy_lint      | -               |
| Prose      | vale                 | vale            |

## Testing Your Migration

After each language migration:

1. **Open a file** of that type
2. **Format it**: Save the file or run `<leader>f`
3. **Check diagnostics**: Look for linting errors in the buffer
4. **Verify Mason**: Run `:Mason` to see installed tools
5. **Check logs**: Run `:ConformInfo` or `:lua print(vim.inspect(require('lint').linters_by_ft))`

## Troubleshooting

### Tool not found
- Run `:Mason` and manually install the tool
- Check `mason-tool-installer` configuration
- Restart Neovim

### Formatter not working
- Run `:ConformInfo` to see available formatters
- Check if tool is executable: `:!which ruff`
- Verify configuration in `conform.lua`

### Linter not showing diagnostics
- Check `nvim-lint` config in `nvim-lint.lua`
- Verify autocmd is running: `:autocmd lint`
- Try manual trigger: `<leader>l`

## Key Bindings

| Binding    | Action                    | Plugin       |
|------------|---------------------------|--------------|
| `<leader>f`| Format buffer             | conform      |
| `<leader>l`| Run linting manually      | nvim-lint    |
| Save file  | Auto-format + auto-lint   | both         |

## Resources

- [conform.nvim documentation](https://github.com/stevearc/conform.nvim)
- [nvim-lint documentation](https://github.com/mfussenegger/nvim-lint)
- [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)

## Notes

- **Coexistence**: conform.nvim and nvim-lint can run alongside none-ls during migration
- **No rush**: Migrate one language at a time to avoid breaking your workflow
- **Format-on-save**: Both none-ls and conform support this (avoid conflicts by removing from one)
- **Testing**: Always test in a non-critical file first
