#!/bin/bash

set -euox pipefail

PACMAN="sudo pacman -S --needed --noconfirm"
PARU="paru -S --needed --noconfirm --removemake"

# https://www.reddit.com/r/archlinux/comments/a2g77x/what_are_your_default_font_packages_you_install/

$PACMAN ttf-hack ttf-fira-sans \
        ttf-nerd-fonts-symbols-mono ttf-nerd-fonts-symbols-common \
        ttf-dejavu ttf-liberation ttf-font-awesome ttf-liberation ttf-droid ttf-ubuntu-font-family \
        ttf-jetbrains-mono-nerd \
        otf-font-awesome \
        noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji \
        adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts

$PARU noto-fonts-tc \
     siji-ng \
     ttf-unifont ttf-gelasio ttf-caladea ttf-carlito ttf-liberation-sans-narrow ttf-ms-fonts
