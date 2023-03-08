#! /bin/bash

# install the list of packages with pacman
# grep -v "^#" arch-packages.txt | xargs sudo pacman -S # directly ignore line comments
cat arch-packages.txt | xargs sudo pacman -S

# install yay from aur with git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
# install packages from AUR with yay
yay -S 7zip-full activitywatch-bin bottles dia helvum-git  ungoogled-chromium upscayl-bin xampp youtube-music-bin
# btrfs-assistant snapper-support
# autofirma-bin cava freetube-bin libpamac libpamac-au libpamac-flatpak pamac-aur wlroots-git

# install packages with flatpak
cat aur-packages.txt | xargs sudo flatpak install

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
