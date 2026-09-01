#!/usr/bin/env bash
set -euo pipefail

# Non-brew sketchybar extras: app-icon font + SbarLua, folded out of the old
# src/config/sketchybar/helpers/install.sh (brew-installable bits now live in mac/Brewfile).

FONT_PATH="$HOME/Library/Fonts/sketchybar-app-font.ttf"
if [[ ! -f "$FONT_PATH" ]]; then
  curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.5/sketchybar-app-font.ttf -o "$FONT_PATH"
fi

if [[ ! -f /usr/local/lib/libSbarLua.0.dylib && ! -f /opt/homebrew/lib/libSbarLua.0.dylib ]]; then
  tmpdir="$(mktemp -d)"
  git clone https://github.com/FelixKratz/SbarLua.git "$tmpdir"
  make -C "$tmpdir" install
  rm -rf "$tmpdir"
fi
