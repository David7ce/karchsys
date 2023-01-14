*ArchSys* is a basic script of Arch Linux system to automatize the task of installation.

# Partitions
- 0:
    - mountpoint: /boot
    - format: ext4
    - size: "520MiB"
    - start: "5MiB"
    - type: "primary"
- 1:
    - mountpoint:
    - format: swap
    - size: "3GiB"
    - start: "520MiB"
    - type: "primary"
- 2:
    - mountpoint: /
    - format: ext4
    - size: "900GiB"
    - start: "3.5GiB"
    - type: "primary"

# Linux software
- Kernel: linux
- Linux distribution: Arch Linux (rolling-release)
Note: you need the Arch Linux iso in a booteable USB

## Desktop environment
- DE: KDE plasma (ark bluedevil breeze ffmpegthumbs kactivitymanagerd kate kcalc kdecoration kgpg kmenuedit konsole kwin kwrite plasma-desktop powerdevil spectale ssdm systemsettings)

## Default KDE Plasma
- Bootloader: GRUB
- Display server: Xorg (future Wayland)
- File manager: dolphin
- Terminal: konsole
- WM: kwin

## Theming
- Theme: Breeze
- Icons: breeze-dark
- Shell: bash


## Extra packages

### Basic
- Audio driver: pipewire, kpipewire, helvum
- Browser: firefox, ungoogled-chromium, chromium (optional)
- Cleaner: bleachbit
- Client: qbitorrent
- Dev: git
- Disk: filelight
- GUI package manager: pamac
- Social: discord, telegram
- Transcoder: handbrake
- Virtualization: virtualbox

### Editors
- IDE: vscode
- PKM: obsidian
- 3D-editor: blender
- Office-editor: libreoffice-fresh
- Text-editor: nvim
- Photo-editor: gimp, upscayl
- Vector-graphic-editor: inkscape
- Video-editor: kdenlive

### Viewers
- Image-viewer: gwenview
- Player: mpv, vlc
- Recorder: obs-studio

# Hardware compatibility
- Graphic card: NVDIA or AMD
- Processor: AMD
- Keyboard: spanish

# User
- username: d7
- system-name: archsys (root)
- password (for both): 123

Note: You can change the password after the installation, or put another in a personal script.


# Why choose this system configuration?
After been installing multiple distributions of Linux and try different desktop environments, and  window managers, I always end up with the same configuration so this a system to just install and use it. The majority of us before using Linux comes from Windows or maybe macOS, and these operative systems in terms of usability are great. To achive some system with more concern of privacy and an open-source ecosystem Linux is the perfect solution, and to replicate the usability of the desktop enviroment, the best options are KDE (K Desktop Environment) and GNOME.

You can use GNOME if you want a very simple desktop or use KDE if you want something more customazibale and sophisticate (but less stable than GNOME).

Notes: all the apps are FOSS (free open-source)

# Resources
- [Arch Linux installation guide](https://wiki.archlinux.org/title/Installation_guide)
- [Download Arch Linux](https://archlinux.org/download/)
- [Bootloader: GRUB](https://wiki.archlinux.org/title/GRUB)
