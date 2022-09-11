#!/bin/bash

# ########### Arch with BSPWM install ###########
# No, this is not Ubuntu!
# No, DO NOT BLINDLY RUN THIS FILE!!!!
#
# Basically this is just my autosetup file when I (re)install Arch (btw)!
# Just clone this file, make anything.sh an executable, if it was not.
# ###############################################

# For debugging sake, but it *should* work as I want
echo "Finding 'dotties' directory..."
DOTTIES_DIR=$(find $HOME -type d -name "dotties")
echo "Found and using dotties directory $DOTTIES_DIR"
echo "The script *might* ask you the password below"

# Setup custom pacman stuffs: parallel downloads, c o l o r s
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads = 8/ParallelDownloads = 8/g' /etc/pacman.conf

# As usual, pacman -Syu
sudo pacman -Syu --noconfirm

# Install server packages
# I assume that you will run this file after boot Arch for the first time
sudo pacman -S --needed --noconfirm pulseaudio networkmanager dhcpcd
sudo systemctl enable NetworkManager.service
sudo systemctl enable dhcpcd.service

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
if [[ -z $(which yay) ]]
then
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  sudo rm -r yay
else
  echo "AUR helper yay already installed"
fi

# Install BSPWM, eww, rofi, picom (fork), sxhkd, polybar, feh
# Technically, setup the desktop
sudo pacman -S --needed --noconfirm bspwm rofi sxhkd polybar dunst feh
yay -S --noconfirm --removemake picom-ibhagwan-git
yay -S --noconfirm --removemake eww

# Install and enable LightDM
sudo pacman -S --needed --noconfirm lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm.service

if [[ -z $(which vis) ]]
then
  # Install cli-visualizer and override with PyWal colors
  sudo pacman -S --needed --noconfirm ncurses fftw cmake
  git clone https://github.com/dpayne/cli-visualizer.git
  cd cli-visualizer
  ./install.sh
  cd ..
  sudo rm -rf cli-visualizer
else
  echo "cli-visualizer already installed"
fi

# Install python-pywal
sudo pacman -Syu --needed --noconfirm python-pywal
sudo wal -i -n $DOTTIES_DIR/desktop.jpg

# Install stuffs for bars
sudo pacman -S --needed --noconfirm acpi alsa-utils playerctl sysstat xdotool

# Install stuffs for system tray
sudo pacman -S --needed --noconfirm redshift python-gobject
sudo pacman -S --needed --noconfirm network-manager-applet
sudo pacman -S --needed --noconfirm pavucontrol pasystray
sudo pacman -S --needed --noconfirm flameshot

# Install fonts
# References: https://www.reddit.com/r/archlinux/comments/a2g77x/what_are_your_default_font_packages_you_install/
sudo mkdir -p /usr/share/fonts/ && sudo cp -a $DOTTIES_DIR/fonts/. /usr/share/fonts/
sudo pacman -S  --needed --noconfirm  ttf-dejavu ttf-liberation ttf-font-awesome ttf-liberation ttf-droid ttf-ubuntu-font-family \
                                      noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji \
                                      adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts
yay -S  --needed --noconfirm --removemake noto-fonts-tc \
                                          siji-git \
                                          ttf-unifont ttf-gelasio-ib ttf-caladea ttf-carlito ttf-liberation-sans-narrow ttf-ms-fonts

# Setup needed packages (for me, you should change) as final run!!!
# - Thunar        - File manager (+plugins)
# - neofetch      - Neofetch
# - btop          - Better htop
# - Viewnior      - Image viewer
# - Geany         - GUI text editor
# - Kitty         - Terminal emulator
# - xclip         - Command line clipboard stuffs
# - font-manager  - Font manager
sudo pacman -S --needed --noconfirm thunar neofetch btop viewnior geany kitty xclip font-manager
sudo pacman -S --needed --noconfirm gvfs thunar-volman thunar-archive-plugin thunar-media-tags-plugin

# Need to be installed manually I guess?
# - GitKraken     - I love this Git GUI client
# - Google Chrome - Web Browser
# - Discord       - Discord (+with system Electron)
# - Peazip        - Archive Manager
# yay -S --needed --noconfirm --removemake peazip-gtk2-bin
# yay -S --needed --noconfirm --removemake gitkraken
# yay -S --needed --noconfirm --removemake google-chrome
# yay -S --needed --noconfirm --removemake discord_arch_electron

# Setup files
sudo chmod -R 777 $DOTTIES_DIR
sudo ln -sf $DOTTIES_DIR/.zshrc $HOME/.zshrc
sudo ln -sf $DOTTIES_DIR/.p10k.zsh $HOME/.p10k.zsh
sudo ln -s $DOTTIES_DIR/.config/bspwm/ $HOME/.config/bspwm/
sudo ln -s $DOTTIES_DIR/.config/eww/ $HOME/.config/eww/
sudo ln -s $DOTTIES_DIR/.config/systemd/ $HOME/.config/systemd/
sudo ln -s $DOTTIES_DIR/.config/kitty/ $HOME/.config/kitty/
sudo ln -s $DOTTIES_DIR/.config/picom/ $HOME/.config/picom/
sudo ln -s $DOTTIES_DIR/.config/vis/ $HOME/.config/vis/
sudo ln -s $DOTTIES_DIR/.config/wal/ $HOME/.config/wal/
sudo ln -s $DOTTIES_DIR/.config/Thunar/ $HOME/.config/Thunar/
sudo ln -s $DOTTIES_DIR/.config/rofi/ $HOME/.config/rofi/

# Export some environment variables
source $DOTTIES_DIR/env.sh

echo "Installation finished!!!"
echo "And please, for the love of god, DO NOT REMOVE THE $DOTTIES_DIR FOLDER!!!! Why? It is **SYMLINKED**!"
echo "That is all, have a good day and happy ricing!"
echo "AND REMEMBER TO REBOOT!!!! DO **NOT** USE 'startx' AFTER THIS!!!"
