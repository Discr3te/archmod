#!/usr/bin/env bash

clear
echo "BOOTLOADER START"
echo

install_pkg grub efibootmgr dosfstools mtools

mkdir --verbose -p $IN_CHROOT_BOOT_PATH/efi
mount -fv /dev/$BOOT_PARTITION $IN_CHROOT_BOOT_PATH/efi

echo "IN_CHROOT_BOOT_PATH: $IN_CHROOT_BOOT_PATH"
echo "$BOOT_PARTITION: $BOOT_PARTITION"
sleep 20

grub-install --target=x86_64-efi --efi-directory=$IN_CHROOT_BOOT_PATH --bootloader-id=GRUB --force --recheck --debug --verbose

grub-mkconfig -o $IN_CHROOT_BOOT_PATH/grub/grub.cfg

echo "BOOTLOADER END"
echo
sleep 10
clear
