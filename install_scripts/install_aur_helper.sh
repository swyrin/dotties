#!/bin/bash
set -euox pipefail

if [ -z $(which paru) ]
then
    sudo pacman -S --needed git base base-devel
    git clone https://aur.archlinux.org/paru-bin.git
    cd $(pwd)/paru-bin
    makepkg -si --noconfirm
    cd ../
    rm $(pwd)/paru-bin -rf
fi
