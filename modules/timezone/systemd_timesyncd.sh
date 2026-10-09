#!/usr/bin/env bash

ln -sf /usr/share/zoneinfo/${TIMEZONE[zone]} /etc/localtime
hwclock --systohc
