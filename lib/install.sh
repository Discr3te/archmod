#!/usr/bin/env bash

source <(curl -fsL "${SOURCE_URL}/lib/utils.sh")

# =============================================================================
# DEFAULTS
# =============================================================================
default_value 'LOGGING[enable]' "true"
case "${LOGGING[file_name]}" in
"true")
  default_value 'LOGGING[file_name]' "archmod.log"
  ;;
esac

default_value 'USER[name]' "linuxuser"
default_value 'USER[group]' ""
default_value 'USER[sudo,enable]' "true"
default_value 'USER[password]' "default"

default_value HOST_NAME "archlinux"
default_value KEYBOARD_LAYOUT "us"
default_value LOCALE_LANGUAGE "en_US.UTF-8"
default_value LOCALE_ENCODEING "UTF-8"
default_value CONSOLE_FONT "ter-132n"

default_value 'TIMEZONE[zone]' "UTC"
default_value 'TIMEZONE[ntp]' "systemd_timesyncd"

default_value MICROCODE "all"
default_value BOOTLOADER "grub"
default_value KERNEL "linux"
default_value NETWORK "networkmanager"
default_value GPU_PACKAGES ""
default_value HARDWARE ""
default_value EXTRA_PACKAGES ""
default_value EXTERNAL_SCRIPT ""

default_value 'MIRRORLIST[country]' "all"
default_value 'MIRRORLIST[protocol]' "all"
default_value 'MIRRORLIST[ip_version]' "all"
default_value 'MIRRORLIST[use_mirror_status]' "on"

default_value 'DISK[name]' "ask"
default_value 'DISK[module]' "gpt"
default_value 'DISK[efi,size]' "1GiB"
default_value 'DISK[swap,size]' "4GiB"
default_value 'DISK[root,size]' "100%"
default_value 'DISK[home,size]' "100%"

# =============================================================================
# INSTALL
# =============================================================================

case ${IN_CHROOT:-false} in
"false")
  load_module utils/rank_mirrorlist
  load_module "filesystem/${DISK[module]}"
  load_module common/pacstrap_install
  load_module common/fstab

  arch-chroot -S "$MOUNT_PATH" /bin/bash -c "IN_CHROOT=\"true\";
  IN_CHROOT_BOOT_PATH=\"${BOOT_PATH/${MOUNT_PATH}/}\";
  MOUNT_PATH=\"$MOUNT_PATH\";
  BOOT_PARTITION=\"$BOOT_PARTITION\";
  $(curl -fsSL "$CONFIG_FILE_URL")"

  cd /
  sync
  umount -R "$MOUNT_PATH"
  ;;
"true")

  load_module "timezone/${TIMEZONE[ntp]}"
  load_module common/locale
  load_module common/initramfs
  load_module "network/$NETWORK"
  load_module common/add_user
  load_module "bootloader/$BOOTLOADER"
  load_module "hardware/$HARDWARE"
  load_module "gpu_packages/$GPU_PACKAGES"
  load_module "external_script/$EXTERNAL_SCRIPT"
  ;;
esac
