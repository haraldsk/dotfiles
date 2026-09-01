#!/usr/bin/env bash
set -euo pipefail

# Installs poetry via its standalone installer. Idempotent: no-ops if already
# installed. Previously ran inside a dedicated pyenv virtualenv; now just
# uses whatever python3 is on PATH (mise-provided, see .mise.toml).

if [[ -x "$HOME/.poetry/bin/poetry" ]]; then
  exit 0
fi

curl -sSL https://install.python-poetry.org | POETRY_HOME="$HOME/.poetry" python3 -
