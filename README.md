*karchsys* is an Arch Linux distribution with vanilla KDE (K Desktop Environment). 

## Why choose this system?
After installing multiple Linux distros with different desktop environments and  window managers, I always end up with a similar configuration and visual design. So this is the type of OS that I recommend to use in a daily drive for most computers.

KarchSys = ArchLinux + Vanilla KDE (by default)

### Kernel = Linux
I have chosen Linux as the Operating System beacause is the biggest open-source project, is private, secure, very customazible and there is a big community that can help you . Also is the only one that can compite against the proprietary system such as Windows and macOS. And in case you don't know, Linux is only the Kernel of the Operating System that communicates with the computer hardware, the rest of the OS is constrcuted on top of that.

### Linux distribution = Arch-Linux
Arch Linux is a very lightway Linux distribution with around 300 packages preinstalled and with 800 MiB of space (perfect for old CDs). It has a big community that grows every day and it has a package manager (pacman) very useful with tons of packages. There are others distributions like Debian, Fedora, openSUSE, Slackware, Red hat, Alpine Linux, Void Linux.

### Desktop Environment = KDE
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
| Mount point | Partition                   | Partition type        | Size                    |
| ----------- | --------------------------- | --------------------- | ----------------------- |
| `/mnt/boot` | `/dev/efi_system_partition` | EFI system partition  | 203 MiB                 |
| `[SWAP]`    | `/dev/swap_partition`       | Linux swap            | 2203 MiB                |
| `/mnt`      | `/dev/root_partition`       | Linux x86-64 root     | Remainder of the device |

## Linux software
- Kernel: linux
- Linux-distribution: arch-Linux
- Desktop environment: KDE-plasma
- Display Server = Xorg / Wayland
- Shell: bash (alternatives fish or zsh)

### K Desktop environment (KDE)
- [plasma-(group)](https://archlinux.org/groups/x86_64/plasma/)
- [plasma-desktop](https://archlinux.org/packages/extra/x86_64/plasma-desktop/)
- [plasma-meta](https://archlinux.org/packages/extra/any/plasma-meta/)
- [plasma-wayland-session](https://archlinux.org/packages/extra/x86_64/plasma-wayland-session/)
- [plasma-workspace](https://archlinux.org/packages/extra/x86_64/plasma-workspace/)
- **extra-kde**: ark dolphin cuttlefish filelight ffmpegthumbnailer ffmpegthumbs inkscape kate kcalc kwrite kdenlive konsole krita spectacle partitionmanager

### Default KDE Plasma
- Bootloader: GRUB
- Display-server: weston xorg-server (xorg-xwayland)
- File-manager: dolphin
- Terminal: konsole
- Theme: Breeze-dark
- Window-manager: kwin

### Extra-packages
`audacious bleachbit blender code chromium dolphin elisa firefox flameshot flatpak freshfetch git handbrake neofetch gimp godot git handbrake kdenlive kitty mpv neovim obs-studio obsidian picard qbitorrent rsync telegram tmux virtualbox vlc vscode wine

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
Download arch-linux iso and create booteable USB. Boot into the live environment from the USB in a your real hardware or select the iso in a virtual machine.

## 1. Installation
There are various options to install the system inside Arch Linux:

### Option 1. Run archinstall command (quick method)
> Note: You can run `archinstall` and select your preferred options, or `archinstall --script guided` which pre-selects options. This takes 2 minutes, here's a video https://www.youtube.com/watch?v=8mEjwn_AjuQ. 
 
Also you can use archinstall with preconfigured files with `archinstall --config <path> --disk-layout <path> --creds <path>`, from local or remote path.
- From remote (GitHub): `archinstall --config https://raw.githubusercontent.com/David7ce/karchsys/main/archisntall-config/config.json --creds https://raw.githubusercontent.com/David7ce/karchsys/main/archisntall-config/creds.json --disk-layout https://raw.githubusercontent.com/David7ce/karchsys/main/archisntall-config/disk-layout.json`
- From local machine: `archinstall --config /var/log/archinstall/config.json --creds /var/log/creds.json --disk-layout /var/log/archinstall/disk-layout.json`

### Option 2. Execute the script "karchsys.sh" (review the script before installating)
- A) Download the script and execute it with curl: `curl -sL shorturl.at/fVWY6 | bash` (shorturl.at/fVWY6 = raw.githubusercontent.com/david7ce/karchsys/master/karchsys.sh)
- B) Clone the repository in the local machine with git and execute the script:
```sh
sudo pacman -S git  # install git
git clone https://github.com/david7ce/karchsys.git
sh ./karchsys/karchsys.sh
```

### Option 3. Download a distributions with KDE pre-configured
- Arch Linux with KDE: [ArcoLinux KDE](https://sourceforge.net/projects/arcolinux-community-editions/files/plasma/), [Garuda KDE Linux Lite](https://sourceforge.net/projects/garuda-linux/files/garuda/kde-lite/), [Garuda KDE Git](https://sourceforge.net/projects/garuda-linux/files/garuda/kde-git/), [Manjaro KDE](https://download.manjaro.org/kde/22.0/manjaro-kde-22.0-221224-linux61.iso), [Xerolinux](https://sourceforge.net/projects/xerolinux/)

- Other Linux distributions with KDE: [KDE Neon (Debian based)](https://neon.kde.org/), [Kubuntu (Debian based)](https://kubuntu.org/), [Fedora KDE](https://spins.fedoraproject.org/), [Nobara Project (KDE)](https://nobaraproject.org/wp-content/uploads/Nobara-37-KDE-2023-02-25.iso.sha256sum), [openSUSE KDE](https://download.opensuse.org/tumbleweed/iso/openSUSE-Tumbleweed-DVD-x86_64-Current.iso?mirrorlist), [Alt Workstation KDE](https://getalt.org/en/alt-kworkstation/), [Rosa Linux KDE](https://mirror.rosalinux.ru/rosa/rosa2021.1/iso/ROSA.FRESH.12/plasma5/), [MX Linux KDE](https://sourceforge.net/projects/mx-linux/files/Final/KDE/), [KaOS - SourceForge](https://sourceforge.net/projects/kaosx/files/ISO/KaOS-2022.12-x86_64.iso/download)


### Other options. 
- Create your specific distro with [ArcoLinux-D (Decision)](https://ftp.belnet.be/arcolinux/iso/v23.01.03/arcolinuxd-v23.01.03-x86_64.iso) selecting packages 
- Write the commands manually using the [Arch Wiki](https://wiki.archlinux.org/title/Installation_guide)


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
