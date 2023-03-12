#! /bin/bash

# install yay from aur with git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# install the list of packages with pacman
# grep -v "^#" ../packages/arch-packages.txt | xargs sudo pacman -S # ignore line comments
cat ../packages/arch-packages.txt | xargs sudo pacman -S

# install the list of packages with yay
# grep -v "^#" ../packages/aur-packages.txt | xargs sudo pacman -S
cat ../packages/aur-packages.txt | xargs sudo pacman -S

# install the list packages with flatpak
# grep -v "^#" ../packages/flatpak-packages.txt | xargs sudo pacman -S
cat ../packages/flatpak-packages.txt | xargs sudo flatpak install

# install homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
