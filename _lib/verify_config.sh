#!/usr/bin/env bash

echo "sourced boostrap.sh"

_defaultvalue USERNAME "linuxuser"
_defaultvalue HOSTNAME "archlinux"
_defaultvalue KEYBOARD_LAYOUT "us"
_defaultvalue LOCALE_LANGUAGE "en_US.UTF-8"
_defaultvalue LOCALE_ENCODEING "UTF-8"
_defaultvalue CONSOLE_FONT ""
_defaultvalue TIMEZONE "UTC"
_defaultvalue MICROCODE "all"
_defaultvalue EXTRA_PACKAGES ""
_defaultvalue EXTERNAL_SETUP_SCRIPT ""

# Mirrolist
_defaultvalue 'MIRRORLIST[country]' "all"
_defaultvalue 'MIRRORLIST[protocol]' "all"
_defaultvalue 'MIRRORLIST[ip_version]' "all"
_defaultvalue 'MIRRORLIST[use_mirror_status]' "on"

# Disk
_defaultvalue 'DISK[name]' "ask"
_defaultvalue 'DISK[label]' "ask"
_defaultvalue 'DISK[efi,size]' "1"
_defaultvalue 'DISK[root,size]' "100%"
_defaultvalue 'DISK[swap,size]' "0"
_defaultvalue 'DISK[separate_home,size]' "0"

_loadmodule _lib/install.sh
