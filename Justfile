export HOME := env_var("HOME")

default:
    @just --list

# --- top-level dispatchers ---

install: (_detect-os-and-run "install")
sync: (_detect-os-and-run "sync")

_detect-os-and-run action:
    #!/usr/bin/env bash
    set -euo pipefail
    if [[ "$(uname)" == "Darwin" ]]; then
        just mac-{{action}}
    elif [[ -f /etc/arch-release ]] || command -v omarchy-version >/dev/null 2>&1; then
        just omarchy-{{action}}
    else
        echo "unsupported platform" >&2
        exit 1
    fi

# --- stow ---

stow-common:
    stow -d stow -t "$HOME" --restow common

stow-mac: stow-common
    stow -d stow -t "$HOME" --restow mac

stow-omarchy: stow-common
    stow -d stow -t "$HOME" --restow omarchy

stow-dry-run pkg:
    stow -d stow -t "$HOME" -n -v {{pkg}}

unstow pkg:
    stow -d stow -t "$HOME" -D {{pkg}}

# --- mac ---

mac-xcode-clt:
    ./mac/xcode-clt.sh

mac-brew:
    #!/usr/bin/env bash
    set -euo pipefail
    if ! command -v brew >/dev/null 2>&1; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew bundle --file=mac/Brewfile

mac-setup:
    just _run-stamped-scripts mac/setup .stamps/mac
    ./mac/setup/sketchybar-extras.sh
    ./mac/setup/gcloud.sh
    ./mac/setup/poetry.sh
    ./mac/setup/krew-plugins.sh

mac-install: mac-xcode-clt mac-brew stow-mac mise-install mac-setup

mac-sync: mac-brew stow-mac mise-install mac-setup

# --- omarchy ---

omarchy-pkgs:
    ./omarchy/install-pkgs.sh omarchy/pkglist.txt

omarchy-setup:
    just _run-stamped-scripts omarchy/setup .stamps/omarchy

omarchy-install: omarchy-pkgs stow-omarchy mise-install omarchy-setup

omarchy-sync: omarchy-pkgs stow-omarchy mise-install omarchy-setup

# --- mise (common) ---

mise-install:
    mise install

# --- stamped one-shot script runner (idempotency) ---

_run-stamped-scripts dir stampdir:
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p {{stampdir}}
    shopt -s nullglob
    for script in {{dir}}/*.sh; do
        stamp="{{stampdir}}/$(basename "$script").stamp"
        if [[ ! -f "$stamp" ]] || [[ "$script" -nt "$stamp" ]]; then
            "$script" && touch "$stamp"
        fi
    done

# --- misc/dev ---

lint:
    shellcheck stow/mac/scripts/* mac/setup/*.sh mac/xcode-clt.sh omarchy/*.sh
    yamllint -c stow/mac/.config/yamllint/config stow/mac/.config

clean-stamps:
    rm -rf .stamps
