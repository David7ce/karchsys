*ArchSys* is an Arch Linux distribution with vanilla KDE (K Desktop Environment). 


# How to install
Prerequisites: download arch-linux iso and create usb booteable. Boot the live environment from a USB or from virtual machine.

There are two options to install ArchSys, only use one:

## 1. Run archinstall with preconfigured files (easy way).
`archinstall --config <path> --disk-layout <path> --creds <path>`, the path can be a remote URL or a local file.

Note: `archinstall --script guided` will perform a guided installation and `archinstall` will let you select from options.

A) Run archinstall with the configuration of this repository:
`archinstall --config https://raw.githubusercontent.com/David7ce/archsys/main/archisntall-config/config-kde.json --creds https://raw.githubusercontent.com/David7ce/archsys/main/archisntall-config/creds.json --disk-layout https://raw.githubusercontent.com/David7ce/archsys/main/archisntall-config/disk-layout.json`

B) Run archinstall with the configuration of the files in your machine:
`archinstall --config /var/log/archinstall/user-configuration.json --creds /var/log/user-credentials.json --disk-layout /var/log/archinstall/disk-layout.json`

## 2. Execute the script "archsys.sh" from this repository.

A) Clone the repository in the local machine with git and execute the script:

```sh
sudo pacman -S git  # install git
git clone https://github.com/david7ce/archsys.git
cd ./archsys
sh archsys
```
B) Download the script file with curl and execute it:

```sh
# loadkeys es
curl -sL https://raw.githubusercontent.com/david7ce/archsys/master/archsys.sh | bash   # Download script
vim alis.conf      # Edit configuration and change variables values with your preferences (system configuration)
./archsys.sh       # Start installation
```

## 3. Copy config files

You can copy configuration files to the user home, if you have created a personal configuration of a program with a your previous system.

Inside the directory backup of your config files run:

```
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
| `/mnt/boot` | `/dev/efi_system_partition` | EFI system partition  | ~300 MB                 |
| `[SWAP]`    | `/dev/swap_partition`       | Linux swap            | more than 512 MB        |
| `/mnt`      | `/dev/root_partition`       | Linux x86-64 root (/) | Remainder of the device |

## Linux software
- Kernel: linux
- Linux distribution: Arch-Linux (rolling-release)

### Desktop environment

- DE: KDE (plasma-desktop)

    - plasma (group): bluedevil breeze breeze-gtk discover drkonqi kactivitymanagerd kde-cli-tools kde-gtk-config kdecoration kdeplasma-addons kgamma5 khotkeys kinfocenter kmenuedit kpipewire kscreen kscreenlocker ksshaskpass ksystemstats kwallet-pam kwayland-integration kwin kwrited layer-shell-qt libkscreen libksysguard milou oxygen oxygen-sounds plasma-browser-integration plasma-desktop plasma-disks plasma-firewall plasma-integration plasma-nm plasma-pa plasma-sdk plasma-systemmonitor plasma-thunderbolt plasma-vault plasma-workspace plasma-workspace-wallpapers polkit-kde-agent powerdevil sddm-kcm systemsettings xdg xdg-desktop-portal-kde

    - plasma-desktop: baloo gawk kdelibs4support kmenuedit libibus polkit-kde-agent systemsettings xdg-user-dirs ibus kaccounts-integration kscreen packagekit-qt5 plasma-nm powerdevil scimnal extra-cmake-modules intltool kaccounts-integration kdesignerplugin kdoctools kinit packagekit-qt5 scim wayland-protocols xf86-input-evdev xf86-input-libinput xf86-input-synaptics xorg-server-devel

    - plasma-meta: bluedevil breeze-gtk breeze-grub discover drkonqi kde-gtk-config kdeplasma-addons kgamma5 khotkeys kinfocenter kscreen ksshaskpass kwallet-pam kwayland-integration kwrited oxygen oxygen-sounds plasma-browser-integration plasma-desktop plasma-disks plasma-firewall plasma-nm plasma-pa plasma-systemmonitor plasma-thunderbolt plasma-vault plasma-workspace-wallpapers powerdevil sddm-kcm xdg-desktop-portal-kde  

    - plasma-wayland-session: egl-wayland kwayland-integration plasma-workspace qt5-wayland xorg-xwayland baloo extra-cmake-modules gpsd kdoctools kunitconversion networkmanager-qt plasma-wayland-protocols

    - extra: ark cuttlefish filelight ffmpegthumbnailer ffmpegthumbs inkscape kate kcalc kwrite kdenlive konsole krita spectacle

### Default KDE Plasma
- Bootloader: GRUB
- Display server: kwin weston xorg-server (xorg-xwayland)
- Communication-protocol: wayland (future)
- File manager: dolphin
- Terminal: konsole
- WM: kwin

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
- hostname: archsys
- password (root and user): 123

## Hardware compatibility
- Graphic card: NVDIA or AMD
- Processor: AMD
- Keyboard: spanish

---

## Why choose this system configuration?
After been installing multiple distributions of Linux and try different desktop environments, and  window managers, I always end up with the same configuration so this a system to just install and use it. The majority of us before using Linux comes from Windows or maybe macOS, and these operative systems in terms of usability are great. To achive some system with more concern of privacy and an open-source ecosystem Linux is the perfect solution, and to replicate the usability of the desktop enviroment, the best options are KDE (K Desktop Environment) and GNOME.

You can use GNOME if you want a very simple desktop or use KDE if you want something more customazibale and sophisticate (but less stable than GNOME).

Note: all the apps are FOSS (free open-source)

# Resources
- [Download Arch Linux](https://archlinux.org/download/)
- [Arch Linux installation guide](https://wiki.archlinux.org/title/Installation_guide)
- [Archinstall - man page](https://man.archlinux.org/man/extra/archinstall/archinstall.1.en)
- [Bootloader: GRUB](https://wiki.archlinux.org/title/GRUB)
- [Distributions featuring KDE Plasma](https://community.kde.org/Distributions)
- [KDE - ArchWiki](https://wiki.archlinux.org/title/KDE)