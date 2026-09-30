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

SOURCE_URL=
CONFIG_FILE_URL=
EXTERNAL_SETUP_SCRIPT=

# =============================================================================
# CONFIG
# =============================================================================

declare -A USER=(
  [name]=
  [group]=       # Check resources/user_group.txt for a list.
  [sudo,enable]= # "true" or "false"
)

HOST_NAME=
KEYBOARD_LAYOUT=  # Check resources/keyboard_layout.txt for a list.
LOCALE_LANGUAGE=  # Check resources/locale_language.txt for a list.
LOCALE_ENCODEING= # Check resources/locale_encodeing.txt for a list.
CONSOLE_FONT=     # Check resources/console_font.txt for a list.
TIMEZONE=         # Check resources/timezone.txt for a list.
MICROCODE=        # "intel-ucode" or "amd-ucode"
KERNEL=           # "linux"
EXTRA_PACKAGES=

declare -A MIRRORLIST=(
  [country]=           # Check resources/mirrorlist_country.txt for a list.
  [protocol]=          # "all" or "http" or "https"
  [ip_version]=        # "all" or "4" or "6"
  [use_mirror_status]= # "on" or "off"
)

declare -A DISK=(
  [name]=
  [efi,size]=
  [root,size]=
  [swap,enable]= # "true" or "false"
  [swap,size]=
  [separate_home,enable]= # "true" or "false"
  [separate_home,size]=
)

# =============================================================================
# EXECUTE
# =============================================================================
source <(curl -fsL "${SOURCE_URL}/lib/helper.sh")
loadmodule "lib/install"
