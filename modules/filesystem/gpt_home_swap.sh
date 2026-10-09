#!/usr/bin/env bash
load_module filesystem/filesystem_utils

validate_disk

MOUNT_PATH="/mnt"
BOOT_PATH="/mnt/boot"
HOME_PATH="/mnt/home"

BOOT_PARTITION="$(partition 1)"
ROOT_PARTITION="$(partition 2)"
SWAP_PARTITION="$(partition 3)"
HOME_PARTITION="$(partition 4)"

# Create a new gpt partition table disk
create_new_partition_table "gpt"

# Create Partitions
add_partition BOOT_PARTITION "efi_system" "${DISK[efi,size]}" "U"
add_partition ROOT_PARTITION "root" "${DISK[root,size]}" "L"
add_partition SWAP_PARTITION "swap" "${DISK[swap,size]}" "S"
add_partition HOME_PARTITION "home" "${DISK[home,size]}" "H"

udevadm settle

# Format Partitions
mkfs.fat -F 32 "/dev/$BOOT_PARTITION"
mkfs.ext4 "/dev/$ROOT_PARTITION"
mkswap "/dev/$SWAP_PARTITION"
mkfs.ext4 "/dev/$HOME_PARTITION"

# Mount Partitions
mount "/dev/$ROOT_PARTITION" $MOUNT_PATH
mount --mkdir "/dev/$BOOT_PARTITION" $BOOT_PATH
swapon "/dev/$SWAP_PARTITION"
mount --mkdir "/dev/$HOME_PARTITION" $HOME_PATH
