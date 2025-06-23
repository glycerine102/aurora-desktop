#!/bin/bash

set -ouex pipefail

# Enable Services
systemctl enable input-remapper.service
systemctl enable sshd.service
systemctl enable lactd.service
systemctl enable zfs-load-key.service

# Disable Services
systemctl disable tailscaled.service

# Enable Mounts
systemctl enable var-mnt-tuxbox-learning.automount
systemctl enable var-mnt-tuxbox-movies.automount
systemctl enable var-mnt-tuxbox-music.automount
systemctl enable var-mnt-tuxbox-photos.automount
systemctl enable var-mnt-tuxbox-television.automount
