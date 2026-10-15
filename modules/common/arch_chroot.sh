#!/usr/bin/env bash

echo "IN_CHROOT=\"true\"
IN_CHROOT_BOOT_PATH=\"${BOOT_PATH/${MOUNT_PATH}/}\"
MOUNT_PATH=\"$MOUNT_PATH\"
BOOT_PARTITION=\"$BOOT_PARTITION\"
ROOT_PARTITION=\"$ROOT_PARTITION\"" >"${MOUNT_PATH}/chroot.sh"

if [[ -f "${BASH_SOURCE[-1]}" ]]; then
  cp "${BASH_SOURCE[-1]}" "$MOUNT_PATH/archmod-config.sh"
else
  curl -fsSL "$CONFIG_FILE_URL" -o "$MOUNT_PATH/archmod-config.sh"
fi || {
  echo "archmod: couldn't copy or download the config into $MOUNT_PATH" >&2
  exit 1
}

arch-chroot -S "$MOUNT_PATH" /bin/bash -c "source /chroot.sh && source /archmod-config.sh" || {
  echo "archmod: chroot phase failed (exit $?). $MOUNT_PATH is still mounted so you can inspect it." >&2
  exit 1
}

rm -f "$MOUNT_PATH/chroot.sh" "$MOUNT_PATH/archmod-config.sh"
cd /
sync
umount -R "$MOUNT_PATH"
