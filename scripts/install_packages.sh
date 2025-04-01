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

networking_packages=(
  "netbird"
  "netbird-ui"
)

packages=(
  "${system_packages[@]}"
  "${devops_packages[@]}"
  "${networking_packages[@]}"
)

rpm-ostree install "${packages[@]}"
