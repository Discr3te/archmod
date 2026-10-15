#!/usr/bin/env bash

[[ "$MICROCODE" == "all" ]] && MICROCODE="amd-ucode intel-ucode"

packages=(
  "base"
  "linux-firmware"
  "$KERNEL"
  $MICROCODE        # don't quote, need it to word split if $MICROCODE=all
  ${EXTRA_PACKAGES} # don't quote, need it to word split
)

pacstrap -K "$MOUNT_PATH" "${packages[@]}"
