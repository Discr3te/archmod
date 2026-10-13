#!/usr/bin/env bash

if [[ -f "${0}" ]]; then
  cp "$0" "$MOUNT_PATH/${BASH_SOURCE[0]##*/}"

  arch-chroot -S "$MOUNT_PATH" /bin/bash -c "IN_CHROOT=\"true\";
  IN_CHROOT_BOOT_PATH=\"${BOOT_PATH/${MOUNT_PATH}/}\";
  MOUNT_PATH=\"$MOUNT_PATH\";
  BOOT_PARTITION=\"$BOOT_PARTITION\";
  ROOT_PARTITION=\"$ROOT_PARTITION\";
  bash ${BASH_SOURCE[0]##*/}"

  cd /
  sync
  umount -R "$MOUNT_PATH"

else
  arch-chroot -S "$MOUNT_PATH" /bin/bash -c "IN_CHROOT=\"true\";
  IN_CHROOT_BOOT_PATH=\"${BOOT_PATH/${MOUNT_PATH}/}\";
  MOUNT_PATH=\"$MOUNT_PATH\";
  BOOT_PARTITION=\"$BOOT_PARTITION\";
  ROOT_PARTITION=\"$ROOT_PARTITION\";
  $(curl -fsSL "$CONFIG_FILE_URL")"

  cd /
  sync
  umount -R "$MOUNT_PATH"
fi
