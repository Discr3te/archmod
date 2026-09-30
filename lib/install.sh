#!/usr/bin/env bash

# =============================================================================
# Defaults
# =============================================================================
default_value 'LOGGING[enable]' "true"
default_value 'LOGGING[file_name]' "archmod.log"

default_value 'USER[name]' "linuxuser"
default_value 'USER[group]' ""
default_value 'USER[sudo]' "true"

default_value HOST_NAME "archlinux"
default_value KEYBOARD_LAYOUT "us"
default_value LOCALE_LANGUAGE "en_US.UTF-8"
default_value LOCALE_ENCODEING "UTF-8"
default_value CONSOLE_FONT "ter-132b"
default_value TIMEZONE "UTC"
default_value MICROCODE "all"
default_value BOOTLOADER ""
default_value NETWORK ""
default_value EXTRA_PACKAGES ""
default_value EXTERNAL_SETUP_SCRIPT ""

default_value 'MIRRORLIST[country]' "all"
default_value 'MIRRORLIST[protocol]' "all"
default_value 'MIRRORLIST[ip_version]' "all"
default_value 'MIRRORLIST[use_mirror_status]' "on"

default_value 'DISK[name]' "ask"
default_value 'DISK[partition_table]' "ask"
default_value 'DISK[efi,size]' "1"
default_value 'DISK[root,size]' "100%"
default_value 'DISK[swap,enable]' "false"
default_value 'DISK[separate_home,enable]' "false"

# =============================================================================
# Install
# =============================================================================

load_module common/rank_mirrorlist
