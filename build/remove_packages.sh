#!/bin/bash

set -oue pipefail

trap '[[ $BASH_COMMAND != echo* ]] && [[ $BASH_COMMAND != log* ]] && echo "+ $BASH_COMMAND"' DEBUG

log() {
  echo "=== $* ==="
}

log "Begin removing packages"

system_packages=(
  "docker-ce"
  "docker-ce-cli"
  "docker-buildx-plugin"
  "docker-compose-plugin"
  "docker-ce-rootless-extras"
  "docker-model-plugin"
  "akonadi-server"
  "akonadi-server-mysql"
  "mariadb"
  "mariadb-backup"
  "mariadb-common"
  "mariadb-cracklib-password-check"
  "mariadb-errmsg"
  "mariadb-gssapi-server"
  "mariadb-server"
  "tailscale"
)

packages=(
  "${system_packages[@]}"
)

dnf5 remove -y "${packages[@]}"

log "Done removing packages"
