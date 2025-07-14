#!/bin/bash

set -ouex pipefail

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
