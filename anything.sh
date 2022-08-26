#!/bin/bash

# ########### Arch with AwesomeWM install ###########
# Yes, run this as sudo please, kthx!
# No, this is not Ubuntu!
# No, DO NOT BLINDLY RUN THIS FILE!!!!
#
# Basically this is just my autosetup file when I install a new thing!
# Just clone this file, make anything.sh an executable

# Setup parallelism for pacman
sudo echo "ParallelDownloads = 5" >> /etc/pacman.conf

# I use archinstall with AwesomeWM profile, so X related packages are installed and properly set up
# If you are using mininal install, or manually install from Arch Wiki, uncomment them!
# REMEMBER TO REBOOT!!!! DO **NOT** USE `startx` AFTER THIS!!!
# You *may* want to double check the $HOME/.xinitrc file!

# sudo pacman -S --noconfirm xorg-server xorg-server-utils xorg-xinit mesa libva-intel-driver intel-media-driver vulkan-intel
# sudo pacman -S --noconfirm alacritty
# cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
# sed -i 's/xterm/alacritty/g' $HOME/.xinitrc
# echo "exec awesome" >> $HOME/.xinitrc

# Setup my beloved nano
sudo pacman -S --noconfirm nano
sudo pacman -S --noconfirm unzip wget
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
sudo pacman -S --noconfirm polybar

# Install Chrome and Discord (optional)
# sudo yay -S google-chrome discord_arch_electron --answerdiff=None --noconfirm

# Install rofi
sudo pacman -S --noconfirm rofi

# Install picom
sudo pacman -S --noconfirm picom

# Setup dotties
cp .config $HOME/.config
