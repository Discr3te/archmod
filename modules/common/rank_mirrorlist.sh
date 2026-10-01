#!/usr/bin/env bash

echo "Downloading pacman-corntib"
pacman -Syu --noconfirm --needed pacman-contrib
echo "Finished downloading pacman-contrib"

mirrorlist_url="https://archlinux.org/mirrorlist/?"
mirrorlist=/etc/pacman.d/mirrorlist
new_mirrorlist=/etc/pacman.d/mirrorlist.new
backup_mirrorlist=/etc/pacman.d/mirrorlist.bk

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
"all")
  mirrorlist_url+="protocol=http&protocol=https&"
  ;;
*)
  mirrorlist_url+="protocol=${MIRRORLIST["protocol"]}&"
  ;;
esac

case ${MIRRORLIST["ip_version"]} in
"all")
  mirrorlist_url+="ip_version=4&ip_version=6&"
  ;;
*)
  mirrorlist_url+="ip_version=${MIRRORLIST["ip_version"]}&"
  ;;
esac

mirrorlist_url+="use_mirror_status=${MIRRORLIST["use_mirror_status"]}"

if [ -f "$mirrorlist" ]; then
  mv $mirrorlist $backup_mirrorlist
fi

curl -o $new_mirrorlist "$mirrorlist_url"
sed -i 's/^# *Server/Server/' $new_mirrorlist
rankmirrors -n 5 $new_mirrorlist >$mirrorlist
rm -rf $new_mirrorlist
