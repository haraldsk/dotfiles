# dotfiles

Forked from `nhhagen/.dotfiles`

Multi-platform dotfiles, symlinked with [GNU Stow](https://www.gnu.org/software/stow/)
and orchestrated with [`just`](https://github.com/casey/just).

## Prerequisites

- `git`
- `stow` and `just` (e.g. `brew install stow just` on mac; `pacman -S stow just` on Omarchy)
- macOS + Homebrew, or an Omarchy (Arch/Hyprland) base install

## Quickstart

```sh
just install   # auto-detects mac vs omarchy
just sync      # re-run any time to pick up changes, safe to repeat
```

Or explicitly: `just mac-install` / `just mac-sync` / `just omarchy-install` / `just omarchy-sync`.

Run `just --list` to see every recipe.

## Layout

```
stow/common/    # dotfiles shared by every machine (mirrors $HOME)
stow/mac/       # mac-only dotfiles (mirrors $HOME)
stow/omarchy/   # omarchy-only dotfiles (mirrors $HOME)
mac/            # mac bootstrap tooling: Brewfile, one-shot setup scripts
omarchy/        # omarchy bootstrap tooling: package list, one-shot setup scripts
.mise.toml      # shared tool-version manifest (see https://mise.jdx.dev)
```

`stow/common/` intentionally starts out nearly empty — everything carried
over from the old single-machine setup lives in `stow/mac/` for now, and gets
promoted into `stow/common/` by hand, item by item, as it turns out to be
worth sharing with the Omarchy machine too. See `AGENTS.md` for the
conventions around that and around adding a new platform.

## Package/version management

- macOS packages: `mac/Brewfile`, installed via `brew bundle`.
- Omarchy packages: `omarchy/pkglist.txt` (pacman + AUR sections), installed
  via `omarchy/install-pkgs.sh`.
- Language/tool versions: `.mise.toml`, installed via `mise install`
  (replaces pyenv/nvm/sdkman/tfenv/goenv from the old Makefile-based setup).
