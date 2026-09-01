#!/usr/bin/env bash
set -euo pipefail

# Installs Xcode Command Line Tools. Idempotent: no-ops if already installed.

if xcode-select -p >/dev/null 2>&1; then
  exit 0
fi

xcode-select --install
