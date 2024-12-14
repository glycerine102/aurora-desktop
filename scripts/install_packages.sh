#!/bin/bash

set -ouex pipefail

system_packages=(
  "libevdev-devel"
  "sassc"
)

devops_packages=(
  "alacritty"
  "cargo"
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
