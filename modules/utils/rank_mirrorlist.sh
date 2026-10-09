#!/usr/bin/env bash

printf "%s\n" "Setting up mirrorlist ranking"
install_pkg pacman-contrib

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

printf "%s\n" "Downloading new mirrorlist..."
curl -fsSL "$mirrorlist_url" -o $new_mirrorlist || exit $?
uncomment "Server" "$new_mirrorlist"

if [ -f "$backup_mirrorlist" ]; then
  rm $backup_mirrorlist
fi

if [ -f "$mirrorlist" ]; then
  mv $mirrorlist $backup_mirrorlist
fi

printf "%s\n" "Ranking mirrorlist..."
rankmirrors -n 5 $new_mirrorlist >$mirrorlist

printf "%s\n" "Finished ranking mirrorlist, cleaning up now..."
rm $new_mirrorlist
