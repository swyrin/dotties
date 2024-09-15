#!/bin/bash
set -euox pipefail

if [ -z $(which paru) ]
then
    sudo pacman -S --needed git base base-devel rust
    git clone https://aur.archlinux.org/paru-git.git
    cd $(pwd)/paru-git
    makepkg -si --noconfirm
    cd ../
    rm $(pwd)/paru-git -rf
fi
