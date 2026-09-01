#!/usr/bin/env bash
set -euo pipefail

# Installs kubectl krew plugins. Idempotent: skips plugins already installed.

PLUGINS=(
  access-matrix
  colorize-applied
  community-images
  ctx
  cost
  neat
  images
  kurt
  kyverno
  mtail
  ns
  viewnode
  resource-capacity
)

installed="$(kubectl krew list 2>/dev/null || true)"
for plugin in "${PLUGINS[@]}"; do
  if ! grep -qx "$plugin" <<<"$installed"; then
    kubectl krew install "$plugin"
  fi
done
