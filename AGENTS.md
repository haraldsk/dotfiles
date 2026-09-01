# AGENTS.md

## Build/Lint/Test Commands

- **Install/sync dotfiles**: `just install` / `just sync` (auto-detect platform), or
  `just mac-install` / `just mac-sync` / `just omarchy-install` / `just omarchy-sync`
- **List all recipes**: `just --list`
- **Build sketchybar helpers**: `make -C stow/mac/.config/sketchybar/helpers`
- **Format Lua code**: `stylua stow/mac/.config/nvim/`
- **Lint YAML files**: `yamllint stow/mac/.config/`
- **Shell script linting**: `shellcheck stow/mac/scripts/* mac/setup/*.sh omarchy/*.sh`, or just `just lint`

## Directory conventions

- `stow/common/`, `stow/mac/`, `stow/omarchy/` are GNU Stow packages — each
  one mirrors `$HOME` exactly (e.g. `stow/mac/.zshrc` → `~/.zshrc`,
  `stow/mac/.config/nvim` → `~/.config/nvim`). **Never put a non-dotfile
  (scripts, package lists, Brewfile) inside `stow/`** — it would get
  symlinked into `$HOME` by mistake.
- `mac/` and `omarchy/` at the repo root (no `stow/` prefix) hold bootstrap
  tooling for that platform instead: `mac/Brewfile`, `mac/setup/*.sh`
  (idempotent one-shot scripts, stamp-gated via `.stamps/`), `omarchy/pkglist.txt`,
  `omarchy/install-pkgs.sh`.
- **No pre-emptive common dotfiles.** `stow/common/` intentionally starts
  with almost nothing — everything carried over from the old single-machine
  (mac) setup lives in `stow/mac/`, unsplit, even where it's technically
  OS-agnostic in content. When something is worth sharing with Omarchy too,
  promote it deliberately with `git mv stow/mac/<file> stow/common/<file>`.
  For shell config specifically, the intended shape once there's something
  to share: pull the shared logic into `stow/common/.config/zsh/common.zsh`
  (and `.config/bash/common.bash`), have `stow/mac/.zshrc` source it plus
  whatever stays mac-only, and add a thin `stow/omarchy/.zshrc` that sources
  the same common lib plus omarchy-only bits. Don't build this out ahead of
  actually needing it.
- **Adding a new platform**: add a `stow/<platform>/` package (mirrors
  `$HOME`), a matching `<platform>/` bootstrap dir at the repo root (package
  list + setup scripts, whatever that platform needs), and `<platform>-install`
  / `<platform>-sync` recipes in the `Justfile` following the existing
  `mac-*`/`omarchy-*` pattern. Extend `_detect-os-and-run` if it should be
  reachable via the auto-detecting `just install`/`just sync`.

## Package/version management

- macOS packages: `mac/Brewfile`, installed via `brew bundle --file=mac/Brewfile`.
- Omarchy packages: `omarchy/pkglist.txt` (`# pacman` / `# aur` sections),
  installed via `omarchy/install-pkgs.sh`.
- Language/tool versions: `.mise.toml` (stowed as `stow/common/.mise.toml`),
  installed via `mise install`. Replaces pyenv, nvm, sdkman, tfenv, and goenv
  from the old Makefile-based setup — don't reintroduce those.
- Tools that don't fit mise cleanly (gcloud SDK, poetry, kubectl krew
  plugins) get their own idempotent script under `mac/setup/`.

## Code Style Guidelines

### Lua (Neovim config)
- Configuration located in `stow/mac/.config/nvim/`
- Main entry point: `stow/mac/.config/nvim/init.lua`
- Plugin config split into two areas:
  - **New config**: `stow/mac/.config/nvim/lua/plugins/` (lazy.nvim plugin specs)
  - **Legacy config**: `stow/mac/.config/nvim/lua/my/` (old-style setup, gradually migrating)
- Use 2 spaces indentation, 120 column width
- Follow lazy.nvim plugin structure with `spec = { import = "plugins" }`
- Leader key: space (`vim.g.mapleader = " "`)

### Shell Scripts
- Use `shellcheck` for linting
- Follow POSIX shell conventions where possible
- Scripts should be executable and use proper shebangs
- One-shot setup scripts under `mac/setup/`/`omarchy/setup/` must be
  idempotent (safe to rerun) — they're gated by a stamp file keyed on the
  script's mtime, not by their own internal state

### YAML
- Use `yamllint` with project config in `stow/mac/.config/yamllint/config`
- Disable document-end, enable new-line-at-end-of-file
- Line length disabled for flexibility

### C (sketchybar helpers)
- Use C99 standard: `clang -std=c99`
- Optimize with `-O3`
- Link macOS frameworks: Carbon, SkyLight

### General
- Use symbolic links (via GNU Stow) for dotfile deployment
- Use conventional commit messages (feat:, fix:, chore:, etc.)
