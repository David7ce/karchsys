#!/bin/bash
# WARNING: this script will destroy data on the selected disk.
# This script can be run by executing the following:
#   curl -sL https://raw.githubusercontent.com/David7ce/archsys/main/archsys.sh | bash

echo "ArchSys"

# 1.1. Set the console keyboard layout
loadkeys es

# 1.2. Update the system clock
timedatectl status

# ------------------ #

# /dev/nvme0n1 or /dev/sda1

# 1.3. Setup the disk and partitions
swap_size=$(free --mebi | awk '/Mem:/ {print $2}')
swap_end=$(( $swap_size + 129 + 1 ))MiB

parted --script "${device}" -- mklabel gpt \
  mkpart ESP fat32 1Mib 129MiB \
  set 1 boot on \
  mkpart primary linux-swap 129MiB ${swap_end} \
  mkpart primary ext4 ${swap_end} 100%

# Simple globbing was not enough as on one device I needed to match /dev/mmcblk0p1
# but not /dev/mmcblk0boot1 while being able to match /dev/sda1 on other devices.
part_boot="$(ls ${device}* | grep -E "^${device}p?1$")"
part_swap="$(ls ${device}* | grep -E "^${device}p?2$")"
part_root="$(ls ${device}* | grep -E "^${device}p?3$")"

wipefs "${part_boot}"
wipefs "${part_swap}"
wipefs "${part_root}"

# 1.4. Then format the partitions
mkfs.vfat -F32 "${part_boot}" # EFI partition formatted to fat32
mkswap "${part_swap}"
mkfs.ext4 "${part_root}"

# 1.5. Mount the file systems (dev/nvme0nx or /dev/sdax)
swapon "${part_swap}"
mount "${part_root}" /mnt
mount --mkdir "${part_boot}" /mnt/boot

# ------------------ #

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
'LANG=en-US.UTF-8' >> /etc/locale.conf  # echo "LANG=en_GB.UTF-8" > /mnt/etc/locale.conf
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