#!/usr/bin/env bash
# =============================================================================
# Archmod: A modular Arch Linux install script.
# (A minor rewrite of Altercation/Archblocks)
# =============================================================================

# =============================================================================
# HARDWARE
# =============================================================================

# Laptop Model: Lenovo Thinkpad T14 Gen 5
# CPU:
# GPU:
# RAM:
# MOTHERBOARD:
# Storage:

# =============================================================================
# REPOSITORIES
# =============================================================================

SOURCE_URL=https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main
CONFIG_FILE_URL="$SOURCE_URL/laptop_t14.sh"
EXTERNAL_SETUP_SCRIPT="/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Discr3te/dev-setup/refs/heads/main/setup.sh)'"

# =============================================================================
# CONFIG
# =============================================================================

declare -A USER=(
  [name]="ryan"
  [group]="wheel"
  [sudo,enable]="true"
)

HOST_NAME="t14"
KEYBOARD_LAYOUT="us"
LOCALE_LANGUAGE="en_US.UTF-8"
LOCALE_ENCODEING="UTF-8"
CONSOLE_FONT="ter132n"
TIMEZONE="America/Chicago"
MICROCODE="amd-ucode"
KERNEL="linux"
BOOTLOADER="grub"
NETWORK=""
EXTRA_PACKAGES=""

declare -A MIRRORLIST=(
  [country]="us"
  [protocol]="https"
  [ip_version]="4"
  [use_mirror_status]="on"
)

declare -A DISK=(
  [name]="nvme0n1"
  [efi,size]="1GiB"
  [root,size]="50GiB"
  [swap,size]="8GiB"
  [separate_home,size]="100%"
)

# =============================================================================
# EXECUTE
# =============================================================================
source <(curl -fsL "${SOURCE_URL}/lib/helper.sh")
loadmodule "lib/install"
