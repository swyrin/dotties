#!/bin/bash
set -e
set -u
set -o pipefail
set -x

SYSCTL_ENABLE="sudo systemctl enable --now"
SYSCTL_ENABLE_USER="systemctl enable --user --now"

# get dots directory
THIS_PLACE=$(dirname "$(realpath $0)")
THIS_PLACE="$(dirname "$THIS_PLACE")"

# ------ Login ------
sudo systemctl enable sddm.service
sudo mkdir /etc/sddm.conf.d -p
sudo cp -f $THIS_PLACE/assets/wallpaper.png         /usr/share/sddm/themes/sddm-astronaut-theme/background.png
sudo cp -f $THIS_PLACE/.config/sddm/theme.conf      /usr/share/sddm/themes/sddm-astronaut-theme/theme.conf
sudo cp -f $THIS_PLACE/.config/sddm/sddm.conf       /etc/sddm.conf
sudo cp -f $THIS_PLACE/.config/sddm/10-wayland.conf /etc/sddm.conf.d/10-wayland.conf

# ------ Audio ------
$SYSCTL_ENABLE_USER pipewire.service
$SYSCTL_ENABLE_USER pipewire-pulse.service
$SYSCTL_ENABLE_USER pipewire-pulse.socket
$SYSCTL_ENABLE_USER wireplumber.service

# ------ Desktop ------
hyprshade install
$SYSCTL_ENABLE_USER hyprshade.timer
