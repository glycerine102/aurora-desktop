#!/bin/bash

set -ouex pipefail

systemctl enable podman.socket
systemctl disable tailscaled.service
