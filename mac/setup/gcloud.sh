#!/usr/bin/env bash
set -euo pipefail

# Installs the Google Cloud SDK to ~/.google-cloud-sdk. Idempotent: no-ops if
# already installed. Previously used a dedicated pyenv virtualenv; now just
# uses whatever python3 is on PATH (mise-provided, see .mise.toml).

if [[ -d "$HOME/.google-cloud-sdk" ]]; then
  exit 0
fi

tmpdir="$(mktemp -d)"
curl -s https://sdk.cloud.google.com > "$tmpdir/install.sh"
CLOUDSDK_PYTHON="$(command -v python3)" bash "$tmpdir/install.sh" --disable-prompts --install-dir="$HOME"
mv "$HOME/google-cloud-sdk" "$HOME/.google-cloud-sdk"
rm -rf "$tmpdir"
