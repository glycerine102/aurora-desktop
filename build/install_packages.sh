#!/bin/bash

set -oue pipefail

trap '[[ $BASH_COMMAND != echo* ]] && [[ $BASH_COMMAND != log* ]] && echo "+ $BASH_COMMAND"' DEBUG

log() {
  echo "=== $* ==="
}

log "Install sanoid package"

SANOID_URL="https://github.com/decoyjoe/sanoid-portable/releases/download/2.2.0-2/sanoid-portable"
SANOID_DIR="/usr/local/sbin"
wget ${SANOID_URL} -O ${SANOID_DIR}/sanoid-portable
chmod +x ${SANOID_DIR}/sanoid-portable
sh ${SANOID_DIR}/sanoid-portable --assimilate
ln -s ${SANOID_DIR}/sanoid-portable /usr/local/sbin/sanoid
ln -s ${SANOID_DIR}/sanoid-portable /usr/local/sbin/syncoid
ln -s ${SANOID_DIR}/sanoid-portable /usr/local/sbin/findoid

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
