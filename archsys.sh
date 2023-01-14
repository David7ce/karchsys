echo "ArchSys"

# 0. Pre-installation
# loadkeys es # panish keyboard

# Update the system clock
timedatectl status

# Use partition manager (lsblk, fdisk, cfdisk)
# cfdisk /dev/sda
	# level type: gpt, dos*, sgi, sun
		# /dev/sda1 128M (primary bootable) -> Boot partition
		# /dev/sda2 rest memory (primary) -> File system partition
		# Write changes and Quit

# Partition the disks with fdisk
fdisk -l
fdisk /dev/nvme0n1 # '/dev/sda', '/dev/nvme0n1', '/dev/mmcblk0'

# Format the partitions
mkfs.ext4 /dev/nvme0n1
mkfs.fat -F 32 /dev/nvme0n2 # EFI partition formatted to fat32
mkswap /dev/nvme0n3


# Mount the file systems (dev/nvme0nx or /dev/sdax)
mount /dev/nvme0n1 /mnt
mount --mkdir /dev/nvme0n2 /mnt/boot
swapon /dev/sda3

# 1. Installation
pacstrap -K /mnt base linux linux-firmware

# 2. Configure the system
# 2.1. Fstab
genfstab -U /mnt >> /mnt/etc/fstab

# 2.2. Chroot
arch-chroot /mnt

# 2.3. Timezone
ln -sf /usr/share/zoneinfo/Atlantic/Canary /etc/localtime
hwclock --systohc

# 2.4 Localization
locale-gen
'LANG=en-US.UTF-8'>> /etc/locale.conf 
'archsys' >> /etc/hostname
'KEYMAP=es' >> /etc/vconsole.conf

# 2.5. Network configuration
'd7' >> /etc/hostname

# 2.6. Initramfs
mkinitcpio -P

# 2.7. Root password
passwd d7

# 2.8. Boot loader
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB
grub-install --target=i386-pc --debug /dev/sdax

# 3. Reboot
exit
umount -R /mnt
reboot

# 4. Post-installation
pacman -S plasma-desktop ark bleachbit docker docker-compose gimp git gwenview firefox filelight handbrake inkscape kdenlive libreoffice-fresh mpv vlc obsidian telegram-desktop virtualbox 

# 
systemctl enable NetworkManager