#!/usr/bin/env bash
set -euo pipefail

# Installs packages listed in omarchy/pkglist.txt: a "# pacman" section and
# an "# aur" section, each one package name per line, blank lines and other
# comments ignored. Idempotent: pacman/yay --needed skip already-installed
# packages.

usage() {
  echo "usage: $0 <pkglist.txt>" >&2
  exit 1
}

[[ $# -eq 1 ]] || usage
pkglist="$1"
[[ -f "$pkglist" ]] || { echo "no such file: $pkglist" >&2; exit 1; }

section=""
pacman_pkgs=()
aur_pkgs=()

while IFS= read -r line; do
  case "$line" in
    "# pacman") section="pacman"; continue ;;
    "# aur") section="aur"; continue ;;
    \#*|"") continue ;;
  esac
  case "$section" in
    pacman) pacman_pkgs+=("$line") ;;
    aur) aur_pkgs+=("$line") ;;
  esac
done < "$pkglist"

if [[ ${#pacman_pkgs[@]} -gt 0 ]]; then
  sudo pacman -S --needed --noconfirm "${pacman_pkgs[@]}"
fi

if [[ ${#aur_pkgs[@]} -gt 0 ]]; then
  yay -S --needed --noconfirm "${aur_pkgs[@]}"
fi
