#!/usr/bin/env bash

# https://wiki.archlinux.org/index.php/Installation_guide#Installation 
# Omit boot loader and reboot yourself

# Select the mirrors
cp -vf /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
pacman -S --needed --noconfirm reflector
reflector --country 'China' --sort rate --save /etc/pacman.d/mirrorlist

# Install the base packages
mount_dir=/mnt
pacstrap $mount_dir base

# Configure the system
hostname=ArchE540
timezone=/usr/share/zoneinfo/Asia/Shanghai
locale="LANG=en_US.UTF-8 UTF-8"

## fstab
echo "Generate a fstab file..."
genfstab -p -U $mount_dir >> /mnt/etc/fstab
## change root
arch-chroot $mount_dir
## hostname
echo "Set the hostname..."
echo $hostname | tee /etc/hostname
## time zone
echo "Set the timezone..."
ln -s $timezone /etc/localtime
## locale
echo "Uncomment the needed locale..."
sed -i "s/#en_US\.UTF-8 UTF-8/en_US\.UTF-8 UTF-8/" /etc/locale.gen
sed -i "s/#zh_CN\.UTF-8 UTF-8/zh_CN\.UTF-8 UTF-8/" /etc/locale.gen
locale-gen
echo "Set the locale..."
echo $locale | tee /etc/locale.conf
## keymap
## font
## network
## mkinitcpio
## clock
echo "Set the hwclock..."
hwclock --systohc --utc
## set the passwd
echo "Set the root passwd..."
passwd
