*ArchSys* is a basic script of Arch Linux system to automatize the task of installation.

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
- Linux distribution: Arch Linux (rolling-release)

### Desktop environment
- DE: KDE plasma (ark bluedevil breeze ffmpegthumbs kactivitymanagerd kate kcalc kdecoration kgpg kmenuedit konsole kwin kwrite plasma-desktop powerdevil spectale ssdm systemsettings)

### Default KDE Plasma
- Bootloader: GRUB
- Display server: Xorg (future Wayland)
- File manager: dolphin
- Terminal: konsole
- WM: kwin

### Theming
- Theme: Breeze
- Icons: breeze-dark
- Shell: bash


### Extra packages

#### Basic
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

#### Editors
- IDE: vscode
- PKM: obsidian
- 3D-editor: blender
- Office-editor: libreoffice-fresh
- Text-editor: nvim
- Photo-editor: gimp, upscayl
- Vector-graphic-editor: inkscape
- Video-editor: kdenlive

#### Viewers
- Image-viewer: gwenview
- Player: mpv, vlc
- Recorder: obs-studio

## User
You can change the username or password after the installation, or put another in the script.
- username: d7
- system-name: archsys (root)
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