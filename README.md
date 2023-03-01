*karchsys* is an Arch Linux distribution with vanilla KDE (K Desktop Environment). 

# Why to choose this system?
After installing multiple Linux distros with different desktop environments and  window managers, I always end up with a similar configuration and visual design. So this is the type of OS that I recommend to use in a daily drive for most computers.

KarchSys = ArchLinux + Vanilla KDE (by default)

## Kernel = Linux
I have chosen Linux as the Operating System beacause is the biggest open-source project, is private, secure, very customazible and there is a big community that can help you . Also is the only one that can compite against the proprietary system such as Windows and macOS. And in case you don't know, Linux is only the Kernel of the Operating System that communicates with the computer hardware, the rest of the OS is constrcuted on top of that.

## Linux distribution = Arch-Linux
Arch Linux is a very lightway Linux distribution with around 300 packages preinstalled and with 800 MiB of space (perfect for old CDs). It has a big community that grows every day and it has a package manager (pacman) very useful with tons of packages. There are others distributions like Debian, Fedora, openSUSE, Slackware, Red hat, Alpine Linux, Void Linux.

## Desktop Environment = KDE
Most of us are familiar with Windows or perhaps MacOS before using Linux, and these operating systems are great in terms of usability, but not for privacy.To achieve a similar design and good usability, the best option is to use a desktop environment such as KDE (K Desktop Environment) or, for something simpler, GNOME or XFCE. KDE is under development and is the biggest open-source project that develop free user applications. Also it has mouse gestures on laptops and is customizable to the exteme.

---

# System configuration
Here is my system configuration, you can define yours.

## Config
- Language-system: en-US
- Encoding: utf-8
- Timezone: UTC

## User
You can change the username or password after the installation, or put another in the script.
- username: d7
- hostname: karchsys
- password (root and user): !123

## Hardware compatibility
- Graphic card: NVDIA / AMD (AMD better for Wayland)
- Processor: AMD
- Keyboard: español

## Partitions
| Mount point | Partition                   | Partition type        | Size                    | Type        |
| ----------- | --------------------------- | --------------------- | ----------------------- | ----------- |
| `/mnt/boot` | `/dev/efi_system_partition` | EFI system partition  | 203 MiB                 | NTFS        |
| `[SWAP]`    | `/dev/swap_partition`       | Linux swap            | 2203 MiB                | SWAP        |
| `/mnt`      | `/dev/root_partition`       | Linux x86-64 root     | Remainder of the device | EXT4 / BRFS |

## Linux software
- Kernel: linux
- Linux-distribution: arch-Linux
- Desktop environment: KDE-plasma
    - Bootloader: grub / systemd-boot
    - Display-server: xorg / (xorg-xwayland wayland weston)
    - File-manager: dolphin
    - Shell: bash (alternatives fish or zsh)
    - Terminal: konsole
    - Theme: breeze-dark
    - Window-manager: kwin

---

# How to install

## 0. Prerequisites
Download arch-linux iso and create booteable USB. Boot into the live environment from the USB in a your real hardware or select the iso in a virtual machine.

## 1. Installation
There are various options to install this configuration system inside Arch Linux:

### Option 1. Run archinstall command
When you boot into Arch, run "archinstall", you only need to select options, in less than 5 minutes you can start the installation. Watch this video using archinstall:
[![Watch the video](https://img.youtube.com/vi/8mEjwn_AjuQ/maxresdefault.jpg)](https://www.youtube-nocookie.com/embed/8mEjwn_AjuQ?start=146)
 
You can also use archinstall with preconfigured options stored in files as json `archinstall --config <path> --disk-layout <path> --creds <path>' where the path can be local or remote.
- A) From remote: `archinstall --config https://raw.githubusercontent.com/David7ce/karchsys/main/archisntall-config/config.json --creds https://raw.githubusercontent.com/David7ce/karchsys/main/archisntall-config/creds.json --disk-layout https://raw.githubusercontent.com/David7ce/karchsys/main/archisntall-config/disk-layout.json`. Or shortened `curl -sL raw.githubusercontent.com/david7ce/karchsys/master/archinstall-config.sh | bash`

- B) From local, clone the repository with git and execute "archinstall-config.sh" that runs archinstall with preconfigured options:
```sh
sudo pacman -S git  # install git
git clone https://github.com/david7ce/karchsys.git
sh ./karchsys/archinstall-config.sh
```

### Option 2. Download a distributions with KDE pre-configured
- Arch Linux with KDE: [ArcoLinux KDE](https://sourceforge.net/projects/arcolinux-community-editions/files/plasma/), [Garuda KDE Linux Lite](https://sourceforge.net/projects/garuda-linux/files/garuda/kde-lite/), [Garuda KDE Git](https://sourceforge.net/projects/garuda-linux/files/garuda/kde-git/), [Manjaro KDE](https://download.manjaro.org/kde/22.0/manjaro-kde-22.0-221224-linux61.iso), [Xerolinux](https://sourceforge.net/projects/xerolinux/)

- Other Linux distributions with KDE: [KDE Neon (Debian based)](https://neon.kde.org/), [Kubuntu (Debian based)](https://kubuntu.org/), [Fedora KDE](https://spins.fedoraproject.org/), [Nobara Project (KDE)](https://nobaraproject.org/wp-content/uploads/Nobara-37-KDE-2023-02-25.iso.sha256sum), [openSUSE KDE](https://download.opensuse.org/tumbleweed/iso/openSUSE-Tumbleweed-DVD-x86_64-Current.iso?mirrorlist), [Alt Workstation KDE](https://getalt.org/en/alt-kworkstation/), [Rosa Linux KDE](https://mirror.rosalinux.ru/rosa/rosa2021.1/iso/ROSA.FRESH.12/plasma5/), [MX Linux KDE](https://sourceforge.net/projects/mx-linux/files/Final/KDE/), [KaOS - SourceForge](https://sourceforge.net/projects/kaosx/files/ISO/KaOS-2022.12-x86_64.iso/download)

### Option 3. Create and execute your own script installation
> **Warning** Modify the script installation "karchsys.sh" and execute with your consent. (Send feedback if you know how to improve it)
- A) Download the script with curl and execute it: `curl -sL raw.githubusercontent.com/david7ce/karchsys/master/karchsys.sh | bash`
- B) Clone the repository in the local machine with git and execute the script:
```sh
sudo pacman -S git  # install git
git clone https://github.com/david7ce/karchsys.git
sh ./karchsys/karchsys.sh
```

### Other options. 
- Install via GUI with [ArcoLinux-D (Decision)](https://ftp.belnet.be/arcolinux/iso/v23.01.03/arcolinuxd-v23.01.03-x86_64.iso) selecting packages.
- Write the commands manually using the [Arch Wiki](https://wiki.archlinux.org/title/Installation_guide)

## 2. Post-installation
After installing KarchSys you can install extra packages with your package manager like: `sh install-pkglist.sh`
```sh
sudo pacman -S plasma-desktop plasma-meta plasma-wayland-protocols plasma-wayland-session plasma-workspace

sudo pacman -S  ark digikam dolphin dolphin-plugins cuttlefish elisa filelight ffmpegthumbnailer ffmpegthumbs gwenview inkscape kamera kate kbackup kcachegrind kcalc kcron kdeconnect kdenetwork-filesharing kdenlive khelpcenter kmag kmix kmousetool kmouth kontrast kwrite konsole krita ksystemlog markdownpart okular partitionmanager print-manager skanlite skanpage spectacle sweeper yakuake

sudo pacman -S archinstall arduino asciinema audacious base base-devel bleachbit blender calibre code chromium clonezilla ffmpeg ffmpegthumbnailer firefox firewalld flameshot flatpak freshfetch gimp git handbrake gimp godot gparted imagemagick kepassxc kitty libreoffice-fresh libvirt mesa mpv neofetch neovim ntfs-3g obs-studio obsidian pacman-mirrorlist picard pipewire pipewire-alsa pipewire-audio pipewire-media-session pipewire-pulse qbitorrent rsync shotwell supertux telegram-desktop tree tmux virtualbox virt-install vlc wine xf86-video-amdgpu xf86-video-nouveau xf86-video-vesa xorg-server xorg-xwayland yt-dlp
```

Also you can copy configuration files to the user home, from your previous system. Just copy config files. To do that copy manually or with a script:

```sh
sudo cp ./TTF/* /usr/share/fonts
sudo cp ./vscode ~/.vscode
sudo cp ./mozilla ~/.mozilla
sudo cp -r ./kitty/ ./neofetch/ ./nvim/ ./obs-studio  ~/.config/
sudo cp ./.bashrc ~/

# Change ownership
chown -R $USER: ~/.config/kitty ~/.config/neofetch ~/.config/nvim ~/.config/obs-studio
```

---

# Resources
- [Arch Linux - Download](https://archlinux.org/download/)
- [Arch Linux installation guide](https://wiki.archlinux.org/title/Installation_guide)
- [Archinstall - man page](https://man.archlinux.org/man/extra/archinstall/archinstall.1.en)
- [Archinstall · GitHub](https://github.com/archlinux/archinstall)
- [ALIS](https://github.com/picodotdev/alis/)
- [Bootloader: GRUB](https://wiki.archlinux.org/title/GRUB)
- [Distributions featuring KDE Plasma](https://community.kde.org/Distributions)
- [KDE - ArchWiki](https://wiki.archlinux.org/title/KDE)
- [10 Ways KDE is just better - YouTube](https://www.youtube.com/watch?v=3nX1YEQg5Z0)
