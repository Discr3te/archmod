#!/usr/bin/env bash

echo "initialized desktop.sh"

# -----------------------------------------------------------------------------
# HARDWARE
# -----------------------------------------------------------------------------

# CPU: AMD Ryzen 7 7700x 8c/16t
# GPU: AMD Radeon RX 6600
# RAM: Corsair Vengeance 32GB DDR5 5600MT/s
# MOTHERBOARD: ROG Strix X670E-I Gaming Wifi
# Storage: SK Hynix PC601 256GB PCIe Gen3

# -----------------------------------------------------------------------------
# EXECUTE
# -----------------------------------------------------------------------------
readonly REMOTE=https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main
source <(curl -fsL "${REMOTE}/_utils/setup.sh")
_loadmodule "_utils/install"

# -----------------------------------------------------------------------------
# CONFIG
# -----------------------------------------------------------------------------

readonly USERNAME="ryan"
readonly HOSTNAME="desktop"
readonly KEYBOARD_LAYOUT="us"
readonly LOCALE_LANGUAGE="en_US.UTF-8"
readonly LOCALE_ENCODEING="UTF-8"
readonly CONSOLE_FONT="ter132n"
readonly TIMEZONE="America/Chicago"a
readonly MICROCODE="amd-ucode"
readonly EXTRA_PACKAGES=""

declare -Ar MIRRORLIST=(
  [country]="US"
  [protocol]="https"
)

declare -Ar DRIVE=(
  [name]="nvme0n1"
  [label]="gpt"
  [efi,size]="1"
  [root,size]="50"
  [swap,size]="16"
  [separate_home,size]="50"
  [unit]="GiB"
)
