#!/bin/bash

# ########### Arch with BSPWM install ###########
# No, this is not Ubuntu!
# No, DO NOT BLINDLY RUN THIS FILE!!!!
#
# Basically this is just my autosetup file when I (re)install Arch (btw)!
# Just clone this file, make anything.sh an executable, if it was not.
# ###############################################

# ONE MORE LAST WORD: THIS SCRIPT IS MEANT FOR **ME**!!!!!!!!!!!!!!!!!

# For debugging sake, but it *should* work as I want
echo "Finding 'dotties' directory..."
DOTTIES_DIR=$(find $HOME -type d -name "dotties")
echo "Found and using dotties directory $DOTTIES_DIR"
echo "The script *might* ask you the password below"

# Setup custom pacman stuffs: parallel downloads, c o l o r s
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 8/g' /etc/pacman.conf

# As usual, pacman -Syu
sudo pacman -Syu --noconfirm

# Sort mirrors
# This might take a while
sudo pacman -S --needed --noconfirm pacman-contrib
curl -s https://archlinux.org/mirrorlist/all/ | sudo tee /etc/pacman.d/mirrorlist
sudo sed -i 's/^#Server/Server/' -e '/^#/d' /etc/pacman.d/mirrorlist
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup | sudo tee /etc/pacman.d/mirrorlist

# Install server packages
# I assume that you will run this file after boot Arch for the first time
sudo pacman -S --needed --noconfirm pulseaudio networkmanager
sudo systemctl enable NetworkManager.service

# Install Xorg and friends
sudo pacman -S --needed --noconfirm xorg xorg-apps xorg-server xorg-xinit \
                                    mesa mesa-utils libva-intel-driver \
                                    intel-media-driver vulkan-intel \
                                    xf86-video-nouveau

# Setup my beloved nano
sudo pacman -S --needed --noconfirm nano
sudo pacman -S --needed --noconfirm unzip wget
wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh

if [[ -z $(grep "set linenumbers" $HOME/.nanorc) ]]
then
  echo "set linenumbers" >> $HOME/.nanorc
else
  echo "'set linenumbers' set in $HOME/.nanorc"
fi

if [[ -z $(grep "set tabstospaces" $HOME/.nanorc) ]]
then
  echo "set tabstospaces" >> $HOME/.nanorc
else
  echo "'set tabstospaces' set in $HOME/.nanorc"
fi

if [[ -z $(grep "set tabsize 4" $HOME/.nanorc) ]]
then
  echo "set tabsize 4" >> $HOME/.nanorc
else
  echo "'set tabsize 4' set in $HOME/.nanorc"
fi

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

# Install BSPWM, rofi, picom (fork), sxhkd, polybar, feh, inetutils
# Technically, setup the desktop
sudo pacman -S --needed --noconfirm bspwm rofi sxhkd polybar dunst feh
yay -S --noconfirm --removemake picom-ibhagwan-git

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
sudo wal -i $DOTTIES_DIR/desktop.jpg -n -s -t

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
                                          nerd-fonts-complete \
                                          ttf-unifont ttf-gelasio-ib ttf-caladea ttf-material-design-icons ttf-carlito ttf-liberation-sans-narrow ttf-ms-fonts

# Install GTK 3 themes
wget -qO- https://git.io/papirus-icon-theme-install | sh
sudo pacman -S --needed --noconfirm arc-gtk-theme

# Setup needed packages (for me, you should change) as final run!!!
# - Thunar        - File manager (+plugins)
# - neofetch      - Neofetch
# - btop          - Better htop
# - Viewnior      - Image viewer
# - Geany         - GUI text editor
# - Kitty         - Terminal emulator
# - xclip         - Commandline clipboard stuffs
# - font-manager  - Font manager
# - Peazip        - Archive manager
sudo pacman -S --needed --noconfirm thunar neofetch btop viewnior geany kitty xclip font-manager
sudo pacman -S --needed --noconfirm gvfs tumbler ffmpegthumbnailer poppler-glib libgsf libgepub libopenraw freetype2 thunar-volman thunar-archive-plugin thunar-media-tags-plugin
yay -S --needed --noconfirm --removemake peazip-gtk2-bin
yay -S --needed --noconfirm --removemake ibus-bamboo

# Need to be installed manually I guess?
# - GitKraken     - I love this Git GUI client
# - Google Chrome - Web Browser
# - Discord       - Discord (+with system Electron)
# yay -S --needed --noconfirm --removemake gitkraken
# yay -S --needed --noconfirm --removemake google-chrome
# yay -S --needed --noconfirm --removemake discord_arch_electron

# Setup files
# Make all executable(?), backup old ones and then, symlink
sudo chmod -R 777 $DOTTIES_DIR
mv $HOME/.config/ $HOME/.config_backup/
mkdir -p $HOME/.config/
sudo ln -sf $HOME/.cache/wal/dunstrc $DOTTIES_DIR/.config/dunst/dunstrc
sudo ln -sf $DOTTIES_DIR/.bscripts/ $HOME/
sudo ln -sf $DOTTIES_DIR/Documents/ $HOME/
sudo ln -sf $DOTTIES_DIR/.config/bspwm/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/dunst/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/polybar/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/systemd/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/kitty/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/picom/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/vis/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/wal/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/btop/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/Thunar/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/rofi/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/flameshot/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/gtk-3.0/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.zshrc $HOME/.zshrc
sudo ln -sf $DOTTIES_DIR/.p10k.zsh $HOME/.p10k.zsh
sudo ln -sf $DOTTIES_DIR/.gtkrc-2.0 $HOME/.gtkrc-2.0

# Export some environment
source $DOTTIES_DIR/env.sh
source $HOME/.bashrc

# After setup
sudo pacman -S --needed --noconfirm tlp tlp-rdw
yay -S --needed --noconfirm --removemake tlpui
sudo systemctl enable tlp.service
sudo systemctl enable NetworkManager-dispatcher.service
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
sudo tlp start

# What to do after this:
#     1. If you are using a touchpad: https://stackoverflow.com/questions/62990795/cannot-set-tapping-enabled-default-on-archlinux
#     2. If your keyboard has a NumLk: https://wiki.archlinux.org/title/Activating_numlock_on_bootup
#     3. If you want to use ibus-daemon by default?
#     4. Extract certs
#     5. Install stuffs for pop_report (but install 'pip' first)
#     6. You can't control backlight?

# 3.
# env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['xkb:us::eng', 'Bamboo']"
# gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"

# 4.
sudo trust extract-compat

# 5.
sudo pacman -S --needed --noconfirm python-pip
pip install PyQt5 inotify

# 6.
# Usually this is for single monitors, edit it as you like
BL_PROVIDER=$(ls /sys/class/backlight/ | head -n 1)
sudo usermod -aG video $USER
sudo chown $USER /sys/class/backlight/$BL_PROVIDER/brightness

# Bye!
echo "Installation finished!!!"
echo "And please, for the love of god, DO **NOT** REMOVE THE $DOTTIES_DIR FOLDER!!!! Why? They are **ALL SYMLINKED**!"
echo "Remember to check $HOME/.config_backup directory"
echo "AND REMEMBER TO REBOOT!!!! DO **NOT** USE 'startx' AFTER THIS!!!"
echo "That is all, have a good day and happy ricing!"
