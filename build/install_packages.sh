#!/bin/bash

set -oue pipefail

trap '[[ $BASH_COMMAND != echo* ]] && [[ $BASH_COMMAND != log* ]] && echo "+ $BASH_COMMAND"' DEBUG

log() {
  echo "=== $* ==="
}

log "Begin installing packages"

system_packages=(
  "lact"
  "libevdev-devel"
  "mbuffer"
  "sassc"
)

devops_packages=(
  "alacritty"
  "cargo"
  "git-filter-repo"
  "rust"
)

gaming_packages=(
  "steam"
)

networking_packages=(
  "netbird"
  "netbird-ui"
)

packages=(
  "${system_packages[@]}"
  "${devops_packages[@]}"
  "${gaming_packages[@]}"
  "${networking_packages[@]}"
)

dnf5 install -y "${packages[@]}"

log "Done installing packages"
