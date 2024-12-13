#!/bin/bash

set -ouex pipefail

system_packages=(
  "docker-ce"
  "docker-ce-cli"
  "docker-buildx-plugin"
  "docker-compose-plugin"
  "docker-ce-rootless-extras"
)

packages=(
  "${system_packages[@]}"
)

dnf remove -y "${packages[@]}"
