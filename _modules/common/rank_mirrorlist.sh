#!/usr/bin/env bash

echo "rank mirrorlist"
echo "mirrorlist country: ${MIRRORLIST["country"]}"

readonly url="https://archlinux.org/mirrorlist/?country=${MIRRORLIST["country"]}&protocol=${MIRRORLIST["protocol"]}&use_mirror_status=on"

echo "mirrorlist url: $url"
#
# readonly mirrorlist=/etc/pacman.d/mirrorlist
# readonly new_mirrorlist=/etc/pacman.d/mirrorlist.new
# readonly backup_mirrorlist=/etc/pacman.d/mirrorlist.bk
#
# if [ -f "$mirrorlist" ]; then
#   mv $mirrorlist $backup_mirrorlist
# fi
#
# curl -o $new_mirrorlist "$url"
# sed -i 's/^# *Server/Server/' $new_mirrorlist
# rankmirrors -n 5 $new_mirrorlist >$mirrorlist
# rm -rf $new_mirrorlist
