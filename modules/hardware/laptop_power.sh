#!/usr/bin/env bash

install_pkg powertop tlp

systemctl enable tlp.service
