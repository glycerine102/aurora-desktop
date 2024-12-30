#!/bin/bash

set -ouex pipefail

# Enable Services
systemctl enable podman.socket
systemctl enable input-remapper.service

# Disable Services
systemctl disable tailscaled.service
