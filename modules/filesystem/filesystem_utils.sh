#!/usr/bin/env bash

require_cmd() {
  local cmd=$1
  local pkg=${2:-$1}

  if ! command -v "$cmd" &>/dev/null; then
    install_pkg "$pkg"
  fi
}

select_disk() {
  require_cmd fzf

  local fzf_opts=(
    --reverse
    --prompt 'Disk: '
    --header 'Select a disk'
    --preview 'lsblk -d -o NAME,SIZE,MODEL /dev/{}'
  )

  lsblk -dno NAME | fzf "${fzf_opts[@]}"
}

confirm_disk() {
  local choice
  require_cmd fzf

  clear
  while true; do
    printf "%s\n\n" "This disk will be PERMANENTLY ERASED: ${DISK[name]}"
    lsblk -o NAME,SIZE,MODEL "/dev/${DISK[name]}"
    echo
    read -N 1 -rp "Erase it? [y]es / [n]o, pick another disk / [q]uit: " choice
    echo

    case "$choice" in
    [yY])
      break
      ;;
    [nN])
      DISK[name]=$(select_disk)
      break
      ;;
    [qQ])
      printf "%s\n" "Aborted. Nothing was changed."
      exit 1
      ;;
    esac
  done
}

validate_disk() {
  if [[ "${DISK[name]}" == "prompt" || ! -b "/dev/${DISK[name]}" ]]; then
    DISK[name]=$(select_disk)
  fi
}

create_new_partition_table() {
  local disk_label=$1
  local sfdisk_opts=(
    --wipe always
    --wipe-partitions always
  )

  case $disk_label in
  "gpt")
    sfdisk "${sfdisk_opts[@]}" "/dev/${DISK[name]}" <<<"label: gpt"
    ;;
  "mbr")
    : # come back and implement
    ;;
  esac
}

partition() {
  if [[ "${DISK[name]}" =~ [0-9]$ ]]; then
    printf "%s" "${DISK[name]}p$1"
  else
    printf "%s" "${DISK[name]}$1"
  fi
}

add_partition() {
  local -n partition=$1
  local name=$2
  local size=$3
  local type=$4

  local partition_info
  local sfdisk_opts=(
    --append
    --wipe always
    --wipe-partitions always
  )

  [[ $size == "100%" ]] && size=+ # sfdisk uses '+' for 100%

  partition_info=(
    "/dev/$partition:"
    "name=$name,"
    "size=$size,"
    "type=$type"
  )

  sfdisk "${sfdisk_opts[@]}" "/dev/${DISK[name]}" <<<"${partition_info[*]}"
}
