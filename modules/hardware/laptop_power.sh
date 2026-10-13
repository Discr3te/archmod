#!/usr/bin/env bash

install_pkg powertop tlp

systemctl enable tlp.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket
