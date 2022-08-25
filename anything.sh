# ########### Arch with AwesomeWM install ###########
# Yes, run this as sudo please, kthx!
# No, this is not Ubuntu!

# Setup parallelism for pacman
echo "ParallelDownloads = 5" >> /etc/pacman.conf

# Setup my beloved nano
pacman -S --noconfirm zip unzip wget
wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh
echo "set linenumbers" >> .nanorc
echo "set tabstospaces" >> .nanorc
echo "set tabsize 4" >> .nanorc

# Install git
pacman -S --noconfirm git

# Install yay AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

# Install polybar
pacman -S --noconfirm polybar

# Install Chrome and Discord (optional)
yay -S google-chrome discord_arch_electron --answerdiff=None --noconfirm

# Setup dotties
git clone https://github.com/Swyreee/dotties
cd dotties
cp .config $HOME/.config
cd ..
