#!/usr/bin/env bash
# =============================================================================
# Archmod: A modular Arch Linux install script.
# (A minor rewrite of Altercation/Archblocks)
#
# Boot the Arch Linux install media, then run one of the following:
# Note: for this script only, CONFIG_FILE_URL must be set for direct curl|bash.
#
# One-liner (pipe directly into bash):
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main/desktop.sh)"
#
# Download first, then run:
#   curl -sfL https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main/desktop.sh
#   bash desktop.sh
#
# Already have this file locally:
#   bash desktop.sh
# =============================================================================

# =============================================================================
# HARDWARE
# =============================================================================

# CPU: AMD Ryzen 7 7700x 8c/16t
# GPU: AMD Radeon RX 6600
# RAM: Corsair Vengeance 32GB DDR5 5600MT/s
# Motherboard: ROG Strix X670E-I Gaming Wifi
# Storage: SK Hynix PC601 256GB PCIe Gen 3

# =============================================================================
# REPOSITORY
# =============================================================================

SOURCE_URL=https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main
CONFIG_FILE_URL="$SOURCE_URL/desktop.sh"

# =============================================================================
# CONFIG
# =============================================================================

declare -A LOGGING=(
  [enable]="false"
  [file_name]="archmod.log"
)

declare -A USER=(
  [name]="ryan"
  [password]="ask"
  [group]=""
  [sudo,enable]="true"
)

HOST_NAME="desktop"
KEYBOARD_LAYOUT="us"
LOCALE_LANGUAGE="en_US.UTF-8"
LOCALE_ENCODEING="UTF-8"
CONSOLE_FONT="ter132n"
declare -A TIMEZONE=(
  [zone]="America/Chicago"
  [ntp]="systemd_timesyncd"
)
MICROCODE="amd-ucode"
KERNEL="linux"
BOOTLOADER="grub_efi"
NETWORK="networkmanager"
GPU_PACKAGES="amd_opensource"
HARDWARE=""
EXTRA_PACKAGES=""
EXTERNAL_SCRIPT="/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Discr3te/dev-setup/refs/heads/main/setup.sh)'"

declare -A MIRRORLIST=(
  [country]="US"
  [protocol]="https"
  [ip_version]="4"
  [use_mirror_status]="on"
)

declare -A DISK=(
  [module]="gpt_home_swap"
  [name]="nvme0n1"
  [efi,size]="1GiB"
  [root,size]="50GiB"
  [swap,size]="16GiB"
  [home,size]="100%"
)

# =============================================================================
# EXECUTE
# =============================================================================
source <(curl -fsL "${SOURCE_URL}/lib/install.sh")
