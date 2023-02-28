*karchsys* is an Arch Linux distribution with vanilla KDE (K Desktop Environment). 

## Why choose this system configuration?
After installing multiple distributions of Linux with different desktop environments and  window managers, I always end up with a similar configuration and visual design. So this is the type of OS that I recommend to use in a daily drive.

KarchSys = ArchLinux + Vanilla KDE (by default)

### Why Linux?
I have chosen Linux as the Operative System beacause is the biggest open-source project, is private, secure and there is a big community that can help you. Also is the only one that can copmite against the proprietary system such as Windows and macOS. One thing to mention is that Linux is only the Kernel of the Operative Systems that communicates with the computer hardware, the rest of the OS is constrcuted on top of that and you can customize the way you want.

### Why Arch Linux?
Arch Linux is very lightway Linux distribution with around 300 packages preinstalled and with 800 MiB of space (perfect for old CDs). It has a big community that grows every day and it has a package manager (pacman) very useful with tons of packages. There are others distributions like Debian, Fedora, openSUSE, Slackware, Red hat, alpine Linux, Void Linux

### Why KDE?
Most of us are familiar with Windows or perhaps MacOS before using Linux, and these operating systems are great in terms of usability, but not for privacy.To achieve a similar design and good usability, the best option is to use a desktop environment such as KDE (K Desktop Environment) or, for something simpler, GNOME or XFCE.

KDE is under development and is the biggest open-source project that develop free user applications. Also it has mouse gestures on laptops and is customizable to the exteme.

---

# System configuration

Here is my system configuration, you can define yours.

## Config
- Language-system: en-US
- Encoding: utf-8
- Timezone: UTC

## User
You can change the username or password after the installation, or put another in the script.
- username: user0
- hostname: karchsys
- password (root and user): !123

## Hardware compatibility
- Graphic card: NVDIA or AMD
- Processor: AMD
- Keyboard: español

## Partitions

| Mount point | Partition                   | Partition type        | Size                    |
| ----------- | --------------------------- | --------------------- | ----------------------- |
| `/mnt/boot` | `/dev/efi_system_partition` | EFI system partition  | 203 MiB                 |
| `[SWAP]`    | `/dev/swap_partition`       | Linux swap            | 2203 MiB                |
| `/mnt`      | `/dev/root_partition`       | Linux x86-64 root     | Remainder of the device |

## Linux software
- Kernel: linux
- Linux-distribution: arch-Linux
- Desktop environment: KDE (plasma)
- Extra-packages: audacious bleachbit blender code chromium dolphin elisa firefox flameshot flatpak freshfetch git handbrake neofetch gimp godot git handbrake kdenlive kitty mpv neovim obs-studio obsidian picard qbitorrent rsync telegram tmux virtualbox vlc vscode wine

### Desktop environment

- DE: KDE (plasma-desktop)
    - **plasma-(group)**: bluedevil breeze breeze-gtk discover drkonqi kactivitymanagerd kde-cli-tools kde-gtk-config kdecoration kdeplasma-addons kgamma5 khotkeys kinfocenter kmenuedit kpipewire kscreen kscreenlocker ksshaskpass ksystemstats kwallet-pam kwayland-integration kwin kwrited layer-shell-qt libkscreen libksysguard milou oxygen oxygen-sounds plasma-browser-integration plasma-desktop plasma-disks plasma-firewall plasma-integration plasma-nm plasma-pa plasma-sdk plasma-systemmonitor plasma-thunderbolt plasma-vault plasma-workspace plasma-workspace-wallpapers polkit-kde-agent powerdevil sddm-kcm systemsettings xdg xdg-desktop-portal-kde
    - **plasma-desktop**: baloo gawk kdelibs4support kmenuedit libibus polkit-kde-agent systemsettings xdg-user-dirs ibus kaccounts-integration kscreen packagekit-qt5 plasma-nm powerdevil scimnal extra-cmake-modules intltool kaccounts-integration kdesignerplugin kdoctools kinit packagekit-qt5 scim wayland-protocols xf86-input-evdev xf86-input-libinput xf86-input-synaptics xorg-server-devel
    - **plasma-meta**: bluedevil breeze-gtk breeze-grub discover drkonqi kde-gtk-config kdeplasma-addons kgamma5 khotkeys kinfocenter kscreen ksshaskpass kwallet-pam kwayland-integration kwrited oxygen oxygen-sounds plasma-browser-integration plasma-desktop plasma-disks plasma-firewall plasma-nm plasma-pa plasma-systemmonitor plasma-thunderbolt plasma-vault plasma-workspace-wallpapers powerdevil sddm-kcm xdg-desktop-portal-kde  
    - **plasma-wayland-session**: egl-wayland kwayland-integration plasma-workspace qt5-wayland xorg-xwayland baloo extra-cmake-modules gpsd kdoctools kunitconversion networkmanager-qt plasma-wayland-protocols
    - **extra-kde**: ark cuttlefish filelight ffmpegthumbnailer ffmpegthumbs inkscape kate kcalc kwrite kdenlive konsole krita spectacle

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
- Shell: bash (alternatives fish or zsh)

### Packages
- Audio-driver: pipewire pipewire-alsa pipewire-audio pipewire-media-session pipewire-pulse pipewire-zeroconf kpipewire helvum
- Backup: clonezilla rsync
- Browser: firefox ungoogled-chromium chromium (optional)
- Cleaner: bleachbit privazer
- Client: qbitorrent
- Dev: ffmpeg git electron
- Disk: filelight gparted
- Editors:
    - IDE: vscode vscodium
    - PKM: obsidian
    - 3D-editor: blender
    - Office-editor: libreoffice-fresh
    - Text-editor: nvim
    - Photo-editor: gimp upscayl
    - Vector-graphic-editor: inkscape
    - Video-editor: kdenlive
- Manager:
    - File manager: dolphin
    - Game manager: steam
- OS-transalation-layer: bottles wine
- Player / viewer:
    - Audio-player: audacious elisa
    - Image-viewer: gwenview
    - Video-player: mpv vlc
- Recorder:
    - Screenshot: flamshot spectacle
    - Video-recorder: obs-studio
- Package manager: pamac
- Social: discord telegram
- Transcoder: handbrake
- Utilities: filelight flatpak flatseal findutils neofetch
- Virtualization: virtualbox

---

# How to install

## 0. Prerequisites
Download arch-linux iso and create usb booteable. Boot the live environment from a USB in a computer or select the iso in a virtual machine.

## 1. Installation

There are various options to install the system inside Arch Linux:

### Option 1. Run archinstall command (quick method)

> Note: You can run `archinstall` and select your preferred options, or `archinstall --script guided` which pre-selects options. This takes 2 minutes, here's a video https://www.youtube.com/watch?v=8mEjwn_AjuQ.

Also you can use archinstall with preconfigured files with `archinstall --config <path> --disk-layout <path> --creds <path>`, the path can be a remote URL or a local file. The bad side is that the url is very large.

A) From remote url (GitHub): `archinstall --config https://raw.githubusercontent.com/David7ce/karchsys/main/archisntall-config/config.json --creds https://raw.githubusercontent.com/David7ce/karchsys/main/archisntall-config/creds.json --disk-layout https://raw.githubusercontent.com/David7ce/karchsys/main/archisntall-config/disk-layout.json`

B) From local machine: `archinstall --config /var/log/archinstall/config.json --creds /var/log/creds.json --disk-layout /var/log/archinstall/disk-layout.json`

### Option 2. Execute the script "karchsys.sh" (review the script before installating)

A) Download the script file with curl and execute it: `curl -sL shorturl.at/fVWY6 | bash`
shorturl.at/fVWY6 = raw.githubusercontent.com/david7ce/karchsys/master/karchsys.sh

B) Clone the repository in the local machine with git and execute the script:
```sh
sudo pacman -S git  # install git
git clone https://github.com/david7ce/karchsys.git
sh ./karchsys/karchsys.sh
```

### Option 3. Download a distributions with KDE configured

#### Arch Linux KDE preinstalled
- [ArcoLinux KDE](https://sourceforge.net/projects/arcolinux-community-editions/files/plasma/)
- [Garuda KDE Linux Lite](https://sourceforge.net/projects/garuda-linux/files/garuda/kde-lite/)
- [Garuda KDE Git](https://sourceforge.net/projects/garuda-linux/files/garuda/kde-git/)
- [Manjaro KDE](https://download.manjaro.org/kde/22.0/manjaro-kde-22.0-221224-linux61.iso)
- [Xerolinux](https://sourceforge.net/projects/xerolinux/)

#### Other Linux distributions with KDE
- [KDE Neon (Debian based)](https://neon.kde.org/)
- [Kubuntu (Debian based)](https://kubuntu.org/)
- [Fedora KDE](https://spins.fedoraproject.org/)
- [Nobara Project (KDE)](https://nobaraproject.org/wp-content/uploads/Nobara-37-KDE-2023-02-25.iso.sha256sum)
- [openSUSE KDE](https://download.opensuse.org/tumbleweed/iso/openSUSE-Tumbleweed-DVD-x86_64-Current.iso?mirrorlist)
- [Alt Workstation KDE](https://getalt.org/en/alt-kworkstation/)
- [Rosa Linux KDE](https://mirror.rosalinux.ru/rosa/rosa2021.1/iso/ROSA.FRESH.12/plasma5/)
- [MX Linux KDE](https://sourceforge.net/projects/mx-linux/files/Final/KDE/)
- [KaOS - SourceForge](https://sourceforge.net/projects/kaosx/files/ISO/KaOS-2022.12-x86_64.iso/download)

### Option 4. Create your specific distro with [Calamres installer](https://calamares.io/) selecting packages

- [ArcoLinux-D (Decision)](https://ftp.belnet.be/arcolinux/iso/v23.01.03/arcolinuxd-v23.01.03-x86_64.iso)

### Option 5. Write the commands manually using the [Arch Wiki](https://wiki.archlinux.org/title/Installation_guide)


## 2. Post-installation.

After installing KarchSys you can install extra packages with your package manager like:
```sh
# sudo pacman -S audacious bleachbit blender code chromium dolphin elisa firefox flameshot flatpak freshfetch git handbrake neofetch gimp godot git handbrake kdenlive kitty mpv neovim obs-studio obsidian picard qbitorrent rsync telegram tmux virtualbox vlc vscode wine
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
