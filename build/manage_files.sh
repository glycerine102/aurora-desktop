#!/bin/bash

set -oue pipefail

trap '[[ $BASH_COMMAND != echo* ]] && [[ $BASH_COMMAND != log* ]] && echo "+ $BASH_COMMAND"' DEBUG

log() {
  echo "=== $* ==="
}

log "Remove unused skel files"
rm /etc/skel/.config/autostart/sb-key-notify.desktop
rm /etc/skel/.local/share/flatpak/overrides/com.google.Chrome

log "Ensure directories exist"
mkdir -p /var/lib/alternatives

log "Done managing files"
