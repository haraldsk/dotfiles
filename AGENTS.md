# AGENTS.md

## Build/Lint/Test Commands

- **Install all dotfiles**: `make install`
- **Build sketchybar helpers**: `make -C src/config/sketchybar/helpers`
- **Format Lua code**: `stylua src/config/nvim/`
- **Lint YAML files**: `yamllint src/config/`
- **Shell script linting**: `shellcheck scripts/*.sh src/scripts/*.sh`

## Code Style Guidelines

### Lua (Neovim config)
- Configuration located in `src/config/nvim/`
- Main entry point: `src/config/nvim/init.lua`
- Plugin config split into two areas:
  - **New config**: `src/config/nvim/lua/plugins/` (lazy.nvim plugin specs)
  - **Legacy config**: `src/config/nvim/lua/my/` (old-style setup, gradually migrating)
- Use 2 spaces indentation, 120 column width
- Follow lazy.nvim plugin structure with `spec = { import = "plugins" }`
- Leader key: space (`vim.g.mapleader = " "`)

### Shell Scripts
- Use `shellcheck` for linting
- Follow POSIX shell conventions where possible
- Scripts should be executable and use proper shebangs

### YAML
- Use `yamllint` with project config in `src/config/yamllint/config`
- Disable document-end, enable new-line-at-end-of-file
- Line length disabled for flexibility

### C (sketchybar helpers)
- Use C99 standard: `clang -std=c99`
- Optimize with `-O3`
- Link macOS frameworks: Carbon, SkyLight

### General
- Config files go in `src/config/`
- Scripts in `src/scripts/` for user scripts, `scripts/` for setup
- Use symbolic links for dotfile deployment
- All files in src/ folder are symlinked to $HOME prefixed with . (e.g., src/bashrc → $HOME/.bashrc)
- Use conventional commit messages (feat:, fix:, chore:, etc.)