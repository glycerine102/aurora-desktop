#!/bin/bash

set -oue pipefail

trap '[[ $BASH_COMMAND != echo* ]] && [[ $BASH_COMMAND != log* ]] && echo "+ $BASH_COMMAND"' DEBUG

log() {
  echo "=== $* ==="
}

log "Enable systemd services"
systemctl enable input-remapper.service
systemctl enable sshd.service
systemctl enable lactd.service
systemctl enable zfs-load-key.service
systemctl enable zfs-scrub-monthly@storage.timer

log "Disable systemd services"
systemctl disable tailscaled.service

log "Set up systemd mounts"
systemctl enable var-mnt-tuxbox-learning.automount
systemctl enable var-mnt-tuxbox-movies.automount
systemctl enable var-mnt-tuxbox-music.automount
systemctl enable var-mnt-tuxbox-photos.automount
systemctl enable var-mnt-tuxbox-television.automount

log "Done managing services"
