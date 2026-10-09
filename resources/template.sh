#!/usr/bin/env bash
# =============================================================================
# Archmod: A modular Arch Linux install script.
# (A minor rewrite of Altercation/Archblocks)
# =============================================================================

# =============================================================================
# HARDWARE
# =============================================================================

# CPU:
# GPU:
# RAM:
# MOTHERBOARD:
# Storage:

# =============================================================================
# REPOSITORIES
# =============================================================================

SOURCE_URL=""
CONFIG_FILE_URL=""

# =============================================================================
# CONFIG
# =============================================================================

declare -A LOGGING=(
  [enable]=""
  [file_name]=""
)

declare -A USER=(
  [name]=""
  [password]=""    # default | ask
  [group]=""       # Check resources/lists/ for a comprehensive list
  [sudo,enable]="" # true | false
)

HOST_NAME=""
KEYBOARD_LAYOUT=""  # Check resources/lists/ for a comprehensive list
LOCALE_LANGUAGE=""  # Check resources/lists/ for a comprehensive list
LOCALE_ENCODEING="" # Check resources/lists/ for a comprehensive list
CONSOLE_FONT=""     # Check resources/lists/ for a comprehensive list
declare -A TIMEZONE=(
  [zone]="" # Check resources/lists/ for a comprehensive list
  [ntp]=""  # <value> -> <timezone>/<value>.sh
)
MICROCODE=""    # intel-ucode | amd-ucode
KERNEL=""       # linux
BOOTLOADER=""   # <value> -> <bootloader>/<value>.sh
NETWORK=""      # <value> -> <network>/<value>.sh
HARDWARE=""     # <value> <value2>... -> <hardware>/<value>.sh
GPU_PACKAGES="" # <value> -> <gpu_packages>/<value>.sh
EXTRA_PACKAGES=""
EXTERNAL_SCRIPT="" # <value> -> <external_script>/<value>.sh

declare -A MIRRORLIST=(
  [country]=""           # Check resources/lists/ for a comprehensive list
  [protocol]=""          # all | http | https
  [ip_version]=""        # all | 4 | 6
  [use_mirror_status]="" # on | off
)

declare -A DISK=(a
  [module]=""    # <gpt>[_home][_swap][_luks] -> <filesystem>/<value>.sh
  [name]=""      # ask | (e.g. nvme0n1)
  [efi,size]=""  # only if gpt partition table (e.g. 1GiB)
  [root,size]="" # (e.g. 50GiB)
  [swap,size]="" # (e.g. 16GiB)
  [home,size]="" # (e.g. 100%)
)

# =============================================================================
# EXECUTE
# =============================================================================
source <(curl -fsL "${SOURCE_URL}/lib/install.sh")
