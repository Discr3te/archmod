#!/usr/bin/env bash

clear
echo "BOOTLOADER START"
echo
sleep 2

echo "start installing packages"
sleep 2
install_pkg grub efibootmgr dosfstools mtools os-prober
echo "finish installing packages"
sleep 2

# mkdir --verbose -p $IN_CHROOT_BOOT_PATH/efi
# mount -fv /dev/$BOOT_PARTITION $IN_CHROOT_BOOT_PATH/efi
#

echo
lsblk
echo "IN_CHROOT_BOOT_PATH: $IN_CHROOT_BOOT_PATH"
echo "$BOOT_PARTITION: $BOOT_PARTITION"
sleep 5

echo "start grub install"
sleep 2
grub-install --target=x86_64-efi --efi-directory=$IN_CHROOT_BOOT_PATH --bootloader-id=GRUB --verbose
echo "finish grub-install"
sleep 2

echo "start grub-mkconfig"
sleep 2
grub-mkconfig -o $IN_CHROOT_BOOT_PATH/grub/grub.cfg
echo "finish grub-mkconfig"
sleep 2

echo "BOOTLOADER END"
echo
sleep 10
clear
