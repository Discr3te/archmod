#!/usr/bin/env bash

packages=(
  "base"
  "linux-firmware"
  "$KERNEL"
  "$MICROCODE"
  ${EXTRA_PACKAGES} # don't quote, need it to word split
)

pacstrap -K "$MOUNT_PATH" "${packages[@]}"
