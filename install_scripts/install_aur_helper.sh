#!/bin/bash
set -euox pipefail

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru-bin.git
cd $(pwd)/paru-bin
makepkg -si --noconfirm
rm $(pwd)/paru-bin -rf
