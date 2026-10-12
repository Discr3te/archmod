#!/usr/bin/env bash

ROOT_PARTITION_UUID=$(blkid -s UUID -o value /dev/$ROOT_PARTITION)

if [[ -z $ROOT_PARTITION_UUID ]]; then
  echo "Could not get UUID for /dev/$ROOT_PARTITION" >&2
  exit 1
fi

bootctl install

cat >"$IN_CHROOT_BOOT_PATH/loader/loader.conf" <<EOF
default arch.conf
timeout 3
console-mode max
editor false
beep false
EOF

mkdir -p "$IN_CHROOT_BOOT_PATH/loader/entries"
cat >"$IN_CHROOT_BOOT_PATH/loader/entries/arch.conf" <<EOF
title   Arch Linux
linux   /vmlinuz-$KERNEL
initrd  /initramfs-${KERNEL}.img
options root=UUID=${ROOT_PARTITION_UUID} rw
EOF

systemctl enable systemd-boot-update.service

# bootctl list
