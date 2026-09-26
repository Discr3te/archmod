#!/usr/bin/env bash

mirrorlist_url="https://archlinux.org/mirrorlist/?"
readonly mirrorlist=/etc/pacman.d/mirrorlist
readonly new_mirrorlist=/etc/pacman.d/mirrorlist.new
readonly backup_mirrorlist=/etc/pacman.d/mirrorlist.bk

case ${MIRRORLIST["country"]} in
"all")
  mirrorlist_url+="country=all&"
  ;;
*)
  for country in ${MIRRORLIST["country"]}; do
    mirrorlist_url+="country=$country&"
  done
  ;;
esac

case ${MIRRORLIST["protocol"]} in
"https")
  mirrorlist_url+="protocol=https&"
  ;;
"http")
  mirrorlist_url+="protocol=http&"
  ;;
"all")
  mirrorlist_url+="protocol=http&protocol=https&"
  ;;
esac

case ${MIRRORLIST["ip_version"]} in
"ipv4")
  mirrorlist_url+="ip_version=4&"
  ;;
"ipv6")
  mirrorlist_url+="ip_version=6&"
  ;;
"all")
  mirrorlist_url+="ip_version=4&ip_version=6&"
  ;;
esac

case ${MIRRORLIST["use_mirror_status"]} in
"on")
  mirrorlist_url+="use_mirror_status=on"
  ;;
"off")
  mirrorlist_url+="use_mirror_status=off"
  ;;
esac

if [ -f "$mirrorlist" ]; then
  mv $mirrorlist $backup_mirrorlist
fi

cmirrorlist_url -o $new_mirrorlist "$mirrorlist_url"
sed -i 's/^# *Server/Server/' $new_mirrorlist
rankmirrors -n 5 $new_mirrorlist >$mirrorlist
rm -rf $new_mirrorlist
