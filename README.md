*karchsys* is an Arch Linux distribution with vanilla KDE (K Desktop Environment).
![](/img/karchsys-min.png)

# Why to choose this system?
After installing multiple Linux distros with different desktop environments and  window managers, I always end up with a similar configuration and visual design. So this is the type of OS that I recommend to use in a daily drive for most computers.

KarchSys = ArchLinux + Vanilla KDE (by default)

## [Kernel = Linux](https://kernel.org/)
I have chosen Linux as the Operating System beacause is the biggest open-source project, is private, secure, very customazible and there is a big community that can help you . Also is the only one that can compite against the proprietary system such as Windows and macOS. And in case you don't know, Linux is only the Kernel of the Operating System that communicates with the computer hardware, the rest of the OS is constrcuted on top of that.

## Linux distribution = [Arch-Linux](https://archlinux.org/)
Arch Linux is a very lightway Linux distribution with around 300 packages preinstalled and with 800 MiB of space (perfect for old CDs). It has a big community that grows every day and it has a package manager (pacman) very useful with tons of packages. There are others distributions like Debian, Fedora, openSUSE, Slackware, Red hat, Alpine Linux, Void Linux.

## Desktop Environment = [KDE](https://kde.org/)
Most of us are familiar with Windows or perhaps MacOS before using Linux, and these operating systems are great in terms of usability, but not for privacy.To achieve a similar design and good usability, the best option is to use a desktop environment such as KDE (K Desktop Environment) or, for something simpler, GNOME or XFCE. KDE is under development and is the biggest open-source project that develop free user applications. Also it has mouse gestures on laptops and is customizable to the exteme.

![](/img/linux-architecture.jpg)


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
| Mount point | Partition                   | Partition type        | Size                    | Type           |
| ----------- | --------------------------- | --------------------- | ----------------------- | -------------- |
| `/mnt/boot` | `/dev/efi_system_partition` | EFI system partition  | 203 MiB                 | FAT32          |
| `[SWAP]`    | `/dev/swap_partition`       | Linux swap            | 2203 MiB                | SWAP           |
| `/mnt`      | `/dev/root_partition`       | Linux x86-64 root     | Remainder of the device | BTRFS or EXT4  |

- For BTRFS partition use subvolumes (@.snapshots, @, @home, @log, @var, @pkg)
- For EXT4, one partition root (/) with (/bin /boot /dev /etc /home /lib /lib64 /mnt /opt /proc /root /run /sbin /srv /sys /tmp /usr /var) or separate /home

## Linux software
- Kernel: linux
- Linux-distribution: arch-Linux
- Bootloader: grub (better for btrfs) / systemd-boot
- Shell: bash / fish / zsh
- Drivers: 
    - Audio-drivers: pìpewire
    - Video-drivers: amd-gpu / nvidia (nvidia open nvidia-utils nouveau)
- Desktop environment: KDE-plasma
    - Display-server: xorg xorg-xwayland / wayland weston
    - File-manager: dolphin
    - Terminal: konsole
    - Terminal-text-editor: nano vim
    - Text-editor-GUI: kate
    - Theme: breeze-dark
    - Window-manager: kwin
- Extra-packages: firefox libreoffice-fresh

---

# How to install

## 0. Prerequisites
Download the Linux distribution as iso and create a booteable USB or select the iso in the virtual machine. To create a booteable USB you can copy the iso with dd command on Unix (BSD, Linux, mac) systems or use Rufus, Ventoy, BalenaEtcher on Windows.
```sh
sudo fdisk –l            # find the disk to create the bootable system
umount /dev/sdb*         # unmount the disk
mkfs.vfat /dev/sdb –I    # format the disk to the selected formating (bfs, ext2, ext3, ext4, exfat, fat, vfat, minix, ntfs, msdos, xfs, xiafs)
dd if=~/Downloads/arch.iso of=/dev/sdb bs=4M status=progress
```

Boot into the live environment from the USB in a your real hardware or select the iso in a virtual machine.

Depending of your needs you can install:
- an Arch Linux system from scratch 
- an Arch-based system preconfigured

## 1.A. Install Arch from scratch
There are various options to install this configuration system inside Arch Linux:

### A) Run archinstall command
When you boot into Arch, run "archinstall", you only need to select options, in less than 5 minutes you can start the installation. Watch this video using archinstall:
[![Watch the video](/img/archinstall-video.png)](https://www.youtube-nocookie.com/embed/8mEjwn_AjuQ?start=146)
 
You can also use archinstall with preconfigured options stored in files as json `archinstall --config <path> --disk-layout <path> --creds <path>' where the path can be local or remote.
- From local, clone the repository with git and execute "archinstall-config.sh" that runs archinstall with preconfigured options:
```sh
sudo pacman -S git
git clone https://github.com/david7ce/karchsys.git
sh ./karchsys/scripts/archinstall-config.sh
```

### B) Create and execute your own script installation
> **Warning** Modify the script installation "karchsys.sh" and execute with your consent. (Send feedback if you know how to improve it)
- Download the script with curl and execute it: `curl -sL raw.githubusercontent.com/david7ce/karchsys/master/scripts/karchsys.sh | bash`
- Or clone the repository in the local machine with git and execute the script:
```sh
sudo pacman -S git
git clone https://github.com/david7ce/karchsys.git
sh ./scripts/karchsys.sh
```

### C) Install typing commands
- Write the commands manually following the [Arch Wiki](https://wiki.archlinux.org/title/Installation_guide)


## 1.B. Install a system with preconfigured KDE

If you don't want to configure Arch Linux, you can also install distributions with preconfigured with KDE.

- Arch-based with KDE: [ArcoLinux KDE](https://sourceforge.net/projects/arcolinux-community-editions/files/plasma/), [Endeavouros KDE](https://endeavouros.com/latest-release/), [Garuda KDE Dr460nized](https://iso.builds.garudalinux.org/iso/garuda/dr460nized/), [Garuda KDE Linux Lite](https://iso.builds.garudalinux.org/iso/garuda/kde-lite/), [Manjaro KDE](https://download.manjaro.org/kde/22.0/manjaro-kde-22.0-221224-linux61.iso), [RebornOS](https://www.rebornos.org/download/), [Xerolinux](https://sourceforge.net/projects/xerolinux/)

- Arch with GUI installer to select packages on a live-environment: [ArcoLinux-D (Decision)](https://ftp.belnet.be/arcolinux/iso/v23.01.03/arcolinuxd-v23.01.03-x86_64.iso)

- Debian-based with KDE: [KDE Neon](https://neon.kde.org/), [Kubuntu](https://kubuntu.org/), [MX Linux KDE](https://sourceforge.net/projects/mx-linux/files/Final/KDE/), [Nitrux KDE](https://sourceforge.net/projects/nitruxos/files/Release/ISO/)

- RPM-based with KDE: [Fedora KDE](https://spins.fedoraproject.org/), [Nobara Project (KDE)](https://nobaraproject.org/wp-content/uploads/Nobara-37-KDE-2023-02-25.iso.sha256sum), [openSUSE KDE](https://download.opensuse.org/tumbleweed/iso/openSUSE-Tumbleweed-DVD-x86_64-Current.iso?mirrorlist)

- Independent-linux-distros with KDE: [Alt Workstation KDE](https://getalt.org/en/alt-kworkstation/), [KaOS - SourceForge](https://sourceforge.net/projects/kaosx/files/ISO/KaOS-2022.12-x86_64.iso/download), [Rosa Linux KDE](https://mirror.rosalinux.ru/rosa/rosa2021.1/iso/ROSA.FRESH.12/plasma5/)


## 2. Post-installation
After installing KarchSys you can install extra packages with your package manager. Execute `sh ./scripts/install-packages.sh` for Arch linux or create your script.
```sh
sudo pacman -S package-name  # on arch
sudo apt install package-name # on debian
sudo dnf install package-name # on fedora
zypper install # on opensuse
```

Also you can copy configuration files to the user home, from your previous system. Just copy config files. To do that copy manually or with a script:
```sh
sudo cp ./TTF/* /usr/share/fonts
sudo cp ./mozilla ~/.mozilla
sudo cp ./vscode ~/.vscode
sudo cp -r ./kitty/ ./neofetch/ ./nvim/ ./obs-studio  ~/.config/
sudo cp ./.bashrc ~/

# Change ownership
chown -R $USER: ~/.config/kitty ~/.config/neofetch ~/.config/nvim ~/.config/obs-studio
```

---

## Resources
- [Arch Linux - Download](https://archlinux.org/download/)
- [Arch Linux installation guide](https://wiki.archlinux.org/title/Installation_guide)
- [Archinstall - man page](https://man.archlinux.org/man/extra/archinstall/archinstall.1.en)
- [Archinstall · GitHub](https://github.com/archlinux/archinstall)
- [ALIS](https://github.com/picodotdev/alis/)
- [Bootloader: GRUB](https://wiki.archlinux.org/title/GRUB)
- [Distributions featuring KDE Plasma](https://community.kde.org/Distributions)
- [KDE - ArchWiki](https://wiki.archlinux.org/title/KDE)
- [10 Ways KDE is just better - YouTube](https://www.youtube.com/watch?v=3nX1YEQg5Z0)
