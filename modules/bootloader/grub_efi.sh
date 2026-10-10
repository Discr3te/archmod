#!/usr/bin/env bash

install_pkg grub efibootmgr dosfstools mtools

grub-install --target=x86_64-efi --efi-directory="$IN_CHROOT_BOOT_PATH" --bootloader-id=GRUB --force --recheck

grub-mkconfig -o "$IN_CHROOT_BOOT_PATH/grub/grub.cfg"
