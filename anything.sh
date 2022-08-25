#!/bin/bash

# ########### Arch with AwesomeWM install ###########
# Yes, run this as sudo please, kthx!
# No, this is not Ubuntu!
#
# Basically this is just my autosetup file when I install a new thing!
# Just clone this file, make anything.sh an executable

# Setup parallelism for pacman
echo "ParallelDownloads = 5" >> /etc/pacman.conf

# Setup my beloved nano
pacman -S --noconfirm nano
pacman -S --noconfirm zip unzip wget
wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh
echo "set linenumbers" >> .nanorc
echo "set tabstospaces" >> .nanorc
echo "set tabsize 4" >> .nanorc

# Install yay AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -r yay

# Install polybar
pacman -S --noconfirm polybar

# Install Chrome and Discord (optional)
# yay -S google-chrome discord_arch_electron --answerdiff=None --noconfirm

# Install rofi
pacman -S --noconfirm rofi


# Setup dotties
cp .config $HOME/.config
