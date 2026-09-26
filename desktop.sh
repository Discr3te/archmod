#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# REMOTE
# -----------------------------------------------------------------------------

readonly REMOTE=https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main

# -----------------------------------------------------------------------------
# HARDWARE
# -----------------------------------------------------------------------------

# CPU: AMD Ryzen 7 7700x 8c/16t
# GPU: AMD Radeon RX 6600
# RAM: Corsair Vengeance 32GB DDR5 5600MT/s
# MOTHERBOARD: ROG Strix X670E-I Gaming Wifi
# Storage: SK Hynix PC601 256GB PCIe Gen3

# -----------------------------------------------------------------------------
# CONFIG
# -----------------------------------------------------------------------------

readonly CONFIG_FILE="$REMOTE/desktop.sh"

USERNAME="ryan"
HOSTNAME="desktop"
KEYBOARD_LAYOUT="us"
LOCALE_LANGUAGE="en_US.UTF-8"
LOCALE_ENCODEING="UTF-8"
CONSOLE_FONT="ter132n"
TIMEZONE="America/Chicago"
MICROCODE="amd-ucode"
EXTRA_PACKAGES=""

declare -A MIRRORLIST=(
  [country]="US"
  [protocol]="https"
  [ip_version]="4"
  [use_mirror_status]="on"
)

declare -A DRIVE=(
  [name]="nvme0n1"
  [label]="gpt"
  [efi,size]="1"
  [root,size]="50"
  [swap,size]="16"
  [separate_home,size]="50"
  [unit]="GiB"
)

# -----------------------------------------------------------------------------
# EXECUTE
# -----------------------------------------------------------------------------
source <(curl -fsL "${REMOTE}/_lib/helper.sh")
_loadmodule "_lib/bootstrap"
