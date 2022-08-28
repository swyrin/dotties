#!/bin/bash

# ########### Arch with BSPWM install ###########
# No, this is not Ubuntu!
# No, DO NOT BLINDLY RUN THIS FILE!!!!
#
# Basically this is just my autosetup file when I (re)install Arch (btw)!
# Just clone this file, make anything.sh an executable, if it was not.

# For debugging sake, but it *should* work
echo "Finding 'dotties' directory..."
DOTTIES_DIR=$(find $HOME -type d -name "dotties")
echo "Found and using dotties directory $DOTTIES_DIR"
echo "The script *should* ask you the password below"

# Setup custom pacman stuffs: parallel downloads, c o l o r s
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf

# As usual, pacman -Syu
sudo pacman -Syu

# Install Xorg and friends
sudo pacman -S --needed --noconfirm xorg xorg-apps xorg-server xorg-xinit \
                                    mesa libva-intel-driver \
                                    intel-media-driver vulkan-intel \
                                    xf86-video-nouveau

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

# Install BSPWM, polybar, rofi, picom, sxhkd, feh
# Technically, setup the desktop
sudo pacman -S --needed --noconfirm bspwm polybar rofi picom sxhkd feh

# Install and enable LightDM
sudo pacman -S --needed --noconfirm lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm.service

# Install cli-visualizer and override with PyWal colors
sudo pacman -S --needed --noconfirm ncurses fftw cmake
git clone https://github.com/dpayne/cli-visualizer.git
cd cli-visualizer
./install.sh
cd ..
sudo rm -rf cli-visualizer

# Install python-pywal
sudo pacman -Syu --needed --noconfirm python-pywal
sudo wal -i desktop.jpg

# Install stuffs for system tray
sudo pacman -S --needed --noconfirm redshift python-gobject
sudo pacman -S --needed --noconfirm network-manager-applet
sudo pacman -S --needed --noconfirm pavucontrol pasystray

# Install zsh, oh-my-zsh and powerlevel10k (+fonts)
# THIS IS AN INTERACTIVE INSTALLATION, SO **PLEASE** FOLLOW THE SCREEN
# The installation will **EXIT** the installation process, so I kept this as reference!!!
# sudo pacman -S --needed --noconfirm zsh zsh-completions
# sudo mkdir -p /usr/share/fonts/ && sudo cp -a $DOTTIES_DIR/fonts/. /usr/share/fonts/
# sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# yay -S --noconfirm zsh-theme-powerlevel10k-git
# echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Setup needed packages (for me, you should change) as final run!!!
# - Dolphin     - File manager
# - neofetch    - Neofetch
# - btop        - Better htop
# - Gwenview    - Image viewer
# - Kate        - My favorite GUI text editor
# - Kitty       - My favorite terminal
# - Ark         - Archive Manager (+unrar for RAR support)
# - xclip       - Command lind clipboard stuffs
sudo pacman -S --needed --noconfirm dolphin neofetch btop gwenview kate kitty ark xclip
sudo pacman -S --needed --noconfirm unrar

# Setup dotties by symbolic links
# ATTENTION: IF THIS IS **NOT** YOUR **FIRST TIME** RUNNING THIS, COMMENT THEM
#            OR YOU *MIGHT* GET F**KED UP
sudo rm -rf $HOME/.config/
sudo chmod 777 -R $DOTTIES_DIR/.config/
sudo ln -s $DOTTIES_DIR/.config/ $HOME/
sudo ln -sf $DOTTIES_DIR/.p10k.zsh ~/.p10k.zsh
sudo ln -sf $DOTTIES_DIR/.zshrc $HOME/.zshrc
sudo ln -sf $DOTTIES_DIR/.fehbg ~/.fehbg

# Export some environment variables
export TERM=kitty
export vis="$DOTTIES_DIR/viswal.sh"

echo "Installation finished!!!"
echo "And please, for the love of god, DO NOT REMOVE THE $DOTTIES_DIR FOLDER!!!!"
echo "They are all symlinked, that is all, have a good day and happy ricing!"
echo "REMEMBER TO REBOOT!!!! DO **NOT** USE 'startx' AFTER THIS!!!"
