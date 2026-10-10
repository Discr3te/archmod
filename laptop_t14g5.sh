#!/usr/bin/env bash
# =============================================================================
# Archmod: A modular Arch Linux install script.
# (A minor rewrite of Altercation/Archblocks)
#
# Boot the Arch Linux install media, then run one of the following:
# Note: for this script only, CONFIG_FILE_URL must be set for direct curl|bash.
#
# One-liner (pipe directly into bash):
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main/laptop_t14g5.sh)"
#
# Download first, then run:
#   curl -sfL https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main/laptop_t14g5.sh
#   bash laptop_t14g5.sh
#
# Already have this file locally:
#   bash laptop_t14g5.sh
# =============================================================================

# =============================================================================
# HARDWARE
# =============================================================================

# Laptop Model: Lenovo Thinkpad T14 Gen 5
# CPU: AMD Ryzen 7 PRO 8840U 8c/16t
# GPU: Radeon 780M Graphics
# RAM: Micron 16GB DDR5 5600MT/s SODIMM
# Motherboard:
# Storage: Micron 3500 512GB PCIe Gen 4

# =============================================================================
# REPOSITORIES
# =============================================================================

SOURCE_URL=https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main
CONFIG_FILE_URL="$SOURCE_URL/laptop_t14g5.sh"

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

HOST_NAME="t14"
KEYBOARD_LAYOUT="us"
LOCALE_LANGUAGE="en_US.UTF-8"
LOCALE_ENCODEING="UTF-8"
CONSOLE_FONT="ter-124b"

declare -A TIMEZONE=(
  [zone]="America/Chicago"
  [ntp]="systemd_timesyncd"
)
MICROCODE="amd-ucode"
KERNEL="linux"
BOOTLOADER="grub_efi"
NETWORK="networkmanager"
HARDWARE="laptop_power"
GPU_PACKAGES="amd_opensource"
EXTRA_PACKAGES=""
EXTERNAL_SCRIPT="arch_setup"

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
  [swap,size]="8GiB"
  [home,size]="100%"
)

# =============================================================================
# EXECUTE
# =============================================================================
source <(curl -fsL "${SOURCE_URL}/lib/install.sh")
