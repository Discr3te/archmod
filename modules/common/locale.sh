#!/usr/bin/env bash

case "$CONSOLE_FONT" in
ter-*)
  install_pkg terminus-font
  ;;
esac

uncomment "$LOCALE_LANGUAGE" "/etc/locale.gen"
echo "LANG=$LOCALE_LANGUAGE" >>/etc/locale.conf
echo -e "KEYMAP=$KEYBOARD_LAYOUT\nFONT=$CONSOLE_FONT" >>/etc/vconsole.conf
locale-gen
