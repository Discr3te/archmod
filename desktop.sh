#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# HARDWARE
# -----------------------------------------------------------------------------

# CPU: AMD Ryzen 7 7700x 8c/16t
# GPU: AMD Radeon RX 6600
# RAM: Corsair Vengeance 32GB DDR5 5600MT/s
# MOTHERBOARD: ROG Strix X670E-I Gaming Wifi
# Storage: SK Hynix PC601 256GB PCIe Gen3

# -----------------------------------------------------------------------------
# REMOTE
# -----------------------------------------------------------------------------

readonly SOURCE_URL=https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main

# -----------------------------------------------------------------------------
# CONFIG
# -----------------------------------------------------------------------------

readonly CONFIG_FILE_URL="$SOURCE_URL/desktop.sh"

USERNAME="ryan"
HOSTNAME="desktop"
KEYBOARD_LAYOUT="us"
LOCALE_LANGUAGE="en_US.UTF-8"
LOCALE_ENCODEING="UTF-8"
CONSOLE_FONT="ter132n"
TIMEZONE="America/Chicago"
MICROCODE="amd-ucode"
EXTRA_PACKAGES=""
EXTERNAL_SETUP_SCRIPT="/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Discr3te/dev-setup/refs/heads/main/setup.sh)'"

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
  [swap,size]="16GiB"
  [separate_home,size]="100%"
)

# -----------------------------------------------------------------------------
# EXECUTE
# -----------------------------------------------------------------------------
source <(curl -fsL "${SOURCE_URL}/_lib/helper.sh")
# source ./_lib/helper.sh
_loadmodule "_lib/verify_config"
