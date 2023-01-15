#!/bin/bash
# WARNING: this script will destroy data on the selected disk.
# This script can be run by executing the following:
#   curl -sL https://raw.githubusercontent.com/David7ce/archsys/main/archsys.sh | bash

echo "ArchSys"

# 1.1. Set the console keyboard layout
loadkeys es

# 1.2. Update the system clock
timedatectl status

# 1.3. Partition the disks (cfdisk, fdisk, lsblk)

# 1.4. Partition the disks with fdisk
fdisk -l
fdisk /dev/nvme0n1 # '/dev/sda', '/dev/nvme0n1', '/dev/mmcblk0'
g
n (ENTER ENTER +550M) # EFI partiion
n (ENTER ENTER +2G) # Swap partion
n (ENTER ENTER ENTER) # Filesystem partition

# Number represents partition
t (1) 1
t (2) 19

w # Write changes

# 1.5. Then format the partitions
mkfs.ext4 /dev/nvme0n1
mkfs.fat -F 32 /dev/nvme0n2 # EFI partition formatted to fat32
mkswap /dev/nvme0n3

# 1.6. Mount the file systems (dev/nvme0nx or /dev/sdax)
mount /dev/nvme0n1 /mnt
mount --mkdir /dev/nvme0n2 /mnt/boot
swapon /dev/sda3

# 2. Install base system
pacman -Sy
pacstrap -K /mnt base linux linux-firmware

# 3. Configure the system
# 3.1. Fstab and chroot
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

# 3.2. Timezone and localization
ln -sf /usr/share/zoneinfo/Atlantic/Canary /etc/localtime
hwclock --systohc

locale-gen
'LANG=en-US.UTF-8' >> /etc/locale.conf 
'archsys' >> /etc/hostname
'KEYMAP=es' >> /etc/vconsole.conf

# 3.5. Network configuration
# 3.5.1. Hostname
'd7' >> /etc/hostname
# 3.5.2. Hosts
'127.0.0.1 localhost\n ::1 localhost\n 127.0.0.1 archsys.localdomain hostname' >> /etc/hosts

# 3.5.3. Initramfs  mkinitcpio -P

# 3.6. Set user
passwd
useradd -m d7
passwd d7 
usermod -aG wheel,audio,video,optical,storage d7
pacman -S sudo
# EDITOR=nvim visudo # Delete comment in line: %wheel ALL=(ALL:ALL) ALL

# 3.7. Boot loader
pacman -S grub
pacman -S  efibootmgr dosfstools os-prober mtools
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

# After installing bootloader change grub config to: GRUB_TIMEOUT=0
nvim /etc/default/grub # Make changes
grub-mkconfig -o /boot/grub/grub.cfg

# 4. Reboot
exit
umount -l /mnt
reboot

# 5. Post-installation
sudo pacman -S plasma-desktop git base-devel systemctl ark bleachbit docker docker-compose gimp git gwenview firefox filelight handbrake inkscape kdenlive libreoffice-fresh mpv neofetch vlc obsidian telegram-desktop virtualbox rsync
systemctl enable NetworkManager # for GNOME and KDE

# 6. Config files