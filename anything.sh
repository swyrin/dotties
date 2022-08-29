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

# Install BSPWM, polybar, rofi, picom (fork), sxhkd, feh
# Technically, setup the desktop
sudo pacman -S --needed --noconfirm bspwm polybar rofi sxhkd feh
yay -S --noconfirm picom-ibhagwan-git

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
sudo wal -i desktop.jpg

# Install stuffs for system tray
sudo pacman -S --needed --noconfirm redshift python-gobject
sudo pacman -S --needed --noconfirm network-manager-applet
sudo pacman -S --needed --noconfirm pavucontrol pasystray

# Install fonts
# References: https://www.reddit.com/r/archlinux/comments/a2g77x/what_are_your_default_font_packages_you_install/
sudo mkdir -p /usr/share/fonts/ && sudo cp -a $DOTTIES_DIR/fonts/. /usr/share/fonts/
sudo pacman -S  --needed --noconfirm  ttf-dejavu ttf-liberation ttf-font-awesome-4 ttf-liberation ttf-droid ttf-ubuntu-font-family \
                                      noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji \
                                      adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts
yay -S  --noconfirm noto-fonts-tc \
                    siji-git \
                    ttf-unifont ttf-gelasio-ib ttf-caladea ttf-carlito ttf-liberation-sans-narrow ttf-ms-fonts

# Install zsh, oh-my-zsh and powerlevel10k
# THIS IS AN INTERACTIVE INSTALLATION, SO **PLEASE** FOLLOW THE SCREEN
# The installation will **EXIT** the installation process, so I kept this as reference!!!
# sudo pacman -S --needed --noconfirm zsh zsh-completions
# sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# yay -S --noconfirm zsh-theme-powerlevel10k-git
# echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
# chsh -s $(which zsh)

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
sudo ln -sf $DOTTIES_DIR/.p10k.zsh $HOME/.p10k.zsh
sudo ln -sf $DOTTIES_DIR/.zshrc $HOME/.zshrc
sudo ln -sf $DOTTIES_DIR/.fehbg $HOME/.fehbg

# Export some environment variables
export TERM=kitty
export vis="$DOTTIES_DIR/viswal.sh"

echo "Installation finished!!!"
echo "And please, for the love of god, DO NOT REMOVE THE $DOTTIES_DIR FOLDER!!!!"
echo "They are all symlinked, that is all, have a good day and happy ricing!"
echo "REMEMBER TO REBOOT!!!! DO **NOT** USE 'startx' AFTER THIS!!!"
