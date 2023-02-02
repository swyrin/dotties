#!/bin/bash

# ########### Arch with BSPWM install ###########
# No, this is not Ubuntu!
# No, DO NOT BLINDLY RUN THIS FILE!!!!
#
# Basically this is just my autosetup file when I (re)install Arch (btw)!
# ###############################################

# ONE MORE LAST WORD: THIS SCRIPT IS MEANT FOR **ME**!!!!!!!!!!!!!!!!!

# For debugging sake, but it *should* work as I want
DOTTIES_DIR=$(find $HOME -type d -name "dotties")
echo "The script *might* ask you the password below"

# Setup custom pacman stuffs: parallel downloads, c o l o r s
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf

# fast commands
PACMAN="sudo pacman -S --needed --noconfirm"
YAY="yay -S --needed --noconfirm --removemake"
SYSCTL_ENABLE="sudo systemctl enable --now"
SYSCTL_ENABLE_USER="systemctl enable --user --now"

# As usual, pacman -Syu
sudo pacman -Syu --noconfirm

# Install packages for sounds and internet
$PACMAN networkmanager \
        pulseaudio
$SYSCTL_ENABLE NetworkManager.service

# Install Xorg and friends
$PACMAN xorg xorg-apps xorg-xinit \
        mesa mesa-utils libva-intel-driver mesa-amber \
        intel-media-driver vulkan-intel \
        xf86-video-nouveau xf86-video-intel

# Setup my beloved nano
$PACMAN nano unzip wget
wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh
grep "set linenumbers" $HOME/.nanorc || echo "set linenumbers" >> $HOME/.nanorc
grep "set tabstospaces" $HOME/.nanorc || echo "set tabstospaces" >> $HOME/.nanorc
grep "set tabsize 4" $HOME/.nanorc || echo "set tabsize 4" >> $HOME/.nanorc

# Setup firewalld
$PACMAN firewalld
$SYSCTL_ENABLE firewalld.service

# Install yay AUR helper
if [ -z $(which yay) ]
then
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  sudo rm -r yay
fi

# Build optimization for make
# 1. https://wiki.archlinux.org/title/makepkg#Building_optimized_binaries
# 2. https://wiki.archlinux.org/title/makepkg#Improving_compile_times
# Normally sse{,2,3}, mmx and 3dnow! are included in new CPUs
# Use '-ftree-vectorize' to abuse ymm registers
# further reading: https://en.wikipedia.org/wiki/3DNow!
sudo sed -i 's/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j\$\(nproc\)\"/g' /etc/makepkg.conf
sudo sed -i 's/-march=x86-64 -mtune=generic/-march=native -ftree-vectorize -fomit-frame-pointer/g' /etc/makepkg.conf
sudo sed -i 's/#RUSTFLAGS=\"-C opt-level=2\"/RUSTFLAGS=\"-C opt-level=2 -C target-cpu=native\"/g' /etc/makepkg.conf

# Install BSPWM, rofi, picom (fork), sxhkd, polybar, notification center(TM), eww
# Technically, setup the desktop
$PACMAN rofi sxhkd feh
$YAY    eww \
        bspwm-git \
        picom-animations-git \
        polybar-git \
        deadd-notification-center-bin notify-send-py

# Install stuffs for notifications
$PACMAN playerctl brightnessctl

# Install stuffs for system tray
$PACMAN redshift python-gobject \
        network-manager-applet \
        pavucontrol pasystray \
        flameshot

# Setup fonts
# References: https://www.reddit.com/r/archlinux/comments/a2g77x/what_are_your_default_font_packages_you_install/
sudo mkdir -p /usr/share/fonts/ && sudo cp -a $DOTTIES_DIR/fonts/. /usr/share/fonts/

$PACMAN ttf-dejavu ttf-liberation ttf-font-awesome ttf-liberation ttf-droid ttf-ubuntu-font-family \
        noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji \
        adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts

$YAY noto-fonts-tc \
     siji-git \
     nerd-fonts-git \
     tf-unifont ttf-gelasio-ib ttf-caladea ttf-material-design-icons ttf-carlito ttf-liberation-sans-narrow ttf-ms-fonts ttf-material-icons-git


# Setup GTK themes
wget -qO- https://git.io/papirus-icon-theme-install | sh
wget -qO- https://git.io/papirus-folders-install | sh
yay -S --needed --noconfirm --removemake catppuccin-gtk-theme-latte
papirus-folders -C yellow --theme Papirus-Light

# Setup needed packages (for me, you should change) as final run!!!
# - Greenclip           - Clipboard manager for rofi
# - Thunar              - File manager (+plugins,mpv,xfce-polkit)
# - Viewnior            - Image viewer
# - Geany               - GUI text editor
# - Kitty               - Terminal emulator
# - xclip               - Commandline clipboard stuffs
# - font-manager        - Font manager
# - Peazip              - Archive manager
# - XFCE Power Manager  - Brightness and stuffs
# - btop                - Think it like the infamous "Task Manager" on Windows
# - GNOME Keyring       - Password storage (+libsecret)
$YAY    rofi-greenclip \
        peazip-gtk2-bin \
        xfce-polkit \
        btop

$PACMAN thunar gvfs tumbler ffmpegthumbnailer poppler-glib libgsf libgepub libopenraw freetype2 thunar-volman thunar-archive-plugin thunar-media-tags-plugin mpv \
        viewnior \
        geany \
        kitty \
        xclip \
        font-manager \
        xfce4-power-manager \
        gnome-keyring libsecret libgnome-keyring

# **WARNING**: BLOATWARES ZONE!!!!!!!!!
# Which means: They are classified as "bloatwares" and DO NOT serve any purposes!!!
# - pfetch              - Neofetch but simplified
# $YAY pfetch

# Setup files
mv $HOME/.config/ $HOME/.config_backup/
mkdir -p $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/bspwm/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/polybar/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/systemd/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/kitty/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/picom/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/Thunar/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/rofi/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/flameshot/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/gtk-3.0/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/eww/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.config/deadd/ $HOME/.config/
sudo ln -sf $DOTTIES_DIR/.zshrc $HOME/.zshrc
sudo ln -sf $DOTTIES_DIR/.xinitrc $HOME/.xinitrc
sudo ln -sf $DOTTIES_DIR/.p10k.zsh $HOME/.p10k.zsh
sudo ln -sf $DOTTIES_DIR/.gtkrc-2.0 $HOME/.gtkrc-2.0
cp -a $DOTTIES_DIR/.config_backup/. $DOTTIES_DIR/.config/
rm -rf $DOTTIES_DIR/.config_backup/

# Setup battery saving "bloatwares"
if ! [ -z $(upower) ];
then
    # Intel HW acceleration
    $PACMAN intel-media-driver libva-intel-driver
    sudo sed -i 's/MODULES=()/MODULES=(i915,i965,iHD)/g' /etc/mkinitcpio.conf
    sudo mkinitcpio -P

    # Powertop
    $PACMAN powertop
    sudo cp $DOTTIES_DIR/.config/systemd/system/powertop.service /etc/systemd/system/powertop.service
    $SYSCTL_ENABLE powertop.service

    # Laptop setup (acpid)
    $PACMAN acpid
    $SYSCTL_ENABLE acpid.service

    # TLP
    $PACMAN tlp tlp-rdw
    $YAY tlpui
    $SYSCTL_ENABLE tlp.service
    sudo systemctl mask systemd-rfkill.service
    sudo systemctl mask systemd-rfkill.socket

    # thermald
    $PACMAN thermald
    $SYSCTL_ENABLE thermald.service

    # auto-cpufreq
    $YAY auto-cpufreq
    $SYSCTL_ENABLE auto-cpufreq.service
else
    echo "No battery installed, skipping installing power savers"
fi

# Post-install stuffs
$SYSCTL_ENABLE_USER sxhkd.service
$SYSCTL_ENABLE_USER greenclip.service

# Clear PM cache
sudo pacman -Sc
yay -Sc

# What to do after this:
#       1. If you are using a touchpad: https://stackoverflow.com/questions/62990795/cannot-set-tapping-enabled-default-on-archlinux
#       2. If your keyboard has a NumLk: https://wiki.archlinux.org/title/Activating_numlock_on_bootup
#       3. You should consume these links for more battery saving on laptops:
#           https://wiki.archlinux.org/title/Power_management
#           https://wiki.archlinux.org/title/CPU_frequency_scaling
#       4. If you can, use `linux-zen` kernel instead.

# Bye!
echo "Installation finished!!!"
echo "And please, for the love of god, DO **NOT** REMOVE THE $DOTTIES_DIR FOLDER!!!! Why? They are **ALL SYMLINKED**!"
echo "That is all, have a good day and happy ricing!"
