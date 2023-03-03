#! /bin/bash

# Basic installation (Desktop Environment + display server + drivers)
# kde plasma
# sudo pacman -S plasma-desktop plasma-meta plasma-wayland-protocols plasma-wayland-session plasma-workspace

# display server (xorg)
# sudo pacman -S xorg-server xorg-xwayland

# audio drivers (pipewire)
# sudo pacman -S pipewire pipewire-alsa pipewire-audio pipewire-media-session pipewire-pulse 

video drivers
# sudo pacman -S lib32-mesa libva-mesa-driver nvidia xf86-video-amdgpu xf86-video-nouveau xf86-video-vesa xf86-video-ati-git xf86-video-chips

# Post installation
# kde packages
sudo pacman -S ark digikam elisa filelight ffmpegthumbnailer ffmpegthumbs gwenview inkscape kamera kate kbackup kcachegrind kcalc kcron kdeconnect kdenetwork-filesharing kdenlive khelpcenter kmag kmix kmousetool kmouth kontrast kwrite konsole krita ksystemlog markdownpart okular partitionmanager print-manager skanlite skanpage spectacle sweeper yakuake

# basic packages
sudo pacman -S archinstall arduino asciinema audacious base base-devel bleachbit blender calibre chromium clonezilla code curl docker docker-compose ffmpeg ffmpegthumbnailer firefox firewalld flameshot flatpak git godot gparted handbrake imagemagick keepassxc kitty libreoffice-fresh libvirt libwebp lynx mesa mpv neofetch neovim ntfs-3g obs-studio obsidian pacman-mirrorlist picard qbittorrent qemu-base reflector rsync shotwell supertux telegram-desktop tree tmux unrar virt-install vlc wget wine yt-dlp
# debtap dpkg freshfetch gimp latte-dock lshw nb qemu-desktop virtualbox

# install yay from aur with git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
# install packages from AUR with yay
yay -S 7zip-full activitywatch-bin  cava dia helvum-git snapper-support ungoogled-chromium upscayl-bin wlroots-git xampp youtube
# autofirma-bin libpamac libpamac-au libpamac-flatpak pamac-aur

# install packages with flatpak
sudo flatpak install flathub com.usebottles.bottles me.hyliu.fluentreader net.veloren.airshipper com.github.tchx84.Flatseal net.davidotek.pupgui2 org.gimp.GIMP
# sh.ppy.osu io.lbry.lbry-app io.gitlab.theevilskeleton.Upscaler


# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"