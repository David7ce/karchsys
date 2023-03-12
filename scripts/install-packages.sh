#! /bin/bash

# install yay from aur with git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# install the list of packages with pacman
# grep -v "^#" arch-packages.txt | xargs sudo pacman -S # directly ignore line comments
cat ../packages/arch-packages.txt | xargs sudo pacman -S

# install the list of packages with yay
cat ../packages/aur-packages.txt | xargs sudo pacman -S

# install the list packages with flatpak
cat ../packages/flatpak-packages.txt | xargs sudo flatpak install

# install homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
