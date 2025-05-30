#!/bin/bash

set -ouex pipefail

system_packages=(
  "docker-ce"
  "docker-ce-cli"
  "docker-buildx-plugin"
  "docker-compose-plugin"
  "docker-ce-rootless-extras"
  "akonadi-server"
  "akonadi-server-mysql"
  "mariadb"
  "mariadb-backup"
  "mariadb-common"
  "mariadb-cracklib-password-check"
  "mariadb-errmsg"
  "mariadb-gssapi-server"
  "mariadb-server"
)

packages=(
  "${system_packages[@]}"
)

rpm-ostree uninstall "${packages[@]}"
