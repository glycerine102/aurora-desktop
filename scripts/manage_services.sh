#!/bin/bash

set -ouex pipefail

systemctl enable podman.socket
systemctl enable input-remapper.service
systemctl disable tailscaled.service
