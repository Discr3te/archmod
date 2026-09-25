#!/usr/bin/env bash

rank_mirrorlist() {
  local mirrorlist_url="https://archlinux.org/mirrorlist/?country=US&protocol=https&use_mirror_status=on"
  local mirrorlist_url="https://archlinux.org/mirrorlist/?country=US&protocol=http&use_mirror_status=on"
  local mirrorlist=/etc/pacman.d/mirrorlist
  local new_mirrorlist=/etc/pacman.d/mirrorlist.new
  local backup_mirrorlist=/etc/pacman.d/mirrorlist.bk

  if [ -f "$backup_mirrorlist" ]; then
    rm -rf $backup_mirrorlist
  fi

  if [ -f "$mirrorlist" ]; then
    mv $mirrorlist $backup_mirrorlist
  fi

  echo "Downloading new mirrorlist"
  curl -o $new_mirrorlist "$mirrorlist_url"
  sed -i 's/^# *Server/Server/' $new_mirrorlist

  echo "Ranking mirrorlist, this will take a few minutes..."
  rankmirrors -n 5 $new_mirrorlist >$mirrorlist

  echo "Finished ranking mirrorlist."
  rm -rf $new_mirrorlist
}

get_user_password() {
  local -n user_password_ref=$1
  local password
  local password_check

  read -rsp "Password: " password
  echo ""
  read -rsp "Re-type Password: " password_check
  if [[ "$password" == "$password_check" ]]; then
    user_password_ref=$password
  else
    clear
    echo "Password do not match, please try again."
    get_user_password $1
  fi
}
