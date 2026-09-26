#!/usr/bin/env bash

echo "sourced boostrap.sh"

set_default_value USERNAME "linuxuser"
set_default_value HOSTNAME "archlinux"
set_default_value KEYBOARD_LAYOUT "us"
set_default_value LOCALE_LANGUAGE "en_US.UTF-8"
set_default_value LOCALE_ENCODEING "UTF-8"
set_default_value CONSOLE_FONT "ter-132b"
set_default_value TIMEZONE "UTC"
set_default_value MICROCODE "all"
set_default_value BOOTLOADER ""
set_default_value NETWORK ""
set_default_value EXTRA_PACKAGES ""
set_default_value EXTERNAL_SETUP_SCRIPT ""

# Mirrolist
set_default_value 'MIRRORLIST[country]' "all"
set_default_value 'MIRRORLIST[protocol]' "all"
set_default_value 'MIRRORLIST[ip_version]' "all"
set_default_value 'MIRRORLIST[use_mirror_status]' "on"

# Disk
set_default_value 'DISK[name]' "ask"
set_default_value 'DISK[label]' "ask"
set_default_value 'DISK[efi,size]' "1"
set_default_value 'DISK[root,size]' "100%"
set_default_value 'DISK[swap,size]' "0"
set_default_value 'DISK[separate_home,size]' "0"

load_module lib/install.sh
