#!/usr/bin/env bash

# =============================================================================
# Defaults
# =============================================================================
default_value 'LOGGING[enable]' "true"
if [[ "${LOGGING[file_name]}" == "true" ]]; then
  default_value 'LOGGING[file_name]' "archmod.log"
fi

default_value 'USER[name]' "linuxuser"
default_value 'USER[sudo,enable]' "true"
if [[ "${USER[sudo,enable]}" == "true" ]]; then
  default_value 'USER[group]' "wheel"
fi

default_value HOST_NAME "archlinux"
default_value KEYBOARD_LAYOUT "us"
default_value LOCALE_LANGUAGE "en_US.UTF-8"
default_value LOCALE_ENCODEING "UTF-8"
default_value CONSOLE_FONT "ter-132n"
default_value TIMEZONE "UTC"
default_value MICROCODE "all"
default_value BOOTLOADER "ask"
default_value KERNEL "linux"
default_value NETWORK ""
default_value EXTRA_PACKAGES ""
default_value EXTERNAL_SETUP_SCRIPT ""

default_value 'MIRRORLIST[country]' "all"
default_value 'MIRRORLIST[protocol]' "all"
default_value 'MIRRORLIST[ip_version]' "all"
default_value 'MIRRORLIST[use_mirror_status]' "on"

default_value 'DISK[name]' "ask"
default_value 'DISK[efi,size]' "1"
default_value 'DISK[root,size]' "100%"
default_value 'DISK[swap,enable]' "false"
default_value 'DISK[separate_home,enable]' "false"

# =============================================================================
# Install
# =============================================================================

load_module common/rank_mirrorlist
