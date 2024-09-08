#!/bin/bash

set -e
set -u
set -o pipefail
set -x

SYSCTL_ENABLE="sudo systemctl enable --now"
SYSCTL_ENABLE_USER="systemctl enable --user --now"

# ------ Audio ------
$SYSCTL_ENABLE_USER pipewire.service
$SYSCTL_ENABLE_USER pipewire-pulse.service
$SYSCTL_ENABLE_USER pipewire-pulse.socket
$SYSCTL_ENABLE_USER wireplumber.service

# ------ Network ------
$SYSCTL_ENABLE NetworkManager.service

# ------ AUR builds ------
sudo sed -i 's/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j\$\(nproc\)\"/g' /etc/makepkg.conf
sudo sed -i 's/-march=x86-64 -mtune=generic/-march=native -ftree-vectorize -fomit-frame-pointer/g' /etc/makepkg.conf
sudo sed -i 's/#RUSTFLAGS=\"-C opt-level=2\"/RUSTFLAGS=\"-C opt-level=2 -C target-cpu=native\"/g' /etc/makepkg.conf
