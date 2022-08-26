#!/bin/bash

# ########### Arch with AwesomeWM install ###########
# Yes, run this as sudo please, kthx!
# No, this is not Ubuntu!
# No, DO NOT BLINDLY RUN THIS FILE!!!!
#
# Basically this is just my autosetup file when I install a new thing!
# Just clone this file, make anything.sh an executable

# Setup parallelism for pacman
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf

# I use archinstall with AwesomeWM profile, so X related packages are installed and properly set up
# If you are using mininal install, or manually install from Arch Wiki, uncomment them!
# REMEMBER TO REBOOT!!!! DO **NOT** USE `startx` AFTER THIS!!!
# You *may* want to double check the $HOME/.xinitrc file!

# Install and setup X
sudo pacman -S --needed --noconfirm xorg-server xorg-server-utils xorg-xinit mesa libva-intel-driver intel-media-driver vulkan-intel
sudo pacman -S --needed --noconfirm alacritty
# cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
# sed -i 's/xterm/alacritty/g' $HOME/.xinitrc
# echo "exec awesome" | sudo tee -a $HOME/.xinitrc

# Setup my beloved nano
sudo pacman -S --needed --noconfirm nano
sudo pacman -S --needed --noconfirm unzip wget
wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh
echo "set linenumbers" >> $HOME/.nanorc
echo "set tabstospaces" >> $HOME/.nanorc
echo "set tabsize 4" >> $HOME/.nanorc

# Install yay AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
sudo rm -r yay

# Install awesome
sudo pacman -S --needed --noconfirm awesome

# Install polybar
sudo pacman -S --needed --noconfirm polybar

# Install Chrome and Discord (optional)
yay -S google-chrome discord_arch_electron --answerdiff=None --noconfirm

# Install rofi
sudo pacman -S --needed --noconfirm rofi

# Install picom
sudo pacman -S --needed --noconfirm picom

# Install and setup LightDM
sudo pacman -S --needed --noconfirm lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm.service

# Install cli-visualizer
sudo pacman -S --needed --noconfirm ncurses fftw cmake
git clone https://github.com/dpayne/cli-visualizer.git
cd cli-visualizer
./install.sh
cd ..
sudo rm -rf cli-visualizer

# Setup dotties by symbolic links
mkdir -p $HOME/.config/
chmod 777 -R ./.config/
ln -s ./.config $HOME/.config

# Clear screen and notify that installation is complete!!!
clear
echo "Installation finished!!!"
