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
sudo cp -f $THIS_PLACE/assets/wallpaper.png    /usr/share/sddm/themes/sddm-astronaut-theme/background.png
sudo cp -f $THIS_PLACE/.config/sddm/theme.conf /usr/share/sddm/themes/sddm-astronaut-theme/theme.conf
sudo cp -f $THIS_PLACE/.config/sddm/sddm.conf  /etc/sddm.conf

# ------ Audio ------
$SYSCTL_ENABLE_USER pipewire.service
$SYSCTL_ENABLE_USER pipewire-pulse.service
$SYSCTL_ENABLE_USER pipewire-pulse.socket
$SYSCTL_ENABLE_USER wireplumber.service

# ------ Network ------
$SYSCTL_ENABLE NetworkManager.service

# ------ AUR builds ------
sudo sed -i 's/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j\$\(nproc\)\"/g' /etc/makepkg.conf
sudo sed -i 's/#RUSTFLAGS=\"-C opt-level=2\"/RUSTFLAGS=\"-C opt-level=2 -C target-cpu=native\"/g' /etc/makepkg.conf

# ------ Desktop ------
hyprshade install
$SYSCTL_ENABLE_USER hyprshade.timer
