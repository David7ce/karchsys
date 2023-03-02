#! /bin/bash

# kde plasma
sudo pacman -S plasma-desktop plasma-meta plasma-wayland-protocols plasma-wayland-session plasma-workspace

# display server (xorg)
sudo pacman -S xf86-video-amdgpu xf86-video-nouveau xf86-video-vesa xorg-server xorg-xwayland

# audio drivers (pipewire)
sudo pacman -S pipewire pipewire-alsa pipewire-audio pipewire-media-session pipewire-pulse 

# kde extra packages
sudo pacman -S ark digikam cuttlefish elisa filelight ffmpegthumbnailer ffmpegthumbs gwenview inkscape kamera kate kbackup kcachegrind kcalc kcron kdeconnect kdenetwork-filesharing kdenlive khelpcenter kmag kmix kmousetool kmouth kontrast kwrite konsole krita ksystemlog markdownpart okular partitionmanager print-manager skanlite skanpage spectacle sweeper yakuake

# basic packages
sudo pacman -S archinstall arduino asciinema audacious base base-devel bleachbit blender calibre code chromium clonezilla ffmpeg ffmpegthumbnailer firefox firewalld flameshot flatpak freshfetch gimp git handbrake gimp godot gparted imagemagick keepassxc kitty libreoffice-fresh libvirt mesa mpv neofetch neovim ntfs-3g obs-studio obsidian pacman-mirrorlist picard qbittorrent reflector rsync snapper-support shotwell supertux telegram-desktop tree tmux virtualbox virt-install vlc wine yt-dlp

# install yay from aur with git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
# install packages from AUR with yay
yay -S 7zip-full activitywatch-bin autofirma-bin brew-git dia helvum-git libpamac libpamac-au libpamac-flatpak pamac-aur ungoogled-chromium upscayl-bin wlroots-git xampp xf86-video-ati-git xf86-video-chips youtube

# install packages with flatpak
sudo flatpak install flathub com.usebottles.bottles me.hyliu.fluentreader net.veloren.airshipper com.github.tchx84.Flatseal net.davidotek.pupgui2 sh.ppy.osu io.lbry.lbry-app io.gitlab.theevilskeleton.Upscaler org.gimp.GIMP