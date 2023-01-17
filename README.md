*karchsys* is an Arch Linux distribution with vanilla KDE (K Desktop Environment). 

# How to install

## Prerequisites
Download arch-linux iso and create usb booteable. Boot the live environment from a USB in a computer or select the iso in a virtual machine.


## Installation

There are various options to install the system:

### Option 1. Run archinstall with preconfigured files (easy way)

> Note: You can run `archinstall` and select your preferred options, or `archinstall --script guided` which pre-selects options.

Also you can use archinstall with preconfigured files with `archinstall --config <path> --disk-layout <path> --creds <path>`, the path can be a remote URL or a local file.

A) Run archinstall with preconfigured files from GitHub:
`archinstall --config https://raw.githubusercontent.com/David7ce/karchsys/main/archisntall-config/config.json --creds https://raw.githubusercontent.com/David7ce/karchsys/main/archisntall-config/creds.json --disk-layout https://raw.githubusercontent.com/David7ce/karchsys/main/archisntall-config/disk-layout.json`

B) Run archinstall with the pre-configured files on your machine (you can use the files on the Live USB):
`archinstall --config /var/log/archinstall/config.json --creds /var/log/creds.json --disk-layout /var/log/archinstall/disk-layout.json`

### Option 2. Execute the script "karchsys.sh" (review the script)

A) Download the script file with curl and execute it: `curl -sL https://raw.githubusercontent.com/david7ce/karchsys/master/karchsys.sh | bash`

B) Clone the repository in the local machine with git and execute the script:

```sh
sudo pacman -S git  # install git
git clone https://github.com/david7ce/karchsys.git
sh ./karchsys/karchsys.sh
```

## Post-installation.

After installing KarchSys you can install extra packages with your package manager like:

```sh
# sudo pacman -S git base-devel systemctl ark bleachbit docker docker-compose gimp git gwenview firefox filelight handbrake inkscape kdenlive libreoffice-fresh mpv neofetch obsidian telegram-desktop rsync virtualbox vlc
```

Also you can copy configuration files to the user home, if you have created a personal configuration of a program with your previous system. Just copy config files, to do that copy manually or with a script:

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

# System configuration
## Partitions

| Mount point | Partition                   | Partition type        | Size                    |
| ----------- | --------------------------- | --------------------- | ----------------------- |
| `/mnt/boot` | `/dev/efi_system_partition` | EFI system partition  | 203 MiB                 |
| `[SWAP]`    | `/dev/swap_partition`       | Linux swap            | 2203 MiB                |
| `/mnt`      | `/dev/root_partition`       | Linux x86-64 root     | Remainder of the device |

## Linux software
- Kernel: linux
- Linux distribution: arch-Linux

### Desktop environment

- DE: KDE (plasma-desktop)

    - plasma (group): bluedevil breeze breeze-gtk discover drkonqi kactivitymanagerd kde-cli-tools kde-gtk-config kdecoration kdeplasma-addons kgamma5 khotkeys kinfocenter kmenuedit kpipewire kscreen kscreenlocker ksshaskpass ksystemstats kwallet-pam kwayland-integration kwin kwrited layer-shell-qt libkscreen libksysguard milou oxygen oxygen-sounds plasma-browser-integration plasma-desktop plasma-disks plasma-firewall plasma-integration plasma-nm plasma-pa plasma-sdk plasma-systemmonitor plasma-thunderbolt plasma-vault plasma-workspace plasma-workspace-wallpapers polkit-kde-agent powerdevil sddm-kcm systemsettings xdg xdg-desktop-portal-kde

    - plasma-desktop: baloo gawk kdelibs4support kmenuedit libibus polkit-kde-agent systemsettings xdg-user-dirs ibus kaccounts-integration kscreen packagekit-qt5 plasma-nm powerdevil scimnal extra-cmake-modules intltool kaccounts-integration kdesignerplugin kdoctools kinit packagekit-qt5 scim wayland-protocols xf86-input-evdev xf86-input-libinput xf86-input-synaptics xorg-server-devel

    - plasma-meta: bluedevil breeze-gtk breeze-grub discover drkonqi kde-gtk-config kdeplasma-addons kgamma5 khotkeys kinfocenter kscreen ksshaskpass kwallet-pam kwayland-integration kwrited oxygen oxygen-sounds plasma-browser-integration plasma-desktop plasma-disks plasma-firewall plasma-nm plasma-pa plasma-systemmonitor plasma-thunderbolt plasma-vault plasma-workspace-wallpapers powerdevil sddm-kcm xdg-desktop-portal-kde  

    - plasma-wayland-session: egl-wayland kwayland-integration plasma-workspace qt5-wayland xorg-xwayland baloo extra-cmake-modules gpsd kdoctools kunitconversion networkmanager-qt plasma-wayland-protocols

    - extra: ark cuttlefish filelight ffmpegthumbnailer ffmpegthumbs inkscape kate kcalc kwrite kdenlive konsole krita spectacle

### Default KDE Plasma
- Bootloader: GRUB
- Display-server: kwin weston xorg-server (xorg-xwayland)
- Communication-protocol: wayland (future)
- File manager: dolphin
- Terminal: konsole
- Window-manager: kwin

### Theming
- Theme: Breeze
- Icons: breeze-dark
- Shell: bash

### Extra packages

#### Basic
- Audio-driver: pipewire pipewire-alsa pipewire-audio pipewire-media-session pipewire-pulse pipewire-zeroconf kpipewire helvum
- Browser: firefox ungoogled-chromium chromium (optional)
- Cleaner: bleachbit
- Client: qbitorrent
- Dev: ffmpeg git
- Disk: filelight gparted
- GUI package manager: pamac
- Social: discord telegram
- Transcoder: handbrake
- Virtualization: virtualbox

#### Editors
- IDE: vscode
- PKM: obsidian
- 3D-editor: blender
- Office-editor: libreoffice-fresh
- Text-editor: nvim
- Photo-editor: gimp upscayl
- Vector-graphic-editor: inkscape
- Video-editor: kdenlive

#### Viewers
- Image-viewer: gwenview
- Player: mpv vlc
- Recorder: obs-studio

## User
You can change the username or password after the installation, or put another in the script.
- username: d7
- hostname: karchsys
- password (root and user): 123

## Hardware compatibility
- Graphic card: NVDIA or AMD
- Processor: AMD
- Keyboard: spanish

---

## Why choose this system configuration?
After installing multiple distributions of Linux with different desktop environments and  window managers, I always end up with a similar configuration and visual design. So this is the type of OS that I recommend to use in a daily drive.

KarchSys = ArchLinux + Vanilla KDE (by default)

### Why Linux?
I have chosen Linux as the Operative System beacause is the biggest open-source project, is private, secure and there is a big community that can help you. Also is the only one that can copmite against the proprietary system such as Windows and macOS. One thing to mention is that Linux is only the Kernel of the Operative Systems that communicates with the computer hardware, the rest of the OS is constrcuted on top of that and you can customize the way you want.

### Why Arch Linux?
Arch Linux is very lightway Linux distribution with around 300 packages preinstalled and with 800 MiB of space. It has a big community that grows every day and it has a package manager (pacman) very useful with tons of packages. There are others distributions like Debian, Fedora, openSUSE, Slackware, Red hat, alpine Linux, Void Linux

### Why KDE?
Most of us are familiar with Windows or perhaps MacOS before using Linux, and these operating systems are great in terms of usability, but not for privacy.To achieve a similar design and good usability, the best option is to use a desktop environment such as KDE (K Desktop Environment) or, for something simpler, GNOME or XFCE.

## Distributions with KDE
### Arch Linux KDE preinstalled

- [Garuda KDE Linux Lite](https://sourceforge.net/projects/garuda-linux/files/garuda/kde-lite/)
- [Garuda KDE Git](https://sourceforge.net/projects/garuda-linux/files/garuda/kde-git/)
- [Manjaro KDE 22](https://download.manjaro.org/kde/22.0/manjaro-kde-22.0-221224-linux61.iso)
- [Xerolinux - Sourceforge](https://sourceforge.net/projects/xerolinux/) 

### Specific distros with KDE
- [KDE Neon (Debian based)](https://neon.kde.org/)
- [Kubuntu (Debian based)](https://kubuntu.org/)
- [Fedora KDE](https://spins.fedoraproject.org/)
- [openSUSE KDE](https://download.opensuse.org/tumbleweed/iso/openSUSE-Tumbleweed-DVD-x86_64-Current.iso?mirrorlist)
- [Alt Workstation KDE](https://getalt.org/en/alt-kworkstation/)
- [Rosa Linux KDE](https://mirror.rosalinux.ru/rosa/rosa2021.1/iso/ROSA.FRESH.12/plasma5/)

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
