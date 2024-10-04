#!/bin/bash

set -e
set -u
set -o pipefail
set -x

# Change shell to zsh
sudo chsh -s /usr/bin/zsh $(whoami)

# Clear leftovers
paru -Qtdq | sudo pacman -Rncsd -
yes | paru -Sccd
