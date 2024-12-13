#!/bin/bash

set -ouex pipefail

system_packages=(
  "sassc"
)

devops_packages=(
  "alacritty"
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
