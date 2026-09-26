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
# REPOSITORY
# =============================================================================

readonly SOURCE_URL=
readonly CONFIG_FILE_URL=

# =============================================================================
# CONFIG
# =============================================================================

USERNAME=
HOSTNAME=
KEYBOARD_LAYOUT=
LOCALE_LANGUAGE=
LOCALE_ENCODEING=
CONSOLE_FONT=
TIMEZONE=
MICROCODE=
KERNEL=
EXTRA_PACKAGES=
EXTERNAL_SETUP_SCRIPT=

declare -A MIRRORLIST=(
  [country]=
  [protocol]=
  [ip_version]=
  [use_mirror_status]=
)

declare -A DISK=(
  [name]=
  [label]=
  [efi,size]=
  [root,size]=
  [swap,size]=
  [separate_home,size]=
)

# =============================================================================
# EXECUTE
# =============================================================================
source <(curl -fsL "${SOURCE_URL}/lib/helper.sh")
loadmodule "lib/verify_config"
