#!/bin/bash

set -e
set -u
set -o pipefail
set -x

# ########### Arch with BSPWM install ###########
# DO NOT BLINDLY RUN THIS FILE!!!!
#
# This is just my autoinstall when I (re)install Arch!
# This will run well on:
# - My machine <3
# - Arch Linux (and derivates)
# - anything that has pacman as the PM
# ###############################################

# For debugging sake, but it *should* work as I want
# DOTTIES_DIR=$(find $HOME -type d -name "dotties")
DOTTIES_DIR=$(pwd)
echo $DOTTIES_DIR
echo "The script *might* ask you the password below"

# Setup custom pacman stuffs: parallel downloads, c o l o r s
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf

# fast commands typing?
PACMAN="sudo pacman -S --needed --noconfirm"
PACMAN_YEET="sudo pacman -Rnc"
YAY="yay -S --needed --noconfirm --removemake"
SYSCTL_ENABLE="sudo systemctl enable --now"
SYSCTL_ENABLE_USER="systemctl enable --user --now"

# Install packages for sound
$PACMAN pipewire wireplumber qpwgraph pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack
$SYSCTL_ENABLE_USER pipewire-pulse.service
$SYSCTL_ENABLE_USER pipewire-pulse.socket
$SYSCTL_ENABLE_USER wireplumber.service
# $PACMAN easyeffects calf lsp-plugins-lv2 zam-plugins-lv2 mda.lv2 yelp curl
# echo "1" > bash -c "$(curl -fsSL https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/install.sh)"

# Install package for internet
$PACMAN networkmanager wpa_supplicant dhcpcd
$SYSCTL_ENABLE wpa_supplicant.service
$SYSCTL_ENABLE NetworkManager.service

# Install Xorg and friends
# Nuke xbacklight for acpilight
echo "y" | $PACMAN_YEET acpilight

$PACMAN xorg xorg-apps xorg-xinit \
        mesa mesa-utils libva-intel-driver libva-mesa-driver \
        libvdpau-va-gl libva-utils \
        intel-media-driver vulkan-intel \
        xf86-video-intel

echo "y" | $PACMAN_YEET xorg-xbacklight
$PACMAN acpilight

# Setup my beloved nano
# If you don't use nano, just comment out them.
$PACMAN nano unzip wget
wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh
grep "set linenumbers" $HOME/.nanorc || echo "set linenumbers" >> $HOME/.nanorc
grep "set tabstospaces" $HOME/.nanorc || echo "set tabstospaces" >> $HOME/.nanorc
grep "set tabsize 4" $HOME/.nanorc || echo "set tabsize 4" >> $HOME/.nanorc

# Build optimization for make
# 1. https://wiki.archlinux.org/title/makepkg#Building_optimized_binaries
# 2. https://wiki.archlinux.org/title/makepkg#Improving_compile_times
sudo sed -i 's/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j\$\(nproc\)\"/g' /etc/makepkg.conf
sudo sed -i 's/-march=x86-64 -mtune=generic/-march=native -ftree-vectorize -fomit-frame-pointer/g' /etc/makepkg.conf
sudo sed -i 's/#RUSTFLAGS=\"-C opt-level=2\"/RUSTFLAGS=\"-C opt-level=2 -C target-cpu=native\"/g' /etc/makepkg.conf

# Install yay AUR helper
if [ -z $(which yay) ]
then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    sudo rm -r yay
    sudo pacman -Rnc $(pacman -Qq go)
fi

# Setup firewalld
# https://bbs.archlinux.org/viewtopic.php?id=284588
$PACMAN firewalld python-pyqt5
$SYSCTL_ENABLE firewalld.service
pip uninstall dbus-python 

# Setup clamav
# I consider this a bloatware.
# Either buy some RAM and give yourself an extra layer of protection.
# Or don't download bad stuffs, it's up to you.
# $PACMAN clamav
# sudo freshclam
# $SYSCTL_ENABLE clamav-freshclam.service
# $SYSCTL_ENABLE clamav-daemon.service
# $YAY clamav-unofficial-sigs
# $SYSCTL_ENABLE clamav-unofficial-sigs.timer

# Technically, setup base parts of the desktop
$PACMAN rofi sxhkd feh
$YAY    eww \
        bspwm-git \
        picom-git \
        polybar-git \
		dunst \
        alttab-git \
        xwinwrap-git

# Install stuffs for notifications
$PACMAN playerctl

# Install stuffs for system tray
$PACMAN redshift python-gobject \
        network-manager-applet \
        pavucontrol pasystray \
        flameshot

# Setup fonts
# https://www.reddit.com/r/archlinux/comments/a2g77x/what_are_your_default_font_packages_you_install/
cp -av $DOTTIES_DIR/fonts/. /usr/share/fonts/

$PACMAN ttf-nerd-fonts-symbols-1000-em-mono ttf-nerd-fonts-symbols-common \
        ttf-dejavu ttf-liberation ttf-font-awesome ttf-liberation ttf-droid ttf-ubuntu-font-family \
        ttf-jetbrains-mono-nerd \
        noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji \
        adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts

$YAY noto-fonts-tc \
     siji-git \
     ttf-unifont ttf-gelasio-ib ttf-caladea ttf-carlito ttf-liberation-sans-narrow ttf-ms-fonts ttf-symbola

# Setup GTK themes
wget -qO- https://git.io/papirus-icon-theme-install | sh
wget -qO- https://git.io/papirus-folders-install | sh
yay -S --needed --noconfirm --removemake catppuccin-gtk-theme-latte
papirus-folders -C yellow --theme Papirus-Light

# Setup needed packages (for me, you should change) as final run!!!
# - Greenclip           - Clipboard manager for rofi
# - Thunar              - File manager (+plugins,mpv)
# - Viewnior            - Image viewer
# - Geany               - GUI text editor
# - Kitty               - Terminal emulator
# - xclip               - Commandline clipboard stuffs
# - font-manager        - Font manager
# - Peazip              - Archive manager
# - btop                - Think it like the infamous "Task Manager" on Windows
# - polkit-gnome        - GNOME polkit
# - GNOME Keyring       - Password storage (+libsecret)
# - rofi-emoji          - Emoji picker for rofi
# - numlockx            - Auto activate numlock key
# - dex                 - XDG autostarter
# - zsh					- zshell (+powerlevel10k, +completion)
$YAY    rofi-greenclip \
        peazip-qt-bin \
        btop

$PACMAN thunar gvfs tumbler ffmpegthumbnailer poppler-glib libgsf libgepub libopenraw freetype2 thunar-volman thunar-archive-plugin thunar-media-tags-plugin mpv \
        viewnior \
        numlockx \
        geany \
        kitty \
        xclip \
        font-manager \
        gnome-keyring libsecret libgnome-keyring \
        polkit-gnome \
        rofi-emoji \
        dex xdg-user-dirs \
		zsh zsh-theme-powerlevel10k zsh-completions

# Symlinking files
ln -sf $DOTTIES_DIR/.config/autostart 			$HOME/.config
ln -sf $DOTTIES_DIR/.config/bspwm 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/polybar 			$HOME/.config
ln -sf $DOTTIES_DIR/.config/systemd 			$HOME/.config
ln -sf $DOTTIES_DIR/.config/kitty 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/picom 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/Thunar 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/rofi 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/flameshot 			$HOME/.config
ln -sf $DOTTIES_DIR/.config/gtk-3.0 			$HOME/.config
ln -sf $DOTTIES_DIR/.config/gtk-4.0 			$HOME/.config
ln -sf $DOTTIES_DIR/.config/eww 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/dunst 				$HOME/.config
ln -sf $DOTTIES_DIR/.config/chrome-flags.conf 	$HOME/.config/chrome-flags.conf
ln -sf $DOTTIES_DIR/.zshrc 						$HOME/.zshrc
ln -sf $DOTTIES_DIR/.xinitrc 					$HOME/.xinitrc
ln -sf $DOTTIES_DIR/.p10k.zsh 					$HOME/.p10k.zsh
ln -sf $DOTTIES_DIR/.gtkrc-2.0 					$HOME/.gtkrc-2.0

$PACMAN upower

# Setup battery saving "bloatwares"
# This will be triggered when you are using "laptop", or anything that uses battery.
if ! [ -z $(upower -e | grep battery) ];
then
    # Powertop
    $PACMAN powertop
    sudo cp $DOTTIES_DIR/.config/systemd/system/powertop.service /etc/systemd/system/powertop.service
    $SYSCTL_ENABLE powertop.service

    # ACPI for laptop-mode-tools
    $PACMAN acpid
    $SYSCTL_ENABLE acpid.service

    # laptop-mode-tools
    $YAY laptop-mode-tools ethtool iw hdparm sdparm hal bluez-utils
    $SYSCTL_ENABLE laptop-mode.service

    # thermald
    $PACMAN thermald
    $SYSCTL_ENABLE thermald.service

    # auto-cpufreq
    $YAY auto-cpufreq
    $SYSCTL_ENABLE auto-cpufreq.service

    # battery icon
    $PACMAN cbatticon
else
    # If this is useless, why bother having it?
    $PACMAN_YEET upower
fi

# Clear PM cache
# echo "$YES$YES$YES" | sudo pacman -Sc
# echo "$YES$YES$YES" | yay -Sc

# Post-install stuffs
$SYSCTL_ENABLE_USER sxhkd.service
$SYSCTL_ENABLE_USER greenclip.service
LC_ALL=C xdg-user-dirs-update --force
chsh -s /usr/bin/zsh

# What to do after this:
#       1. If you are using a touchpad: https://stackoverflow.com/questions/62990795/cannot-set-tapping-enabled-default-on-archlinux
#       2. If your keyboard has a NumLk: https://wiki.archlinux.org/title/Activating_numlock_on_bootup
#       3. You should consume these links for more battery saving on laptops:
#           https://wiki.archlinux.org/title/Power_management
#           https://wiki.archlinux.org/title/CPU_frequency_scaling
#           https://www.reddit.com/r/archlinux/comments/rz6294/arch_linux_laptop_optimization_guide_for/
#       4. If you can, use `linux-zen` kernel instead.
echo "Installation finished!!!"
echo "And please, for the love of god, DO **NOT** REMOVE THE $DOTTIES_DIR FOLDER!!!! Why? They are **ALL SYMLINKED**!"
echo "That is all, have a good day and happy ricing!"
