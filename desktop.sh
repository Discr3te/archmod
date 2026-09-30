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
# MOTHERBOARD: ROG Strix X670E-I Gaming Wifi
# Storage: SK Hynix PC601 256GB PCIe Gen3

# =============================================================================
# REPOSITORY
# =============================================================================

SOURCE_URL=https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main
CONFIG_FILE_URL="$SOURCE_URL/desktop.sh"
EXTERNAL_SETUP_SCRIPT="/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Discr3te/dev-setup/refs/heads/main/setup.sh)'"

# =============================================================================
# CONFIG
# =============================================================================

declare -A LOGGING=(
  [enable]="true"
  [file_name]="archmod.log"
)

declare -A USER=(
  [name]="ryan"
  [group]="wheel"
  [sudo,enable]="true"
)

HOST_NAME="desktop"
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
  [country]="US"
  [protocol]="https"
  [ip_version]="4"
  [use_mirror_status]="on"
)

declare -A DISK=(
  [name]="nvme0n1"
  [label]="gpt"
  [efi,size]="1GiB"
  [root,size]="50GiB"
  [swap,enable]="true"
  [swap,size]="16GiB"
  [separate_home,enable]="true"
  [separate_home,size]="100%"
)

# =============================================================================
# EXECUTE
# =============================================================================
source <(curl -fsL "${SOURCE_URL}/lib/helper.sh")
load_module "lib/install"
