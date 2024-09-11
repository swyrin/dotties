#!/bin/bash

set -e
set -u
set -o pipefail
set -x

# Create XDG user directories
LC_ALL=en_US.UTF-8 xdg-user-dirs-update --force

# Change shell to zsh
chsh -s /usr/bin/zsh $(whoami)

# Set dns server to quad9
nmcli -g name,type connection show | awk -F: '/ethernet|wireless/ { print $1 }' | while read connection
do
    nmcli con mod "$connection" ipv4.ignore-auto-dns yes
    nmcli con mod "$connection" ipv6.ignore-auto-dns yes

    nmcli con mod "$connection" ipv4.dns "9.9.9.9 149.112.112.112"
    nmcli con mod "$connection" ipv6.dns "2620:fe::fe 2620:fe::9"
done

# Reset active connections
nmcli -g name,type connection show --active | awk -F: '/ethernet|wireless/ { print $1 }' | while read connection
do
    nmcli con down "$connection" && nmcli con up "$connection"
done
